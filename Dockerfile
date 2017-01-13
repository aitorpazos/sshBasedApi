FROM rastasheep/ubuntu-sshd:16.04

MAINTAINER Aitor Pazos <mail@aitorpazos.es>

COPY sshd_config /etc/ssh/sshd_config
COPY sshWrapper.sh /root/
COPY commands /root/commands/
RUN chmod 644 /etc/ssh/sshd_config && \
    chmod 550 -R /root/commands && \
    chmod 550 /root/sshWrapper.sh && \
    rm /etc/ssh/*_key* && \
    ssh-keygen -A && \
    mkdir /etc/ssh/keys && \
    groupadd -g 666 -r sshapi;

CMD /root/sshWrapper.sh
