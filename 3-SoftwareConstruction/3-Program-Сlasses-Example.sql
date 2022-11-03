/* Створення об'єктного типу (класу) User */
CREATE OR REPLACE TYPE User AS OBJECT (
user_id NUMBER(4), -- N користувача 
Surname VARCHAR(20), -- прізвище користувача
Name VARCHAR(20), -- ім'я користувача
Patronymic VARCHAR(20), -- по-батькові користувача
E-mail adress VARCHAR(20), -- e-mail адреси користувача
psychologist_id NUMBER(4), --  психолога
insomnia_id NUMBER(4), -- N insomnia-користувача
    	NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
/

/* Cтворення об'єктного типу (класу) Psychologist, що успадковує об'єктний тип User */
CREATE OR REPLACE TYPE Psychologist UNDER User (
   	psychologist_id NUMBER(4), -- N психолога
Work experience NUMBER(4), -- N досвід роботи психолога
Education VARCHAR(20), -- N освіта психолога 
salary NUMBER(6,2), -- з/п психолога
recommends_id NUMBER(4), -- N рекомендацій 
	/* перевизначення методу-процедури класу User */
    	OVERRIDING MEMBER PROCEDURE display 
);
/

/* Створення об'єктного типу (клас) Session */
-- DROP TYPE Session FORCE;
CREATE OR REPLACE TYPE Session AS OBJECT (
   session_id NUMBER(4), -- N сеансу
Duration NUMBER(2), -- тривалість сеансу
Date_ DATE, -- дата сеансу
insomnia_id NUMBER(4), -- N insomnia-користувача
psychologist_id NUMBER(4), -- N психолога
    	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_Date_ - дата сеансу
	   умова 1) якщо в таблиці Session вже існує вказана дата,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Session створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Session(p_Date_ DATE)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_Date_(p_session_id NUMBER, p_Date_ DATE),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_session_id RETURN NUMBER,
		MEMBER FUNCTION get_Date_ RETURN DATE,
    	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/
-- show errors;

/* Створення об'єктного типу (класу) Recommends */
CREATE OR REPLACE TYPE Recommends AS OBJECT (
    	recommends_id NUMBER(4), -- N рекомендацій 
Surname VARCHAR(20), -- прізвище користувача
Name VARCHAR(20), -- ім'я користувача
Patronymic VARCHAR(20), -- по-батькові користувача
Sleep quality VARCHAR(20), -- опис якості сну 
Birth _Date_ DATE, -- дата народження
Mental state VARCHAR(20), -- опис психологічно-емоційного стану
personaldata_id NUMBER(4), -- N персональних даних 
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

/* Створення об'єктного типу (класу) Personaldata */
CREATE OR REPLACE TYPE Personaldata AS OBJECT (
    	personaldata_id NUMBER(4), -- N персональних даних
Surname VARCHAR(20), -- прізвище користувача
Name VARCHAR(20), -- ім'я користувача
Patronymic VARCHAR(20), -- по-батькові користувача
Sleep quality VARCHAR(20), -- опис якості сну 
Birth _Date_ DATE, -- дата народження
Mental state VARCHAR(20), -- опис психологічно-емоційного стану
psychologist_id NUMBER(4), -- N психолога
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

/* Створення об'єктного типу (класу) Insomnia */
CREATE OR REPLACE TYPE Insomnia AS OBJECT (
    	insomnia_id NUMBER(4), -- N insomnia-користувача
Mental state VARCHAR(20), -- опис психологічно-емоційного стану
Sleep quality VARCHAR(20), -- опис якості сну
personaldata_id NUMBER(4), -- N персональних даних
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/




