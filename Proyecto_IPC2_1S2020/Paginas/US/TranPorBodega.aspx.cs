using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_1S2020.Paginas.US {
    public partial class Formulario_web13 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();
            }
        }
        void primeraCarga() {
            for (int i = 10; i < 32; i++) {
                cDia.Items.Add(i.ToString());
                eDia.Items.Add(i.ToString());
            }
            for (int i = 10; i < 13; i++) {
                cMes.Items.Add(i.ToString());
                eMes.Items.Add(i.ToString());
            }
            for (int i = 2010; i < 2021; i++) {
                cAño.Items.Add(i.ToString());
                eAño.Items.Add(i.ToString());
            }
            con.cargaProveedores();
            tablaProveedores.DataSource = con.datos.Copy();
            tablaProveedores.DataBind();
            cListaProveedores.Items.Clear();
            for (int i = 0; i < con.datos.Rows.Count; i++) {
                cListaProveedores.Items.Add(con.datos.Rows[i][0].ToString());
            }
            con.cargaClientes();
            tablaClientes.DataSource = con.datos.Copy();
            tablaClientes.DataBind();
            eListaClientes.Items.Clear();
            for (int i = 0; i < con.datos.Rows.Count; i++) {
                eListaClientes.Items.Add(con.datos.Rows[i][0].ToString());
            }
            con.cargaBodegasDeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                cListaBodega.Items.Clear();
                cListaBodega.Items.Add("");
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    cListaBodega.Items.Add(con.datos.Rows[i][0].ToString());
                }
            }
            con.cargaProductosDeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                tablaProductos.DataSource = con.datos.Copy();
                tablaProductos.DataBind();
                cListaProducto.Items.Clear();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    cListaProducto.Items.Add(con.datos.Rows[i][0].ToString());
                }
            }
            con.cargaSaldosDeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                tablaSaldos.DataSource = con.datos.Copy();
                tablaSaldos.DataBind();
            }
            con.cargaLotesDeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                tablaLotes.DataSource = con.datos.Copy();
                tablaLotes.DataBind();
            }
            con.cargaSalidasdeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                tablaSalidas.DataSource = con.datos.Copy();
                tablaSalidas.DataBind();
            }
            con.cargaEntradasdeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                tablaEntradas.DataSource = con.datos.Copy();
                tablaEntradas.DataBind();
            }
            limpiar();

        }
        void limpiar() {
            cCantidad.Text = "";
            eCantidad.Items.Clear();
            cListaPasillo.Items.Clear();
            cListaEstante.Items.Clear();
            cListaNivel.Items.Clear();
            eListaNivel.Items.Clear();
            eListaProducto.Items.Clear();
        }

        protected void cTipo_SelectedIndexChanged(object sender, EventArgs e) {
            if (cTipo.SelectedValue.Equals("Saldos")) {
                cLogica.Enabled = false;
            }
            else {
                cLogica.Enabled = true;
            }
        }

        protected void eTipo_SelectedIndexChanged(object sender, EventArgs e) {
            eListaProducto.Items.Clear();
            eListaProducto.Items.Add("");
            if (eTipo.SelectedValue.Equals("Saldos")) {
                eLogica.Enabled = false;
                con.cargaSaldosDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        eListaProducto.Items.Add(con.datos.Rows[i][5].ToString());
                    }
                }
            }
            else {
                eLogica.Enabled = true;
                con.cargaLotesDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        eListaProducto.Items.Add(con.datos.Rows[i][6].ToString());
                    }
                }
            }
        }

        protected void cDia_SelectedIndexChanged(object sender, EventArgs e) {

        }

        protected void btnCrearEntrada_Click(object sender, EventArgs e) {
            if (cTipo.SelectedIndex < 0) {
                Response.Write("<script>alert('Tipo No Seleccionado')</script>");
            }
            else if (cTipo.SelectedValue.Equals("Saldos")) {
                if (cCantidad.Text.Length == 0 || cCosto.Text.Length == 0 || cListaBodega.SelectedValue.Equals("") || cListaPasillo.SelectedValue.Equals("") || cListaEstante.SelectedValue.Equals("") || cListaNivel.SelectedValue.Equals("")) {
                    Response.Write("<script>alert('Campos Vacios')</script>");
                }
                else {
                    string fecha_farctura = cAño.SelectedValue + "-" + cMes.SelectedValue + "-" + cDia.SelectedValue;
                    con.agregarSaldos(cListaNivel.SelectedValue, cListaProducto.SelectedValue, cListaBodega.SelectedValue, cCantidad.Text);
                    con.agregarFacturaProveedor(Models.userActual.id_usuarioActual, cListaProveedores.SelectedValue, cListaProducto.SelectedValue, cCantidad.Text, fecha_farctura);
                    primeraCarga();
                }

            }
            else if (cTipo.SelectedValue.Equals("Lotes")) {
                if (cCantidad.Text.Length == 0 || cCosto.Text.Length == 0 || cListaBodega.SelectedValue.Equals("") || cListaPasillo.SelectedValue.Equals("") || cListaEstante.SelectedValue.Equals("") || cListaNivel.SelectedValue.Equals("")) {
                    Response.Write("<script>alert('Campos Vacios')</script>");
                }
                else {
                    string fecha_farctura = cAño.SelectedValue + "-" + cMes.SelectedValue + "-" + cDia.SelectedValue;
                    con.agregarLotes(cListaNivel.SelectedValue, cListaProducto.SelectedValue, cListaBodega.SelectedValue, cCantidad.Text, cLogica.SelectedValue);
                    con.agregarFacturaProveedor(Models.userActual.id_usuarioActual, cListaProveedores.SelectedValue, cListaProducto.SelectedValue, cCantidad.Text, fecha_farctura);
                    primeraCarga();
                }
            }
        }

        protected void btnCrearSalida_Click(object sender, EventArgs e) {
            if (eTipo.SelectedIndex < 0) {
                Response.Write("<script>alert('Tipo No Seleccionado')</script>");
            }
            else if (eTipo.SelectedValue.Equals("Saldos")) {
                if (eListaProducto.Items.Count == 0 || eCantidad.Items.Count == 0 || eListaBodega.SelectedValue.Equals("") || eListaNivel.SelectedValue.Equals("")) {
                    Response.Write("<script>alert('Campos Vacios')</script>");
                }
                else {
                    con.modificarSaldosSalida(eListaNivel.SelectedValue, eListaProducto.SelectedValue, eListaBodega.SelectedValue, eCantidad.SelectedValue);
                    con.agregarFacturaCliente(Models.userActual.id_usuarioActual, eListaClientes.SelectedValue, eListaProducto.SelectedValue, eCantidad.SelectedValue);
                    primeraCarga();
                }

            }
            else if (eTipo.SelectedValue.Equals("Lotes")) {
                if (eListaProducto.Items.Count == 0 || eCantidad.Items.Count == 0 || eListaBodega.SelectedValue.Equals("") || eListaNivel.SelectedValue.Equals("")) {
                    Response.Write("<script>alert('Campos Vacios')</script>");
                }
                else {
                    con.modificarLotesSalida(eListaNivel.SelectedValue, eListaProducto.SelectedValue, eListaBodega.SelectedValue, eCantidad.SelectedValue, eLogica.SelectedValue);
                    con.agregarFacturaCliente(Models.userActual.id_usuarioActual, eListaClientes.SelectedValue, eListaProducto.SelectedValue, eCantidad.SelectedValue);
                    primeraCarga();
                }
            }
        }

        protected void cListaBodega_SelectedIndexChanged(object sender, EventArgs e) {
            cListaPasillo.Items.Clear();
            cListaPasillo.Items.Add("");
            con.cargaPasillos();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (cListaBodega.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                        cListaPasillo.Items.Add(con.datos.Rows[i][0].ToString());
                    }
                }
            }
        }

        protected void cListaPasillo_SelectedIndexChanged(object sender, EventArgs e) {
            cListaEstante.Items.Clear();
            cListaEstante.Items.Add("");
            con.cargaEstantes();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (cListaPasillo.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                        cListaEstante.Items.Add(con.datos.Rows[i][0].ToString());
                    }
                }
            }
        }

        protected void cListaEstante_SelectedIndexChanged(object sender, EventArgs e) {
            cListaNivel.Items.Clear();
            cListaNivel.Items.Add("");
            con.cargaNiveles();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (cListaEstante.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                        cListaNivel.Items.Add(con.datos.Rows[i][0].ToString());
                    }
                }
            }
        }

        protected void eListaProducto_SelectedIndexChanged(object sender, EventArgs e) {
            if (eTipo.SelectedValue.Equals("Saldos")) {
                con.cargaSaldosDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    int cantidad = 0;
                    eListaBodega.Items.Clear();
                    eListaBodega.Items.Add("");
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (eListaProducto.SelectedValue.Equals(con.datos.Rows[i][5].ToString())) {
                            eListaBodega.Items.Add(con.datos.Rows[i][3].ToString());
                            cantidad = int.Parse(con.datos.Rows[i][4].ToString());
                            eCosto.Text = con.datos.Rows[i][8].ToString();
                        }
                    }
                    for (int i = 0; i <= cantidad; i++) {
                        eCantidad.Items.Add(i.ToString());
                    }
                }
            }
            else {
                con.cargaLotesDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    int cantidad = 0;
                    eListaBodega.Items.Clear();
                    eListaBodega.Items.Add("");
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (eListaProducto.SelectedValue.Equals(con.datos.Rows[i][6].ToString())) {
                            eListaBodega.Items.Add(con.datos.Rows[i][3].ToString());
                            cantidad = int.Parse(con.datos.Rows[i][4].ToString());
                            eCosto.Text = con.datos.Rows[i][9].ToString();
                            eLogica.SelectedValue = con.datos.Rows[i][5].ToString();
                        }
                    }
                    for (int i = 0; i <= cantidad; i++) {
                        eCantidad.Items.Add(i.ToString());
                    }
                }
            }
        }

        protected void eListaBodega_SelectedIndexChanged(object sender, EventArgs e) {
            eListaNivel.Items.Clear();
            eListaNivel.Items.Add("");
            if (eTipo.SelectedValue.Equals("Saldos")) {
                con.cargaSaldosDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][3].ToString().Equals(eListaBodega.SelectedValue)) {
                            eListaNivel.Items.Add(con.datos.Rows[i][1].ToString());
                        }
                    }
                }
            }
            else {
                con.cargaLotesDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][3].ToString().Equals(eListaBodega.SelectedValue)) {
                            eListaNivel.Items.Add(con.datos.Rows[i][1].ToString());
                        }
                    }
                }
            }
        }


    }
}