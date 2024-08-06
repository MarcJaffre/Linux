-------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation de MacOS sur Vmware </p>

-------------------------------------------------------------------------------------------------------------------------
## I. CPU AMD
### A. Fichier VMX
Editer le fichier vmx avec le bloc-note.
```
board-id = "Mac-A61BADE1FDAD7B05"
hw.model = "MacBookPro16,4"

smc.version = "0"
cpuid.0.eax = "0000:0000:0000:0000:0000:0000:0000:1011"
cpuid.0.ebx = "0111:0101:0110:1110:0110:0101:0100:0111"
cpuid.0.ecx = "0110:1100:0110:0101:0111:0100:0110:1110"
cpuid.0.edx = "0100:1001:0110:0101:0110:1110:0110:1001"
cpuid.1.eax = "0000:0000:0000:0001:0000:0110:0111:0001"
cpuid.1.ebx = "0000:0010:0000:0001:0000:1000:0000:0000"
cpuid.1.ecx = "1000:0010:1001:1000:0010:0010:0000:0011"
cpuid.1.edx = "0000:0111:1000:1011:1111:1011:1111:1111"
```

### B. Liste des Mac (BoardID, DeviceID, Model Identifiers & Machine Models)

```
https://mrmacintosh.com/list-of-mac-boardid-deviceid-model-identifiers-machine-models/
```

<br />

-------------------------------------------------------------------------------------------------------------------------
### II. Réseau
Pour qu'internet fonctionne, remplacer `e1000e` par le nom du réseau (Exemple: `vmxnet3`)
```
ethernet0.virtualDev = "e1000e"
```



```
- https://stackoverflow.com/questions/67025805/vmware-macos-bigsur-in-win10
 > smbios.reflectHost = TRUE
- https://www.geekrar.com/how-to-fix-the-cpu-has-been-disabled-by-the-guest-os/#comment-21413
- https://forums.developer.apple.com/forums/thread/681787
```


