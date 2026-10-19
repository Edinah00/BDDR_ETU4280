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

-- 4

SELECT commande.id_commande as commande , COALESCE(client.nom,'client de passage') as Nom_client
from commande
left join client on commande.id_client = client.id_client;

-- 5

SELECT s.nom,
       COUNT(DISTINCT c.id_commande) AS nb_commandes,
       COALESCE(SUM(p.prix * d.quantite), 0) AS chiffre_affaires
FROM serveur s
LEFT JOIN commande c ON c.id_serveur = s.id_serveur
LEFT JOIN detail_commande d ON d.id_commande = c.id_commande
LEFT JOIN plat p ON p.id_plat = d.id_plat
GROUP BY s.id_serveur, s.nom;

-- étape 6
SELECT c.id_commande,
       t.total AS montant_du,
       COALESCE(p.paye, 0) AS montant_paye,
       t.total - COALESCE(p.paye, 0) AS reste_a_payer
FROM commande c
JOIN (SELECT d.id_commande, SUM(pl.prix * d.quantite) AS total
      FROM detail_commande d
      JOIN plat pl ON pl.id_plat = d.id_plat
      GROUP BY d.id_commande) t ON t.id_commande = c.id_commande
LEFT JOIN (SELECT id_commande, SUM(montant) AS paye
           FROM paiement
           GROUP BY id_commande) p ON p.id_commande = c.id_commande
WHERE t.total - COALESCE(p.paye, 0) > 0;

-- 7 : ancien calcul (le total change)
SELECT d.id_commande, SUM(p.prix * d.quantite) AS total_ancien
FROM detail_commande d JOIN plat p ON p.id_plat = d.id_plat
GROUP BY d.id_commande;

-- 7 : nouveau calcul (le total ne bouge plus)
SELECT id_commande, SUM(prix_unitaire * quantite) AS total
FROM detail_commande
GROUP BY id_commande;