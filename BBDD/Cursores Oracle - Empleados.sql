-- 1. Muestra los empleados que tienen un salario superior que la media de los empleados pertenecientes al
-- departamento pasado por parámetro.
create or replace procedure p_empleados_ricos (in1 varchar2)
as
cursor emplecursor is
    select * from EMPLE where DEPT_NO=in1 AND SALARIO > (select avg(SALARIO)
                                                        from EMPLE
                                                        where DEPT_NO = in1);
begin
    for i in emplecursor loop
        DBMS_OUTPUT.PUT_LINE(i.APELLIDO || ' ' || i.SALARIO ||' ' || i.DEPT_NO);
    end loop;
end p_empleados_ricos;

call p_empleados_ricos(20);

-- 2. Escribe un procedimiento que visualice el apellido y el salario de los cinco empleados que tienen el salario más alto.
create or replace procedure p_empleados_top_5
as
cursor emplecursor2 is
    select * from ( select APELLIDO, SALARIO from EMPLE order by SALARIO desc) where ROWNUM <= 5;

begin
    for i in emplecursor2 loop
        DBMS_OUTPUT.PUT_LINE(i.APELLIDO ||' ' || i.SALARIO);
    end loop;
end p_empleados_top_5;

call p_empleados_top_5();

-- 3. Escribe un procedimiento que visualice el apellido y el salario de los N empleados que tienen el salario más alto.
create or replace procedure p_empleados_top_n (in1 number)
as
cursor emplecursor3 is
    select * from ( select APELLIDO, SALARIO  from EMPLE
                    where SALARIO is not null
                    order by SALARIO desc) where ROWNUM <= in1;

begin
    for i in emplecursor3 loop
        DBMS_OUTPUT.PUT_LINE( i.APELLIDO ||' ' || i.SALARIO);
    end loop;
end p_empleados_top_n;

call p_empleados_top_n(2);

/* 4. Escribe un procedimiento que reciba como parámetro un número de departamento y un porcentaje; y que
suba el sueldo ese porcentaje a todos los empleados del departamento indicado en la llamada. El programa
debe informar del número de filas afectadas por la actualización. Se actualizarán los salarios
individualmente y usando el ROWID. */
create or replace procedure sube_salario (in_depart varchar2, in_porcentaje number)
as
porcentaje_calculado number default 0;
contador number default 0;
cursor emplecursor4 is
    select SALARIO, ROWID from EMPLE where DEPT_NO = in_depart;
begin
    porcentaje_calculado := (in_porcentaje * 0.01) +1;
    for i in emplecursor4 loop
        update EMPLE set SALARIO = SALARIO * porcentaje_calculado WHERE ROWID = i.ROWID;
        contador := contador + 1;
    end loop;
    DBMS_OUTPUT.PUT_LINE( 'Número de tuplas modificadas: ' || contador);
end sube_salario;

call sube_salario(10, 20);
-- 5. Ejercicio 4 página 284 del libro.
create or replace procedure listar_emple
as
    cursor c1 is
        select APELLIDO, SALARIO, DEPT_NO from EMPLE order by DEPT_NO, APELLIDO;
begin
    for i in c1 loop
        DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || i.DEPT_NO || 'NUM EMPLEADOS: ' );
    end loop;
end listar_emple;

-- 6. Visualiza todos los empleados que se dieron de alta en el mes pasado por parámetro.
create or replace procedure p_empleados_mespasado
as
cursor empleadoscursor6 is
    select APELLIDO, FECHA_ALT from EMPLE where (extract(month from FECHA_ALT) = (extract(month from sysdate) - 1));

begin
    for i in empleadoscursor6 loop
        DBMS_OUTPUT.PUT_LINE( i.APELLIDO || ' ' || i.FECHA_ALT);
    end loop;
end p_empleados_mespasado;

call p_empleados_mespasado();

-- 7. Visualiza todos los empleados del departamento X que se dieron de alta en el año Z.
create or replace procedure p_empleados_departagno (in_depart varchar2, in_agno number)
as
cursor empleadoscursor2 is
    select * from EMPLE where (extract(year from FECHA_ALT) = in_agno) and DEPT_NO = in_depart;

begin
    for i in empleadoscursor2 loop
        DBMS_OUTPUT.PUT_LINE( i.APELLIDO || ' Fue dado de alta el ' || i.FECHA_ALT || ', y es del departamento ' || i.DEPT_NO);
    end loop;
end p_empleados_departagno;

call p_empleados_departagno(20,1990);

