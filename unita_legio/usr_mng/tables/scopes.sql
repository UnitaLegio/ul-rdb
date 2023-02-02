-- auto-generated definition
create table scopes
(
    id          integer generated always as identity
        primary key,
    name        varchar not null
        unique
        constraint scopes_name_check
            check (length((name)::text) < 150)
        constraint scopes_name_check1
            check (length((name)::text) < 2000),
    description varchar
);

alter table scopes
    owner to postgres;

