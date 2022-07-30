FROM buildpack-deps:jammy as builder

RUN apt-get update && apt-get install -y --no-install-recommends cmake
WORKDIR /etc
RUN git clone --recurse-submodules https://github.com/h2o/h2o.git

WORKDIR /etc/h2o
RUN mkdir -p build
WORKDIR /etc/h2o/build
RUN cmake ..
RUN make
RUN make install

FROM ubuntu:22.04
COPY --from=builder /usr/local/bin/h2o /usr/local/bin/h2o
COPY --from=builder /usr/local/bin/h2o-httpclient /usr/local/bin/h2o-httpclient
