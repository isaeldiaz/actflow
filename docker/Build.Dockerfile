FROM actflow_base:latest


COPY . /build_dir
ENV VLSI_TOOLS_SRC /build_dir

# Building and installing async tools
RUN apk add --no-cache patch g++ make cmake && cd $VLSI_TOOLS_SRC && ./build
RUN tar -cvf $VLSI_TOOLS_SRC/release/async_tools.tar.gz $ACT_HOME


