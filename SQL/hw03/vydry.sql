drop table vydra cascade constraints;
drop table revir cascade constraints;

create table revir(
	crev	number(2),
	nazev	varchar2(20),
	rozloha	number(3),
	popis	varchar2(100),
	constraint revir_pk primary key (crev));

create table vydra (
	cv	number(3),
	jmeno	varchar2(20),
	otec	number(3),
	matka	number(3),
	dnar	date,
	barva	varchar2(1),
	pohlavi	varchar2(1),
	crev	number(2),
	constraint vydra_pk primary key (cv),
	constraint vydra_o_fk foreign key (otec) references vydra(cv),
	constraint vydra_m_fk foreign key (matka) references vydra(cv),
	constraint vydra_r_fk foreign key (crev) references revir(crev),
	constraint vydra_pohlavi check (pohlavi in ('M','Z')),
	constraint vydra_barva check (barva in ('H','B','S')));


insert into revir values (1,'Vltava',40,null);
insert into revir values (2,'Sazava',20,null);
insert into revir values (3,'Berounka',30,null);
insert into revir values (4,'Orlice',15,null);
insert into revir values (5,'Jizera',25,null);

commit;

insert into vydra values (1,'Malvina',null,null, to_date('1.1.90','DD.MM.RR'),'H','Z',1); 
insert into vydra values (2,'Nestor',null,null, to_date('7.3.92','DD.MM.RR'),'B','M',1); 
insert into vydra values (3,'Jarmila',null,null, to_date('9.6.91','DD.MM.RR'),'S','Z',1);
insert into vydra values (4,'Elvis',2,1, to_date('4.7.94','DD.MM.RR'),'H','M',2);
insert into vydra values (5,'Lilien',2,1, to_date('4.7.94','DD.MM.RR'),'B','Z',2);
insert into vydra values (6,'Ursula',2,3, to_date('15.6.95','DD.MM.RR'),'S','Z',3);
insert into vydra values (7,'Ringo',2,3, to_date('19.10.96','DD.MM.RR'),'H','M',2);
insert into vydra values (8,'Zoran',null,null, to_date('4.5.92','DD.MM.RR'),'B','M',3);
insert into vydra values (9,'Laura',null,null, to_date('6.6.97','DD.MM.RR'),'S','Z',4);
insert into vydra values (10,'Iason',7,5, to_date('7.8.97','DD.MM.RR'),'H','M',4); 
insert into vydra values (11,'Teodor',8,6, to_date('14.8.98','DD.MM.RR'),'B','M',1); 
insert into vydra values (12,'Blazej',null,null, to_date('1.5.00','DD.MM.RR'),'S','M',1); 
insert into vydra values (13,'Merilin',10,9, to_date('6.7.01','DD.MM.RR'),'H','Z',1); 
insert into vydra values (14,'Sarlota',12,13, to_date('7.9.02','DD.MM.RR'),'B','Z',2); 
insert into vydra values (15,'Sybila',11,13, to_date('9.9.02','DD.MM.RR'),'S','Z',3); 

commit;


