#### Note ([Doc](https://www.kernel.org/doc/html/v5.3/process/applying-patches.html#applying-patches)


```bash
clear;
cd /tmp
mkdir /tmp/test/
cd /tmp/test/
rm -r /tmp/test/*
wget https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.tar.xz;
wget https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-7.0.1.xz;

tar -xf linux-7.0.tar.xz;
xz -d patch-7.0.1.xz;
cd linux-7.0

patch -p1 -i ../patch-7.0.1;
patch -p1 <  ../patch-7.0.1;

