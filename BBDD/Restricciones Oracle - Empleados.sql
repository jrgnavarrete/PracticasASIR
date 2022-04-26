--1. Ejecuta el siguiente script

create table emple (
 codigo number(6),
 documento char(8),
 nombre varchar2(30),
 seccion varchar2(20),
 sueldo number(6,2)
);
insert into emple values (1,'22222222','Alberto Acosta','Sistemas',-10);
insert into emple values (2,'33333333','Beatriz Benitez','Recursos',3000);
insert into emple values (3,'34444444','Carlos Caseres','Contaduria',4000);

--2. Agrega una restricción "check" para asegurarte que no se ingresen valores negativos para el
-- sueldo sin especificar validación ni estado:
alter table emple add constraint sueldonegativo check(sueldo > 0);
-- Este da error porque al validar datos ya insertados, hay uno negativo (-10).

--3. Agrega de nuevo la restricción “check” a la tabla emple sin que dé problemas e inserta un
-- empleado con sueldo negativo
alter table emple add constraint sueldonegativo check(sueldo > 0) novalidate;
-- De esta forma no da error porque no valida datos anteriores, ahora dará error al insertar un suelo negativo:
insert into emple values (4,'22222221','Valerie Galindo','Psicología',-1120);

--4. Deshabilita la restricción e inserta el registro anterior.
alter table emple disable constraint sueldonegativo;
-- Con la constraint desactivada, ya podremos introducir sueldos negativos.
insert into emple values (4,'22222221','Valerie Galindo','Psicología',-1120);

--5. Intenta establecer una restricción "check" para "seccion" que permita solamente los valores
-- "Sistemas", "Administracion" y "Contaduría" sin especificar validación
alter table emple add constraint seccion_in check (seccion IN ('SISTEMAS', 'ADMINISTRACION', 'CONTADURIA'));
-- Da error ya que hay una persona en "Recursos".

--6. Establece la restricción anterior evitando que se controlen los datos existentes.
alter table emple add constraint seccion_in check (seccion IN
                                                    ('SISTEMAS', 'ADMINISTRACION', 'CONTADURIA')) enable novalidate;
--Al igual que en el ejemplo anterior, la creamos sin que valide para que el de "Recursos" no de problemas.

--7. Visualiza las restricciones de la tabla emple que están o no habilitadas y validadas.
select constraint_name, constraint_type, search_condition, status
from user_constraints
where table_name=(upper('emple'));

--8. Habilita la restricción deshabilitada. Observa que existe un sueldo que infringe la condición.
alter table emple enable constraint sueldonegativo;
--Si no la ponemos como novalidate, al intentar validar los datos ya puestos, dará error.

--9. Modifica la sección del empleado "Carlos Caseres" a "Recursos"
update emple set seccion='RECURSOS' where nombre='CARLOS CASERES';
-- Da error porque seccion solo puede ser SISTEMAS, ADMINISTRACION O CONTADURIA desde que añadimos la constraint.

--10. Deshabilita la restricción para poder realizar la actualización del punto anterior.
alter table emple disable constraint seccion_in;

--11. Agrega una restricción "primary key" para el campo "codigo" deshabilitada e inserta un registro
-- con código existente.
alter table emple add constraint PK_EMPLEADO_CODIGO primary key (codigo) disable;
insert into emple values (7,'22222223','KIKE MONTILLA','SISTEMAS',5120);

-- 12. Habilita la restricción anterior y si no lo permite, realiza en las tuplas las modificaciones
-- necesarias.
update emple set codigo=5 where nombre='KIKE MONTILLA';
alter table emple enable constraint PK_EMPLEADO_CODIGO;

-- 13-Agrega una restricción "unique" para el campo "documento".
alter table emple add constraint DOCUMENTO_UNIQUE unique (documento);

