using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Controls.Primitives;

namespace Proyecto_IPC2_1S2020.Models {

    public class ConexionDB {

        public static string cadena = "data source=---\\SQLEXPRESS; database= HelloWord; integrated security=SSPI";
        public static SqlConnection cnn = new SqlConnection(cadena);
        public static SqlCommand cmd;
        public static string sql;
        public DataTable datos = new DataTable();

        void cargaDatos() {
            datos.Reset();
            cmd = new SqlCommand(sql, cnn);
            SqlDataReader lectura;
            conectar();
            try {
                using (lectura = cmd.ExecuteReader()) {
                    datos.Load(lectura);
                }
            }
            catch (Exception) {

            }
            desconectar();
        }
        void enviarDatos() {
            cmd = new SqlCommand(sql, cnn);
            conectar();
            try {
                SqlDataAdapter escritura = new SqlDataAdapter();
                cmd = new SqlCommand(sql, cnn);
                escritura.InsertCommand = new SqlCommand(sql, cnn);
                escritura.InsertCommand.ExecuteNonQuery();
                cmd.Dispose();
            }
            catch (Exception) {

            }
            desconectar();
        }
        void borrarDatos() {
            cmd = new SqlCommand(sql, cnn);
            conectar();
            try {
                SqlDataAdapter escritura = new SqlDataAdapter();
                cmd = new SqlCommand(sql, cnn);
                escritura.DeleteCommand = new SqlCommand(sql, cnn);
                escritura.DeleteCommand.ExecuteNonQuery();
                cmd.Dispose();
            }
            catch (Exception) {

            }
            desconectar();
        }
        void conectar() {
            cnn.Open();
        }
        void desconectar() {
            cnn.Close();
        }
        public Boolean existenDatos() {
            if (datos.Rows.Count != 0) {
                return true;
            }
            else {
                return false;
            }
        }
        public void login() {
            sql = "select * from usuario inner join empresa on user_fk_empre=id_empre";
            cargaDatos();
        }
        public void cargarModulos() {
            sql = "select * from modulo";
            cargaDatos();
        }
        public void agregarModulo(string nombre, string abreviatura, string descripcion, string defaultMod) {
            sql = "insert into modulo(nombre_mod, abreviatura_mod, descripcion_mod, default_mod) values( " + "'" + nombre + "'," + "'" + abreviatura + "'," + "'" + descripcion + "'," + "'" + defaultMod + "'" + ")";
            enviarDatos();
        }
        public void modificarModulo(string nombre, string abreviatura, string descripcion, string defaultMod) {
            sql = "update modulo set nombre_mod =" + "'" + nombre + "',abreviatura_mod =" + "'" + abreviatura + "',descripcion_mod = " + "'" + descripcion + "',default_mod =" + "'" + defaultMod + "' where nombre_mod = " + "'" + nombre + "'";
            enviarDatos();
        }
        public void eliminarModulo(string nombre) {
            sql = "delete from modulo where nombre_mod =" + "'" + nombre + "'";
            borrarDatos();
        }
        public void cargarPrecios() {
            sql = "select * from precio";
            cargaDatos();
        }
        public void agregarPrecio(string rango, string mes, string año) {
            sql = "insert into precio(rango, mensual_pre, anual_pre) values( " + "'" + rango + "'," + "'" + mes + "'," + "'" + año + "'" + ") ";
            enviarDatos();
        }
        public void eliminarPrecio(string rango) {
            sql = "delete from precio where rango = '" + rango + "'";
            borrarDatos();
        }
        public void cargarEmpresas() {
            sql = "select * from empresa";
            cargaDatos();
        }
        public void joinEmpresaTarjeta() {
            sql = "select * from empresa inner join tarjeta on id_empre = tar_fk_empre";
            cargaDatos();
        }
        public void cargarTarjetasDeEmpresa(string id_empre) {
            sql = "select * from tarjeta where tar_fk_empre = '" + id_empre + "'";
            cargaDatos();
        }
        public void cargarModulosDeEmpresa(string id_empre) {
            sql = "select * from modulo inner join tienda_modulo on id_mod = shop_fk_mod where shop_fk_empre = '" + id_empre + "'";
            cargaDatos();
        }
        public void eliminarModuloDeEmpresa(string id_modulo, string id_empre) {
            sql = "delete tienda_modulo where shop_fk_empre= '" + id_empre + "' and  shop_fk_mod = ' " + id_modulo + " ' ";
            borrarDatos();
        }
        public void agregarModuloDeEmpresa(string id_modulo, string id_empre) {
            sql = "";
        }
        public void joinEmpresaEmpleados() {
            sql = "select * from empresa inner join empleado on id_empre = emple_fk_empre";
            cargaDatos();
        }
        public void agregarEmpresa(string nombreE, string nitE, string tipoE, string tamañoE) {
            sql = "insert into empresa (nombre_empre,nit_empre,tipo_empre,tamaño_empre) values (" + "'" + nombreE + "'," + "'" + nitE + "'," + "'" + tipoE + "'," + "'" + tamañoE + "'" + ")";
            enviarDatos();
        }
        public void agregarTarjeta(string tar_fk_empre, string numT, string nombreT, string mesT, string añoT, string tipoT, string cvrT, string suscripcion_tar) {
            sql = "insert into tarjeta (tar_fk_empre,num_tar,nombre_tar,mes_tar,año_tar,tipo_tar,crv_tar,vigencia,suscripcion_tar) values (" + "'" + tar_fk_empre + "'," + "'" + numT + "'," + "'" + nombreT + "'," + "'" + mesT + "'," + "'" + añoT + "'," + "'" + tipoT + "'," + "'" + cvrT + "', 'Si' , '" + suscripcion_tar + "' )";
            enviarDatos();
        }
        public void cargarTarjetas() {
            sql = "select * from tarjeta";
            cargaDatos();
        }
        public void modificarEmpresa(string id_empre, string nombreE, string nitE, string tipoE, string tamañoE) {
            sql = "update empresa set nombre_empre = '" + nombreE + "', nit_empre= '" + nitE + "',tipo_empre= '" + tipoE + "',tamaño_empre = '" + tamañoE + "' where id_empre = '" + id_empre + "'";
            enviarDatos();
        }
        public void modificarTarjeta(string tar_fk_empre, string numT, string nombreT, string mesT, string añoT, string tipoT, string cvrT, string suscripcion_tar) {
            sql = "update tarjeta set vigencia = 'No' where tar_fk_empre = " + "'" + tar_fk_empre + "' and vigencia = 'Si'";
            enviarDatos();
            sql = "insert into tarjeta (tar_fk_empre,num_tar,nombre_tar,mes_tar,año_tar,tipo_tar,crv_tar,vigencia,suscripcion_tar) values (" + "'" + tar_fk_empre + "'," + "'" + numT + "'," + "'" + nombreT + "'," + "'" + mesT + "'," + "'" + añoT + "'," + "'" + tipoT + "'," + "'" + cvrT + "', 'Si' ,+ '" + suscripcion_tar + "' )";
            enviarDatos();
        }
        public void eliminarTarjetas(string id_empre) {
            sql = "delete from tarjeta where tar_fk_empre = '" + id_empre + "'";
            borrarDatos();
        }
        public void eliminarEmpresa(string nombre_empre) {
            sql = "delete from empresa where nombre_empre = '" + nombre_empre + "'";
            borrarDatos();
        }
        public void cargarUsuarios() {
            sql = "select * from usuario";
            cargaDatos();
        }
        public void agregarEmpleado(string codigoEmpresa, string nombre, string correo, string puesto, string celular) {
            sql = "insert into empleado (emple_fk_empre, nombre_emple, correo_emple, puesto_emple, celular_emple) values (" + "'" + codigoEmpresa + "'," + "'" + nombre + "'," + "'" + correo + "'," + "'" + puesto + "'," + "'" + celular + "'" + ")";
            enviarDatos();
        }
        public void eliminarEmpleado(string emple_fk_empre) {
            sql = "delete from empleado where emple_fk_empre = '" + emple_fk_empre + "'";
            borrarDatos();
        }
        public void agregarUsuario(string codigoEmpre, string codigoEmple, string user, string pass, string tipo_user) {
            sql = "insert into usuario (user_fk_empre, user_fk_emple,nick,pass,tipo) values (" + "'" + codigoEmpre + "'," + "'" + codigoEmple + "'," + "'" + user + "'," + "'" + pass + "'," + "'" + tipo_user + "'" + ")";
            enviarDatos();
        }
        public void cargarEmpleados() {
            sql = "select * from empleado";
            cargaDatos();
        }
        public void joinUsuariosEmpresa() {
            sql = "select * from usuario inner join empresa on user_fk_empre = id_empre";
            cargaDatos();
        }
        public void joinUsuariosEmpleado() {
            sql = "select * from usuario inner join empleado on user_fk_emple = id_emple";
            cargaDatos();
        }
        public void modificarEmpleado(string codigoEmple, string codigoEmpresa, string nombre, string correo, string puesto, string celular) {
            sql = "update empleado set emple_fk_empre = " + "'" + codigoEmpresa + "'" + ", nombre_emple = " + "'" + nombre + "'" + ",correo_emple = " + "'" + correo + "'" + ",puesto_emple= " + "'" + puesto + "'" + ",celular_emple = '" + celular + "'" + "where id_emple = '" + codigoEmple + "'";
            enviarDatos();
        }
        public void modificarUsuario(string codigoUsuario, string codigoEmpre, string codigoEmple, string user, string pass) {
            sql = "update usuario set user_fk_empre = ' " + codigoEmpre + " ' ,user_fk_emple = ' " + codigoEmple + " ',nick = ' " + user + " ',pass = ' " + pass + " ' where id_user = '" + codigoUsuario + "'";
            enviarDatos();
        }
        public void eliminarUsuario(string user) {
            sql = "delete from usuario where nick = '" + user + "'";
            borrarDatos();
        }

