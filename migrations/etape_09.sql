CREATE TABLE composition_menu (
  id_menu INTEGER REFERENCES plat(id_plat),
  id_plat INTEGER REFERENCES plat(id_plat),
  quantite INTEGER NOT NULL DEFAULT 1 CHECK (quantite > 0),
  PRIMARY KEY (id_menu, id_plat),
  CHECK (id_menu <> id_plat)
);

INSERT INTO categorie (nom) VALUES ('Menu');

INSERT INTO plat (nom, prix, id_categorie)
VALUES ('Menu Romazava', 8000, (SELECT id_categorie FROM categorie WHERE nom = 'Menu'));

INSERT INTO historique_prix (id_plat, prix, date_debut)
SELECT id_plat, prix, CURRENT_DATE FROM plat WHERE nom = 'Menu Romazava';

INSERT INTO composition_menu (id_menu, id_plat, quantite) VALUES
((SELECT id_plat FROM plat WHERE nom = 'Menu Romazava'), (SELECT id_plat FROM plat WHERE nom = 'Romazava'), 1),
((SELECT id_plat FROM plat WHERE nom = 'Menu Romazava'), (SELECT id_plat FROM plat WHERE nom = 'Ranon''ampango'), 1),
((SELECT id_plat FROM plat WHERE nom = 'Menu Romazava'), (SELECT id_plat FROM plat WHERE nom = 'Mofo gasy (les 4)'), 1);

