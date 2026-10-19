# Schéma relationnel

## Étape 01 : Je veux la liste de mes plats avec leur prix

- PLAT(**id_plat**, nom, prix) (nouveau)
 
 Le prix est un entier (pas de centimes en ariary). L’identifiant est un numéro automatique (SERIAL), car le nom d’un plat peut changer.   

## Étape 02 : Les catégories

- CATEGORIE(**id_categorie**, nom) (nouveau)

- PLAT(**id_plat**, nom, prix , id_categorie) (modifié)

    Piège. Pourquoi ne pas simplement ajouter une colonne categorie VARCHAR(50) dans la table des
    plats ? Donnez un exemple de problème concret.
    Avec un VARCHAR, on peut écrire « Soupe » et « soupes » : ce sont 2 catégories différentes. Et pour renommer une catégorie, il faut modifier tous les plats.

## Étape 03 : Les Commandes

- COMMANDE (**id_commande** , date) (nouveau)

- DETAIL_COMMANDE (**id_detail** , id_commande ,id_plat ,quantité) 

La quantité est dans DETAIL_COMMANDE, car elle dépend à la fois de la commande et du plat.

## Étape 04 : Les Clients

- CLIENT (**id_client** , nom ,contact) (nouveau)

- COMMANDE (**id_commande** , id_client ,date) (Modifié)

    Non, la clé étrangère n’est pas NOT NULL, car certains clients sont de passage. Il faut un LEFT JOIN pour ne pas perdre les commandes sans client.


## Étape 05 : Les Serveurs et les tables

- SERVEUR (**id_serveur** , nom ,contact) (nouveau)

- TABLE (**id_table** , nom) (nouveau) 

- COMMANDE (**id_commande** , id_client ,date , id_table ,id_serveur) (Modifié)
 Une table de la salle existe en permanence, alors qu’une commande est ponctuelle. Une table reçoit plusieurs commandes, et un plat à emporter n’a pas de table. table est un mot réservé en SQL, donc on utilise table_gargotte.

## Étape 06 : Les paiements

**Piège.** Une colonne `montant_paye` dans `commande` ne dit pas combien a été payé par chaque mode (espèces + MVola), ni la référence de chaque transaction. Elle peut aussi devenir fausse si un paiement est ajouté sans la mettre à jour.

- MODE_PAIEMENT(**id_mode**, nom) (nouveau)
- PAIEMENT(**id_paiement**, #id_commande, #id_mode, montant, reference?) (nouveau)
