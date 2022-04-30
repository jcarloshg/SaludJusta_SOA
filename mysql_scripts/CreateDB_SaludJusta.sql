DROP DATABASE IF EXISTS SaludJustaDB;

CREATE DATABASE IF NOT EXISTS SaludJustaDB;


# ROLES
# client -> CLIENT
# receptionist -> RECEPTIONIST
# labTechnician -> LAB_TECHNICIAN

# GENDER
# male -> MALE
# famale -> FAMAL

# STATUS
# EN ESPERA
# FINALIZADA
# NO ASIGNADA
# EN CURSO

use SaludJustaDB;

CREATE TABLE ExamCatalog
(
	idExamCatalog int auto_increment primary key not null,
    typeExam varchar(45) not null,
    cost float not null
);

CREATE TABLE Appointment
(
	idAppointment int auto_increment primary key not null,
    date DATE NOT NULL,
    time TIME NOT NULL,
    status varchar(20) NOT NULL,
    FK_Exam INT,
    FK_ExamCatalog INT NOT NULL,
    FK_UserClient INT
);

CREATE TABLE Exam
(
	idExam int auto_increment primary key not null,
    results VARCHAR(45),
    FK_ExamCatalog int not null
);

CREATE TABLE User
(
	idUser int auto_increment primary key not null,
    name VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    phoneNumber VARCHAR(10) NOT NULL,
	gender VARCHAR(45) NOT NULL,
    
    email VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    role VARCHAR(45) NOT NULL
);


# add [FOREIGN KEY][ExamCatalog] into table [Exam] -> an [Exam] is an [ExamCatalog]
ALTER TABLE Exam ADD FOREIGN KEY (FK_ExamCatalog) REFERENCES ExamCatalog(idExamCatalog);

# add [FOREIGN KEY][Exam] into table [Appointment] -> an [Appointment] have an [Exam]
ALTER TABLE Appointment ADD FOREIGN KEY (FK_Exam) REFERENCES Exam(idExam);

# add [FOREIGN KEY][Exam] into table [Appointment] -> [APPOINTMENTS] BELONG TO ONE EXAM TYPE FROM [ExamCatalog]
ALTER TABLE Appointment ADD FOREIGN KEY (FK_ExamCatalog) REFERENCES ExamCatalog(idExamCatalog);

# add [FOREIGN KEY][Exam] into table [Appointment] -> an [Appointment] have an [Exam]
ALTER TABLE Appointment ADD FOREIGN KEY (FK_UserClient) REFERENCES User(idUser);

show tables;


# ==========================================================================================
# INSERTS TO PrOOFS
# ==========================================================================================


INSERT INTO ExamCatalog (typeExam, cost) values ('AUDIOMETRÍA', 350.50);
INSERT INTO ExamCatalog (typeExam, cost) values ('MASTOGRAFÍA', 100.50);
INSERT INTO ExamCatalog (typeExam, cost) values ('ESPIROMETRÍA', 558.50);
INSERT INTO ExamCatalog (typeExam, cost) values ('PERFIL TRIODE', 100.50);
INSERT INTO ExamCatalog (typeExam, cost) values ('BIOMETRÍA HEMÁTICA', 920.00);


INSERT INTO User (name, lastName, phoneNumber, gender, email, password , role)
values
	('Jose Carlos', 'Huerta', '522212272775', 'FAMALE', 'carlosj12336@gmail.com', 'jose123', 'CLIENT' ),
	('Christian', 'Pasten', '521234567890', 'FAMALE', 'christian@email.com', 'christian123', 'CLIENT' ),
	('Luis David', 'Hernandez', '521234567890', 'MALE', 'luis@email.com', 'luis123', 'RECEPTIONIST' ),
	('Emmanuel', 'Bazan Velazco', '521234567890', 'MALE', 'emmanuel@email.com', 'emmanuel123', 'RECEPTIONIST' ),
	('Richie', 'Buena Vibra', '521234567890', 'FAMALE', 'richie@email.com', 'richie123', 'LAB_TECHNICIAN' ),
	('Alejando', 'Buena Cara', '521234567890', 'MALE', 'alejando@email.com', 'alejandro123', 'LAB_TECHNICIAN' )
;

INSERT INTO
  Appointment (date,time,status, FK_ExamCatalog)
