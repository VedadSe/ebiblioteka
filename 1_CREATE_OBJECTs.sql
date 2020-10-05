create sequence knjige_id;

create table knjige (
	id bigint primary key default nextval('knjige_id'),
	isbn varchar(5) not null,
	naslov varchar(50) not null,
	ime_autora varchar(20) not null,
	prezime_autora varchar(20) not null,
	izdanje int not null,
	tezina_kg double precision(2,2) not null,
	aktivan char(1) not null default '1',
	username varchar(12) not null,
	datum_upisa timestamp with time zone not null default now()
);

create sequence clanovi_id;

create table clanovi (
	id bigint primary key default nextval('clanovi_id'),
	jmb varchar(13) not null,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	adresa varchar(50) not null,
	tel_broj varchar(15),
	e_mail varchar(30),
	spol char(1) not null,
	punoljetan boolean not null,
	clanarina double precision(2,2) not null,
	aktivan char(1) not null default '1',
	username varchar(12) not null,
	datum_upisa timestamp with time zone not null default now()
);

create sequence posudjene_knjige_id;

create table posudjene_knjige (
	id bigint primary key default nextval('posudjene_knjige_id'),
	knjiga_id bigint references knjige(id),
	dostavni_servis varchar(10) not null,
	brza_dostava boolean not null,
	datum_posiljke date not null,
	postarina numeric(2,2) not null,
	ostecena boolean,
	procitana boolean,
	kasni_dana int,
	nadoknada double precision(2,2),
	aktivan char(1) not null default '1',
	username varchar(12) not null,
	datum_upisa timestamp with time zone not null default now()
);

create table clan_posudjena_knjiga (
	clan_id bigint references clanovi(id),
	posudjena_knjiga_id bigint references posudjene_knjige(id),
	datum_od date,
	datum_do date,
	primary key (clan_id, posudjena_knjiga_id)
);