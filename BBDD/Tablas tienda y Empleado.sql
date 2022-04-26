CREATE TABLE Provincia
(
nombre_prov varchar2(10),
codprov number(2) constraint codprov_NN not null,

CONSTRAINT PK_PROVINCIA PRIMARY KEY (nombre_prov),
CONSTRAINT COD_PROV_UNIQUE UNIQUE(codprov)
);

CREATE TABLE Localidad
(
nombre_loc varchar2(10),
nombre_prov varchar2(10),
codloc number(2) constraint codloc_NN not null,

CONSTRAINT PK_LOCALIDAD PRIMARY KEY (nombre_loc,nombre_prov),
CONSTRAINT COD_LOC_UNIQUE UNIQUE(codloc),
CONSTRAINT Localidad_Provincia_FK FOREIGN KEY(nombre_prov) REFERENCES Provincia(nombre_prov) on delete cascade
);

CREATE TABLE Empleado
(
dni varchar(9),
nombre varchar2(30) constraint empnom_NN not null,
ap1 varchar2(30) constraint empap1_NN not null,
ap2 varchar2(30) constraint empap2_NN not null,
edad number(2) default 18 constraint empedad_NN not null,
telefono number(9) constraint emptlf_NN not null,

CONSTRAINT PK_EMPLEADO PRIMARY KEY (dni),
CONSTRAINT MAYUS_DNI CHECK (dni = UPPER(dni)),
CONSTRAINT MAYUS_AP1 CHECK (ap1 = UPPER(ap1)),
CONSTRAINT MAYUS_AP2 CHECK (ap2 = UPPER(ap2)),
CONSTRAINT RANGO_EDAD CHECK (edad between 18 and 35),
CONSTRAINT RANGO_TLF CHECK (telefono between 600000000 and 799999999 OR telefono between 900000000 and 999999999)
);


CREATE TABLE Tienda
(
CIF varchar2(10),
nombre varchar(20),
direccion varchar(20) constraint tiendadir_NN not null,
nombre_loc varchar2(10) constraint tiendanombreloc_NN not null,
nombre_prov varchar2(10) constraint tiendanombreprov_NN not null,
tipo_via varchar2(10) constraint tiendatipovia_NN not null,
nombre_via varchar2(10) constraint tiendanombrevia_NN not null,
numero numeric(3),
piso numeric(3),
escalera numeric(3) ,
portal numeric(3),
puerta varchar2(3),

CONSTRAINT PK_ARTICULO PRIMARY KEY (CIF),
CONSTRAINT MAYUS_NOMBRE CHECK (nombre = UPPER(nombre)),
CONSTRAINT MAYUS_NOMBRELOC CHECK (nombre_loc = UPPER(nombre_loc)),
CONSTRAINT MAYUS_NOMBREPROV CHECK (nombre_prov = UPPER(nombre_prov)),
CONSTRAINT MAYUS_NOMBREVIA CHECK (nombre_via = UPPER(nombre_via)),
CONSTRAINT MAYUS_PUERTA CHECK (puerta = UPPER(puerta)),
CONSTRAINT TIPO_VIA_DOMAIN CHECK (tipo_via IN ('AVENIDA', 'CALLE', 'PLAZA','CARRETERA')),
CONSTRAINT TIENDA_FK_NOMLOC FOREIGN KEY (nombre_loc,nombre_prov) REFERENCES Localidad(nombre_loc,nombre_prov)
);


CREATE TABLE Fabricante
(
cod_fabrii numeric(3),
nombre varchar(15),

CONSTRAINT PK_FABRICANTE PRIMARY KEY (cod_fabrii),
CONSTRAINT MAYUS_NOMBREFABRICANTE CHECK (nombre = UPPER(nombre))
);

CREATE TABLE Articulo
(
cod_art varchar2(20),
peso numeric(3) constraint articulopeso_NN not null,
categoria varchar2(10) constraint articulocat_NN not null,
cod_fabrii numeric(3) constraint articulocod_fabrii_NN not null,

CONSTRAINT PRIMARYKEY_ARTICULO PRIMARY KEY (cod_art, cod_fabrii),
CONSTRAINT MAYUS_CODART CHECK (cod_art = UPPER(cod_art)),
CONSTRAINT CATEGORIA_DOMAIN CHECK (categoria IN ('PRIMERA','SEGUNDA','TERCERA')),
CONSTRAINT FABRICANTE_ARTICULO_FK FOREIGN KEY(cod_fabrii) REFERENCES Fabricante(cod_fabrii) ON DELETE CASCADE
);

