cat > omv.sh << EOF
apt-get install --yes gnupg
wget --quiet --output-document=- https://packages.openmediavault.org/public/archive.key | gpg --dearmor --yes --output "/usr/share/keyrings/openmediavault-archive-keyring.gpg"
EOF


clear;
pct push 999 /root/omv.sh /root/omv.sh;


clear;
pct exec 999 -- bash -c 'chmod +x /root/omv.sh'

clear;
pct exec 999 -- bash -c '/root/omv.sh'
