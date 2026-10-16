CREATE TABLE categorie (
    id_categorie SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);
ALTER TABLE plat ADD COLUMN id_categorie INTEGER REFERENCES categorie(id_categorie);
insert into categorie (nom) values 
('Plat Malagasy'),
('Plat chinois'),
('Dessert et gouter'),
('Soupe'),
('Boisson'),
('Entree');

update plat set id_categorie = 1 where nom in ('Romazava','Ravitoto sy henakisoa','Akoho sy voanio');
update plat set id_categorie = 2 where nom = 'Mi sao';
update plat set id_categorie = 3 where nom = 'Mofogasy (les 4)';
update plat set id_categorie =4 where nom = 'Soupe chinoise';
update plat set id_categorie = 5 where nom = 'Ranon apango';