        //Fase 3

        public void cargaBodegas() {
            sql = "select * from bodega";
            cargaDatos();
        }
        public void cargaPasillos() {
            sql = "select * from pasillo";
            cargaDatos();
        }
        public void cargaEstantes() {
            sql = "select * from estante";
            cargaDatos();
        }
        public void cargaNiveles() {
            sql = "select * from nivel";
            cargaDatos();
        }
        public void agregarBodega(string nombre_bode, string descripcion_bode, string direccion_bode) {
            sql = "insert into bodega (bode_fk_empre,nombre_bode,descripcion_bode,direccion_bode) values (" + "'" + Models.userActual.id_empreActual + "'," + "'" + nombre_bode + "'," + "'" + descripcion_bode + "'," + "'" + direccion_bode + "'" + ")";
            enviarDatos();
        }
        public void agregarPasillo(string pasi_fk_bode, string ancho_pasi, string largo_pasi) {
            sql = "insert into pasillo (pasi_fk_bode,ancho_pasi,largo_pasi) values (" + "'" + pasi_fk_bode + "'," + "'" + ancho_pasi + "'," + "'" + largo_pasi + "'" + ")";
            enviarDatos();
        }
        public void agregarEstante(string estan_fk_pasi, string letra_estan, string largo_estan, string ancho_estan, string altura_estan) {
            sql = "insert into estante(estan_fk_pasi,letra_estan,largo_estan,ancho_estan,altura_estan) values (" + "'" + estan_fk_pasi + "'," + "'" + letra_estan + "'," + "'" + largo_estan + "'," + "'" + ancho_estan + "'," + "'" + altura_estan + "'" + ")";
            enviarDatos();
        }
        public void agregarNivel(string nivel_fk_estan, string altura_nivel) {
            sql = "insert into nivel(nivel_fk_estan,altura_nivel) values (" + "'" + nivel_fk_estan + "'," + "'" + altura_nivel + "'" + ")";
            enviarDatos();
        }
        public void eliminarBodega(string id_bode) {
            sql = "delete from bodega where id_bode =  '" + id_bode + "'";
            borrarDatos();
        }
        public void eliminarPasillo(string id_pasi) {
            sql = "delete from pasillo where id_pasi  =  '" + id_pasi + "'";
            borrarDatos();
        }
        public void eliminarEstante(string id_estan) {
            sql = "delete from estante where id_estan  =  '" + id_estan + "'";
            borrarDatos();
        }
        public void eliminarNivel(string id_nivel) {
            sql = "delete from nivel where id_nivel  =  '" + id_nivel + "'";
            borrarDatos();
        }
        public void modificarBodega(string id_bode, string nombre_bode, string descripcion_bode, string direccion_bode) {
            sql = "update bodega set nombre_bode = ' " + nombre_bode + " ' ,descripcion_bode = ' " + descripcion_bode + " ',direccion_bode = ' " + direccion_bode + "'" + " where id_bode = '" + id_bode + "'";
            enviarDatos();
        }
        public void modificarPasillo(string id_pasi, string ancho_pasi, string largo_pasi) {
            sql = "update pasillo set ancho_pasi = ' " + ancho_pasi + " ',largo_pasi = ' " + largo_pasi + "'" + " where id_pasi = '" + id_pasi + "'";
            enviarDatos();
        }
        public void modificarEstante(string id_estan, string letra_estan, string largo_estan, string ancho_estan, string altura_estan) {
            sql = "update estante set letra_estan = '" + letra_estan + "',largo_estan = '" + largo_estan + "',ancho_estan ='" + ancho_estan + "',altura_estan = '" + altura_estan + "' where id_estan = '" + id_estan + "'";
            enviarDatos();
        }
        public void modificarNivel(string id_nivel, string altura_nivel) {
            sql = "update nivel set altura_nivel = ' " + altura_nivel + "'" + " where id_nivel = '" + id_nivel + "'";
            enviarDatos();
        }
        public void cargaProductos() {
            sql = "select * from producto";
            cargaDatos();
        }
        public void cargaProductosDeEmpresa(string id_empre) {
            sql = "select * from producto inner join empresa on id_empre = prod_fk_empre where id_empre = '" + id_empre + "'";
            cargaDatos();
        }
        public void cargaBodegasDeEmpresa(string id_empre) {
            sql = "select * from bodega inner join empresa on id_empre = bode_fk_empre where id_empre =  '" + id_empre + "'";
            cargaDatos();
        }
        public void cargaSaldosDeEmpresa(string id_empre) {
            sql = "select * from ubicacion inner join producto on ubica_fk_prod = id_prod where prod_fk_empre =  '" + id_empre + "'";
            cargaDatos();
        }
        public void cargaLotesDeEmpresa(string id_empre) {
            sql = "select * from lote_nivel inner join producto on lote_nivel_fk_prod = id_prod where prod_fk_empre =  '" + id_empre + "'";
            cargaDatos();
        }
        public void agregarSaldos(string ubica_fk_nivel, string ubica_fk_prod, string ubica_fk_bode, string cantidad_prod) {
            sql = "insert into ubicacion (ubica_fk_nivel,ubica_fk_prod,ubica_fk_bode,cantidad_prod) values (" + "'" + ubica_fk_nivel + "'," + "'" + ubica_fk_prod + "'," + "'" + ubica_fk_bode + "'," + "'" + cantidad_prod + "'" + ")";
            enviarDatos();
        }
        public void agregarLotes(string lote_nivel_fk_nivel, string lote_nivel_fk_prod, string lote_nivel_fk_bod, string cantidad_prod, string logica) {
            sql = "insert into lote_nivel (lote_nivel_fk_nivel,lote_nivel_fk_prod,lote_nivel_fk_bod,cantidad_prod,logica) values (" + "'" + lote_nivel_fk_nivel + "'," + "'" + lote_nivel_fk_prod + "'," + "'" + lote_nivel_fk_bod + "'," + "'" + cantidad_prod + "'," + "'" + logica + "'" + ")";
            enviarDatos();
        }
        public void modificarSaldos(string ubica_fk_nivel, string ubica_fk_prod, string ubica_fk_bode, string cantidad_prod) {
            sql = "update ubicacion set ubica_fk_nivel = ' " + ubica_fk_nivel + " ',ubica_fk_bode = ' " + ubica_fk_bode + " ',cantidad_prod = ' " + cantidad_prod + "' where ubica_fk_prod = '" + ubica_fk_prod + "'";
            enviarDatos();
        }
        public void modificarSaldosSalida(string ubica_fk_nivel, string ubica_fk_prod, string ubica_fk_bode, string cantidad_prod) {
            sql = "update ubicacion set ubica_fk_nivel = ' " + ubica_fk_nivel + " ',ubica_fk_bode = ' " + ubica_fk_bode + " ',cantidad_prod = cantidad_prod -' " + cantidad_prod + "' where ubica_fk_prod = '" + ubica_fk_prod + "'";
            enviarDatos();
        }
        public void modificarLotes(string lote_nivel_fk_nivel, string lote_nivel_fk_prod, string lote_nivel_fk_bod, string cantidad_prod, string logica) {
            sql = "update lote_nivel set lote_nivel_fk_nivel = '" + lote_nivel_fk_nivel + "',lote_nivel_fk_bod = '" + lote_nivel_fk_bod + "', cantidad_prod = '" + cantidad_prod + "', logica = '" + logica + "' where lote_nivel_fk_prod = '" + lote_nivel_fk_prod + "'";
            enviarDatos();
        }
        public void modificarLotesSalida(string lote_nivel_fk_nivel, string lote_nivel_fk_prod, string lote_nivel_fk_bod, string cantidad_prod, string logica) {
            sql = "update lote_nivel set lote_nivel_fk_nivel = '" + lote_nivel_fk_nivel + "',lote_nivel_fk_bod = '" + lote_nivel_fk_bod + "', cantidad_prod =cantidad_prod - '" + cantidad_prod + "', logica = '" + logica + "' where lote_nivel_fk_prod = '" + lote_nivel_fk_prod + "'";
            enviarDatos();
        }
        public void eliminarSaldos(string ubica_fk_prod) {
            sql = "delete from ubicacion where ubica_fk_prod = '" + ubica_fk_prod + "'";
            borrarDatos();
        }
        public void eliminarLotes(string lote_nivel_fk_prod) {
            sql = "delete from lote_nivel where lote_nivel_fk_prod = '" + lote_nivel_fk_prod + "'";
            borrarDatos();
        }
        public void cargaProveedores() {
            sql = "select * from proveedor";
            cargaDatos();
        }
        public void cargaClientes() {
            sql = "select * from cliente";
            cargaDatos();
        }
        public void cargaLotesParaReportes() {
            sql = "select lote_nivel_fk_prod from lote_nivel group by lote_nivel_fk_prod";
            cargaDatos();
        }
        public void agregarFacturaProveedor(string fac_cp_fk_user, string fac_pp_fk_prov, string fac_pp_fk_prod, string cantidad_prod, string fecha_fac) {
            sql = "insert into factura_proveedor_producto (fac_cp_fk_user,fac_pp_fk_prov,fac_pp_fk_prod,cantidad_prod,fecha_fac) values ('" + fac_cp_fk_user + "','" + fac_pp_fk_prov + "','" + fac_pp_fk_prod + "','" + cantidad_prod + "','" + fecha_fac + "')";
            enviarDatos();
        }
        public void agregarFacturaCliente(string fac_cp_fk_user, string fac_cp_fk_cli, string fac_cp_fk_prod, string cantidad_prod) {
            sql = "insert into factura_cliente_producto (fac_cp_fk_user,fac_cp_fk_cli,fac_cp_fk_prod,cantidad_prod) values ('" + fac_cp_fk_user + "','" + fac_cp_fk_cli + "','" + fac_cp_fk_prod + "','" + cantidad_prod + "')";
            enviarDatos();
        }
        public void cargaSalidasdeEmpresa(string user_fk_empre) {
            sql = "select * from factura_cliente_producto inner join usuario on fac_cp_fk_user = id_user where user_fk_empre = '" + user_fk_empre + "'";
            cargaDatos();
        }
        public void cargaEntradasdeEmpresa(string user_fk_empre) {
            sql = "select * from factura_proveedor_producto inner join usuario on fac_cp_fk_user = id_user where user_fk_empre = '" + user_fk_empre + "'";
            cargaDatos();
        }
        public void pdfSaldos(string id_bodega) {
            sql = "select nombre_prod as 'Nombre Producto',id_bode as 'Bodega',nombre_bode as 'Nombre Bodega' ,id_pasi as 'Pasillo',id_estan as 'Estante',id_nivel as 'Nivel',cantidad_prod as 'Cantidad' from bodega inner join ubicacion on ubica_fk_bode = id_bode inner join producto on ubica_fk_prod = id_prod inner join pasillo on pasi_fk_bode = id_bode inner join estante on estan_fk_pasi = id_pasi inner join nivel on nivel_fk_estan = id_estan where id_bode = '" + id_bodega + "' order by nombre_prod";
            cargaDatos();
            Document doc = new Document(PageSize.LETTER);
            string ruta = "C:\\PruebasGenerales\\Saldos.pdf";
            if (File.Exists(ruta)) {
                File.Delete(ruta);
            }
            // Indicamos donde vamos a guardar el documento
            PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(ruta, FileMode.Create));
            doc.AddTitle("Saldos");

