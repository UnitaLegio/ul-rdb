-- auto-generated definition
create table roles_scopes
(
    role_id  integer not null
        references usr_mng.roles,
    scope_id integer not null
        references usr_mng.scopes
);

alter table roles_scopes
    owner to postgres;

create unique index roles_scopes_idx
    on roles_scopes (role_id, scope_id);

