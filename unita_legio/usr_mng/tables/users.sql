-- auto-generated definition
create table users
(
    id                      bigint generated always as identity
        primary key,
    username                varchar               not null
        unique
        constraint users_username_check
            check ((length((username)::text) > 3) AND (length((username)::text) < 21)),
    password                varchar               not null
        constraint users_password_check
            check ((length((password)::text) > 7) AND (length((password)::text) < 2048)),
    credentials_expire_date date,
    account_expire_date     date,
    locked                  boolean default false not null,
    enabled                 boolean default false not null
);

comment on table users is 'Account'' main info';

comment on column users.username is 'User''s login';

comment on column users.password is 'Hash of user''s password';

comment on column users.credentials_expire_date is 'When password expires; null means never';

comment on column users.account_expire_date is 'When account expires; null means never';

comment on column users.locked is 'Whether the account is locked (by admin, or for security purposes)';

comment on column users.enabled is 'Whether the account is enabled (when it hasn''t ever been logged in, or disabled for better ages)';

alter table users
    owner to postgres;

create unique index usrs_username_idx
    on users (username);