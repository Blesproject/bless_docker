FROM alpine
MAINTAINER Sofyan Saputra "sofyan@biznetgio.com"


RUN apk update && \
    mkdir /app
WORKDIR /app
RUN apk --no-cache add gcc musl-dev python3 python3-dev git
RUN pip3 install --upgrade pip
RUN git clone https://github.com/Blesproject/bless_gen.git && cd bless_gen
RUN pip3 install -e .
RUN cd ../BLESS
RUN cd bless #your app_name 
RUN pip3 install -r requirements.txt && sh production.sh

EXPOSE 6969
RUN apk del build-base