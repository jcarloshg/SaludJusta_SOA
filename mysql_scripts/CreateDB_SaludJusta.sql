DROP DATABASE IF EXISTS SaludJustaDB;

CREATE DATABASE IF NOT EXISTS SaludJustaDB;

use SaludJustaDB;

CREATE TABLE ExamCatalog
(
	id int auto_increment primary key not null,
    typeExam varchar(45) not null,
    cost float not null
);

CREATE TABLE Appointment
(
	id int auto_increment primary key not null,
    dateTimeA DATETIME NOT NULL,
    status varchar(10) NOT NULL,
    FK_Exam INT NOT NULL,
    FK_UserClient INT NOT NULL
);

CREATE TABLE Exam
(
	id int auto_increment primary key not null,
    results VARCHAR(45) not null,
    FK_ExamCatalog int not null
);

CREATE TABLE User
(
	id int auto_increment primary key not null,
    name VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    phoneNumber VARCHAR(10) NOT NULL,
	gender VARCHAR(45) NOT NULL,
    
    email VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    role VARCHAR(45) NOT NULL
);


# add [FOREIGN KEY][ExamCatalog] into table [Exam] -> an [Exam] is an [ExamCatalog]
ALTER TABLE Exam ADD FOREIGN KEY (FK_ExamCatalog) REFERENCES ExamCatalog(id);

# add [FOREIGN KEY][Exam] into table [Appointment] -> an [Appointment] have an [Exam]
ALTER TABLE Appointment ADD FOREIGN KEY (FK_Exam) REFERENCES Exam(id);

# add [FOREIGN KEY][Exam] into table [Appointment] -> an [Appointment] have an [Exam]
ALTER TABLE Appointment ADD FOREIGN KEY (FK_UserClient) REFERENCES User(id);

show tables;


# ==========================================================================================
# INSERTS TO PrOOFS
# ==========================================================================================

INSERT INTO User (name, lastName, phoneNumber, gender, email, password , role)
values
	('Jose Carlos', 'Huerta', '522212272775', 'FAMALE', 'carlosj12336@gmail.com', 'jose123', 'CLIENT' ),
	('Christian', 'Pasten', '521234567890', 'FAMALE', 'christian@email.com', 'christian123', 'CLIENT' ),
	('Luis David', 'Hernandez', '521234567890', 'MALE', 'luis@email.com', 'luis123', 'RECEPTIONIST' ),
	('Emmanuel', 'Bazan Velazco', '521234567890', 'MALE', 'emmanuel@email.com', 'emmanuel123', 'RECEPTIONIST' ),
	('Richie', 'Buena Vibra', '521234567890', 'FAMALE', 'richie@email.com', 'richie123', 'LAB_TECHNICIAN' ),
	('Alejando', 'Buena Cara', '521234567890', 'MALE', 'alejando@email.com', 'alejandro123', 'LAB_TECHNICIAN' )
;

SELECT * FROM User;


