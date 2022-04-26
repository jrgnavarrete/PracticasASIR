-- 1. OBLIGATORIO Dado el siguiente procedimiento:

CREATE OR REPLACE PROCEDURE crear_depart (
 v_num_dept depart.dept_no%TYPE,
 v_dnombre depart.dnombre%TYPE DEFAULT 'PROVISIONAL',
 v_loc depart.loc%TYPE DEFAULT 'PROVI SIONAL')
AS
BEGIN
INSERT INTO depart VALUES (v_num_dept, v_dnombre, v_loc);
END crear_depart;

select * from depart;

-- Indicar cuáles de las siguientes llamadas son correctas y cuáles incorrectas, en este último
-- caso escribir la llamada correcta usando la notación posicional (en los casos que se pueda):

execute crear_depart; -- No es valido, necesitamos como minimo el numero de departamento
execute crear_depart(50); -- Es valido, se pondra en tipo provisional y con loc provisional
execute crear_depart('COMPRAS'); -- No es valido, necesitamos un numero de departamento
execute crear_depart(50,'COMPRAS'); -- Valido, su locaclizacion será provisional
execute crear_depart('COMPRAS', 50); -- No es valido, el primer parámetro de entrada debe ser el número de departamento
execute crear_depart('COMPRAS', 'VALENCIA'); -- No es valido, el primer parámetro de entrada debe ser el número de departamento
execute crear_depart(50, 'COMPRAS', 'VALENCIA'); -- Valido
execute crear_depart('COMPRAS', 50, 'VALENCIA'); -- No es valido, el primer parámetro de entrada debe ser el número de departamento
execute crear_depart('VALENCIA', ‘COMPRAS’); -- No es valido, el primer parámetro de entrada debe ser el número de departamento
execute crear_depart('VALENCIA', 50); -- No es valido, el primer parámetro de entrada debe ser el número de departamento

-- 4. Codificar un procedimiento que permita borrar un empleado cuyo
-- número se pasará en la llamada.

CREATE OR REPLACE PROCEDURE p_borra_empleado (
 in_DNI EMPLEADO.DNI%TYPE)
AS
BEGIN
delete EMPLEADO
where DNI = in_DNI;
END p_borra_empleado;
/

-- 5. Escribir un procedimiento que modifique la localidad de un
-- departamento. El procedimiento recibirá como parámetros el número del
-- departamento y la localidad nueva.
CREATE OR REPLACE PROCEDURE p_mod_loc_depart (
 in_num DEPART.DEPT_NO%TYPE, in_loc DEPART.LOC%TYPE)
AS
BEGIN
update DEPART
set DEPART.LOC = in_loc
where DEPT_NO = in_num;
END p_mod_loc_depart;
/

-- 6. Visualizar todos los procedimientos y funciones del usuario almacenados
-- en la base de datos y su situación (valid o invalid). ¿Qué significa invalid?
SELECT OBJECT_NAME, STATUS FROM ALL_OBJECTS WHERE OBJECT_TYPE IN ('FUNCTION','PROCEDURE');
-- Invalid significa que no se ha compilado bien.

--7. Escribir un procedimiento que reciba dos números y visualice su suma.
create or replace procedure p_suma (in1 number, in2 number)
as
    result number(6);
begin
    result:=in1+in2;
    select result;
end p_suma;
/

-- 8. Codificar un procedimiento que reciba una lista de hasta 5 números y
-- visualice su suma.
CREATE OR REPLACE PROCEDURE f_suma_5num (in1 number, in2 number default 0, in3 number default 0,
                                        in4 number default 0, in5 number default 0, in6 number default 0)
AS
    result number(10);
BEGIN
    result:=in1+in2+in3+in4+in5+in6;
    DBMS_OUTPUT.PUT_LINE(result);
END f_suma_5num;
/

-- 9. Crear una función que calcule el área de un rectángulo (hay que pasar
-- como parámetro su base y su altura).
create or replace function f_arearectangulo (in1 number, in2 number) return number
as
    result number(10);
begin
    result:=in1*in2;
    return result;
end f_arearectangulo;
/

