------------------------------------------------------------------------------------------------------------------------------------------------------------
<p align='center'> Fichiers de configuration linux </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Base
#### A. /etc/fstab
- Le fichier /etc/fstab est utilisé pour contrôler la manière dont les systèmes de fichiers sont montés au démarrage et pendant le fonctionnement normal du système. 
- Il répertorie tous les systèmes de fichiers disponibles et leurs points de montage, y compris les options et les fréquences de vidage.


#### B. /etc/passwd
- Le fichier /etc/passwd contient des informations sur les utilisateurs du système, notamment leur nom d’utilisateur, leur ID d’utilisateur, leur ID de groupe, leur répertoire personnel et leur shell.
- Ce fichier est lisible par tous les utilisateurs du système, mais il est important de le sécuriser afin d’empêcher tout accès non autorisé aux comptes des utilisateurs.

#### C. /etc/shadow
- Le fichier /etc/shadow contient le mot de passe crypté et d’autres informations de sécurité pour chaque utilisateur du système.
- Contrairement à /etc/passwd, ce fichier n’est lisible que par l’utilisateur root et est donc beaucoup plus sûr. 
- Il est utilisé pour stocker des informations telles que le dernier changement de mot de passe, l’âge minimum du mot de passe et l’âge maximum du mot de passe.

#### D. /etc/group
- Le fichier /etc/group répertorie les groupes du système et leurs membres.
- Il contient des informations sur chaque groupe, notamment son nom, son identifiant et la liste des utilisateurs qui en sont membres.
- Ce fichier est utilisé pour gérer les autorisations d’accès des utilisateurs et des groupes aux fichiers et aux répertoires du système.

#### E. /etc/sudoers
- Le fichier /etc/sudoers est utilisé pour gérer la commande sudo, qui permet aux utilisateurs d’exécuter des commandes en tant qu’utilisateur root.
- Ce fichier répertorie les utilisateurs et les groupes autorisés à utiliser la commande sudo, ainsi que les commandes qu’ils sont autorisés à exécuter.
- Il est important de sécuriser ce fichier afin d’éviter tout accès non autorisé au compte de l’utilisateur root.

#### F. /etc/ssh/sshd_config
- Le fichier /etc/ssh/sshd_config est le fichier de configuration du serveur SSH.
- Il spécifie les options du serveur, telles que le numéro de port à écouter, les méthodes d’authentification autorisées et l’emplacement des clés d’hôte.
- Ce fichier est utilisé pour sécuriser et configurer le serveur SSH sur un système Linux.

#### G. /etc/resolv.conf
- Le fichier /etc/resolv.conf est utilisé pour configurer le résolveur DNS du système.
- Il contient des informations sur les serveurs DNS que le système doit utiliser pour la résolution de noms, ainsi que sur les domaines de recherche et les options.
- Ce fichier est crucial pour une communication réseau correcte sur un système Linux.

#### H. /etc/hosts
- Le fichier /etc/hosts est utilisé pour faire correspondre les noms d’hôtes aux adresses IP.
- Il s’agit d’un simple fichier texte qui peut être utilisé pour spécifier des noms d’hôtes et des adresses IP personnalisés, sans qu’il soit nécessaire d’utiliser un serveur DNS.
- Ce fichier est utilisé pour effectuer la résolution locale des noms sur un système Linux.

#### I. /etc/sysctl.conf
- Le fichier /etc/sysctl.conf est utilisé pour configurer les paramètres du noyau Linux au moment de l’exécution.
- Il contient une liste de paires clé-valeur qui peuvent être utilisées pour modifier le comportement du noyau, comme l’activation ou la désactivation du transfert IPv4, l’ajustement du nombre maximum de descripteurs de fichiers ouverts et la définition du nombre maximum de segments de mémoire partagée.

#### J. /etc/services
- Le fichier /etc/services répertorie les services bien connus ainsi que les numéros de port et les protocoles qu’ils utilisent.
- Il est utilisé par le système pour faire correspondre les noms des services aux numéros de port et aux protocoles, ce qui facilite la configuration des services réseau par les utilisateurs.
- Ce fichier est utilisé pour gérer les services réseau sur un système Linux.

#### K. /etc/aliases
- Le fichier /etc/aliases est utilisé pour gérer les alias de courrier électronique sur un système Linux.
- Il contient une liste d’adresses électroniques qui sont redirigées vers d’autres adresses électroniques, ce qui permet aux utilisateurs de recevoir du courrier électronique à plusieurs adresses ou de rediriger du courrier électronique vers une autre adresse.
- Ce fichier est utilisé pour gérer le courrier électronique sur un système Linux.

