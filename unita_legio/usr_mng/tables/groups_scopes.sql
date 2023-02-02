-- auto-generated definition
create table groups_scopes
(
    group_id    integer               not null
        references usr_mng.groups,
    scope_id    integer               not null
        references usr_mng.scopes,
    restricting boolean default false not null
);

comment on column groups_scopes.restricting is 'Whether scope is restricting';

alter table groups_scopes
    owner to postgres;

