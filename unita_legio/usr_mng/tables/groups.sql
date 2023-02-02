-- auto-generated definition
create table groups
(
    id          integer generated always as identity
        primary key,
    name        varchar not null
        unique
        constraint groups_name_check
            check (length((name)::text) < 150)
        constraint groups_name_check1
            check (length((name)::text) < 2000),
    description varchar
);

alter table groups
    owner to postgres;

