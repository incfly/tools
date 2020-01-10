FROM ubuntu:bionic
RUN apt-get update && \
  apt-get install iperf
WORKDIR /
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"