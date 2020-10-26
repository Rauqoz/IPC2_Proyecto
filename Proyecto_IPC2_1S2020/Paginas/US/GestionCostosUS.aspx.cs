using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_1S2020.Paginas.US {
    public partial class Formulario_web12 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();
            }
        }
        void primeraCarga() {
            con.cargaProductos();
            cListaProducto.Items.Clear();
            for (int i = 0; i < con.datos.Rows.Count; i++) {
                if (con.datos.Rows[i][1].ToString().Equals(Models.userActual.id_empreActual)) {
                    cListaProducto.Items.Add(con.datos.Rows[i][0].ToString());
                }
            }
            con.cargaProductosDeEmpresa(Models.userActual.id_empreActual);
            tablaProductos.DataSource = con.datos.Copy();
            tablaProductos.DataBind();
            con.cargaBodegasDeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                cListaBodega.Items.Clear();
                cListaBodega.Items.Add("");
                mListaBodega.Items.Clear();
                mListaBodega.Items.Add("");
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    cListaBodega.Items.Add(con.datos.Rows[i][0].ToString());
                    mListaBodega.Items.Add(con.datos.Rows[i][0].ToString());
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
            limpiar();
        }
        void limpiar() {
            cCantidad.Text = "";
            mCantidad.Text = "";
            cListaPasillo.Items.Clear();
            cListaEstante.Items.Clear();
            cListaNivel.Items.Clear();
            mListaPasillo.Items.Clear();
            mListaEstante.Items.Clear();
            mListaNivel.Items.Clear();
            mListaProducto.Items.Clear();
            eListaProducto.Items.Clear();
        }

        protected void cTipo_SelectedIndexChanged(object sender, EventArgs e) {
            if (cTipo.SelectedValue.Equals("Saldos")) {
                cListaLogica.Enabled = false;
                limpiar();
            }
            else {
                cListaLogica.Enabled = true;
                limpiar();
            }
        }

        protected void mTipo_SelectedIndexChanged(object sender, EventArgs e) {
            mListaProducto.Items.Clear();
            if (mTipo.SelectedValue.Equals("Saldos")) {
                mListaLogica.Enabled = false;
                limpiar();
                con.cargaSaldosDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        mListaProducto.Items.Add(con.datos.Rows[i][2].ToString());
                    }
                }

            }
            else {
                mListaLogica.Enabled = true;
                limpiar();
                con.cargaLotesDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        mListaProducto.Items.Add(con.datos.Rows[i][2].ToString());
                    }
                }
            }
        }

        protected void eTipo_SelectedIndexChanged(object sender, EventArgs e) {
            eListaProducto.Items.Clear();
            if (eTipo.SelectedValue.Equals("Saldos")) {
                limpiar();
                con.cargaSaldosDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        eListaProducto.Items.Add(con.datos.Rows[i][2].ToString());
                    }
                }

            }
            else {
                limpiar();
                con.cargaLotesDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        eListaProducto.Items.Add(con.datos.Rows[i][2].ToString());
                    }
                }
            }
        }

        protected void btnCrearSaldos_Click(object sender, EventArgs e) {
            if (cTipo.SelectedIndex < 0) {
                Response.Write("<script>alert('Tipo No Seleccionado')</script>");
            }
            else if (cTipo.SelectedValue.Equals("Saldos")) {
                if (cListaProducto.Items.Count == 0 || cListaBodega.SelectedValue.Equals("") || cListaPasillo.SelectedValue.Equals("") || cListaEstante.SelectedValue.Equals("") || cListaNivel.Items.Count == 0 || cCantidad.Text.Length == 0) {
                    Response.Write("<script>alert('Campos vacios')</script>");
                }
                else {
                    con.agregarSaldos(cListaNivel.SelectedValue, cListaProducto.SelectedValue, cListaBodega.SelectedValue, cCantidad.Text);
                    primeraCarga();
                }
            }
            else if (cTipo.SelectedValue.Equals("Lotes")) {
                if (cListaProducto.Items.Count == 0 || cListaBodega.SelectedValue.Equals("") || cListaPasillo.SelectedValue.Equals("") || cListaEstante.SelectedValue.Equals("") || cListaNivel.Items.Count == 0 || cCantidad.Text.Length == 0) {
                    Response.Write("<script>alert('Campos vacios')</script>");
                }
                else {
                    con.agregarLotes(cListaNivel.SelectedValue, cListaProducto.SelectedValue, cListaBodega.SelectedValue, cCantidad.Text, cListaLogica.SelectedValue);
                    primeraCarga();
                }
            }
        }

        protected void cListaBodegas_SelectedIndexChanged(object sender, EventArgs e) {
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

        protected void cListaPasillos_SelectedIndexChanged(object sender, EventArgs e) {
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

        protected void cListaEstantes_SelectedIndexChanged(object sender, EventArgs e) {
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

        protected void mListaBodegas_SelectedIndexChanged(object sender, EventArgs e) {
            mListaPasillo.Items.Clear();
            mListaPasillo.Items.Add("");
            con.cargaPasillos();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (mListaBodega.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                        mListaPasillo.Items.Add(con.datos.Rows[i][0].ToString());
                    }
                }
            }
        }

        protected void mListaPasillos_SelectedIndexChanged(object sender, EventArgs e) {
            mListaEstante.Items.Clear();
            mListaEstante.Items.Add("");
            con.cargaEstantes();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (mListaPasillo.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                        mListaEstante.Items.Add(con.datos.Rows[i][0].ToString());
                    }
                }
            }
        }

        protected void mListaEstantes_SelectedIndexChanged(object sender, EventArgs e) {
            mListaNivel.Items.Clear();
            mListaNivel.Items.Add("");
            con.cargaNiveles();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (mListaEstante.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                        mListaNivel.Items.Add(con.datos.Rows[i][0].ToString());
                    }
                }
            }
        }

        protected void mListaProductos_SelectedIndexChanged(object sender, EventArgs e) {

        }

        protected void cListaNivel_SelectedIndexChanged(object sender, EventArgs e) {

        }

        protected void btnModificarSaldo_Click(object sender, EventArgs e) {
            if (mTipo.SelectedIndex < 0) {
                Response.Write("<script>alert('Tipo No Seleccionado')</script>");
            }
            else if (mTipo.SelectedValue.Equals("Saldos")) {
                if (mListaProducto.Items.Count == 0 || mListaBodega.SelectedValue.Equals("") || mListaPasillo.SelectedValue.Equals("") || mListaEstante.SelectedValue.Equals("") || mListaNivel.Items.Count == 0 || mCantidad.Text.Length == 0) {
                    Response.Write("<script>alert('Campos vacios')</script>");
                }
                else {
                    con.modificarSaldos(mListaNivel.SelectedValue, mListaProducto.SelectedValue, mListaBodega.SelectedValue, mCantidad.Text);
                    primeraCarga();
                }
            }
            else if (mTipo.SelectedValue.Equals("Lotes")) {
                if (mListaProducto.Items.Count == 0 || mListaBodega.SelectedValue.Equals("") || mListaPasillo.SelectedValue.Equals("") || mListaEstante.SelectedValue.Equals("") || mListaNivel.Items.Count == 0 || mCantidad.Text.Length == 0) {
                    Response.Write("<script>alert('Campos vacios')</script>");
                }
                else {
                    con.modificarLotes(mListaNivel.SelectedValue, mListaProducto.SelectedValue, mListaBodega.SelectedValue, mCantidad.Text, mListaLogica.SelectedValue);
                    primeraCarga();
                }
            }
        }

        protected void btnEliminarSaldo_Click(object sender, EventArgs e) {
            if (eTipo.SelectedIndex < 0) {
                Response.Write("<script>alert('Tipo No Seleccionado')</script>");
            }
            else if (eTipo.SelectedValue.Equals("Saldos")) {
                if (eListaProducto.Items.Count == 0) {
                    Response.Write("<script>alert('Campos vacios')</script>");
                }
                else {
                    con.eliminarSaldos(eListaProducto.SelectedValue);
                    primeraCarga();
                }
            }
            else if (eTipo.SelectedValue.Equals("Lotes")) {
                if (eListaProducto.Items.Count == 0) {
                    Response.Write("<script>alert('Campos vacios')</script>");
                }
                else {
                    con.eliminarLotes(eListaProducto.SelectedValue);
                    primeraCarga();
                }
            }
        }
    }
}