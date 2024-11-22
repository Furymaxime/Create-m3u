# Générateur de fichiers `.m3u` pour Jeux Multidisques

Ce script batch Windows automatise la création de fichiers `.m3u` pour des dossiers contenant des jeux multi-disques. Les fichiers `.m3u` sont particulièrement utiles pour les émulateurs prenant en charge ce format, permettant de gérer facilement les changements de disque.

---

## Fonctionnalités

- **Recherche récursive** : Parcourt un répertoire et ses sous-dossiers à la recherche de fichiers correspondant aux extensions spécifiées.
- **Création de fichiers `.m3u`** : Génère un fichier `.m3u` pour les dossiers contenant plusieurs fichiers (ex. `.chd`, `.iso`) afin de lister tous les fichiers dans l'ordre.
- **Flexible et configurable** : Permet de spécifier les extensions de fichiers à traiter.
- **Ignoration automatique** : Ignore les dossiers contenant un seul fichier.

---

## Prérequis

1. **Système d'exploitation** : Windows avec support des scripts batch.
2. **Données compatibles** : Les fichiers doivent avoir des extensions cohérentes (comme `.chd`, `.iso`, ou autres formats de jeu).
3. **Terminal Windows** : Accès à l'invite de commandes pour exécuter le script.

---

## Installation

1. Téléchargez le script et placez-le dans un dossier accessible.
2. Assurez-vous que le répertoire contenant vos fichiers de jeu est correctement organisé.

---

## Utilisation

1. **Exécuter le script** : 
   - Double-cliquez sur le fichier `.bat`, **ou**
   - Ouvrez un terminal, naviguez jusqu'au répertoire du script, puis exécutez :
     ```cmd
     create m3u_Fury.bat
     ```

2. **Entrer les informations demandées** :
   - **Chemin du répertoire racine** : Fournissez le chemin vers le dossier contenant vos jeux, par exemple `C:\Fullset PSX`.
   - **Extensions de fichiers à traiter** : Indiquez les extensions (séparées par un espace), par exemple `chd iso`.

3. **Résultat attendu** :
   - Un fichier `.m3u` sera généré pour chaque dossier contenant plusieurs fichiers correspondant aux extensions spécifiées.

---

## Exemple

### Structure avant exécution :

```
C:\Fullset PSX\
├── Game1\
│   ├── disc1.chd
│   ├── disc2.chd
├── Game2\
│   ├── game.iso
├── Game3\
│   ├── part1.chd
│   ├── part2.chd
│   ├── part3.chd
```

### Étapes :
1. Lancer le script.
2. Saisir le chemin `C:\Fullset PSX`.
3. Entrer les extensions `chd iso`.

### Structure après exécution :

```
C:\Fullset PSX\
├── Game1\
│   ├── disc1.chd
│   ├── disc2.chd
│   ├── Game1.m3u
├── Game2\
│   ├── game.iso
├── Game3\
│   ├── part1.chd
│   ├── part2.chd
│   ├── part3.chd
│   ├── Game3.m3u
```

### Contenu d'un fichier `.m3u` :
Pour `Game1.m3u` :
```
disc1.chd
disc2.chd
```

---

## Limitations

- Ne génère pas de fichier `.m3u` pour les dossiers contenant un seul fichier correspondant aux extensions.
- Les extensions de fichiers doivent être spécifiées manuellement lors de l'exécution.
- Les fichiers sont ajoutés dans l'ordre trouvé par le système de fichiers, il est recommandé de nommer les fichiers pour maintenir un tri correct (ex. `disc1`, `disc2`, etc.).

---

## Personnalisation

Si vous souhaitez étendre ou adapter le script (par exemple, ajouter des fonctionnalités ou automatiser certaines étapes), le code est ouvert et modifiable.

---

## Licence

Ce projet est distribué sous licence MIT. Vous êtes libre d'utiliser, modifier et redistribuer ce script.

--- 

N'hésitez pas à poser des questions ou à demander des améliorations ! 😊
