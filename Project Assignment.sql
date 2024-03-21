/* ****************************** */
/* 1.0                            */
/* ****************************** */

--Fasheem Paige Jr

/* ****************************** */
/* 1.1                            */
/* ****************************** */

drop table a1_venues
drop table a1_events
drop table a1_types


/* ****************************** */
/* 1.2                            */
/* ****************************** */

create table a1_venues(
venue_id varchar(200) not null,
venue_name varchar(50) not null,
venue_capacity int default(0) not null,
venue_description varchar(max) null,
venue_cost int not null
)

/* ****************************** */
/* 1.3                            */
/* ****************************** */

create table a1_events (
event_id int identity not null,
event_name varchar(50) not null,
event_date smalldatetime not null,
event_price decimal(8,2) default(100) not null,
fk_venue_id varchar(200) null,
fk_event_type varchar(50) not null
)

/* ****************************** */
/* 1.4                            */
/* ****************************** */

create table a1_types(
event_type varchar(50) not null
)

/* ****************************** */
/* 2.1                            */
/* ****************************** */

alter table a1_venues
	add constraint pk_venue_id primary key (venue_id)

/* ****************************** */
/* 2.2                            */
/* ****************************** */

alter table a1_events
	add constraint pk_event_id primary key (event_id)

/* ****************************** */
/* 2.3                            */
/* ****************************** */

alter table a1_types
	add constraint pk_event_type primary key (event_type)

/* ****************************** */
/* 3.1                            */
/* ****************************** */

alter table a1_events
	add constraint fk_venue_id foreign key(fk_venue_id) references a1_venues(venue_id)

alter table a1_events
	add constraint fk_event_type foreign key(fk_event_type) references a1_types(event_type)


/* ****************************** */
/* 5.1                            */
/* ****************************** */

insert into a1_venues (
venue_id,
venue_name,
venue_capacity,
venue_description,
venue_cost
)
values(
'RRA',
'Red Rocks Amphitheater',
2525,
'open-air amphitheatre',
15000
)

insert into a1_venues (
venue_id,
venue_name,
venue_capacity,
venue_description,
venue_cost
)
values(
'CH-Stern',
'Carnegie Hall Stern Room',
2804,
'venue for classical music and popular music',
14000
)

insert into a1_venues (
venue_id,
venue_name,
venue_capacity,
venue_description,
venue_cost
)
values(
'DS',
'Dodger Stadium',
56000,
'baseball stadium in the Elysian Park',
25000
)

insert into a1_venues (
venue_id,
venue_name,
venue_capacity,
venue_description,
venue_cost
)
values(
'HR',
'Hard Rock Stadium',
65326,
'home field for the Miami Dolphins ',
30000
)

/* ****************************** */
/* 5.2                            */
/* ****************************** */

insert into a1_types values ('country')
insert into a1_types values ('classical')
insert into a1_types values ('opera')
insert into a1_types values ('comedy')
insert into a1_types values ('pop')

/* ****************************** */
/* 5.3                            */
/* ****************************** */

insert into a1_events (
event_name,
event_date,
event_price,
fk_venue_id,
fk_event_type
) 
values(
'Lyle Lovett and His Large Band',
'10/2/23 7:30pm',
68,
'CH-Stern',
'country'
)

insert into a1_events (
event_name,
event_date,
event_price,
fk_venue_id,
fk_event_type
) 
values(
'John-Henry Crawford, Cello',
'10/3/23 7:30pm',
69,
'CH-Stern',
'classical'
)

insert into a1_events (
event_name,
event_date,
event_price,
fk_venue_id,
fk_event_type
) 
values(
'Enrique de Allende',
'10/5/23 8:00pm',
50,
'CH-Stern',
'opera'
)

insert into a1_events (
event_name,
event_date,
event_price,
fk_venue_id,
fk_event_type
) 
values(
'Bert Kreischer: Trippin'' at Red Rocks',
'10/4/23 7:30pm',
49,
'RRA',
'comedy'
)

insert into a1_events (
event_name,
event_date,
event_price,
fk_venue_id,
fk_event_type
) 
values(
'Cody Jinks',
'10/7/23 7:00pm',
74.5,
'RRA',
'country'
)

insert into a1_events (
event_name,
event_date,
event_price,
fk_venue_id,
fk_event_type
) 
values(
'Taylor Swift',
'10/20/24 8:00pm',
898,
'HR',
'pop'
)

/* ****************************** */
/* 6.1                            */
/* ****************************** */

select 
	avg(event_price) as average_event_price,
	max(event_price) as most_expensive_event
from a1_events

/* ****************************** */
/* 6.2                            */
/* ****************************** */

select * from a1_events
where year(event_date) =2023 and month(event_date) =10
order by event_date asc

/* ****************************** */
/* 6.3                            */
/* ****************************** */

select
	fk_event_type as event_type,
	venue_id as venue_name,
	count(event_id) as number_count
from a1_events
	full join a1_venues on venue_id = fk_venue_id
group by fk_event_type, venue_id
order by venue_name
