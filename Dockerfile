FROM rastasheep/ubuntu-sshd:16.04

MAINTAINER Aitor Pazos <mail@aitorpazos.es>

COPY sshd_config /etc/ssh/sshd_config
RUN rm /etc/ssh/*.key* && \
    ssh-keygen -A && \
    mkdir /etc/ssh/keys && \
    groupadd -g 666 -r sshapi;
