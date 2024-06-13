create or replace procedure fill_ma(row_count IN NUMBER) AUTHID CURRENT_USER IS
    i NUMBER := 0;
    check_ma NUMBER;
    check_row_cnt_ma NUMBER;

    c_id_student STUDENT.ID_STUDENT%type;
    c_id_univerzita UNIVERZITA.ID_UNIVERZITA%type;

begin
    -- check if tables is not empty
    SELECT COUNT(*) INTO check_row_cnt_ma FROM MA;
    if check_row_cnt_ma > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Table MA is not empty!');
        RETURN;
    end if;

    -- fill two connected tables
    FILL_STUDENT(row_count);
    FILL_UNIVERZITA(row_count);

    while i < row_count loop

        -- select random id from STUDENT
        SELECT ID_STUDENT INTO c_id_student
        FROM (SELECT ID_STUDENT FROM STUDENT ORDER BY DBMS_RANDOM.VALUE())
        WHERE rownum = 1;

         -- select random id from UNIVERZITA
        SELECT ID_UNIVERZITA INTO c_id_univerzita
        FROM (SELECT ID_UNIVERZITA FROM UNIVERZITA ORDER BY DBMS_RANDOM.VALUE())
        WHERE rownum = 1;

        -- check if relation already exists
        SELECT COUNT(*) INTO check_ma FROM MA WHERE ID_STUDENT = c_id_student AND ID_UNIVERZITA = c_id_univerzita;

        if check_ma = 0 THEN
            -- DBMS_OUTPUT.PUT_LINE(c_id_student||' AND '||c_id_univerzita);
            INSERT INTO MA (ID_UNIVERZITA, ID_STUDENT) VALUES (c_id_univerzita, c_id_student);
            commit;
            i := i + 1;
        end if;
    end loop;
    DBMS_OUTPUT.PUT_LINE(row_count||' rows is successfully added to table MA');
end;

/

begin
    fill_ma(10);
--     DELETE FROM UNIVERZITA;
--     commit;
--     DELETE FROM STUDENT;
--     commit;
--     DELETE FROM ZAMESTNANEC;
--     commit;
--     DELETE FROM MA;
--     commit;
end;