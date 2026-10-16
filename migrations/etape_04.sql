CREATE TABLE client (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    contact VARCHAR(50) NOT NULL
);

insert into client (nom, contact) values 
('Rakoto', '0341234567'),
('Rasoa', '0329876543'),
('Rabe', '0334567890');

ALTER TABLE commande 
ADD COLUMN id_client INTEGER DEFAULT NULL REFERENCES client(id_client);

UPDATE commande
SET id_client = 1 WHERE id_commande = 1;
UPDATE commande
SET id_client = 2 WHERE id_commande = 2;
