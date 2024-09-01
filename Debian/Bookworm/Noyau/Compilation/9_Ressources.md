------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Ressources utiles pour le Kernel </p>

------------------------------------------------------------------------------------------------------------------------
## I. Patch
### A. schedutil
Améliore la gestion des processeurs et des threads, ce qui permet une meilleure utilisation des ressources système pour les jeux vidéo.

C'est une mise à jour du gestionnaire de processeur (CPU) qui améliore la gestion des processeurs et des threads pour les jeux vidéo.

#### 1. Amélioration de la gestion des processeurs
Le patch "schedutil" permet au noyau de mieux gérer les processeurs et les threads, ce qui signifie que les jeux vidéo peuvent utiliser plus efficacement les ressources système. 

Cela se traduit par une amélioration de la fréquence d'images (FPS) et une réduction de la latence.

#### 2. Meilleure prise en charge des processeurs à plusieurs cœurs :
Le patch "schedutil" améliore la prise en charge des processeurs à plusieurs cœurs, ce qui permet aux jeux vidéo de bénéficier de la puissance de traitement supplémentaire offerte par ces processeurs.

<br />



### B. futex2
Améliore la gestion des mutex et des verrous, ce qui réduit les temps de latence et améliore la performance globale.

#### 1. Amélioration de la gestion des mutex
Le patch "futex2" permet au noyau de gérer plus efficacement les mutex, ce qui signifie que les jeux vidéo peuvent accéder plus rapidement aux ressources système partagées.

#### 2. Réduction des temps de latence : 
Le patch "futex2" réduit les temps de latence en permettant aux jeux vidéo de répondre plus rapidement aux événements système.

<br />



### C. io_uring
Améliore la gestion des entrées-sorties et des opérations de fichiers, ce qui réduit les temps de chargement et améliore la performance des jeux vidéo.

#### 1. Amélioration de la gestion des entrées-sorties
Le patch "io_uring" permet au noyau de gérer plus efficacement les entrées-sorties, ce qui signifie que les jeux vidéo peuvent charger plus rapidement les ressources système.

#### 2. Réduction des temps de chargement
Le patch "io_uring" réduit les temps de chargement en permettant aux jeux vidéo de charger plus rapidement les ressources système.

<br />



### D. AMD P-State
Améliore la gestion de la fréquence d'horloge des processeurs AMD, ce qui permet une meilleure performance énergétique et une réduction de la consommation d'énergie.
#### 1. Amélioration de la gestion de la fréquence d'horloge :
Le patch "AMD P-State" permet au noyau de gérer plus efficacement la fréquence d'horloge des processeurs AMD, ce qui signifie que les jeux vidéo peuvent bénéficier d'une meilleure performance énergétique.

#### 2. Réduction de la consommation d'énergie
Le patch "AMD P-State" réduit la consommation d'énergie en permettant aux processeurs AMD de fonctionner à une fréquence d'horloge plus basse lorsqu'elle n'est pas nécessaire.
