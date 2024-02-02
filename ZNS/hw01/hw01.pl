% FIT ČVUT, BI-ZNS.21, ZS2023, Anopa Denys, Úloha 1: Jednoduchý znalostní systém pro kontrolu účtenek


% hlavni telo programu, tento kod je zodpovedny za vypsani textu uvadejiciho uzivatele do problematiky, volani dotazu a vypis reseni

main :- identifikace.

identifikace:-
  retractall(known(_,_,_,_)),
  retractall(known2(_,_,_)),
  writeln('Vítá vás jednoduchý expertní systém pro kontrolu účtenek.'),
  writeln('Prosím odpovídejte na dotazy ano nebo ne. Každou odpověď je třeba zakončit tečkou.'), nl,
  chyba(X), nl,
  write('Účtenka není platná. '),write(X),  write('.'), nl.
identifikace:-
  write('Účtenka je v pořádku.'),nl.

% ----------------------
% Báze znalostí chyb
% ----------------------

chyba('Chybí údaje o dodavateli IČO'):-
  not(ico('IČO')).

chyba('Chybné IČO'):-
  ico('IČO'),
  not(check('IČO')).

chyba('Chybí údaje o dodavateli DIČ'):-
  not(dic('DIČ')), 
  doklad('daňový doklad').

chyba('Chybné IČO a DIČ odběratele'):-
  doklad('zjednodušený daňový doklad'),
  not(check('DIČ')), 
  not(check('IČO')).


chyba('Chybná celková částka'):-
  not(soucet('celkovým součtem uvedeným na dokladu')).


chyba('Chybí rekapitulace DPH'):-
  doklad('daňový doklad'),
  not(rekapitulace('rekapitulace DPH')),
  not(sazba('sazba DPH pro celkovou částku')).


chyba('Chyba v datu'):-
  datum('datum je mimo rok 2021').


chyba('Chybí údaje o dodavateli DIČ a IČO'):-
  doklad('daňový doklad'),
  not(ico('IČO')), 
  not(dic('DIČ')).


chyba('Chybné sazby DPH'):-
  potraviny('účtovány'),
  dph('DPH 10%'),
  not(konzumace('prostorách dodavatele')).


chyba('Chybí údaje o zápisu dodavatele do obchodního a živnostenského rejstříku'):-
  (not(zivnostensky('živnostenského rejstříku')), not(obchodni('obchodního rejstříku'))).

chyba('Chybí údaje o zápisu dodavatele do živnostenského rejstříku'):-
  not(zivnostensky('živnostenského rejstříku')).

chyba('Chybí údaje o zápisu dodavatele do obchodního rejstříku'):-
  not(obchodni('obchodního rejstříku')).


chyba('Chybí číslo dokladu'):-
  not(cislo_dokladu('obsahuje číslo dokladu')).


chyba('Chybí datum uskutečnění zdanitelného plnění'):-
  doklad('daňový doklad'),
  datum('chybí datum vystavení dokladu').


chyba('Jedná se o zjednodušený daňový doklad, ale celková částka je přes 10.000 Kč'):-
  doklad('zjednodušený daňový doklad'),
  castka('přes 10.000 Kč').



% Typy dokladů
doklad('daňový doklad'):-
 dic('DIČ'),
 ico('IČO').

doklad('zjednodušený daňový doklad'):-
  ico('IČO'),
  not(odberatel('je uveden název odběratele')).

% ----------------------
% Uživatelské rozhraní
% ----------------------

% ziskani hodnoty atributu od uzivatele

odberatel(X):- dotaz('Na dokladu: ', odberatel, X).
castka(X):- dotaz('Celková částka je: ', castka, X).
datum(X):- dotaz('Na dokladu: ', datum, X).

zivnostensky(X):- dotaz('Účtenka obsahuje údaje o zápisu dodavatele do: ', zivnostensky, X).
obchodni(X):- dotaz('Účtenka obsahuje údaje o zápisu dodavatele do: ', obchodni, X).

ico(X):- dotaz('Na dokladu je uvedeno ', ico, X).
dic(X):- dotaz('Na dokladu je uvedeno ', dic, X).

soucet(X):- dotaz('Je celkový součet položek dokladu stejný s ', soucet, X).
rekapitulace(X):- dotaz('Je na dokladu ', rekapitulace, X).
sazba(X):- dotaz('Je na účtence uvedena ', sazba, X).
potraviny(X):- dotaz('Jsou potraviny ', potraviny, X).
dph(X):- dotaz('Jedná se o sazbu ', dph, X).
konzumace(X):- dotaz('Jsou položky v sazbě DPH 10% konzumovány v ', konzumace, X).
cislo_dokladu(X):- dotaz('Doklad ', cislo_dokladu, X).

% otestuje, zda byl polozen stejny dotaz na stejny identifikator.
check(X):-
  known2(_,overeni_identifikatoru,X),  !, fail.

% Ověření identifikátoru podle názvu a ukládání informaci do bázi. 
% Tedy pokud identifikátor je platný, zapíšeme ano pro tuto kombinaci hodnoty a atributu a výrok je pravdivý. 
% Jinak zapíšeme ne, a výrok o správnosti identifikátoru je nepravdivý.
check(X):-
  ((overeni_identifikatoru(X),
  (asserta(known2(ano, overeni_identifikatoru, X)), true));
  (asserta(known2(ne, overeni_identifikatoru, X)), false)).