#### L. /etc/crontab
- Le fichier /etc/crontab est le fichier de table cron du système.
- Il est utilisé pour planifier les tâches qui seront exécutées automatiquement par le démon cron.
- Il contient une liste de commandes ainsi que les heures et les dates auxquelles elles doivent être exécutées.
- Ce fichier est utilisé pour automatiser des tâches sur un système Linux.

#### M. /etc/rc.local
- Le fichier /etc/rc.local est un script qui est exécuté au moment du démarrage par le processus init.
- Il contient des commandes et des scripts qui doivent être exécutés après le démarrage du système, comme le démarrage de services ou la configuration de variables d’environnement.
- Ce fichier est utilisé pour personnaliser le comportement d’un système Linux pendant le démarrage.

#### N. /etc/default/locale
- Le fichier /etc/default/locale est utilisé pour configurer les paramètres linguistiques du système Linux.
- Il contient des informations sur les paramètres régionaux par défaut, telles que la langue, le pays et le codage des caractères, qui doivent être utilisés pour les paramètres de l’ensemble du système.
- Ce fichier est utilisé pour gérer les paramètres linguistiques d’un système Linux.

#### O. /etc/environment
- Le fichier /etc/environment est utilisé pour définir les variables d’environnement sur un système Linux.
- Il contient une liste de paires clé-valeur exportées en tant que variables d’environnement, qui peuvent être utilisées par des applications et des scripts pour configurer leur comportement.
- Ce fichier est utilisé pour gérer les variables d’environnement sur un système Linux.

#### P. /etc/default/keyboard
- Le fichier /etc/default/keyboard est utilisé pour configurer la disposition du clavier sur un système Linux.
- Il contient des informations sur le modèle de clavier, la disposition, la variante et les options à utiliser pour les paramètres du clavier à l’échelle du système.
- Ce fichier est utilisé pour gérer le clavier sur un système Linux.

#### Q. /etc/hostname
- Le fichier /etc/hostname stocke le nom de l’hôte de l’appareil utilisé par le système et les applications.

#### R. /etc/hosts.allow et /etc/hosts.deny
- Les fichiers /etc/hosts.allow et /etc/hosts.deny permettent de filtrer les adresses IP entrantes vers des services.

#### S. /etc/nsswitch.conf
- nsswitch.conf est un fichier de configuration Linux qui spécifie comment le système doit basculer entre différents fournisseurs de services de noms.
- Le fichier peut être utilisé pour configurer les services à utiliser pour la recherche de noms d’hôtes, la recherche de mots de passe, etc.
- Notamment vous pouvez choisir la priorité et ordre de résolution DNS (fichier HOSTS, DNS, etc)

#### T. /etc/security/limits.conf
- Le fichier /etc/security/limits.conf est utilisé pour définir des limites de ressources sur un système Linux.
- Il contient une liste de paires clé-valeur qui spécifient les valeurs maximale et minimale pour diverses ressources système, telles que le nombre de descripteurs de fichiers ouverts, la taille de la mémoire virtuelle et le nombre maximal de processus.
- Ce fichier est utilisé pour gérer les limites de ressources sur un système Linux.

/etc/apt/sources.list	Le fichier /etc/apt/sources.list est utilisé pour configurer les sources logicielles du gestionnaire de paquets APT sur un système Linux. Il contient une liste de référentiels, ou sources de logiciels, à partir desquels les paquets peuvent être installés et mis à jour. Ce fichier est utilisé pour gérer les sources logicielles et les paquets sur un système Linux à base Debian (Ubuntu, Mint, …)

/etc/apt/apt.conf	Le fichier /etc/apt/apt.conf est utilisé pour configurer le gestionnaire de paquets APT sur un système Linux. Il contient une liste d’options et de préférences qui affectent le comportement d’APT, telles que le serveur proxy à utiliser, la version par défaut à partir de laquelle installer les packages et l’action par défaut à effectuer lors de la mise à niveau des packages.

/etc/bash.bashrc	Le fichier /etc/bash.bashrc est le fichier de configuration à l’échelle du système pour le shell bash. Il contient une liste de commandes et de paramètres qui sont exécutés chaque fois qu’un utilisateur démarre une session shell bash. Ce fichier est utilisé pour configurer le shell bash pour tous les utilisateurs sur un système Linux.

