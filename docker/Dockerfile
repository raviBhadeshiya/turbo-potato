FROM nvidia/cuda:10.2-cudnn8-runtime-ubuntu18.04

LABEL maintainer="Ravi Bhadeshiya"

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
ENV DEBIAN_FRONTEND noninteractive

ARG TZ=America/New_York
ENV TZ ${TZ}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# # install dependecies
COPY external/dependecies.sh /
RUN chmod +x /dependecies.sh && ./dependecies.sh

# set ROS
ARG ROS2_DISTRO=eloquent
ENV ROS2_DISTRO ${ROS2_DISTRO}

ARG ROS1_DISTRO
ENV ROS1_DISTRO ${ROS1_DISTRO}

# install ROS 2
COPY external/ros2.sh /
RUN if [ ! -z "${ROS2_DISTRO}" ]; then chmod +x /ros2.sh && ./ros2.sh ;fi

# install ROS 1 and bridge
COPY external/ros.sh /
RUN if [ ! -z "${ROS1_DISTRO}" ]; then chmod +x /ros.sh && ./ros.sh ;fi

# install extra's
COPY external/extra.sh /
RUN chmod +x /extra.sh && ./extra.sh

# Add new sudo user
ARG DOCKER_USER=user
ENV USER=$DOCKER_USER

ARG DOCKER_PASSWD=user
ENV PASSWD $DOCKER_PASSWD

ARG uid=1000
ENV UID $uid

ARG gid=1000
ENV GID $gid

RUN useradd --create-home -m $USER && \
    echo "$USER:$PASSWD" | chpasswd && \
    usermod --shell /bin/bash $USER && \
    usermod -aG sudo $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER && \
    # Replace 1000 with your user/group id
    usermod  --uid $UID $USER && \
    groupmod --gid $GID $USER

# set workspace
USER $USER
ENV HOME /home/$USER
WORKDIR ${HOME}

# init the rosdep
RUN sudo rosdep init && rosdep update

# setup entrypoint for sourcing
COPY external/ros_entrypoint.sh /
RUN sudo chmod +x /ros_entrypoint.sh

ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]
