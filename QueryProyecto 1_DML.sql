
use HelloWord;

insert into empresa (nombre_empre,nit_empre,tipo_empre,tamaño_empre) values ('Hello Word','0000','Software','0');
insert into empresa (nombre_empre,nit_empre,tipo_empre,tamaño_empre) values ('Empresa Mauro','0000','Financiera','20');
insert into empresa (nombre_empre,nit_empre,tipo_empre,tamaño_empre) values ('Empresa Raul','1231','Comercial','10');

insert into empleado (emple_fk_empre, nombre_emple, correo_emple, puesto_emple, celular_emple) values ('0','Administrador Hello Word','admin@helloword.com','Administrador Hello Word' , '0000');
insert into empleado (emple_fk_empre, nombre_emple, correo_emple, puesto_emple, celular_emple) values ('1','Administrador Mauro','admin@mauro.com','Mauro' , '0000');
insert into empleado (emple_fk_empre, nombre_emple, correo_emple, puesto_emple, celular_emple) values ('2','Administrador Raul','admin@raul.com','Raul' , '0000');

insert into usuario (user_fk_empre, user_fk_emple,nick,pass,tipo) values ('0','0','admin','hw','ah');
insert into usuario (user_fk_empre, user_fk_emple,nick,pass,tipo) values ('1','1','mauro','admin','as');
insert into usuario (user_fk_empre, user_fk_emple,nick,pass,tipo) values ('2','2','raul','admin','as');
insert into usuario (user_fk_empre, user_fk_emple,nick,pass,tipo) values ('1','1','mauro','123','us');
insert into usuario (user_fk_empre, user_fk_emple,nick,pass,tipo) values ('2','2','raul','123','us');

insert into cliente (nombre_cli,apellido_cli,nit_cli,telefono_cli) values ('Mari','Sol','4671','3695');
insert into cliente (nombre_cli,apellido_cli,nit_cli,telefono_cli) values ('Lenin','Gay','4789','1360');
insert into proveedor(nombre_prov,apellido_prov,nit_prov,telefono_prov) values ('Tavo','Perez','4976','5792');
insert into proveedor(nombre_prov,apellido_prov,nit_prov,telefono_prov) values ('Mark','Zukaritas','9746','2046');
insert into producto(prod_fk_empre,nombre_prod,precio_prod) values ('1','bananos','6');
insert into producto(prod_fk_empre,nombre_prod,precio_prod) values ('1','fresas','8');
insert into producto(prod_fk_empre,nombre_prod,precio_prod) values ('1','duraznos','7');
insert into producto(prod_fk_empre,nombre_prod,precio_prod) values ('2','almohadas','10');
insert into producto(prod_fk_empre,nombre_prod,precio_prod) values ('2','sabanas','15');
insert into producto(prod_fk_empre,nombre_prod,precio_prod) values ('2','camas','50');

select * from empleado;

select * from usuario;

select * from empresa;

select * from producto;

select * from bodega;

select * from pasillo;

select * from estante;

select * from nivel;

select * from cliente;

select * from proveedor;

select * from ubicacion;

select * from lote_nivel;

-- SELECT * FROM t1 WHERE fecha BETWEEN '20200103' AND '20200205'

select * from factura_cliente_producto;

select * from factura_proveedor_producto;

select nombre_prod as 'Nombre Producto',id_bode as 'Bodega',nombre_bode as 'Nombre Bodega' ,id_pasi as 'Pasillo',id_estan as 'Estante',id_nivel as 'Nivel',cantidad_prod as 'Cantidad' 
from bodega 
inner join ubicacion on ubica_fk_bode = id_bode
inner join producto on ubica_fk_prod = id_prod
inner join pasillo on pasi_fk_bode = id_bode 
inner join estante on estan_fk_pasi = id_pasi
inner join nivel on nivel_fk_estan = id_estan
where id_bode = '1' order by nombre_prod

select nombre_prod as 'Nombre Producto',id_bode as 'Bodega',nombre_bode as 'Nombre Bodega',id_pasi as 'Pasillo',id_estan as 'Estante',id_nivel as 'Nivel',cantidad_prod as 'Cantidad',logica as 'Logica'
from bodega 
inner join lote_nivel on lote_nivel_fk_bod = id_bode
inner join producto on lote_nivel_fk_prod = id_prod
inner join pasillo on pasi_fk_bode = id_bode
inner join estante on estan_fk_pasi = id_pasi
inner join nivel on nivel_fk_estan = id_estan
where id_prod = '3' order by nombre_prod, logica asc

-- lote_nivel_fk_prod = id_prod
-- inner join lote_nivel on lote_nivel_fk_bod = id_bode

select lote_nivel_fk_prod from lote_nivel group by lote_nivel_fk_prod;