-- 14. Muestra todas las restricciones de la tabla "emple" y
-- deshabilítalas todas las restricciones de "emple"
select constraint_name, constraint_type, search_condition, status
from user_constraints
where table_name=(upper('emple'));
-- He visto que para hacerlo sin tener que escribir todas se podría usar un script, pero como no
-- estoy seguro de cómo funciona, lo hago manualmente.
alter table emple disable constraint DOCUMENTO_UNIQUE;
alter table emple disable constraint PK_EMPLEADO_CODIGO;
alter table emple disable constraint seccion_in;
alter table emple disable constraint sueldonegativo;

-- 15. Inserta un registro que viole todas las restricciones
insert into emple values (1,'22222222','Alberto Acosta','EYYY',-99);

-- 16, 17: Habilitar restricciones sin validar
alter table emple enable novalidate constraint seccion_in;
alter table emple enable novalidate constraint sueldonegativo;
--Estas no dan error porque estas constraint si puede no validarlas.

-- 18 y 19: Habilitar restricciones PK y Unique
alter table emple enable constraint DOCUMENTO_UNIQUE;
alter table emple enable constraint PK_EMPLEADO_CODIGO;
--Estas sí dan error porque las de UNIQUE y PK no pueden obviar los datos anteriores a pesar de poner novalidate

-- 20. Elimina el registro que infringe con las restricciones "primary key" y "unique"
delete from emple where 'seccion'='EYYY'

--21. Habilita las restricciones "PK_emple_codigo" y "UQ_emple_documento" sin validar los datos existentes
alter table emple enable constraint DOCUMENTO_UNIQUE;
alter table emple enable constraint PK_EMPLEADO_CODIGO;

-- 22. Consulta el catálogo "user_constraints" y analiza la información.
select * from USER_CONSTRAINTS;
-- La primera columa te indica el dueño de cada constraint, así como su nombre.
-- La tercera columna indica el tipo de constraint, si es primaria, un check, foránea o unique.
-- A su derecha se nos muestra el nombre de la tabla, y tras ello, se nos muestra la condición de
-- búsqueda si la hubiese, ya que las PK, Unique o FK no la tienen.
-- Más a la derecha nos indica también si está activa y validada.

--23. Un parking almacena cada día los datos de los vehículos que utilizan el mismo, para ello se
-- necesita crear una tabla llamada "vehiculos". Modifica el formato de salida del tipo de dato DATE
-- para que muestre hora y minutos.
create table vehiculos(
    patente char(6) not null,
    tipo char(1),
    horallegada date not null,
    horasalida date
);

ALTER SESSION SET nls_date_format = 'dd-mm-yyyy hh24:mi:ss';

-- 24. Establece una restricción "check" que admita solamente los valores "a" y "m" para el campo "tipo":
alter table vehiculos add constraint tipo_in check (tipo IN ('A','M'));

-- 25. Agrega una restricción "primary key" que incluya los campos "patente" y "horallegada". Inserta un vehículo.
alter table vehiculos add constraint vechiulo_pk primary key (patente, horallegada);
insert into vehiculos values (1, 'A', TO_DATE('2021/10/10 11:53:27', 'yyyy/mm/dd hh24:mi:ss'), sysdate);

-- 26. Insertar un registro repitiendo la clave primaria.
-- (Va a dar error porque la PK no se puede repetir).
insert into vehiculos values (1, 'M', TO_DATE('2021/10/10 11:53:27', 'yyyy/mm/dd hh24:mi:ss'), sysdate);

-- 27. Inserta un registro repitiendo la patente, pero no la hora de llegada.
insert into vehiculos values (1, 'A', sysdate, sysdate);

-- 28. Inserta un registro repitiendo la hora de llegada, pero no la patente.
insert into vehiculos values (2, 'M', TO_DATE('2021/10/10 11:53:27', 'yyyy/mm/dd hh24:mi:ss'), sysdate);

-- 29. Muestra todas las restricciones para la tabla "vehiculos"
select constraint_name, constraint_type, search_condition, status
from user_constraints
where table_name=(upper('vehiculos'));

