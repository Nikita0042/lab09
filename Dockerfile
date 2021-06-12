FROM ubuntu:18.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . doc/
WORKDIR doc

RUN cmake -H. -B_build
RUN cmake --build _build

ENV LOG_PATH /home/logs/log.txt

VOLUME /home/logs

WORKDIR _install/bin

ENTRYPOINT ./solver
