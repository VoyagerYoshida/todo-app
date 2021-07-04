FROM golang:1.15 as build 

LABEL maintainer="voyagerwy130 <voyager.yoshida@gmail.com>"

RUN apt-get update && \
    apt-get -y install git unzip build-essential autoconf libtool
RUN git clone https://github.com/google/protobuf.git && \
    cd protobuf && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \
    make clean && \
    cd .. && \
    rm -r protobuf

RUN go get google.golang.org/grpc
RUN go get github.com/golang/protobuf/protoc-gen-go

ENV WORKSPACE /var/www
RUN mkdir -p $WORKSPACE 
WORKDIR $WORKSPACE

COPY ./api/todopb/ .
RUN protoc --go_out=plugins=grpc:. ./todo.proto

FROM golang:1.15

ENV SRC_DIR=/go/src/github.com/VoyagerYoshida/todo-app/ 
WORKDIR $SRC_DIR 

COPY --from=build /var/www/api/ ./api/

RUN go get -u google.golang.org/grpc \
    && go get go.mongodb.org/mongo-driver/mongo

ENTRYPOINT [""]
