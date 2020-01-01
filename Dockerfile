FROM debian:stretch

RUN useradd meteor -G staff -m -s /bin/bash
WORKDIR /home/meteor

RUN apt-get update && \
   apt-get install -y git curl bzip2 gnupg libcap2-bin procps && \
   apt-get clean && \
   rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER meteor
RUN curl https://install.meteor.com | sh

EXPOSE 3000
COPY ./src /home/meteor/prj
USER root
RUN chown meteor:meteor -R ./prj
USER meteor
VOLUME /home/meteor/prj
WORKDIR prj
RUN meteor npm install
RUN meteor npm install --save @babel/runtime
ENTRYPOINT [ "meteor" ]