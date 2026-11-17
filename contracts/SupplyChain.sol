// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title SupplyChain - Projet Academique Simple
 * Ce contrat gere la tracabilite d'un produit : Fabrication -> Transport -> Livraison
 */
contract SupplyChain {

    // a. Les 3 statuts possibles d'un produit
    enum Statut { Fabrique, EnTransit, Livre }

    // Structure des donnees d'un produit
    struct Produit {
        uint id;
        string nom;
        Statut statut;
        uint dateCreation;      // b. Horodatage initial (block.timestamp)
        uint dateDerniereMaj;  // b. Horodatage derniere mise a jour
        address responsable;   // Adresse de la derniere personne ayant interagi
    }

    uint public totalProduits;
    mapping(uint => Produit) public produits;

    // Evenement emis pour la tracabilite sur la blockchain
    event ProduitMaj(uint id, string nom, Statut statut, uint date, address responsable);

    // 1. FABRICATION : Cree un produit
    function fabriquer(string memory _nom) public {
        totalProduits++;
        produits[totalProduits] = Produit(
            totalProduits,
            _nom,
            Statut.Fabrique,
            block.timestamp,
            block.timestamp,
            msg.sender
        );
        emit ProduitMaj(totalProduits, _nom, Statut.Fabrique, block.timestamp, msg.sender);
    }

    // 2. EXPEDITION : Passe le produit "En Transit"
    function expedier(uint _id) public {
        require(_id > 0 && _id <= totalProduits, "Produit inexistant");
        require(produits[_id].statut == Statut.Fabrique, "Le produit doit etre a l'etat Fabrique");

        produits[_id].statut = Statut.EnTransit;
        produits[_id].dateDerniereMaj = block.timestamp;
        produits[_id].responsable = msg.sender;

        emit ProduitMaj(_id, produits[_id].nom, Statut.EnTransit, block.timestamp, msg.sender);
    }

    // 3. LIVRAISON : Passe le produit "Livre"
    function livrer(uint _id) public {
        require(_id > 0 && _id <= totalProduits, "Produit inexistant");
        require(produits[_id].statut == Statut.EnTransit, "Le produit doit etre En Transit");

        produits[_id].statut = Statut.Livre;
        produits[_id].dateDerniereMaj = block.timestamp;
        produits[_id].responsable = msg.sender;

        emit ProduitMaj(_id, produits[_id].nom, Statut.Livre, block.timestamp, msg.sender);
    }

    // Fonction de lecture simple pour recuperer un produit
    function getProduit(uint _id) public view returns (
        uint id,
        string memory nom,
        string memory statutTexte,
        uint dateCreation,
        uint dateDerniereMaj,
        address responsable
    ) {
        require(_id > 0 && _id <= totalProduits, "Produit inexistant");
        Produit memory p = produits[_id];
        
        string memory s = "Fabrique";
        if (p.statut == Statut.EnTransit) s = "En Transit";
        if (p.statut == Statut.Livre) s = "Livre";

        return (p.id, p.nom, s, p.dateCreation, p.dateDerniereMaj, p.responsable);
    }
}
