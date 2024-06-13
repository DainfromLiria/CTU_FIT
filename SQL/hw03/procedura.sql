create or replace procedure get_ancestral_line(v_name IN VYDRA.JMENO%type,
                                               anc_line IN VYDRA.JMENO%type)
AUTHID CURRENT_USER IS
    cursor vydra_cursor(v_name VYDRA.JMENO%type, v_line_m VYDRA.JMENO%type, v_line_z VYDRA.JMENO%type) IS
        with
        Ancestors(v_cv, v_jmeno, v_otec, v_matka, v_gen) as
        (
            select CV, JMENO, OTEC, MATKA, 0
            from VYDRA v1
            where JMENO = v_name
            union all
            select v2.CV, v2.JMENO, v2.OTEC, v2.MATKA, a.v_gen + 1
            from VYDRA v2
            inner join Ancestors a on ((a.v_matka = v2.CV or a.v_otec = v2.CV) and
                                       (v2.POHLAVI = v_line_m or v2.POHLAVI = v_line_z))
        )
        select * from Ancestors
        where Ancestors.v_gen > 0;

    v_cv VYDRA.CV%type;
    v_jmeno VYDRA.JMENO%type;
    v_otec VYDRA.OTEC%type;
    v_matka VYDRA.MATKA%type;
    v_gen NUMBER;
    check_name NUMBER;
begin
    -- check name validity
    select count(*) into check_name from VYDRA where JMENO = v_name;
    if check_name = 0 then
        DBMS_OUTPUT.PUT_LINE('Otter with name '||v_name||' does not exists');
        return;
    end if;

    -- select line
    if anc_line = 'ženská' then
        open vydra_cursor(v_name, 'Z', 'Z');
    elsif anc_line = 'mužská' then
        open vydra_cursor(v_name, 'M', 'M');
    elsif anc_line = 'obě' then
        open vydra_cursor(v_name, 'M', 'Z');
    else
        DBMS_OUTPUT.PUT_LINE('Wrong ancestor ancestral line. You have: '||anc_line||
                             ' Must be: mužská, ženská or obě');
        return;
    end if;

    -- print data
    DBMS_OUTPUT.PUT('Rodová linie vydry '|| v_name ||' je : ');
    -- fetch data from cursor
    LOOP
        FETCH vydra_cursor INTO v_cv, v_jmeno, v_otec, v_matka, v_gen;
        EXIT WHEN vydra_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT(v_jmeno||'('||v_gen||'), ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;

    close vydra_cursor;
end;