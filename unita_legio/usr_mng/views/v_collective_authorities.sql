create view v_collective_authorities(name, description) as
	SELECT sc.name,
    sc.description
   FROM usr_mng.scopes sc
UNION
 SELECT rol.name,
    rol.description
   FROM usr_mng.roles rol
UNION
 SELECT gr.name,
    gr.description
   FROM usr_mng.groups gr;

alter table v_collective_authorities owner to postgres;