-- 10. Crear una función que calcule el perímetro de un rectángulo (hay que
-- pasar como parámetro su base y su altura).
create or replace function f_perimetrorectangulo (in1 number, in2 number) return number
as
    result number(10);
begin
    result:=2*(in1+in2);
    return result;
end f_perimetrorectangulo;
/

-- 12.  Crear un procedimiento que muestre el área de un rectángulo
-- utilizando la función del ejercicio 9 y otro procedimiento que muestre el perímetro de
-- un rectángulo usando la función del ejercicio 10.

-- ????????????????

-- 22. Escribir una función que reciba una fecha y devuelva el año, en número,
-- correspondiente a esa fecha. Hacerlo de dos formas (to_char y extract) y comparar
--tiempos.
create or replace function f_añofecha_extract (in1 varchar2) return number
as
    result number(4);
begin
    result:=EXTRACT(YEAR FROM TO_DATE(in1, 'dd-mm-yyyy'));
    return result;
end f_añofecha_extract;
/

call f_añofecha_extract('07-02-1999');


create or replace function f_añofecha_tochar (in1 varchar2) return number
as
    result number(4);
begin
    result:=to_char(in1, 'HH24:MI:SS');
    return result;
end f_añofecha_tochar;
/
--* Es mas rápido el extract porque ya es una función predeterminada de Oracle para este caso concreto.

-- 23. Desarrollar una función que devuelva el número de años completos que
-- hay entre dos fechas que se pasan como argumentos. Hacerlo de dos formas
-- (months_between y resta de fechas). Comparar tiempos
create or replace function f_mesesentre (in1 date, in2 date) return number
as
    result number(5);
begin
    result:=abs(trunc(months_between(in1,in2))/12);
    return result;
end f_mesesentre;
/

create or replace function f_añosresta (in1 date, in2 date) return number
as
    result number(5);
begin
    result:=abs(trunc(to_number(in1-in2))/365);
    return result;
end f_añosresta;
/
--* Vuelve a ser más eficiente la opción de months beetween especifica para este caso.

-- 24. Escribir una función que, haciendo uso de la función anterior devuelva los
-- trienios que hay entre dos fechas.
create or replace function f_trienios(in1 date, in2 date) return number
as
    result number(5);
begin
    result:=trunc(f_mesesentre(in1,in2)/3);
    return result;
end f_trienios;
/

-- 30.  Crear una función para mostrar el día de la semana actual.
create or replace function f_hoy return varchar2
as
    result varchar2(50);
begin
    result:=to_char(sysdate, 'day');
    return result;
end f_hoy;
/

-- 33. Crear un procedimiento que muestre en mayúsculas las tres primeras
-- letras de una cadena pasa como parámetro.

CREATE OR REPLACE PROCEDURE p_letrasmayus (in1 varchar2)
AS
BEGIN
    dbms_output.put_line(upper(substr(in1,1,3)));
END p_letrasmayus;
/

--34. Crear una función que devuelva en mayúsculas las tres primeras letras de
-- una cadena pasa como parámetro.
create or replace function f_hoy (in1 varchar2) return varchar2
as
    result varchar2(3);
begin
    result:=upper(substr(in1,1,3));
    return result;
end f_hoy;
/

-- 37. Procedimiento que borrará aquellos libros no publicados en los meses de verano
CREATE OR REPLACE PROCEDURE p_borra_libro_noverano
AS
BEGIN
delete from LIBRO
where extract(month from LIBRO.FECHA_PUBLICACION) NOT IN (6,7,8,9);
END p_borra_libro_noverano;
/

-- 38. Procedimiento que borrará los libros que contengan en su título las dos
-- letras que se les pasan por parámetro, las cuales nunca estarán juntas.

CREATE OR REPLACE PROCEDURE p_borra_libro_letras (in1 varchar, in2 varchar)
AS
BEGIN
delete LIBRO
where regexp_like (LIBRO.TITULO, '(in1|in2)');
END p_borra_libro_letras;
/

CREATE OR REPLACE PROCEDURE p_borra_libro_letras2 (in1 varchar, in2 varchar)
AS
BEGIN
   delete from LIBRO where TITULO LIKE ('%'in1 in2)
END p_borra_libro_letras2;
/

select *
from LIBRO
where regexp_like(TITULO, '[B-S]');

