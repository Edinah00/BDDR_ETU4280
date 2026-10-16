CREATE TABLE serveur (
    id_serveur SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    contact VARCHAR(50) NOT NULL
);

CREATE TABLE table_gargotte(
    id_table SERIAL PRIMARY KEY,
    nom_table VARCHAR(50) NOT NULL
);

insert into serveur (nom, contact) values 
('Njaka Rakoto', '0341234567'),
('Lalao Rasoa', '0329876543');

insert into table_gargotte (nom_table) values 
('Table 1'),
('Table 2'),
('Table 3'),
('Table 4'),
('Table 5'),
('Table 6'),
('Table 7'),
('Table 8');


alter table commande
add column id_serveur integer default null references serveur(id_serveur);

alter table commande
add column id_table integer default null references table_gargotte(id_table);

update commande
set id_serveur = 1, id_table = 1 where id_commande = 1;
update commande
set id_serveur = 2, id_table = 2 where id_commande = 2;

