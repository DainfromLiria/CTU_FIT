create or replace procedure fill_student(row_count IN NUMBER) AUTHID CURRENT_USER IS
    TYPE VARCHAR_ARRAY IS TABLE OF VARCHAR2(256); -- array for name, surname or specialization
    check_id NUMBER;
    i NUMBER := 0;
    check_row_cnt_zam NUMBER;
    check_row_cnt_stud NUMBER;

    g_id_zamestnanec STUDENT.ID_ZAMESTNANEC%type;
    g_id_student STUDENT.ID_STUDENT%type;
    g_plat STUDENT.PLAT%type;
    g_rocnik STUDENT.ROCNIK%type;
    g_name VARCHAR_ARRAY := VARCHAR_ARRAY('Alex', 'Sophia', 'Ethan',
                                          'Emma', 'William', 'Olivia',
                                          'Liam', 'Ava', 'Noah', 'Isabella',
                                          'James', 'Charlotte', 'Logan', 'Amelia',
                                          'Benjamin', 'Mia', 'Mason', 'Harper', 'Elijah', 'Abigail');
    g_surname VARCHAR_ARRAY := VARCHAR_ARRAY('Johnson', 'Williams', 'Brown', 'Jones',
                                             'Davis', 'Miller', 'Wilson', 'Moore',
                                             'Taylor', 'Anderson', 'Thomas', 'White',
                                             'Jackson', 'Harris', 'Martin', 'Thompson',
                                             'Garcia', 'Martinez', 'Robinson', 'Clark');
    g_obor VARCHAR_ARRAY := VARCHAR_ARRAY('Informatika a výpočetní technika', 'Elektrotechnika a elektronika',
                                          'Chemické inženýrství', 'Aplikovaná matematika',
                                          'Aplikovaná fyzika', 'Automatizace a řízení',
                                          'Biotechnologie a bioinženýrství', 'Telekomunikace a sítě',
                                          'Robotika','Umělá inteligence',
                                          'Informační bezpečnost a kybernetika', 'Výpočetní vědy a informatika',
                                          'Kybernetika a teorie informace', 'Technická fyzika');
begin
    -- check if tables is not empty
    SELECT COUNT(*) INTO check_row_cnt_zam FROM ZAMESTNANEC;
    SELECT COUNT(*) INTO check_row_cnt_stud FROM STUDENT;
    if check_row_cnt_stud > 0 OR check_row_cnt_zam > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Table ZAMESTNANEC or STUDENT is not empty!');
        RETURN;
    end if;

    while i < row_count loop
        g_id_zamestnanec := round(DBMS_RANDOM.VALUE(1, row_count), 0); -- DBMS_RANDOM.VALUE return float number
        -- check if generated id is not in table (count of rows must be 0)
        SELECT COUNT(*) INTO check_id
        FROM ZAMESTNANEC
        WHERE ID_ZAMESTNANEC = g_id_zamestnanec;
        if check_id = 0 THEN
            INSERT INTO ZAMESTNANEC (ID_ZAMESTNANEC, JMENO, PLAT, PRIJMENI)
            VALUES (g_id_zamestnanec, g_name(round(DBMS_RANDOM.VALUE(1, 20), 0)),
                    round(DBMS_RANDOM.VALUE(1, 100000), 0),
                    g_surname(round(DBMS_RANDOM.VALUE(1, 20), 0)));
            commit;
        end if;


        g_id_student := round(DBMS_RANDOM.VALUE(1, row_count), 0);
        g_plat := round(DBMS_RANDOM.VALUE(1000, 10000), 0);
        g_rocnik := round(DBMS_RANDOM.VALUE(1, 3), 0);
        -- check if generated id is not in table (count of rows must be 0)
        SELECT COUNT(*) INTO check_id
        FROM STUDENT
        WHERE ID_STUDENT = g_id_student;

        -- if id is not in table insert data into table and increment i on 1
        if check_id = 0 THEN
            INSERT INTO STUDENT(ID_STUDENT, ID_ZAMESTNANEC, JMENO, OBOR, PLAT, PRIJMENI, ROCNIK)
            VALUES (g_id_student, g_id_zamestnanec, g_name(round(DBMS_RANDOM.VALUE(1, 20), 0)),
                    g_obor(round(DBMS_RANDOM.VALUE(1, 14), 0)), g_plat, g_surname(round(DBMS_RANDOM.VALUE(1, 20), 0)),
                    g_rocnik);
            commit;
            i := i + 1;
        end if;
    end loop;
    DBMS_OUTPUT.PUT_LINE(row_count||' rows is successfully added to table STUDENT');
end;

/

begin
    fill_student(10);
    -- For clean STUDENT and ZAMESTNANEC tables
--     DELETE FROM STUDENT;
--     commit;
--     DELETE FROM ZAMESTNANEC;
--     commit;
end;