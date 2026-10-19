
-- prix figé à la commande (rempli AVANT l'augmentation)
ALTER TABLE detail_commande ADD COLUMN prix_unitaire INTEGER;
UPDATE detail_commande d SET prix_unitaire = p.prix
FROM plat p WHERE p.id_plat = d.id_plat;
ALTER TABLE detail_commande ALTER COLUMN prix_unitaire SET NOT NULL;

-- historique
CREATE TABLE historique_prix (
  id_historique SERIAL PRIMARY KEY,
  id_plat INTEGER NOT NULL REFERENCES plat(id_plat),
  prix INTEGER NOT NULL CHECK (prix >= 0),
  date_debut DATE NOT NULL
);
INSERT INTO historique_prix (id_plat, prix, date_debut)
SELECT id_plat, prix, DATE '2026-01-01' FROM plat;

-- augmentation du romazava
UPDATE plat SET prix = 7500 WHERE nom = 'Romazava';
INSERT INTO historique_prix (id_plat, prix, date_debut)
SELECT id_plat, 7500, DATE '2026-10-15' FROM plat WHERE nom = 'Romazava';

