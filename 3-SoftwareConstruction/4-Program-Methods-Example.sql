/* Методи класу Personal data */
-- DROP TYPE Personal data FORCE;
CREATE OR REPLACE TYPE BODY Personal data AS 
    
       
    
/* Процедура зміни значень атрибутів */
MEMBER PROCEDURE fillPersonaldata(p_personaldata_id NUMBER, p_Birth _Date_ DATE, p_Surname VARCHAR, p_Name VARCHAR, p_Patronymic VARCHAR, p_Sleepquality VARCHAR, p_Mentalstate VARCHAR, p_psychologist_id NUMBER )
IS
BEGIN
UPDATE Personal data SET Birth _Date_ = p_Birth _Date_, Surname = p_Surname, Name = p_Surname, Patronymic = p_Patronymic, Sleepquality = p_Sleepquality, Mentalstate = p_Mentalstate
WHERE personaldata_id = p_personaldata_id, psychologist_id = p_psychologist_id;
SELF.Birth _Date_ := p_Birth _Date_, SELF.Surname := p_Surname, SELF.Name := p_Surname, SELF.Patronymic := p_Patronymic, SELF.Sleepquality := p_Sleepquality, SELF.Mentalstate := p_Mentalstate
END fillPersonaldata;

/* Функції отримання значень атрибутів */
/* get_personaldata_id */
MEMBER FUNCTION get_personaldata_id
RETURN NUMBER 
IS
BEGIN
RETURN SELF.personaldata_id;
END get_personaldata_id;
        
/* get_Birth _Date_*/
MEMBER FUNCTION get_Birth _Date_
RETURN NUMBER 
IS
BEGIN
RETURN SELF.Birth _Date_;
END get_Birth _Date_;

/* Процедура виводу на екран значень атрибутів */
MEMBER PROCEDURE display 
IS
BEGIN 
dbms_output.put_line('personaldata_id: ' || personaldata_id);
dbms_output.put_line('Birth _Date_: ' || Birth _Date_);
dbms_output.put_line('Surname: ' || Surname);
dbms_output.put_line('Name: ' || Name);
dbms_output.put_line('Patronymic: ' || Patronymic);  
dbms_output.put_line('Sleepquality: ' || Sleepquality);
dbms_output.put_line('Mentalstate: ' || Mentalstate);
END display;
END; 
/
