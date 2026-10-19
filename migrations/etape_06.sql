
CREATE TABLE mode_paiement (
  id_mode SERIAL PRIMARY KEY,
  nom VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE paiement (
  id_paiement SERIAL PRIMARY KEY,
  id_commande INTEGER NOT NULL REFERENCES commande(id_commande),
  id_mode INTEGER NOT NULL REFERENCES mode_paiement(id_mode),
  montant INTEGER NOT NULL CHECK (montant > 0),
  reference VARCHAR(50)
);

INSERT INTO mode_paiement (nom) VALUES
('Espèces'), ('MVola'), ('Orange Money'), ('Airtel Money');

INSERT INTO paiement (id_commande, id_mode, montant, reference) VALUES
(1, (SELECT id_mode FROM mode_paiement WHERE nom = 'Espèces'), 10000, NULL),
(1, (SELECT id_mode FROM mode_paiement WHERE nom = 'MVola'), 5000, 'MV261018001'),
(2, (SELECT id_mode FROM mode_paiement WHERE nom = 'Orange Money'), 6000, 'OM261018002');

COMMIT;