            // Abrimos el archivo
            doc.Open();

            PdfPTable table = new PdfPTable(datos.Columns.Count);
            table.WidthPercentage = 100;

            //Set columns names in the pdf file
            for (int k = 0; k < datos.Columns.Count; k++) {
                PdfPCell cell = new PdfPCell(new Phrase(datos.Columns[k].ColumnName));

                cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                cell.BackgroundColor = new iTextSharp.text.BaseColor(51, 102, 102);

                table.AddCell(cell);
            }
            //Add values of DataTable in pdf file
            for (int i = 0; i < datos.Rows.Count; i++) {
                for (int j = 0; j < datos.Columns.Count; j++) {
                    PdfPCell cell = new PdfPCell(new Phrase(datos.Rows[i][j].ToString()));

                    //Align the cell in the center
                    cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                    cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;

                    table.AddCell(cell);
                }
            }

            doc.Add(table);
            doc.Close();
            writer.Close();

            Process start = new Process();
            start.StartInfo.FileName = ruta;
            start.Start();


        }
        public void pdfLotes(string id_prod) {
            sql = "select nombre_prod as 'Nombre Producto',id_bode as 'Bodega',nombre_bode as 'Nombre Bodega',id_pasi as 'Pasillo',id_estan as 'Estante',id_nivel as 'Nivel',cantidad_prod as 'Cantidad',logica as 'Logica' from bodega inner join lote_nivel on lote_nivel_fk_bod = id_bode inner join producto on lote_nivel_fk_prod = id_prod inner join pasillo on pasi_fk_bode = id_bode inner join estante on estan_fk_pasi = id_pasi inner join nivel on nivel_fk_estan = id_estan where id_prod = '" + id_prod + "' order by nombre_prod, logica asc";
            cargaDatos();
            Document doc = new Document(PageSize.LETTER);
            string ruta = "C:\\PruebasGenerales\\Lotes.pdf";
            if (File.Exists(ruta)) {
                File.Delete(ruta);
            }
            // Indicamos donde vamos a guardar el documento
            PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(ruta, FileMode.Create));
            doc.AddTitle("Lotes");

            // Abrimos el archivo
            doc.Open();

            PdfPTable table = new PdfPTable(datos.Columns.Count);
            table.WidthPercentage = 100;

            //Set columns names in the pdf file
            for (int k = 0; k < datos.Columns.Count; k++) {
                PdfPCell cell = new PdfPCell(new Phrase(datos.Columns[k].ColumnName));

                cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                cell.BackgroundColor = new iTextSharp.text.BaseColor(51, 102, 102);

                table.AddCell(cell);
            }
            //Add values of DataTable in pdf file
            for (int i = 0; i < datos.Rows.Count; i++) {
                for (int j = 0; j < datos.Columns.Count; j++) {
                    PdfPCell cell = new PdfPCell(new Phrase(datos.Rows[i][j].ToString()));

                    //Align the cell in the center
                    cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                    cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;

                    table.AddCell(cell);
                }
            }

            doc.Add(table);
            doc.Close();
            writer.Close();

            Process start = new Process();
            start.StartInfo.FileName = ruta;
            start.Start();


        }


    }
}