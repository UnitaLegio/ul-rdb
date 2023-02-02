-- auto-generated definition
create table users_role
(
    user_id bigint  not null
        references usr_mng.users,
    role_id integer not null
        references usr_mng.roles
);

comment on table users_role is 'Users and roles many to many relation';

alter table users_role
    owner to postgres;

