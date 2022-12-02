FROM ubuntu
USER root
LABEL name="kumar"
RUN  usermod -a -G docker jenkins
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y curl
