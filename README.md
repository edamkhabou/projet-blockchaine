# 📦 Supply Chain Tracker - Projet Académique Blockchain Ethereum

Projet académique simple, efficace et sans dépendances lourdes pour la gestion et la traçabilité d'une chaîne d'approvisionnement sur la blockchain Ethereum.

---

## 🎯 Réponse aux 4 Exigences Académiques

1. **a. Suivi d’un produit de la fabrication à la livraison** :
   - Cycle de vie à 3 états : `Fabrique` ➔ `EnTransit` ➔ `Livre`.
   - Fonctions : `fabriquer(nom)`, `expedier(id)`, `livrer(id)`.

2. **b. Horodatage et traçabilité transparente** :
   - Gravure de la date et l'heure dans la blockchain grâce à `block.timestamp`.
   - Émission de l'événement `ProduitMaj` à chaque étape pour un audit public.
   - Consultation directe de l'historique et des dates via la fonction `getProduit(id)`.

3. **c. Mesure des performances des transactions** :
   - **Latence** : chronomètre précis entre l'envoi et la validation du bloc dans le réseau (`ms`).
   - **Gas consommé** : calculé à partir du reçu de transaction (`receipt.gasUsed`).
   - **Débit estimé (Throughput / TPS)** : calculé en transactions par seconde.

4. **d. Intégration avec une interface web** :
   - Interface web fluide et intuitive (`frontend/index.html`) utilisant `ethers.js` via CDN.
   - Connexion directe avec le portefeuille **MetaMask**.

---

## 📂 Structure du Projet

```text
├── contracts/
│   └── SupplyChain.sol           # Smart Contract Solidity (~60 lignes, ultra-lisible)
├── frontend/
│   └── index.html                # Interface Web complète (HTML + CSS + Ethers.js)
├── scripts/
│   └── measure_performance.js    # Script de calcul et de simulation des métriques
├── start_server.bat              # Script de lancement rapide en local sous Windows
├── package.json                  # Métadonnées du projet
└── README.md                     # Documentation
```

---

## 🚀 Guide Rapide de Lancement

### 1. Déploiement du Smart Contract (Remix IDE)
1. Ouvrez [remix.ethereum.org](https://remix.ethereum.org).
2. Créez un fichier `SupplyChain.sol` et collez-y le code situé dans `contracts/SupplyChain.sol`.
3. Dans l'onglet **Solidity Compiler**, compilez le contrat.
4. Dans l'onglet **Deploy & Run Transactions**, déployez le contrat (sur `Remix VM` ou sur le réseau `Sepolia` avec MetaMask).
5. Copiez l'adresse du contrat déployé (`0x...`).

### 2. Lancement de l'Application Web
1. Double-cliquez sur `start_server.bat` (ou lancez `python -m http.server 8000 --directory frontend` dans votre terminal).
2. Ouvrez votre navigateur sur **http://localhost:8000**.
3. Cliquez sur **« 🦊 Connecter MetaMask »**.
4. Collez l'adresse de votre contrat et cliquez sur **« Valider »**.
5. Vous pouvez maintenant fabriquer, expédier, livrer et mesurer les performances en temps réel !
