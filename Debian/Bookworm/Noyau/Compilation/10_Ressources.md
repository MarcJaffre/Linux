------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Ressources utiles pour le Kernel </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Patch CPU
### X. AMD P-State
Améliore la gestion de la fréquence d'horloge des processeurs AMD, ce qui permet une meilleure performance énergétique et une réduction de la consommation d'énergie.
#### 1. Amélioration de la gestion de la fréquence d'horloge :
Le patch `AMD P-State` permet au noyau de gérer plus efficacement la fréquence d'horloge des processeurs AMD, ce qui signifie que les jeux vidéo peuvent bénéficier d'une meilleure performance énergétique.

#### 2. Réduction de la consommation d'énergie
Le patch `AMD P-State` réduit la consommation d'énergie en permettant aux processeurs AMD de fonctionner à une fréquence d'horloge plus basse lorsqu'elle n'est pas nécessaire.


<br />

### X. CPUFreq Governor
ce patch permet de configurer le gouverneur de fréquence du processeur pour qu'il utilise la fréquence la plus élevée possible en fonction de la charge du système. 


<br />

### X. Schedutil
Améliore la gestion des processeurs et des threads, ce qui permet une meilleure utilisation des ressources système pour les jeux vidéo.

C'est une mise à jour du gestionnaire de processeur (CPU) qui améliore la gestion des processeurs et des threads pour les jeux vidéo.

#### 1. Amélioration de la gestion des processeurs
Le patch `schedutil` permet au noyau de mieux gérer les processeurs et les threads, ce qui signifie que les jeux vidéo peuvent utiliser plus efficacement les ressources système. 

Cela se traduit par une amélioration de la fréquence d'images (FPS) et une réduction de la latence.

#### 2. Meilleure prise en charge des processeurs à plusieurs cœurs :
Le patch `schedutil` améliore la prise en charge des processeurs à plusieurs cœurs, ce qui permet aux jeux vidéo de bénéficier de la puissance de traitement supplémentaire offerte par ces processeurs.



<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Patch Mémoire
### X. AMD NUMA
Ce patch améliore la prise en charge de la mémoire non-uniforme (NUMA) pour les processeurs AMD. Vous pouvez le télécharger à partir de ce lien.

<br />

### X. AMD IOMMU
Ce patch améliore la prise en charge de l'unité de gestion de la mémoire d'entrée-sortie (IOMMU) pour les processeurs AMD. Vous pouvez le télécharger à partir de




<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Sécurité
### X. Grsecurity
Ce patch ajoute des fonctionnalités de sécurité supplémentaires au kernel, notamment la prise en charge de la mémoire exécutable (W^X) et la protection contre les attaques de type "return-to-user" (ret2usr).



<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Performances du système
### X. BFQ (Budget Fair Queueing)
ce patch améliore la gestion des files d'attente du système et permet d'atteindre des performances plus élevées. 

### X. Futex2
Améliore la gestion des mutex et des verrous, ce qui réduit les temps de latence et améliore la performance globale.

#### 1. Amélioration de la gestion des mutex
Le patch `futex2` permet au noyau de gérer plus efficacement les mutex, ce qui signifie que les jeux vidéo peuvent accéder plus rapidement aux ressources système partagées.

#### 2. Réduction des temps de latence : 
Le patch `futex2` réduit les temps de latence en permettant aux jeux vidéo de répondre plus rapidement aux événements système.

<br />

### X. IO_uring
Améliore la gestion des entrées-sorties et des opérations de fichiers, ce qui réduit les temps de chargement et améliore la performance des jeux vidéo.

#### 1. Amélioration de la gestion des entrées-sorties
Le patch `io_uring` permet au noyau de gérer plus efficacement les entrées-sorties, ce qui signifie que les jeux vidéo peuvent charger plus rapidement les ressources système.

#### 2. Réduction des temps de chargement
Le patch `io_uring` réduit les temps de chargement en permettant aux jeux vidéo de charger plus rapidement les ressources système.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
