
```
BTF: .tmp_vmlinux1: pahole (pahole) is not available
Failed to generate BTF for vmlinux
Try to disable CONFIG_DEBUG_INFO_BTF
make[2]: *** [scripts/Makefile.vmlinux:34 : vmlinux] Erreur 1
make[1]: *** [/Data/linux-6.10.7/Makefile:1171 : vmlinux] Erreur 2
make[1]: *** Attente des tâches non terminées....
```

Mettre la valeur `CONFIG_DEBUG_INFO_BTF` sur N.
