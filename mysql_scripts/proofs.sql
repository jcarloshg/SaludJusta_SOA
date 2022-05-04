use SaludJustaDB;

show tables;

select * from Appointment;
select * from Exam;
select * from ExamCatalog;
select * from Client;

INSERT INTO Exam (FK_ExamCatalog) values (1);


use SaludJustaDB;

INSERT INTO Exam (FK_ExamCatalog) values (4);
SELECT * FROM Appointment WHERE status = "EN ESPERA" AND date ='2022-04-21';
SELECT * FROM Appointment WHERE idAppointment = 1;


UPDATE Appointment SET status = "EN CURSO" WHERE idAppointment =1; 
SELECT * from Appointment;

UPDATE Appointment SET FK_Exam = 1, FK_UserClient = 1, status = "EN ESPERA" WHERE idAppointment = 1;


use SaludJustaDB;
SELECT * FROM Exam INNER JOIN ExamCatalog ON Exam.FK_ExamCatalog = ExamCatalog.idExamCatalog WHERE idExam= 3;
UPDATE Exam SET results="RESRULTADOS DE PRUEBA" WHERE idExam= 3;
