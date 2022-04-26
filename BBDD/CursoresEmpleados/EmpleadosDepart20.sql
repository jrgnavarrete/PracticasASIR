-- Manteniendo el bucle do while:

create or replace procedure employs_depart20
as
    cursor cursor1 is
    select APELLIDO, ROWID from EMPLE where DEPT_NO=20;
    v_emple cursor1%rowtype;
    rowid_anterior varchar2(20) default 'a';
begin
    open cursor1;
        loop
            fetch cursor1 into v_emple;

            if rowid_anterior != rowidtochar(v_emple.ROWID) then
                DBMS_OUTPUT.PUT_LINE(to_char(cursor1%rowcount,'99.') || v_emple.APELLIDO || ' ' || rowid_anterior || ' ' || v_emple.ROWID);
            end if;

            rowid_anterior := rowidtochar(v_emple.ROWID);

            exit when cursor1%notfound;
        end loop;
    close cursor1;

end employs_depart20;

call employs_depart20();

-- Con un while
create or replace procedure employs_depart20_while
as
    cursor cursor2 is
    select APELLIDO from EMPLE where DEPT_NO=20;
    v_apellido EMPLE.APELLIDO%type;
begin
    open cursor2;
        fetch cursor2 into v_apellido;
        while cursor2%found loop
            DBMS_OUTPUT.PUT_LINE(to_char(cursor2%rowcount,'99.') || v_apellido);
            fetch cursor2 into v_apellido;
        end loop;
    close cursor2;

end employs_depart20_while;

call employs_depart20_while();