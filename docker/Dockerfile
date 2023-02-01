FROM i386/alpine:3.17

ARG user=docker_user
ARG uid=1000

COPY . /build_dir
ENV ACT_HOME /opt/async
ENV VLSI_TOOLS_SRC /build_dir
ENV PATH $ACT_HOME/bin:$PATH

# Building and installing async tools
RUN apk add --no-cache patch g++ make cmake bison boost-dev numactl-dev libedit-dev zlib-dev m4
RUN mkdir $ACT_HOME && cd $VLSI_TOOLS_SRC && ./build

#Removing building tools and source code from image
RUN apk del --no-cache patch g++ make cmake && rm -Rf $VLSI_TOOLS_SRC

# Adding user
RUN adduser --disabled-password --no-create-home --uid $uid $user && addgroup $user $user
USER $user


