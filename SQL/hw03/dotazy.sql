---------------------------------------------------------------------
-- první iteraci
---------------------------------------------------------------------
-- dotaz (10, mužská)
with
Ancestors(v_cv, v_jmeno, v_otec, v_matka, v_gen) as
(
    select CV, JMENO, OTEC, MATKA, 0
    from VYDRA v1
    where CV = 10
    union all
    select v2.CV, v2.JMENO, v2.OTEC, v2.MATKA, a.v_gen + 1
    from VYDRA v2
    inner join Ancestors a on ((a.v_matka = v2.CV or a.v_otec = v2.CV) and
                               (v2.POHLAVI = 'M' or v2.POHLAVI = 'M'))
)
select * from Ancestors
where v_gen > 0;


-- dotaz (10, ženská)
with
Ancestors(v_cv, v_jmeno, v_otec, v_matka, v_gen) as
(
    select CV, JMENO, OTEC, MATKA, 0
    from VYDRA v1
    where CV = 10
    union all
    select v2.CV, v2.JMENO, v2.OTEC, v2.MATKA, a.v_gen + 1
    from VYDRA v2
    inner join Ancestors a on ((a.v_matka = v2.CV or a.v_otec = v2.CV) and
                               (v2.POHLAVI = 'Z' or v2.POHLAVI = 'Z'))
)
select * from Ancestors
where v_gen > 0;

---------------------------------------------------------------------
-- druhá iteraci
---------------------------------------------------------------------
-- dotaz (10, obě)
with
Ancestors(v_cv, v_jmeno, v_otec, v_matka, v_gen) as
(
    select CV, JMENO, OTEC, MATKA, 0
    from VYDRA v1
    where CV = 10
    union all
    select v2.CV, v2.JMENO, v2.OTEC, v2.MATKA, a.v_gen + 1
    from VYDRA v2
    inner join Ancestors a on ((a.v_matka = v2.CV or a.v_otec = v2.CV) and
                               (v2.POHLAVI = 'M' or v2.POHLAVI = 'Z'))
)
select * from Ancestors
where v_gen > 0;