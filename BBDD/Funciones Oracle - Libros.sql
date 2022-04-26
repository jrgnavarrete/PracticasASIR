-- A. Realizar la modificación oportuna en la tabla  EJEMPLAR para que refleje la dependencia en
-- identificación respecto a la tabla LIBRO.
alter table EJEMPLAR drop constraint LIBRO_FK_EJEMPLAR;
alter table EJEMPLAR add constraint LIBRO_FK_EJEMPLAR foreign key (ISBN) references LIBRO (ISBN) ON DELETE CASCADE;

-- B. Añade las restricciones que consideres oportunas a las tablas dadas.
alter table LIBRO add constraint LIBRO_ISBN_CHECK check (ISBN > 0);
alter table LIBRO add constraint LIBRO_TITULO_NN check (TITULO is not null);
alter table LIBRO add constraint LIBRO_FECHAPUB_NN check (FECHA_PUBLICACION is not null);
alter table LIBRO add constraint LIBRO_AUTOR_NN check (AUTOR is not null);
alter table LIBRO add constraint LIBRO_TITULO_MAYUS check (TITULO = UPPER(TITULO)) NOVALIDATE;
alter table LIBRO add constraint LIBRO_AUTOR_MAYUS check (AUTOR = UPPER(AUTOR)) NOVALIDATE;

alter table EJEMPLAR add constraint EJEMPLAR_NUMERO_EJEM check (NUMERO_EJEMPLAR >= 0);
alter table EJEMPLAR add constraint EJEMPLAR_PRECIO_EJEM check (PRECIO_EJEMPLAR > 0);
alter table EJEMPLAR add constraint EJEMPLAR_NUMERO_NN check (NUMERO_EJEMPLAR is not null);
alter table EJEMPLAR add constraint EJEMPLAR_PRECIO_NN check (PRECIO_EJEMPLAR is not null);

update LIBRO
set TITULO = UPPER(TITULO);
update LIBRO
set AUTOR = UPPER(AUTOR);

alter table LIBRO enable validate constraint LIBRO_TITULO_MAYUS;
alter table LIBRO enable validate constraint LIBRO_AUTOR_MAYUS;


-- C. Modificar el formato de salida del tipo de dato DATE para que puedan visualizarse las horas.
Alter session set NLS_DATE_FORMAT='DD-MM-YYYY HH24:MI:SS';

-- 1. Modificar el Título de aquellos libros publicados en primavera (del 21 de marzo al 20 de junio). El cambio en
-- el título será darle la vuelta. Ejemplo: Ejemplo: "Bevis" se convertiría en "siveB".
update LIBRO
SET TITULO = reverse(TITULO)
where extract(month from FECHA_PUBLICACION) = 4 OR extract(month from FECHA_PUBLICACION) = 5 OR
      extract(month from FECHA_PUBLICACION) = 3 AND extract(day from FECHA_PUBLICACION) > 20 OR
      extract(month from FECHA_PUBLICACION) = 6 AND extract(day from FECHA_PUBLICACION) < 21;

-- 2. Borrar aquellos libros no publicados en los meses de verano.
delete from LIBRO
where extract(MONTH FROM(FECHA_PUBLICACION)) not in (6,7,8);

-- 3. Borrar los libros que contengan en el título una "a" y una "n" pero nunca juntas.
delete from LIBRO
where regexp_like (titulo, '(a|n)') and NOT regexp_like (titulo, 'an');

-- 4. Modificar el precio a los ejemplares que cuesten entre 100 y 200 euros. El cambio será sumarle la parte
-- decimal del mismo precio Ejemplo: 123.250 se cambiará a 123.250 + 0.250
UPDATE EJEMPLAR
SET PRECIO_EJEMPLAR TO_CHAR(PRECIO_EJEMPLAR,'999.999+0.999')
WHERE PRECIO_EJEMPLAR BETWEEN 100 AND 200;

-- 5. Borrar los libros no publicados en fin de semana.
select EXTRACT(DAY FROM TO_DATE(FECHA_PUBLICACION, 'DAY-MON-YY')) from LIBRO;

-- 6. Borrar los libros que contengan una vocal en la segunda letra del título y se publicaron hace más de un año.
DELETE FROM LIBRO
WHERE SUBSTR(TITULO,2,1) IN ('A','E','I','O','U') AND ( EXTRACT(YEAR FROM (FECHA_PUBLICACION)) > 1);

-- 7. Modificar el título añadiendo la misma cadena, pero al revés si
-- la cadena mide más de 5 caracteres o añadiendo la misma cadena si la longitud del tiempo es 5 o menor.
-- Ejemplo: "Bevis" sería "BevisBevis". " Bethany" sería "BethanyynahteB".
update LIBRO
set TITULO = (TITULO || reverse(TITULO))
where LENGTH(TITULO) > 5;

