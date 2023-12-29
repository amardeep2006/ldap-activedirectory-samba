FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
# Install Required packages
RUN apt-get update && apt-get -y install samba krb5-config winbind smbclient iproute2 openssl \
    && rm /etc/krb5.conf \
    && mkdir -p /opt/ad-scripts
WORKDIR /opt/ad-scripts
COPY *.sh /opt/ad-scripts
CMD chmod +x /opt/ad-scripts/*.sh && ./samba-ad-setup.sh && ./samba-ad-run.sh