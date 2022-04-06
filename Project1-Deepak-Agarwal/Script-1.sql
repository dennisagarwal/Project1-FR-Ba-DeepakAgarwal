CREATE table user_role(
id SERIAL primary key,
role VARCHAR(20) not null
);

insert into user_role (role)
values ('employee'),
('manager');

select *
from user_role

create table users (
id SERIAL primary key,
username varchar(200) not null unique,
password varchar(200) not null,
user_role_id integer not null,
constraint fk_user_userrole foreign key (user_role_id) references user_role(id)
);

insert into users (username, password, user_role_id, first_name, last_name, email)
values ('ryan_jordan', 'password123', 2, 'ryan', 'jordan', 'ryan@gmail.com'),
('nigel_dsouza', 'password12345',1, 'nigel', 'dsouza', 'nigel@gmail.com'),
('rebekah_kennedy', '12345', 1, 'rebekah', 'kennedy', 'rebekah@yahoo.com');

select * from users;

delete from users;

ALTER TABLE users AUTO_INCREMENT = 1;

ALTER SEQUENCE users_id_seq RESTART WITH 1

ALTER TABLE users
ADD COLUMN firstName varchar(100);

ALTER TABLE users
RENAME COLUMN last_Name TO last_name;

ALTER TABLE users
ADD COLUMN lastName varchar(100);

ALTER TABLE users
ADD COLUMN email varchar(150) not null unique;

ALTER TABLE users
DROP COLUMN fisrtName;

create table reimbursements(
id SERIAL primary key,
reimbursements_amount integer not null,
reimbursements_submitted DATE not null,
reimbursements_resolved DATE,
reimbursements_description varchar(250),
reimbursements_receipt bytea,
reimbursements_author integer not null,
reimbursements_resolver integer,
reimbursements_status_id  integer,
reimbursements_type_id  integer not null,
constraint fk_reimbursements_author foreign key (reimbursements_author) references users(id),
constraint fk_reimbursements_resolver foreign key (reimbursements_resolver) references users(id),
constraint fk_reimbursements_status_id foreign key (reimbursements_status_id) references reimbursement_status(id),
constraint fk_reimbursements_type_id foreign key (reimbursements_type_id) references reimbursement_type(id)
);


ALTER TABLE reimbursements
ALTER COLUMN reimbursements_submitted TYPE varchar(260) 

insert into reimbursements (reimbursements_amount,reimbursements_submitted,reimbursements_author,reimbursements_resolver,reimbursements_status_id,reimbursements_type_id)
values (400,'2022/02/01',5,4,1,2);

select reimbursements.id as rs_id, reimbursements.reimbursements_amount as rs_amount ,
reimbursements.reimbursements_submitted as rs_submitted, reimbursements.reimbursements_resolved as rs_resolved, 
employee_user.username as employee_name,employee_user.password as employee_password,
manager_user.username as manager_name,manager_user.password as manager_password, rs.status ,rt.type 
from reimbursements
inner join users employee_user
on employee_user.id = reimbursements.reimbursements_author
LEFT join users manager_user
on manager_user.id = reimbursements.reimbursements_resolver 
LEFT join reimbursement_status rs
on rs.id = reimbursements.reimbursements_status_id
LEFT join reimbursement_type rt 
on rt.id = reimbursements.reimbursements_type_id 
where reimbursements.reimbursements_id =10

insert into reimbursements 


drop table reimbursement;

delete from reimbursements where id=13;

select * from reimbursements;

select * from reimbursement_type;

create table reimbursement_type(
id SERIAL primary key,
type VARCHAR(20) not null
);

select * from reimbursement_status;

create table reimbursement_status(
id SERIAL primary key,
status VARCHAR(20) not null
);

insert into reimbursement_status (status)
values ('pending'),
('approve'),
('deny');

select * from reimbursement_type;

insert into reimbursement_type (type)
values ('lodging'),
('tavel'),
('food'),
('other');

select * from reimbursements;

SELECT r.reimbursements_receipt 
                    FROM reimbursements r 
                    WHERE r.id = 14 and r.reimbursements_author =6
                    
create extension pgcrypto;

insert into users (username, password, user_role_id, first_name, last_name, email)
values ('gebriel_tereska', crypt('password', gen_salt('md5')),1, 'gabriel', 'tereska', 'gabriel@hotmail.com');

select * from users;
delete from users where id=7

select * from reimbursements
delete from reimbursements where id=16

SELECT users.username  
  FROM users
 WHERE users.email = 'carol@hotmail.com' 
   AND users.password = crypt('123456', users.password);
  
UPDATE users
SET password =  crypt('12345', users.password)
WHERE users.id=6;

UPDATE users
SET username = 'gabriel_tereska'
WHERE users.id=9;

update reimbursements 
set reimbursements_receipt = pg_read_binary_file('E:\BootCamp\Revature\Proj\Project1-Deepak-Agarwal\images\lodgingReceipt1.JPG')::bytea 
where id=3;

update reimbursements 
set reimbursements_description = 'bike repair'
where id=6;

update reimbursements 
set reimbursements_resolved = '2021/11/18'
where id=14;

SHOW data_directory;
