@echo off
setlocal enabledelayedexpansion

REM Demander à l'utilisateur de saisir le répertoire racine
echo Veuillez entrer le chemin du répertoire racine contenant les jeux (par exemple C:\Fullset PSX) :
set /p root_dir= 

REM Vérifier si le dossier existe
if not exist "%root_dir%" (
    echo Le répertoire spécifié n'existe pas. Veuillez vérifier le chemin et réessayer.
    pause
    exit /b
)

REM Demander à l'utilisateur de saisir les extensions de fichiers à traiter (par exemple, chd iso)
echo Veuillez entrer les extensions des fichiers à traiter (séparées par un espace, par exemple chd iso) :
set /p extensions=

REM Parcourir tous les sous-dossiers
for /r "%root_dir%" %%d in (.) do (
    pushd "%%d"
    
    REM Vérifier si le dossier contient des fichiers des extensions spécifiées
    set "files_found="
    set "file_count=0"
    
    REM Boucle sur chaque extension pour vérifier les fichiers correspondants
    for %%e in (%extensions%) do (
        for %%f in (*%%e) do (
            set "files_found=1"
            set /a file_count+=1
        )
    )
    
    REM Si plusieurs fichiers des extensions spécifiées sont trouvés, créer le .m3u
    if defined files_found if !file_count! geq 2 (
        REM Nom du dossier = nom du jeu
        set "game_name=%%~nd"

        REM Créer le fichier .m3u pour ce jeu
        if not exist "!game_name!.m3u" (
            > "!game_name!.m3u" (
                REM Ajouter chaque fichier des extensions spécifiées pour ce jeu dans le .m3u
                for %%e in (%extensions%) do (
                    for %%f in (*%%e) do (
                        echo %%~nxf
                    )
                )
            )
            REM Afficher uniquement le jeu pour lequel un fichier .m3u a été créé
            echo Fichier !game_name!.m3u créé.
        )
    )
    
    REM Si seulement un fichier des extensions spécifiées est trouvé, ne pas créer de .m3u
    if defined files_found if !file_count! lss 2 (
        REM Ne rien afficher pour les jeux avec un seul fichier
    )
    
    popd
)

echo Génération des fichiers .m3u terminée.
pause