/etc/sysconfig/network	Le fichier /etc/sysconfig/network est utilisé pour configurer les paramètres réseau sur un système Linux. Il contient des informations sur le nom d’hôte, la passerelle et d’autres paramètres réseau qui doivent être définis au démarrage du système. Ce fichier est utilisé pour gérer les paramètres réseau sur un système Linux à base de Redhat / Fedora

/etc/network/interfaces	Le fichier /etc/network/interfaces est utilisé pour configurer les interfaces réseau sur un système Linux. Il contient des informations sur les interfaces réseau, telles que les adresses IP, les masques de réseau et les passerelles, ainsi que des options pour configurer les adresses DHCP et les adresses IP statiques. Ce fichier est utilisé pour gérer la configuration du réseau sur un système Linux.

/etc/NetworkManager/system-connections/	Dans ce répertoire, vous pouvez déclarer les fichiers de configuration pour automatiser la configuration réseau de votre distribution Linux.

/etc/modprobe.d/blacklist.conf	Le fichier /etc/modprobe.d/blacklist.conf est utilisé pour empêcher les modules d’être chargés par le noyau Linux. Il contient une liste de modules qui ne doivent pas être chargés, soit parce qu’ils sont connus pour causer des problèmes, soit parce qu’ils ne sont pas nécessaires sur le système. Ce fichier est utilisé pour gérer le chargement des modules du noyau sur un système Linux.

/etc/udev/rules.d/70-persistent-net.rules	Le fichier /etc/udev/rules.d/70-persistent-net.rules est utilisé pour attribuer de manière persistante des noms d’interface réseau sur un système Linux. Il contient une liste de règles qui correspondent aux interfaces réseau en fonction de leurs adresses MAC et leur attribue des noms stables, tels que « eth0 » ou « wlan0 ». Ce fichier est utilisé pour gérer la dénomination des interfaces réseau sur un système Linux.


/etc/default/grub	Le fichier /etc/default/grub est utilisé pour configurer le chargeur de démarrage GRUB sur un système Linux. Il contient des options et des paramètres qui affectent le comportement de GRUB, tels que le noyau par défaut pour démarrer, le délai d’expiration et la résolution d’affichage. Ce fichier est utilisé pour gérer le chargeur de démarrage GRUB sur un système Linux.

/etc/X11/xorg.conf	Le fichier /etc/X11/xorg.conf est utilisé pour configurer le système X Window sur un système Linux. Il contient des informations sur la carte graphique, le moniteur et le clavier, ainsi que des options pour personnaliser le comportement du système X Window, telles que la profondeur de couleur et la résolution de l’écran. Ce fichier est utilisé pour gérer le système X Window sur un système Linux.

/etc/ld.so.conf	Le fichier /etc/ld.so.conf est utilisé pour configurer l’éditeur de liens dynamique sur un système Linux. Il contient une liste de répertoires qui doivent être recherchés par l’éditeur de liens dynamiques lors du chargement de bibliothèques partagées. Ce fichier est utilisé pour gérer l’éditeur de liens dynamique sur un système Linux.

/etc/pam.d/system-auth	Le fichier /etc/pam.d/system-auth est utilisé pour configurer le mécanisme d’authentification sur un système Linux. Il contient une liste de modules qui doivent être utilisés pour l’authentification, tels que la vérification du mot de passe par rapport au fichier fantôme ou l’utilisation de cartes à puce. Ce fichier est utilisé pour gérer l’authentification sur un système Linux.

/etc/systemd/system.conf	Le fichier /etc/systemd/system.conf stocke la configuration de Systemd.
Ce dernier est le gestionnaire de service qui succède à SysV init.

/etc/logrotate.conf	Le fichier /etc/logrotate.conf est utilisé pour configurer l’utilitaire logrotate sur un système Linux. Il contient des informations sur la façon dont les fichiers journaux doivent être pivotés, telles que la fréquence, la taille et la compression des journaux pivotés. Ce fichier est utilisé pour gérer les fichiers journaux sur un système Linux.

/etc/rsyslog.conf	Le fichier /etc/rsyslog.conf est utilisé pour configurer le démon rsyslog sur un système Linux. Il contient des informations sur l’emplacement d’envoi des messages de journal, par exemple à un serveur distant ou à un fichier local, ainsi que des options de filtrage et de formatage des messages de journal. Ce fichier est utilisé pour gérer la journalisation sur un système Linux.
