/* Приклади роботи з класом Personal_data */
DECLARE
   pd1 Personal_data;
BEGIN 
    pd1:= NEW Personal_data (3,TO_DATE('11.03.2022','DD/MM/YYYY'), Tokareva, Marina, Borisova, Bad, Bad, 2);
dbms_output.put_line('personaldata_id: ' || personaldata_id);
dbms_output.put_line('Birth _Date_: ' || Birth _Date_);
dbms_output.put_line('Surname: ' || Surname);
dbms_output.put_line('Name: ' || Name);
dbms_output.put_line('Patronymic: ' || Patronymic);  
dbms_output.put_line('Sleepquality: ' || Sleepquality);
dbms_output.put_line('Mentalstate: ' || Mentalstate);
dbms_output.put_line('psychologist_id: ' || psychologist_id);
    pd1.display();
END;
/


/* Приклад роботи з класами Personal_data, Insomnia */
DECLARE 
    pd1 Personal_data;
    ins1 Insomnia;
BEGIN 
    pd1:= Personal_data(3,TO_DATE('11.03.2022','DD/MM/YYYY'), Tokareva, Marina, Borisova, Bad, Bad, 2);
    ins1:= Insomnia(Bad, Bad, pd1);
    ins1.display();
END;
/

/* Приклад роботи з класами Personal_data, Insomnia, Recommends */
DECLARE 
   rec1 Recommends;
   pd1 Personal_data;
   ins1 Insomnia;
BEGIN
    rec1:= Recommends(Книга по психологии, Написать письмо маме, Бег на дорожке 15 минут);
    pd1:= Personal_data(3,TO_DATE('11.03.2022','DD/MM/YYYY'), Tokareva, Marina, Borisova, Bad, Bad, 2, rec1);
    ins1:= Insomnia(Bad, Bad, rec1);
    rec1.display(); 
END;
/
