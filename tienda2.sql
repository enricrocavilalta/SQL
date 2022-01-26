select nombre from producto;
select nombre,precio from producto;
select * from producto;
select nombre,precio,precio*1.14 from producto;
select nombre,precio as euos, precio*1.14 as dollars from producto;
select upper(nombre),precio from producto;
select lower(nombre),precio from producto;
select nombre, upper(substring(nombre,1,2)) from fabricante;
select nombre, round(precio) from producto;
select nombre, floor(precio) from producto;
select codigo_fabricante from producto;
select codigo_fabricante from producto group by codigo_fabricante;
select nombre from fabricante order by nombre asc;
select nombre from fabricante order by nombre desc;
select nombre,precio from producto order by nombre, precio desc;
select nombre from fabricante limit 5;
select nombre from fabricante limit 3,2;

select apellido1, apellido2, nombre from persona where tipo="alumno" order by apellido1,apellido2,nombre;
select nombre, apellido1, apellido2 from persona where tipo="alumno" and isnull(telefono);
select nombre, apellido1, apellido2 from persona where tipo="alumno" and fecha_nacimiento like "1999%";
select nombre, apellido1, apellido2 from persona where tipo='profesor' and isnull(telefono) and nif like '%K';
select nombre from asignatura where cuatrimestre=1 and curso=3 and id_grado=7;
select apellido1,apellido2,persona.nombre,departamento.nombre from profesor inner join departamento on profesor.id_departamento=departamento.id inner join persona on persona.id=profesor.id_profesor order by apellido1;
select asignatura.nombre, anyo_inicio, anyo_fin from alumno_se_matricula_asignatura inner join persona on id_alumno=persona.id  inner join asignatura on alumno_se_matricula_asignatura.id_asignatura=asignatura.id inner join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar=curso_escolar.id where nif='26902806M';
select * from profesor inner join persona on profesor.id_profesor=persona.id inner join departamento on profesor.id_departamento=departamento.id where departamento.nombre='informática';
select nombre, apellido1,apellido2 from alumno_se_matricula_asignatura inner join persona on alumno_se_matricula_asignatura.id_alumno=persona.id inner join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar=curso_escolar.id where anyo_inicio='2018' group by apellido1;

select departamento.nombre as departament, persona.nombre, apellido1, apellido2 from profesor left join departamento on profesor.id_profesor=departamento.id inner join persona on profesor.id_profesor=persona.id;-- no veo el que falta
select departamento.nombre as departament, persona.nombre, apellido1, apellido2 from profesor left join departamento on profesor.id_profesor=departamento.id inner join persona on profesor.id_profesor=persona.id where isnull(departamento.nombre);
select nombre as departament from departamento left join profesor on departamento.id=profesor.id_profesor where isnull(id_profesor);

select * from profesor right join asignatura on profesor.id_profesor=asignatura.id where isnull(asignatura.id_profesor);

select count(id) from persona where tipo='alumno';
select count(id) from persona where tipo='alumno' and fecha_nacimiento like '1999%';
select count(*),nombre from profesor inner join departamento on profesor.id_departamento=departamento.id group by nombre order by count(*) asc;
select count(*)-1,nombre from profesor right join departamento on profesor.id_departamento=departamento.id group by nombre order by count(*) desc;
select grado.nombre, count(*)-1 from grado left join asignatura on grado.id=asignatura.id_grado group by grado.nombre order by count(*) desc;
select grado.nombre, count(*)-1 as num from grado left join asignatura on grado.id=asignatura.id_grado group by grado.nombre having count(*) > 40 order by count(*) desc; 
select grado.nombre, tipo, sum(creditos),count(*)-1 from grado left join asignatura on grado.id=asignatura.id_grado group by grado.nombre,tipo order by nombre;
select anyo_inicio,count(*)-1 as alumnes from alumno_se_matricula_asignatura right join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar=curso_escolar.id group by anyo_inicio;
select profesor.id_profesor, persona.nombre, apellido1, apellido2, count(*)-1 as asignaturas from profesor left join asignatura on profesor.id_profesor=asignatura.id_profesor inner join persona on profesor.id_profesor=persona.id group by profesor.id_profesor;
select * from persona order by fecha_nacimiento desc limit 1;
select profesor.id_profesor from profesor left join asignatura on profesor.id_profesor=asignatura.id_profesor where isnull(asignatura.id_profesor);