CREATE TABLE Art_Tie
(
cod_art varchar2(20),
cod_fabrii varchar2(20),
CIF varchar2(10),


CONSTRAINT PK_ARTICULO PRIMARY KEY (cod_art, CIF, cod_fabrii),
CONSTRAINT Art_Tie_Tienda_FK FOREIGN KEY(CIF) REFERENCES Tienda(CIF),
CONSTRAINT Art_Tie_Articulo_FK FOREIGN KEY(cod_art,cod_fabrii) REFERENCES Articulo(cod_art,cod_fabrii)
);


CREATE TABLE Venta
(
codigo numeric(8),
fecha date constraint fechaprecio_NN not null,
precio number(6,2) constraint ventaprecio_NN not null,
unidades number (2) constraint ventauni_NN not null,
Precio_Total numeric(8,2) GENERATED ALWAYS  as (precio*unidades),
cod_art varchar2(20) constraint ventacod_art_NN not null,
cod_fabrii numeric(3) constraint ventacod_fabri_NN not null,
dni varchar2(9) constraint ventadni_NN not null,

CONSTRAINT PK_VENTA PRIMARY KEY (codigo),
CONSTRAINT MAYUS_TIENDA_CODART CHECK (cod_art = UPPER(cod_art)),
CONSTRAINT MAYUS_TIENDA_CODFABRII CHECK (cod_fabrii = UPPER(cod_fabrii)),
CONSTRAINT TIENDA_ARTICULO_FK FOREIGN KEY(cod_art,cod_fabrii) REFERENCES Articulo(cod_art,cod_fabrii),
CONSTRAINT VENTA_EMPLEADO_FK FOREIGN KEY(dni) REFERENCES Empleado(dni),
CONSTRAINT venta_precio check (precio > 0),
CONSTRAINT venta_unidades check (unidades > 0)
);

--3. Realiza las siguientes modificaciones
-- Tienda: Nombre a 30 caracteres y NN. Eliminar direccion.
alter table Tienda modify nombre varchar2(30) constraint tiendanombre_NN not null;
alter table Tienda drop column direccion;
alter table Tienda add constraint tiendanombre_mayus check (nombre=upper(nombre));

--4. Realiza modificaciones que consideres necesarias
alter table Articulo add constraint articulopeso_check CHECK (peso > 0 );

--5. Visualiza las restricciones definidas para las tablas anteriores
select constraint_name, constraint_type, search_condition, status
from user_constraints
where table_name in (upper('articulo'), upper('tienda'), upper('venta'), upper('empleado'));

-- 6. Modifica Unidades para que pueda almacenar cantidades numéricas de 6 dígitos.
alter table Venta drop column Precio_Total;
alter table Venta modify unidades number(6);
alter table Venta add Precio_Total number(12,2) GENERATED ALWAYS AS (precio*unidades);

--7. Añadir atributo telefono a Fabricante para móviles
alter table Fabricante add telefono_movil number(9);
alter table Fabricante add constraint Fabricantetlf_check CHECK (telefono_movil between 600000000 and 799999999);

--8. Modificar el nombre del atributo anterior a tlf
alter table Fabricante rename column telefono_movil to tlfn;

--9. Mostrar todos los empleados
select * from Empleado;

--10. Almacena la info de los hijos varones en una tabla y de los que sean mujeres en otra
alter table Empleado add sexo varchar2(6) constraint empleadosexo_NN not null;
alter table Empleado add constraint empleadosexo_check CHECK (Empleado.sexo IN ('HOMBRE', 'MUJER'));
CREATE TABLE EmpleadoHombre
(
dni varchar(9),
nombre varchar2(30) constraint empHnom_NN not null,
ap1 varchar2(30) constraint empHap1_NN not null,
ap2 varchar2(30) constraint empHap2_NN not null,
edad number(2) default 18 constraint empHedad_NN not null,
telefono number(9) constraint empHtlf_NN not null,

CONSTRAINT PK_H_EMPLEADO PRIMARY KEY (dni)
);
CREATE TABLE EmpleadoMujer
(
dni varchar(9),
nombre varchar2(30) constraint empMnom_NN not null,
ap1 varchar2(30) constraint empMap1_NN not null,
ap2 varchar2(30) constraint empMap2_NN not null,
edad number(2) default 18 constraint empMedad_NN not null,
telefono number(9) constraint empMtlf_NN not null,

CONSTRAINT PK_M_EMPLEADO PRIMARY KEY (dni)
);

declare cursor empleados is
    select *
    from Empleado;

begin
    for u in empleados loop
        if(Empleado.sexo='HOMBRE') then
            insert into EmpleadoHombre
            values (dni, nombre, ap1, ap2, edad, telefono);
        else
            insert into EmpleadoMujer
            values (dni, nombre, ap1, ap2, edad, telefono);
        end if;
    end loop;
end;

-- Volcar datos directamente con una condicion
create table hijo_varones
as  select * from hijos
    where genero LIKE 'VARON';