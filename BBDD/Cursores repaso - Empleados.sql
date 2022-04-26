-- 1. Visualiza los empleados del departamento pasado por parámetroque tienen una A en su apellido.
create or replace procedure p_empleados_conA (in_depart varchar2)
as
cursor emplecur is
    select APELLIDO from EMPLE where regexp_like(APELLIDO, '[A]') and DEPT_NO = in_depart;
begin
    for i in emplecur loop
        DBMS_OUTPUT.PUT_LINE(i.APELLIDO);
    end loop;
end p_empleados_conA;

call p_empleados_conA(30);

-- 2. Añade una 'A' al final del apellido de los empleados cuyo salario sea mayor que 1300.
create or replace procedure p_empleados_addA
as
cursor emplecurs is
    select APELLIDO, ROWID from EMPLE where SALARIO > 1300;
begin
    for i in emplecurs loop
        update EMPLE set APELLIDO = rpad(APELLIDO,length(APELLIDO)+1,'A') where ROWID = i.ROWID;
    end loop;
end p_empleados_addA;

call p_empleados_addA();

-- 3. Añade una 'S' al principio del apellido de los empleados cuyo salario sea menor que el pasado por parámetro.
create or replace procedure p_empleados_addS (in1 number)
as
cursor emplecurs1 is
    select APELLIDO, ROWID from EMPLE where SALARIO < in1;
begin
    for i in emplecurs1 loop
        update EMPLE set APELLIDO = lpad(APELLIDO,length(APELLIDO)+1,'S') where ROWID = i.ROWID;
    end loop;
end p_empleados_addS;

call p_empleados_addS(1300);


