```bash
clear;
cat > omv.sh << EOF
apt-get install --yes gnupg
wget --quiet --output-document=- https://packages.openmediavault.org/public/archive.key | gpg --dearmor --yes --output "/usr/share/keyrings/openmediavault-archive-keyring.gpg"
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
