-- auto-generated definition
create table roles
(
    id          integer generated always as identity
        primary key,
    name        varchar not null
        unique
        constraint roles_name_check
            check (length((name)::text) < 150)
        constraint roles_name_check1
            check (length((name)::text) < 2000),
    description varchar
);

alter table roles
    owner to postgres;

