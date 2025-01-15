```bash
clear;
cat > omv.sh << EOF
apt-get install --yes gnupg
wget --quiet --output-document=- https://packages.openmediavault.org/public/archive.key | gpg --dearmor --yes --output "/usr/share/keyrings/openmediavault-archive-keyring.gpg"

export LANG=C.UTF-8
export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
apt-get update
apt-get --yes --auto-remove --show-upgraded \
    --allow-downgrades --allow-change-held-packages \
    --no-install-recommends \
    --option DPkg::Options::="--force-confdef" \
    --option DPkg::Options::="--force-confold" \
    install openmediavault

omv-confdbadm populate;
omv-salt deploy run systemd-networkd
EOF
```

```bash
clear;
pct push 999 /root/omv.sh /root/omv.sh;
```

```bash
clear;
pct exec 999 -- bash -c 'chmod +x /root/omv.sh'
```

```bash
clear;
pct exec 999 -- bash -c '/root/omv.sh'
```
