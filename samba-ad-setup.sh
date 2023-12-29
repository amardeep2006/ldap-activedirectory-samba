#!/bin/bash
 
set -e
 
info () {
    echo "[INFO] $@"
}
 
info "Running setup"
 
# Check if samba is setup
[ -f /var/lib/samba/.setup ] && info "Already setup..." && exit 0
 
info "Provisioning domain controller..."
 
info "Given admin password: ${SMB_ADMIN_PASSWORD}"
 
rm /etc/samba/smb.conf

# Setting up Samba AD server 
samba-tool domain provision\
 --server-role=dc\
 --use-rfc2307\
 --dns-backend=SAMBA_INTERNAL\
 --realm=$(hostname | cut -d '.' -f 2-)\
 --domain=${AD_DOMAIN}\
 --adminpass=${SMB_ADMIN_PASSWORD}
 
mv /etc/samba/smb.conf /var/lib/samba/private/smb.conf
 
touch /var/lib/samba/.setup