# FROM ubuntu:18.04
ARG BASE_IMAGE=nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04 

FROM ${BASE_IMAGE}
LABEL maintainer="Ravi Bhadeshiya"

# set enviroment
RUN echo "Setting Enviroment variables"
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
ENV DEBIAN_FRONTEND=noninteractive

ARG ROS2_DISTRO=dashing
ENV ROS2_DISTRO=${ROS2_DISTRO}

ARG TZ=America/New_York
ENV TZ=${TZ}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#install dependecies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
        sudo apt-utils git htop wget nano build-essential cmake doxygen \
        curl gnupg2 lsb-release python3-pip locales python3-numpy \
        python3-pyqt5 libzmq3-dev libdw-dev python-pip python-dev \
        libgtk2.0-0 unzip libblas-dev liblapack-dev libhdf5-dev \
        libasio-dev libtinyxml2-dev python3-sip-dev \
        --fix-missing 

RUN pip3 install transforms3d billiard psutil hrim

#install ROS
RUN echo "Installing ROS ${ROS2_DISTRO}" && \ 
    locale-gen en_US en_US.UTF-8 && \ 
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \ 
    export LANG=en_US.UTF-8 && \
    curl http://repo.ros2.org/repos.key | apt-key add - && \ 
    sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \ 
    apt-get update && apt-get install -y python3-colcon-common-extensions python3-vcstool python3-argcomplete \
        ros-$ROS2_DISTRO-desktop &&\
        curl -sSL http://get.gazebosim.org | sh 

# Install ros extra 
RUN sudo apt update && sudo apt install -y \
        ros-$ROS2_DISTRO-behaviortree-cpp \
        ros-$ROS2_DISTRO-rttest \
        ros-$ROS2_DISTRO-rclcpp-action \
        ros-$ROS2_DISTRO-gazebo-dev \
        ros-$ROS2_DISTRO-gazebo-msgs \
        ros-$ROS2_DISTRO-gazebo-plugins \
        ros-$ROS2_DISTRO-gazebo-ros \
        ros-$ROS2_DISTRO-gazebo-ros-pkgs 

ARG BUILD_AI_PACKAGE
RUN if [ "$BUILD_AI_PACKAGE" = "true" ] ; \
        then pip3 install tensorflow-gpu matplotlib pandas scipy h5py testresources scikit-learn && \
        pip3 install gym && git clone https://github.com/benelot/pybullet-gym.git && cd pybullet-gym && pip3 install -e . ;\
        fi

# Expose Jupyter 
EXPOSE 8888
# Expose Tensorboard
EXPOSE 6006

# Add new sudo user
ARG DOCKER_USER=user
ENV USER=$DOCKER_USER

ARG DOCKER_PASSWD=user
ENV PASSWD=$DOCKER_PASSWD

ARG uid=1000
ENV UID=$uid

ARG gid=1000
ENV GID=$gid

RUN useradd --create-home -m $USER && \
        echo "$USER:$PASSWD" | chpasswd && \
        usermod --shell /bin/bash $USER && \
        usermod -aG sudo $USER && \
        echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USER && \
        chmod 0440 /etc/sudoers.d/$USER && \
        # Replace 1000 with your user/group id
        usermod  --uid $UID $USER && \
        groupmod --gid $GID $USER

RUN rm -rf /var/lib/apt/lists/*

# set workspace 
USER $USER
WORKDIR /home/$USER/

# setup entrypoint for sourcing
COPY ./ros_entrypoint.sh /
RUN sudo chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]
