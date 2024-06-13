create or replace function kolik_penez(id_zamn IN NUMBER)
return NUMBER AUTHID CURRENT_USER is
    check_id_zam NUMBER := 0;
    check_id_zam_hist NUMBER := 0;
    zam_plat NUMBER := 0;
    z_od DATE;
    z_do DATE;
    in_month NUMBER;
    salary NUMBER;

    cursor my_cursor(id_zamnestnanec ZAM_HISTORIE.ID_ZAM%type) IS
        select OD, DO, PLAT
        from ZAM_HISTORIE
        where ZAM_HISTORIE.ID_ZAM = id_zamnestnanec;
begin
    -- check if ZAMESTNANEC exists
    SELECT COUNT(*) INTO check_id_zam FROM ZAMESTNANEC where ZAMESTNANEC.ID_ZAM = id_zamn;
    SELECT COUNT(*) INTO check_id_zam_hist FROM ZAM_HISTORIE where ZAM_HISTORIE.ID_ZAM = id_zamn;
    if (check_id_zam = 0 or check_id_zam_hist = 0) THEN
        RAISE_APPLICATION_ERROR(-20001, 'ORA-20001: Zaměstnanec s číslem '||id_zamn||' buď neexistuje nebo nemá žádnou historii.');
    end if;

    -- get the interval
    open my_cursor(id_zamn);

    -- calculate salary
     LOOP
        FETCH my_cursor into z_od, z_do, salary;
        EXIT WHEN my_cursor%NOTFOUND;

        -- if zamestnanec if working
        if z_do is null then
            z_do := SYSDATE;
        end if;
        -- get month count
        in_month := round(MONTHS_BETWEEN(z_do, z_od), 0);

        -- get month salary
        zam_plat := zam_plat + (salary * in_month);
     END LOOP;

    close my_cursor;
    return zam_plat;
end;


-- tests
begin
--     plt := kolik_penez(id_zamn => 1);
    DBMS_OUTPUT.PUT_LINE('Zaměstnanec: '||3||' ma plat: '||kolik_penez(id_zamn => 3));
    DBMS_OUTPUT.PUT_LINE('Zaměstnanec: '||1||' ma plat: '||kolik_penez(id_zamn => 1));
    DBMS_OUTPUT.PUT_LINE('Zaměstnanec: '||17||' ma plat: '||kolik_penez(id_zamn => 17));
    DBMS_OUTPUT.PUT_LINE('Zaměstnanec: '||33||' ma plat: '||kolik_penez(id_zamn => 33));
end;
