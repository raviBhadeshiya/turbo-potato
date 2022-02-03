FROM nvidia/cuda:11.5.1-cudnn8-runtime-ubuntu20.04

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

# setup entrypoint for sourcing
COPY external/entrypoint.sh /
RUN sudo chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]
