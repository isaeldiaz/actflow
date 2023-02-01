FROM actflow_base:latest

ARG user=docker_user
ARG uid=1000

# Copy the executables of async tools from local build
ADD async_tools.tar.gz /

# Adding user
RUN adduser --disabled-password --no-create-home --uid $uid $user && addgroup $user $user
USER $user


