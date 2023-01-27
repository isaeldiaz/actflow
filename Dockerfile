FROM i386/alpine:latest

COPY . /build_dir
ENV ACT_HOME /opt/async
ENV VLSI_TOOLS_SRC /build_dir
ENV PATH $ACT_HOME/bin:$PATH

RUN apk add --no-cache patch g++ make cmake bison boost-dev numactl-dev libedit-dev zlib-dev m4
RUN mkdir $ACT_HOME
RUN cd $VLSI_TOOLS_SRC && ./build



