-- auto-generated definition
create table groups_roles
(
    group_id integer not null
        references usr_mng.groups,
    role_id  integer not null
        references usr_mng.roles
);

alter table groups_roles
    owner to postgres;

