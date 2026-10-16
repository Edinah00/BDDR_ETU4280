CREATE TABLE plat (
    id_plat SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prix INTEGER NOT NULL

);
insert into plat (nom,prix) values 
('Romazava',7000),
('Ravitoto sy henakisoa',8000),
('Akoho sy voanio',8500),
('Mi sao',6000),
('Soupe chinoise',5000),
('Mofogasy (les 4)', 1000),
('Ranon apango' ,500);