% Predikát pro ověření platnosti identifikatoru
overeni_identifikatoru(Ident) :-
    % Načteme vstup
    (((Ident == 'DIČ'), 
                      ((write('Uveďte prosím zkratku statu: '), read(ZK)),
                      (write('Uveďte prosím zbývající čísla: '), read(Cislice) )) );
    ((Ident == 'IČO'), 
                      (write('Uveďte prosím '), write(Ident), write(':'), read(Cislice)))),
     
    % Ověřime kód statu nebo nic, pokud se jedna o IČO
    (((Ident == 'DIČ'), check_code(ZK)); ((Ident == 'IČO'), write(''))),

    % Převod řetězce na seznam symbolů
    atom_chars(Cislice, CisliceList),

    % Ověření delky identifikatoru
    check_length(CisliceList),

    % Převod symbolů na čisla
    maplist(atom_number, CisliceList, CisliceCisla),

    
    % Vynásobení prvních sedmi číslic čísly 8, 7, 6, 5, 4, 3, 2
    nth1(1, CisliceCisla, C1),
    nth1(2, CisliceCisla, C2),
    nth1(3, CisliceCisla, C3),
    nth1(4, CisliceCisla, C4),
    nth1(5, CisliceCisla, C5),
    nth1(6, CisliceCisla, C6),
    nth1(7, CisliceCisla, C7),
    
    Soucet is C1 * 8 + C2 * 7 + C3 * 6 + C4 * 5 + C5 * 4 + C6 * 3 + C7 * 2,
    
    % Uložení poslední osmé číslice do proměnné C
    last(CisliceCisla, C),
    
    % Výpočet zbytku po dělení jedenácti
    Zbytek is Soucet mod 11,
    
    % Porovnání zbytku po dělení a poslední číslice
    (((Zbytek =:= 0 ; Zbytek =:= 10), C =:= 1);
    (Zbytek =:= 1, C =:= 0);
    (not(Zbytek =:= 0 ; Zbytek =:= 10 ; C =:= 1), C =:= 11 - Zbytek)).

% Počet čísel musí být osm
check_length(Input) :-
  length(Input, Len),
  Len =:= 8.

% Kódy statů
check_code(X) :- member(X, [af, ax, al, dz, as, ad, ao, ai, aq, ag, ar, am, aw, au, at, az, 
  bs, bh, bd, bb, by, be, bz, bj, bm, bt, bo, bq, ba, bw, bv, br, io, bn, bg, bf, bi, cv, kh, cm, ca, 
  ky, cf, td, cl, cn, cx, cc, co, km, cg, cd, ck, cr, ci, hr, cu, cw, cy, cz, dk, dj, dm, do, ec, eg, 
  sv, gq, er, ee, sz, et, fk, fo, fj, fi, fr, gf, pf, tf, ga, gm, ge, de, gh, gi, gr, gl, gd, gp, gu, 
  gt, gg, gn, gw, gy, ht, hm, va, hn, hk, hu, is, in, id, ir, iq, ie, im, il, it, jm, jp, je, jo, kz, 
  ke, ki, kp, kr, kw, kg, la, lv, lb, ls, lr, ly, li, lt, lu, mo, mg, mw, my, mv, ml, mt, mh, mq, mr, 
  mu, yt, mx, fm, md, mc, mn, me, ms, ma, mz, mm, na, nr, np, nl, nc, nz, ni, ne, ng, nu, nf, mk, mp, 
  no, om, pk, pw, ps, pa, pg, py, pe, ph, pn, pl, pt, pr, qa, re, ro, ru, rw, bl, sh, kn, lc, mf, pm, 
  vc, ws, sm, st, sa, sn, rs, sc, sl, sg, sx, sk, si, sb, so, za, gs, ss, es, lk, sd, sr, sj, se, ch, 
  sy, tw, tj, tz, th, tl, tg, tk, to, tt, tn, tr, tm, tc, tv, ug, ua, ae, gb, us, um, uy, uz, vu, ve, 
  vn, vg, vi, wf, eh, ye, zm, zw]).




% uzivatelske rozhrani, implementace klauzule dotaz

% otestuje, zda je zaznam odpovedi ano pro danou kombinaci atributu a hodnoty jiz v bazi faktu
dotaz(O,X,Y):-
  known(ano,O,X,Y),  !.

% otestuje, zda je zaznam odpovedi ne pro danou kombinac atribut a hodnoty jiz v bazi faktu
dotaz(O,X,Y):-
  known(ne,O, X,Y),
  !, fail.

% otestuje, zda byl polozen stejny dotaz na stejny typ atributu, ale bez vazby na soucasnou hodnotu atributu a byla na nej odpoved ano.
dotaz(O,X,_):-
  known(ano,O,X,_),  !, fail.

% dotaz, zobrazi otazku a nacte hodnotu ze vstupu
dotaz(O,X,Y):-
  write(O), write(Y),
  write('? (ano nebo ne): '),
  read(A),
  asserta(known(A,O,X,Y)),
  A = ano.

