use SaludJustaDB;

CREATE TABLE CatalogoExamen
(
	id int auto_increment primary key not null,
    tipoExamen varchar(45) not null,
    costo float not null
);


INSERT INTO CatalogoExamen (tipoExamen, costo) values ('AUDIOMETRÍA', 350.50);
INSERT INTO CatalogoExamen (tipoExamen, costo) values ('MASTOGRAFÍA', 100.50);
INSERT INTO CatalogoExamen (tipoExamen, costo) values ('ESPIROMETRÍA', 558.50);

SELECT * from CatalogoExamen;