-- Create 2 VUZ
INSERT INTO VUZ VALUES (1, 12, 'big');
INSERT INTO VUZ VALUES (2, 10, 'middle');

-- Create 3 ZAMESTNANEC for test
INSERT INTO ZAMESTNANEC VALUES (1, 'Eva', 13500, 'Novotná');
INSERT INTO ZAMESTNANEC VALUES (2, 'Jan', 18000, 'Svoboda');
INSERT INTO ZAMESTNANEC VALUES (3, 'Michal', 15500, 'Marek');


-------------------------
-- POSITIVE CASE
-------------------------

begin
    -- add two ZAMESTNANEC as RIDIC
    check_ridic.add_ridic(1, 1, 1);
    check_ridic.add_ridic(2, 1, 2);
end;

select * from RIDIC;

begin
    -- delete RIDIC with id 1
    check_ridic.del_ridic(1, 1);
end;

select * from RIDIC;

begin
    -- add RIDIC with id 1 but on VUZ with id 2 with SMENA 2
    check_ridic.add_ridic(1, 2, 2);
end;

select * from RIDIC;

begin
    -- Move RIDIC with id 2 from 2 SMENA to 1
    check_ridic.update_ridic(2, M_SMENA => 1);
end;

select * from RIDIC;

begin
    -- Move RIDIC with id 1 from VUZ with id 2 to VUZ with id 1
    check_ridic.update_ridic(1, M_VUZ_ID => 1);
end;

select * from RIDIC;


-------------------------
-- NEGATIVE CASE
-------------------------

begin
    -- add third ZAMESTNANEC as  into VUZ with id 1 where is 2 RIDIC (Min 2 RIDIC by one with different SMENA)
    check_ridic.add_ridic(3, 1, 1);
end;

select * from RIDIC;

begin
    -- Move RIDIC with id 3 from VUZ with id 2 to VUZ with id 1 where is already 2 RIDIC
    check_ridic.add_ridic(3, 2, 1);
    check_ridic.update_ridic(3, M_VUZ_ID => 1);
end;

select * from RIDIC;

begin
    -- Move RIDIC with id 1 from 2 SMENA to 1
    check_ridic.update_ridic(2, M_SMENA => 1);
end;

select * from RIDIC;

begin
    -- delete RIDIC with id 1 and 2 from VUZ with id 1 (Min 1 RIDIC by one VUZ)
    check_ridic.del_ridic(1, 1);
    check_ridic.del_ridic(2, 1);
end;

select * from RIDIC;

rollback;