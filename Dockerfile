FROM docker.io/jellyfin/jellyfin:10.8.9

COPY entry.sh /entry.sh

RUN rm -rf /config/* /cache/* /jellyfin && \
    chmod +x /entry.sh && \
    apt update && \
    apt install --no-install-recommends --no-install-suggests -y bash git openssh-server rsync augeas-tools libvshadow-utils && \
    mkdir -p /root/.ssh /etc/authorized_keys && chmod 700 /root/.ssh/ && \
    augtool 'set /files/etc/ssh/sshd_config/AuthorizedKeysFile ".ssh/authorized_keys /etc/authorized_keys/%u"' && \
    cp -a /etc/ssh /etc/ssh.cache

RUN apt clean autoclean -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 22

VOLUME /config

ENTRYPOINT ["/entry.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
