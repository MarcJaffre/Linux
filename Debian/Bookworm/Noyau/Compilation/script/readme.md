#### Note ([Doc](https://www.kernel.org/doc/html/v5.3/process/applying-patches.html#applying-patches)


```bash
clear;
cd /tmp
rm -r /tmp/test/ 2>/dev/null;
mkdir /tmp/test/ 2>/dev/null;
cd    /tmp/test/ 2>/dev/null;

wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.tar.xz;
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-7.0.1.xz;

tar -xf linux-7.0.tar.xz;
xz -d patch-7.0.1.xz;
cd linux-7.0
make kernelversion
```

```
patch -p1 -i ../patch-7.0.1;
patch -p1 <  ../patch-7.0.1;
```

