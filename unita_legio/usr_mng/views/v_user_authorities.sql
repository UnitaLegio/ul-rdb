create view v_user_authorities(user_id, username, name, description, restricting, type) as
	SELECT usr.id AS user_id,
    usr.username,
    authorities.name,
    authorities.description,
    authorities.restricting,
    authorities.type
   FROM usr_mng.users usr
     LEFT JOIN ( SELECT us.user_id,
            sc.name,
            sc.description,
            us.restricting,
            'SCOPE'::text AS type
           FROM usr_mng.users_scopes us
             JOIN usr_mng.scopes sc ON us.scope_id = sc.id
        UNION
         SELECT ur.user_id,
            rol.name,
            rol.description,
            false,
            'ROLE'::text AS type
           FROM usr_mng.users_role ur
             JOIN usr_mng.roles rol ON ur.role_id = rol.id
        UNION
         SELECT ug.user_id,
            gr.name,
            gr.description,
            false,
            'GROUP'::text AS type
           FROM usr_mng.users_group ug
             JOIN usr_mng.groups gr ON ug.group_id = gr.id) authorities ON usr.id = authorities.user_id;

comment on column v_user_authorities.username is 'User''s login';

comment on column v_user_authorities.restricting is 'Whether scope is restricting';

alter table v_user_authorities owner to postgres;

