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
