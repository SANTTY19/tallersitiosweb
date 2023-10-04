create database tallersitiosweb
use tallersitiosweb

CREATE TABLE Imagenes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    URL NVARCHAR(255) NOT NULL,
    Categoria NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(MAX) 
)

INSERT INTO Imagenes (URL, Categoria, Descripcion)
VALUES ('https://acnews.blob.core.windows.net/imgnews/extralarge/NAZ_e4843af518154f25a54e7469b5da1dfd.jpg', 'automoviles', 'camaro zl1');

INSERT INTO Imagenes (URL, Categoria, Descripcion)
VALUES ('https://puromotor.com/wp-content/uploads/2023/09/M1000R-.png', 'motocicletas', 'bmw motorrad');

INSERT INTO Imagenes (URL, Categoria, Descripcion)
VALUES ('https://www.beneteau.com/sites/default/files/styles/wide/public/2022-08/gran-turismo-usp1.jpg.webp?itok=KNsAymxC', 'barcos', 'barco beneteau');


SELECT * FROM Imagenes;

drop table Imagenes