@echo off
title Serveur Local SupplyChain DApp
echo ========================================================
echo   Lancement du Serveur Web Local pour MetaMask...
echo ========================================================
echo.
echo Pourquoi un serveur local ?
echo Les navigateurs (Chrome, Edge, Brave) bloquent MetaMask sur 
echo les fichiers ouverts directement en "file://".
echo En passant par http://localhost:8000, MetaMask est detecte 
echo automatiquement !
echo.
echo Ouverture de votre navigateur sur http://localhost:8000 ...
start http://localhost:8000
echo.
echo Serveur en cours d'execution sur le port 8000.
echo (Pour arreter le serveur, fermez cette fenetre).
echo.
python -m http.server 8000 --directory frontend
pause
