using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_1S2020.Paginas.AH {
    public partial class Formulario_web1 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();

            }
        }
        void primeraCarga() {
            con.cargarModulos();
            if (con.existenDatos()) {
                tablaModulos.DataSource = con.datos.Copy();
                tablaModulos.DataBind();
                mListaModulos.Items.Clear();
                eListaModulos.Items.Clear();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    mListaModulos.Items.Add(con.datos.Rows[i][1].ToString());
                    eListaModulos.Items.Add(con.datos.Rows[i][1].ToString());
                }
            }
            con.cargarPrecios();
            if (con.existenDatos()) {
                tablaPrecios.DataSource = con.datos.Copy();
                tablaPrecios.DataBind();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    dRangoEliminar.Items.Add(con.datos.Rows[i][1].ToString());
                }
            }
            limpiar();

        }
        void limpiar() {
            cNombre.Text = "";
            cAbreviatura.Text = "";
            cDescrip.Value = "";
            cDefault.SelectedValue = "No";
            mNombre.Text = "";
            mAbreviatura.Text = "";
            mDescripcion.Value = "";
            mDefault.SelectedValue = "No";
            tPrecioMensual.Text = "";
            tPrecioAnual.Text = "";
        }
        protected void btnActualizarModulos_Click(object sender, EventArgs e) {
            primeraCarga();
        }
        protected void Button4_Click(object sender, EventArgs e) {
            if (cNombre.Text.Length == 0 || cAbreviatura.Text.Length == 0 || cDescrip.Value.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }
            else {
                con.agregarModulo(cNombre.Text, cAbreviatura.Text, cDescrip.Value, cDefault.SelectedValue);
                primeraCarga();
            }
        }
        protected void btnModificarModulo_Click(object sender, EventArgs e) {
            if (mListaModulos.Items.Count != 0) {
                if (mNombre.Text.Length == 0 || mAbreviatura.Text.Length == 0 || mDescripcion.Value.Length == 0) {
                    Response.Write("<script>alert('Campos Vacios')</script>");
                }
                else {
                    con.modificarModulo(mNombre.Text, mAbreviatura.Text, mDescripcion.Value, mDefault.SelectedValue);
                    primeraCarga();
                }
            }

        }
        protected void cargarModificarModulo_Click(object sender, EventArgs e) {
            if (mListaModulos.Items.Count != 0) {
                con.cargarModulos();
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (mListaModulos.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                            mNombre.Text = con.datos.Rows[i][1].ToString();
                            mAbreviatura.Text = con.datos.Rows[i][2].ToString();
                            mDescripcion.Value = con.datos.Rows[i][3].ToString();
                            mDefault.SelectedValue = con.datos.Rows[i][4].ToString();
                        }
                    }
                }
            }

        }
        protected void btnEliminarModulo_Click(object sender, EventArgs e) {
            if (eListaModulos.Items.Count != 0) {
                con.eliminarModulo(eListaModulos.SelectedValue);
                primeraCarga();
            }
        }
        protected void btnDefinirPrecio_Click(object sender, EventArgs e) {

            if (tPrecioMensual.Text.Length == 0 || tPrecioAnual.Text.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }
            else {
                con.cargarPrecios();
                Boolean borrarPrecio = false;
                if (con.datos.Rows.Count != 0) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][1].ToString().Equals(dRangoAgregar.SelectedValue)) {
                            dRangoAgregar.Items.Remove(dRangoAgregar.SelectedValue);
                            borrarPrecio = true;
                            Response.Write("<script>alert('Este Rango Ya Existe')</script>");
                        }
                    }
                    if (borrarPrecio == false) {
                        con.agregarPrecio(dRangoAgregar.SelectedValue, tPrecioMensual.Text, tPrecioAnual.Text);
                        primeraCarga();
                    }
                }
                else {
                    con.agregarPrecio(dRangoAgregar.SelectedValue, tPrecioMensual.Text, tPrecioAnual.Text);
                    dRangoAgregar.Items.Remove(dRangoAgregar.SelectedValue);
                    primeraCarga();
                }
            }


        }
        protected void btnDefinirPrecio0_Click(object sender, EventArgs e) {
            if (dRangoEliminar.Items.Count != 0) {
                con.eliminarPrecio(dRangoEliminar.SelectedValue);
                primeraCarga();
            }
        }
    }
}