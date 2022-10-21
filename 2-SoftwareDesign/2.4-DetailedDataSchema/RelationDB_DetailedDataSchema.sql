/* видалення таблиць з каскадним видаленням 
можливих описів цілісності */
drop table User CASCADE CONSTRAINTS;
drop table Psychologist CASCADE CONSTRAINTS;
drop table Session CASCADE CONSTRAINTS;
drop table Recommends CASCADE CONSTRAINTS;
drop table Insomnia CASCADE CONSTRAINTS;
drop table Personal data CASCADE CONSTRAINTS;

CREATE TABLE User ( -- опис користувача
user_id NUMBER(4), -- N користувача 
Surname VARCHAR(20), -- прізвище користувача
Name VARCHAR(20), -- ім'я користувача
Patronymic VARCHAR(20), -- по-батькові користувача
E-mail adress VARCHAR(20), -- e-mail адреси користувача
psychologist_id NUMBER(4), --  психолога
insomnia_id NUMBER(4), -- N insomnia-користувача

);

CREATE TABLE Psychologist ( -- опис психолога
psychologist_id NUMBER(4), -- N психолога
Work experience NUMBER(4), -- N досвід роботи психолога
Education VARCHAR(20), -- N освіта психолога 
salary NUMBER(6,2), -- з/п психолога
recommends_id NUMBER(4), -- N рекомендацій 

);

CREATE TABLE Session ( -- опис сеансу
session_id NUMBER(4), -- N сеансу
Duration NUMBER(2), -- тривалість сеансу
Date_ DATE, -- дата сеансу
insomnia_id NUMBER(4), -- N insomnia-користувача
psychologist_id NUMBER(4), -- N психолога

);

CREATE TABLE Recommends ( -- опис рекомендацій
recommends_id NUMBER(4), -- N рекомендацій 
Surname VARCHAR(20), -- прізвище користувача
Name VARCHAR(20), -- ім'я користувача
Patronymic VARCHAR(20), -- по-батькові користувача
Sleep quality VARCHAR(20), -- опис якості сну 
Birth _Date_ DATE, -- дата народження
Mental state VARCHAR(20), -- опис психологічно-емоційного стану
personaldata_id NUMBER(4), -- N персональних даних

);

CREATE TABLE Personaldata ( -- опис персональних даних
personaldata_id NUMBER(4), -- N персональних даних
Surname VARCHAR(20), -- прізвище користувача
Name VARCHAR(20), -- ім'я користувача
Patronymic VARCHAR(20), -- по-батькові користувача
Sleep quality VARCHAR(20), -- опис якості сну 
Birth _Date_ DATE, -- дата народження
Mental state VARCHAR(20), -- опис психологічно-емоційного стану
psychologist_id NUMBER(4), -- N психолога

); 

CREATE TABLE Insomnia ( -- опис insomnia-користувача
insomnia_id NUMBER(4), -- N insomnia-користувача
Mental state VARCHAR(20), -- опис психологічно-емоційного стану
Sleep quality VARCHAR(20), -- опис якості сну
personaldata_id NUMBER(4), -- N персональних даних

); 

-- обмеження первинних ключів
ALTER TABLE User ADD CONSTRAINT user_pk
	PRIMARY KEY (user_id);
ALTER TABLE  Psychologist ADD CONSTRAINT psych_pk
	PRIMARY KEY (psychologist_id);
ALTER TABLE  Personaldata ADD CONSTRAINT pdata_pk
	PRIMARY KEY (personaldata_id);
ALTER TABLE  Session ADD CONSTRAINT sess_pk
	PRIMARY KEY (session_id);
ALTER TABLE  Recommends ADD CONSTRAINT rec_pk
	PRIMARY KEY (recommends_id);
ALTER TABLE  Insomnia ADD CONSTRAINT ins_pk
	PRIMARY KEY (insomnia_id);

-- обмеження зовнішніх ключів
ALTER TABLE User ADD CONSTRAINT user_psychologist_id_fk
	FOREIGN KEY (psychologist_id)
	REFERENCES Psychologist (psychologist_id);

ALTER TABLE User ADD CONSTRAINT user_insomnia_id_fk
	FOREIGN KEY (insomnia_id)
	REFERENCES Insomnia (insomnia_id);

ALTER TABLE Personaldata ADD CONSTRAINT pdata_psychologist_id_fk
	FOREIGN KEY (psychologist_id)
	REFERENCES Psychologist (psychologist_id);

ALTER TABLE Recommends ADD CONSTRAINT rec_personaldata_id_fk
	FOREIGN KEY (personaldata_id)
	REFERENCES Personaldata (personaldata_id);

ALTER TABLE Psychologist ADD CONSTRAINT  psychologist_recommends_id_fk
	FOREIGN KEY (recommends_id)
	REFERENCES Recommends (recommends_id);

ALTER TABLE Insomnia ADD CONSTRAINT  insomnia_pdata_id_fk
	FOREIGN KEY (personaldata_id)
	REFERENCES Personaldata (personaldata_id);

ALTER TABLE Session ADD CONSTRAINT session_insomnia_id_fk
	FOREIGN KEY (insomnia_id)
	REFERENCES Insomnia (insomnia_id);
ALTER TABLE Session ADD CONSTRAINT session_psychologist_id_fk
	FOREIGN KEY (psychologist_id)
	REFERENCES Psychologist (psychologist_id);

-- обмеження вмісту стовпчиків таблиці
ALTER TABLE User ADD CONSTRAINT user_e-mail_adress
    CHECK (regexp_like(e-mail_adress, 
	           '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'));	

ALTER TABLE Session ADD CONSTRAINT session_duration_range
CHECK (duration between 0 and 60);

ALTER TABLE Psychologist ADD CONSTRAINT psychologist_salary_range
	CHECK (salary between 0 and 10000);

ALTER TABLE Psychologist ADD CONSTRAINT psychologist_workexperience_range
	CHECK (workexperience > 0);