update LIBRO
set TITULO = (TITULO || TITULO)
where LENGTH(TITULO) <= 5;
-- 8. Mostrar la hora de publicación de los libros.
select TITULO, EXTRACT(hour FROM (FECHA_PUBLICACION)) "Hora"
from LIBRO;

--9. Mostrar los años que llevan publicados los libros.
select TITULO, ROUND(((sysdate - FECHA_PUBLICACION) /365),2) "Años"
from LIBRO;

-- 10. Mostrar los días que llevan publicados los libros (considera meses de 30 días).
select TITULO, ROUND(((sysdate - FECHA_PUBLICACION)),2) "Días"
from LIBRO;

-- 11. Muestra el precio de cada ejemplar con el siguiente formato: 12,23€
select NUMERO_EJEMPLAR, TO_CHAR(PRECIO_EJEMPLAR,'999,99L')
FROM EJEMPLAR;

-- 12. Realiza una consulta que muestre por pantalla una fecha que se construya tomando los días, mes y año del
-- sistema; y horas, minutos y segundos de la fecha de publicación del libro.
select to_char(sysdate, 'DD-MM-YYYY') || ' ' || to_char(FECHA_PUBLICACION, 'HH24:MI:SS') "fecha"
from LIBRO

-- 13. Con la fecha obtenida en el ejercicio anterior, mostrar las horas que han pasado con la fecha actual.
select trunc((sysdate - (to_date(to_char(sysdate, 'DD-MM-YYYY') || ' ' || to_char(FECHA_PUBLICACION, 'HH24:MI:SS'),'DD-MM-YYYY HH24:MI:SS'))) * 24) "Horas que han pasado"
from libro;

-- 14. Con la fecha obtenida en el ejercicio 12, mostrar los minutos que han pasado con la fecha actual.
select trunc((sysdate - (to_date(to_char(sysdate, 'DD-MM-YYYY') || ' ' || to_char(FECHA_PUBLICACION, 'HH24:MI:SS'),'DD-MM-YYYY HH24:MI:SS'))) * 1440) "Min que han pasado"
from libro;

-- 15. Con la fecha obtenida en el ejercicio 12, mostrar los segundos que han pasado con la fecha actual.
select trunc((sysdate - (to_date(to_char(sysdate, 'DD-MM-YYYY') || ' ' || to_char(FECHA_PUBLICACION, 'HH24:MI:SS'),'DD-MM-YYYY HH24:MI:SS'))) * 86400) "Secs que han pasado"
from libro;

-- 16. Actualiza los títulos de los libros de tal forma que tengan 3 interrogaciones al final y 2 exclamaciones al principio.
update libro set titulo='!!' || titulo || '???';
select  * from libro;

-- 17. Muestra los títulos de los libros con el siguiente formato de salida.
-- Titulo (subrayado)
-- Aaaaaa-*-*-*-*-*
-- Bbbbb-*-*-*-*-*-
-- Cbb-*-*-*-*-*-*-

select initcap(rpad(rtrim(ltrim(TITULO, '"!'), '"?'),37,'-*')) TITULO
from libro;
-- 18. Realiza una consulta que visualice en una columna primero el nombre del autor y luego el apellido.
select substr(autor,instr(autor,',')+2) || ' ' || substr(autor,1,instr(autor,',')-1) "nombre y apellidos"
from LIBRO;

-- 19. Muestra la consulta anterior ordenada por su número de caracteres.
select substr(autor,instr(autor,',')+2) || ' ' || substr(autor,1,instr(autor,',')-1) "nombre y apellidos"
from LIBRO
order by length (substr(autor,instr(autor,',')+2) || ' ' || substr(autor,1,instr(autor,',')-1));

--20. Mostrar los libros que lleven publicados más de dos años.
select *
from LIBRO
where months_between(sysdate,FECHA_PUBLICACION)/12 > 2;

--21. Mostrar los isbn de los ejemplares que su isbn sea 1 como UNO, el resto de los isbn se mostrarán como
-- están almacenados en la BD. Importante, no muestres tuplas repetidas.
select distinct decode(ISB,1,'UNO',ISBN)
from EJEMPLAR;

-- 22. Mostrar los isbn de los ejemplares que su isbn sea 1 o 2 como UNO o DOS, el resto de los isbn se mostrarán
-- como están almacenados en la BD. Importante, no muestres tuplas repetidas.
select distinct decode(ISBN,1,'UNO',decode(ISBN,2,'DOS',ISBN))
from EJEMPLAR
order by decode(ISBN,1,'UNO',decode(ISBN,2,'DOS',ISBN));

-- Jorge Navarrete. 2º Asir.