values
  ('2022-04-21', '07:00:00', "NO ASIGNADA", 1),
  ('2022-04-21', '07:30:00', "NO ASIGNADA", 1),
  ('2022-04-21', '08:00:00', "NO ASIGNADA", 1),
  ('2022-04-21', '08:30:00', "NO ASIGNADA", 1),
  ('2022-04-21', '09:00:00', "NO ASIGNADA", 1),
  ('2022-04-21', '09:30:00', "NO ASIGNADA", 1),
  #############
  ('2022-04-21', '07:00:00', "NO ASIGNADA", 2),
  ('2022-04-21', '08:00:00', "NO ASIGNADA", 2),
  ('2022-04-21', '09:00:00', "NO ASIGNADA", 2),
  ('2022-04-21', '10:00:00', "NO ASIGNADA", 2),
  ('2022-04-21', '11:00:00', "NO ASIGNADA", 2),
  ('2022-04-21', '12:00:00', "NO ASIGNADA", 2),
  #############
  ('2022-04-21', '12:00:00', "NO ASIGNADA", 3),
  ('2022-04-21', '12:30:00', "NO ASIGNADA", 3),
  ('2022-04-21', '13:00:00', "NO ASIGNADA", 3),
  ('2022-04-21', '13:30:00', "NO ASIGNADA", 3),
  ('2022-04-21', '14:00:00', "NO ASIGNADA", 3),
  ('2022-04-21', '14:30:00', "NO ASIGNADA", 3),
  #############
  ('2022-04-21', '12:00:00', "NO ASIGNADA", 4),
  ('2022-04-21', '13:00:00', "NO ASIGNADA", 4),
  ('2022-04-21', '14:00:00', "NO ASIGNADA", 4),
  ('2022-04-21', '15:00:00', "NO ASIGNADA", 4),
  ('2022-04-21', '16:00:00', "NO ASIGNADA", 4),
  ('2022-04-21', '17:00:00', "NO ASIGNADA", 4),
  #############
  ('2022-04-21', '07:00:00', "NO ASIGNADA", 5),
  ('2022-04-21', '08:00:00', "NO ASIGNADA", 5),
  ('2022-04-21', '08:00:00', "NO ASIGNADA", 5),
  ('2022-04-21', '09:00:00', "NO ASIGNADA", 5),
  ('2022-04-21', '10:00:00', "NO ASIGNADA", 5),
  ('2022-04-21', '11:00:00', "NO ASIGNADA", 5)
  ;

## CREATE EXAMS
INSERT INTO Exam (FK_ExamCatalog) VALUES (1);
INSERT INTO Exam (FK_ExamCatalog) VALUES (1);
INSERT INTO Exam (FK_ExamCatalog) VALUES (1);
INSERT INTO Exam (FK_ExamCatalog) VALUES (1);
INSERT INTO Exam (FK_ExamCatalog) VALUES (1);

## INSERT IDEXAMS, IDCLIENT AND CHANGE STATUS TO EACH APPOINTMENT
UPDATE Appointment SET FK_UserClient=1, FK_Exam=1,status = "EN CURSO" WHERE idAppointment = 1;
UPDATE Appointment SET FK_UserClient=1, FK_Exam=2,status = "EN CURSO" WHERE idAppointment = 2;
UPDATE Appointment SET FK_UserClient=1, FK_Exam=3,status = "EN CURSO" WHERE idAppointment = 3;
UPDATE Appointment SET FK_UserClient=1, FK_Exam=4,status = "EN CURSO" WHERE idAppointment = 4;
UPDATE Appointment SET FK_UserClient=1, FK_Exam=5,status = "EN CURSO" WHERE idAppointment = 5;


use SaludJustaDB;
SELECT * FROM User;
SELECT * FROM ExamCatalog;
SELECT * FROM Exam;
SELECT * FROM Appointment;

SELECT * FROM Exam 
INNER JOIN ExamCatalog ON Exam.FK_ExamCatalog = ExamCatalog.idExamCatalog
INNER JOIN Appointment ON Appointment.FK_Exam = Exam.idExam
INNER JOIN User ON User.idUser = Appointment.FK_UserClient 
WHERE status = 'EN CURSO' AND date = '2022-04-21'
ORDER BY time ASC;

SELECT * FROM Exam INNER JOIN Appointment ON Appointment.FK_Exam = Exam.idExam WHERE status = 'EN ESPERA' AND date = '2022-04-21'ORDER BY time ASC;