-- 30. Elimina la restricción "primary key"
alter table vehiculos drop constraint vechiulo_pk;

-- 31. Asegurarnos de que se ha eliminado
select constraint_name, constraint_type, search_condition, status
from user_constraints
where table_name=(upper('vehiculos'));
-- Se ha eliminado OK.

-- 32. Elimina la restricción de control que establece que el campo "patente" no sea nulo (busque el
-- nombre consultando "user_constraints"). Asegúrate que la has eliminado.
alter table vehiculos drop constraint SYS_C007232;

-- 33. Vuelve a establecer la restricción "primary key" eliminada.
alter table vehiculos add constraint vechiulo_pk primary key (patente, horallegada);

--34. Se quiere incluir, para el campo "tipo", además de los valores permitidos "a" (auto) y "m" (moto), el
-- carácter "c" (camión). No puede modificar la restricción, debe eliminarla y luego redefinirla con los
-- 3 valores.
alter table vehiculos drop constraint tipo_in;
alter table vehiculos add constraint tipo_IN CHECK (tipo IN ('A','B','C'));

-- 35. Consulta "user_constraints" para ver si la condición de chequeo de la restricción
-- "CK_vehiculos_tipo" se ha modificado.
select constraint_name, constraint_type, search_condition, status
from user_constraints
where table_name=(upper('vehiculos'));

-------------- PARTE 3:

create table clientes (
 codigo number(5),
 nombre varchar2(30),
 domicilio varchar2(30),
 ciudad varchar2(20),
 codigoubicacion number(2),
 primary key(codigo)
);
create table ubicacion(
 codigo number(2),
 nombre varchar2(20),
 primary key (codigo)
);
-- insert into provincias values(1,'Cordoba');
insert into ubicacion values(2,'Santa Fe');
insert into ubicacion values(3,'Misiones');
insert into ubicacion values(4,'Rio Negro');
insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
insert into clientes values(102,'Garcia Juan','Sucre 345','Cordoba',1);
insert into clientes values(103,'Lopez Susana','Caseros 998','Posadas',3);
insert into clientes values(104,'Marcelo Moreno','Peru 876','Viedma',4);
insert into clientes values(105,'Lopez Sergio','Avellaneda 333','La Plata',5);

-- 36. Añade una restricción "foreign key" para que los códigos de ubicación de "clientes" existan en
-- "ubicación" sin especificar la opción de comprobación de datos. Ten en cuenta que las tablas
-- tienen datos insertados
alter table clientes add constraint FK_cliente_ubicacion foreign key (codigoubicacion) references ubicacion (codigo);

-- 37. Deshabilita la restricción "foreign key" de "clientes"
alter table clientes disable constraint FK_cliente_ubicacion;

-- 38. Añade un registro que no cumpla la restricción "foreign key"
insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',99);
-- Obviamente lo hace, ya que está disabled la FK.

-- 39. Modifica el código de ubicación del cliente código 104 por 9
update clientes set codigoubicacion=9 where codigoubicacion=104;

--40. Habilita la restricción "foreign key" de "clientes"
alter table clientes enable novalidate constraint FK_cliente_ubicacion;
-- Para que se pueda habilitar hay que indicarle novalidate para que no mire valores mal puestos (como el anterior).

--41. Intenta modificar un código de ubicación existente por uno inexistente.
update clientes set codigoubicacion=117 where codigo=101;

--42. Intenta modificar la restricción "foreign key" para que valide los datos existentes
alter table clientes enable validate constraint FK_cliente_ubicacion;
-- No puede validar

--43. Elimina los registros que no cumplen la restricción y modifique la restricción a "enable" y "validate"
delete from clientes where codigoubicacion=9;
delete from clientes where codigoubicacion=117;
alter table clientes enable validate constraint FK_cliente_ubicacion;

--44. Obtén información sobre la restricción "foreign key" de "clientes"
select *
from user_constraints
where CONSTRAINT_NAME=(upper('fk_cliente_ubicacion'));