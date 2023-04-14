FROM i386/alpine:3.17

ENV ACT_HOME /opt/async
ENV PATH $ACT_HOME/bin:$PATH

# Installing dependencies
RUN mkdir $ACT_HOME && apk add --no-cache bison boost-dev numactl-dev libedit-dev zlib-dev m4 libgomp


