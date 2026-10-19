
CREATE TABLE ingredient (
  id_ingredient SERIAL PRIMARY KEY,
  nom VARCHAR(50) NOT NULL UNIQUE,
  unite VARCHAR(10) NOT NULL,
  stock NUMERIC(10,2) NOT NULL DEFAULT 0
);

CREATE TABLE recette (
  id_plat INTEGER REFERENCES plat(id_plat),
  id_ingredient INTEGER REFERENCES ingredient(id_ingredient),
  quantite NUMERIC(10,2) NOT NULL CHECK (quantite > 0),
  PRIMARY KEY (id_plat, id_ingredient)
);

INSERT INTO ingredient (nom, unite, stock) VALUES
('Riz', 'g', 50000),
('Viande de zébu', 'g', 20000),
('Brèdes mafana', 'g', 10000);

INSERT INTO recette (id_plat, id_ingredient, quantite) VALUES
((SELECT id_plat FROM plat WHERE nom = 'Romazava'), (SELECT id_ingredient FROM ingredient WHERE nom = 'Riz'), 250),
((SELECT id_plat FROM plat WHERE nom = 'Romazava'), (SELECT id_ingredient FROM ingredient WHERE nom = 'Viande de zébu'), 150),
((SELECT id_plat FROM plat WHERE nom = 'Romazava'), (SELECT id_ingredient FROM ingredient WHERE nom = 'Brèdes mafana'), 100);

