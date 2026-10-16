CREATE TABLE commande (
    id_commande SERIAL PRIMARY KEY,
    date_commande TIMESTAMP NOT NULL
);

CREATE TABLE detail_commande (
    id_detail_commande SERIAL PRIMARY KEY,
    id_commande INTEGER REFERENCES commande(id_commande),
    id_plat INTEGER REFERENCES plat(id_plat),
    quantite INTEGER NOT NULL
);

insert into commande (date_commande) values 
('2024-06-01 12:00:00'),
('2024-06-02 18:30:00'),
('2024-06-03 14:15:00');

insert into detail_commande (id_commande, id_plat, quantite) values 
(1, 1, 2),
(1, 3, 1);
