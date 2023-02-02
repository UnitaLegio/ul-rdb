-- auto-generated definition
create table users_group
(
    user_id  bigint  not null
        references usr_mng.users,
    group_id integer not null
        references usr_mng.groups
);

comment on table users_group is 'Users and groups many to many relation';

alter table users_group
    owner to postgres;

