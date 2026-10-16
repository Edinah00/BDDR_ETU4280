SELECT * FROM plat ORDER BY prix DESC;
--2 jointure externe (categorie na tsisy plat) 

SELECT categorie.nom AS Categorie,COUNT(plat.id_plat) AS nombre_plat
FROM categorie 
LEFT JOIN plat on plat.id_categorie = categorie.id_categorie
GROUP BY categorie.nom;
-- 3
SELECT id_commande , SUM(detail_commande.quantite * plat.prix) 
AS prix_total_commande 
FROM detail_commande 
JOIN plat ON detail_commande.id_plat = plat.id_plat
GROUP BY id_commande;
