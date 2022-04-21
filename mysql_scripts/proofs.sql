use SaludJustaDB;

show tables;

select * from Appointment;
select * from Exam;
select * from ExamCatalog;
select * from Client;

INSERT INTO Exam (FK_ExamCatalog) values (1);


use SaludJustaDB;

INSERT INTO Exam (FK_ExamCatalog) values (4);
SELECT * FROM Exam;