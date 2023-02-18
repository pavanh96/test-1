FROM alpine:3.4
LABEL name="kumar"
RUN apk update
RUN apk add vim
RUN apk add curl
