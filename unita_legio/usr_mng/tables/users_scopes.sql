-- auto-generated definition
create table users_scopes
(
    user_id     bigint                not null
        references usr_mng.users,
    scopes      integer               not null
        references usr_mng.scopes,
    restricting boolean default false not null
);

comment on table users_scopes is 'Users to scopes many to many relation';

comment on column users_scopes.restricting is 'Whether scope is restricting';

alter table users_scopes
    owner to postgres;

