#### Note ([Doc](https://www.kernel.org/doc/html/v5.3/process/applying-patches.html#applying-patches)


```bash
clear;
wget https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.tar.xz  -o /tmp/linux-7.0.tar.xz; 
wget https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-7.0.1.xz    -o /tmp/patch-7.0.1.xz;

cd /tmp;
tar -xf /tmp/linux-7.0.tar.xz;
tar -xf /tmp/patch-7.0.1.xz;
cd linux-7.0

patch -p1 -i ../patch-7.0.1;
patch -p1 <  ../patch-7.0.1;
