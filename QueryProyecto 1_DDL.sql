create database HelloWord;

use HelloWord;

create table empresa(

id_empre int identity(0,1) primary key not null ,
nombre_empre varchar(45) not null,
nit_empre int not null,
tipo_empre varchar(25) not null,
tamaño_empre int not null
);

create table empleado(

id_emple int identity(0,1) primary key not null,
emple_fk_empre int foreign key references empresa(id_empre) on delete cascade,
nombre_emple varchar(45) not null,
correo_emple varchar(45) not null,
puesto_emple varchar(25) not null,
celular_emple int not null
);

create table tarjeta(

id_tar int identity(0,1) primary key not null,
tar_fk_empre int foreign key references empresa(id_empre) on delete cascade,
num_tar int not null,
nombre_tar varchar(45) not null,
mes_tar int not null,
año_tar int not null,
tipo_tar varchar(10) not null,
crv_tar int not null,
vigencia char(2) not null,
suscripcion_tar varchar(10)
);

create table usuario(

id_user int identity(0,1) primary key not null,
user_fk_empre int foreign key references empresa(id_empre),
user_fk_emple int foreign key references empleado(id_emple),
nick varchar(45) not null,
pass varchar(45) not null,
tipo char(2)
);

create table publicacion(

id_publi int identity(0,1) primary key not null,
publi_fk_user int foreign key references usuario(id_user),
titulo_publi varchar(25) not null,
post_publi varchar(150) not null
);

create table comentario (

id_coment int identity(0,1) primary key not null,
coment_fk_publi int foreign key references publicacion(id_publi),
coment_fk_user int foreign key references usuario(id_user),
coment varchar(100) not null
);

create table modulo(

id_mod int identity(0,1) primary key not null,
nombre_mod varchar(45) not null,
abreviatura_mod varchar(20) not null,
descripcion_mod varchar(100) not null,
default_mod char(2) not null
);

create table precio(

id_pre int identity(0,1) primary key not null,
rango char(1) not null,
mensual_pre float not null,
anual_pre float not null

);

create table acceso_modulo(
id_accm int identity(0,1) primary key not null,
accm_fk_user int foreign key references usuario(id_user),
accm_fk_mod int foreign key references modulo(id_mod)
);

create table tienda_modulo(

shop_fk_mod int foreign key references modulo(id_mod),
shop_fk_empre int foreign key references empresa(id_empre),
shop_fk_pre int foreign key references precio(id_pre),
estado_mod char(1) not null,
fecha_inicio date not null,
fecha_fin date not null
);

create table candidato(

id_cand int identity(0,1) primary key not null,
nombre_cand varchar(20) not null,
apellido_cand varchar(20) not null,
edad_cand int not null,
profesion_cand varchar(20) not null
);

create table entrevista(

entre_fk_empre int foreign key references empresa(id_empre),
entre_fk_cand int foreign key references candidato(id_cand),
fecha datetime not null
);

create table cliente(

id_cli int identity(0,1) primary key not null,
nombre_cli varchar(20) not null,
apellido_cli varchar(20) not null,
nit_cli int null,
telefono_cli int null
);

create table proveedor(

id_prov int identity(0,1) primary key not null,
nombre_prov varchar(20) not null,
apellido_prov varchar(20) not null,
nit_prov int not null,
telefono_prov int not null
);

create table bodega(

id_bode int identity(0,1) primary key not null,
bode_fk_empre int foreign key references empresa(id_empre) on delete cascade,
nombre_bode varchar(25) not null,
descripcion_bode varchar(45) not null,
direccion_bode varchar(45) not null
);

create table pasillo(

id_pasi int identity(0,1) primary key not null,
pasi_fk_bode int foreign key references bodega(id_bode) on delete cascade,
ancho_pasi int not null,
largo_pasi int not null
);

create table estante(

id_estan int identity(0,1) primary key not null,
estan_fk_pasi int foreign key references pasillo(id_pasi) on delete cascade,
letra_estan char(1) not null,
largo_estan int not null,
ancho_estan int not null,
altura_estan int not null
);

create table nivel(

id_nivel int identity(0,1) primary key not null,
nivel_fk_estan int foreign key references estante(id_estan) on delete cascade,
altura_nivel int not null
);

create table producto(

id_prod int identity(0,1) primary key not null,
prod_fk_empre int foreign key references empresa(id_empre) on delete cascade,
nombre_prod varchar(25) not null,
precio_prod float not null
);

create table lote_nivel(

id_lote_nivel int identity(0,1) primary key not null,
lote_nivel_fk_nivel int foreign key references nivel(id_nivel) on delete cascade,
lote_nivel_fk_prod int foreign key references producto(id_prod)on delete no action,
lote_nivel_fk_bod int foreign key references bodega(id_bode),
cantidad_prod int not null,
logica varchar(4) not null

);

create table ubicacion(

id_ubica int identity(0,1) primary key not null,
ubica_fk_nivel int foreign key references nivel(id_nivel) on delete cascade,
ubica_fk_prod int foreign key references producto(id_prod)on delete no action,
ubica_fk_bode int foreign key references bodega(id_bode),
cantidad_prod int not null
);

create table materia_prima(

 id_mat int identity(0,1) primary key not null,
 nombre_mat varchar(25) not null,
 precio_mat float not null,
 cantidad_mat int not null
);

create table detalle(

det_fk_mat int foreign key references materia_prima(id_mat),
det_fk_prod int foreign key references producto(id_prod)
);

create table factura_cliente_producto(

fac_cp_fk_user int foreign key references usuario(id_user),
fac_cp_fk_cli int foreign key references cliente(id_cli),
fac_cp_fk_prod int foreign key references producto(id_prod),
cantidad_prod int not null
);

create table factura_proveedor_producto(

fac_cp_fk_user int foreign key references usuario(id_user),
fac_pp_fk_prov int foreign key references proveedor(id_prov),
fac_pp_fk_prod int foreign key references producto(id_prod),
cantidad_prod int not null,
fecha_fac date not null
);

create table factura_proveedor_materia(

fac_cp_fk_user int foreign key references usuario(id_user),
fac_pm_fk_prov int foreign key references proveedor(id_prov),
fac_pm_fk_mat int foreign key references materia_prima(id_mat),
cantidad_prod int not null,
fecha_fac date not null
);
