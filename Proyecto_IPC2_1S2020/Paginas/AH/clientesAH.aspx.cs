using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_1S2020.Paginas.AH {
    public partial class Formulario_web11 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();
            }

        }
        void primeraCarga() {
            con.cargarEmpresas();
            if (con.existenDatos()) {
                tablaEmpresas.DataSource = con.datos.Copy();
                tablaEmpresas.DataBind();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (!con.datos.Rows[i][1].Equals("Hello Word")) {
                        mSeleccionCliente.Items.Add(con.datos.Rows[i][1].ToString());
                        eSeleccionCliente.Items.Add(con.datos.Rows[i][1].ToString());
                    }
                }
            }
            con.cargarTarjetas();
            if (con.existenDatos()) {
                tablaTarjetas.DataSource = con.datos.Copy();
                tablaTarjetas.DataBind();
            }
            limpiar();
        }
        void limpiar() {
            cNitEmpresa.Text = "";
            cNombreEmpresa.Text = "";
            cTamañoEmpresa.Text = "";
            cTarjetaEmpresa.Text = "";
            cNombreTarjetaEmpresa.Text = "";
            cCvrTarjetaEmpresa.Text = "";
            mNitEmpresa.Text = "";
            mNombreEmpresa.Text = "";
            mTamañoEmpresa.Text = "";
            mTarjetaEmpresa.Text = "";
            mNombreTarjetaEmpresa.Text = "";
            mCvrTarjetaEmpresa.Text = "";
        }

        protected void btnCrearEmpresa_Click(object sender, EventArgs e) {
            if (cNitEmpresa.Text.Length == 0 || cNombreEmpresa.Text.Length == 0 || cTamañoEmpresa.Text.Length == 0 || cTarjetaEmpresa.Text.Length == 0 || cNombreTarjetaEmpresa.Text.Length == 0 || cCvrTarjetaEmpresa.Text.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }
            else {
                con.agregarEmpresa(cNombreEmpresa.Text, cNitEmpresa.Text, cTipoEmpresa.SelectedValue, cTamañoEmpresa.Text);
                con.cargarEmpresas();
                string codEmpresa = "";
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (con.datos.Rows[i][1].ToString().Equals(cNombreEmpresa.Text)) {
                        codEmpresa = con.datos.Rows[i][0].ToString();
                    }
                }
                con.agregarTarjeta(codEmpresa, cTarjetaEmpresa.Text, cNombreTarjetaEmpresa.Text, cMesTarjetaEmpresa.SelectedValue, cAñoTarjetaEmpresa.SelectedValue, cTipoTarjetaEmpresa.SelectedValue, cCvrTarjetaEmpresa.Text, cSuscripcion.SelectedValue);
                primeraCarga();
            }
        }
        protected void btnModificarEmpresa_Click(object sender, EventArgs e) {
            if (mSeleccionCliente.Items.Count != 0) {
                if (mNitEmpresa.Text.Length == 0 || mNombreEmpresa.Text.Length == 0 || mTamañoEmpresa.Text.Length == 0 || mTarjetaEmpresa.Text.Length == 0 || mNombreTarjetaEmpresa.Text.Length == 0 || mCvrTarjetaEmpresa.Text.Length == 0) {
                    Response.Write("<script>alert('Campos Vacios')</script>");
                }
                else {
                    con.joinEmpresaTarjeta();
                    string id_empre = "";
                    string id_tarjeta = "";
                    string tarjetaActual = "";
                    if (con.existenDatos()) {
                        for (int i = 0; i < con.datos.Rows.Count; i++) {
                            if (con.datos.Rows[i][1].ToString().Equals(mSeleccionCliente.SelectedValue) && con.datos.Rows[i][13].ToString().Equals("Si")) {
                                id_empre = con.datos.Rows[i][0].ToString();
                                id_tarjeta = con.datos.Rows[i][5].ToString();
                                tarjetaActual = con.datos.Rows[i][7].ToString();
                                if (con.datos.Rows[i][7].ToString().Equals(tarjetaActual)) {
                                    con.modificarTarjeta(id_empre, mTarjetaEmpresa.Text, mNombreTarjetaEmpresa.Text, mMesTarjetaEmpresa.SelectedValue, mAñoTarjetaEmpresa.SelectedValue, mTipoTarjetaEmpresa.SelectedValue, mCvrTarjetaEmpresa.Text, mSuscripcion.SelectedValue);
                                }
                            }
                        }
                        con.modificarEmpresa(id_empre, mNombreEmpresa.Text, mNitEmpresa.Text, mTipoEmpresa.SelectedValue, mTamañoEmpresa.Text);
                        primeraCarga();
                    }
                }
            }
        }
        protected void btnEliminarEmpresa_Click(object sender, EventArgs e) {
            if (eSeleccionCliente.Items.Count != 0) {
                con.joinEmpresaTarjeta();
                string id_empre = "";
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][1].ToString().Equals(eSeleccionCliente.SelectedValue)) {
                            id_empre = con.datos.Rows[i][0].ToString();
                            con.eliminarTarjetas(con.datos.Rows[i][0].ToString());
                        }
                    }
                }
                con.joinUsuariosEmpresa();
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][7].ToString().Equals(eSeleccionCliente.SelectedValue)) {
                            con.eliminarUsuario(con.datos.Rows[i][3].ToString());
                        }
                    }
                }
                con.joinEmpresaEmpleados();
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][1].ToString().Equals(eSeleccionCliente.SelectedValue)) {
                            id_empre = con.datos.Rows[i][0].ToString();
                            con.eliminarEmpleado(id_empre);
                        }
                    }
                }
                con.eliminarEmpresa(eSeleccionCliente.SelectedValue);
            }
        }
        protected void btnCargarDatosEmpresa_Click(object sender, EventArgs e) {
            if (mSeleccionCliente.Items.Count != 0) {
                con.joinEmpresaTarjeta();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (con.datos.Rows[i][1].ToString().Equals(mSeleccionCliente.SelectedValue)) {
                        mNitEmpresa.Text = con.datos.Rows[i][2].ToString();
                        mNombreEmpresa.Text = con.datos.Rows[i][1].ToString();
                        mTamañoEmpresa.Text = con.datos.Rows[i][4].ToString();
                        mTarjetaEmpresa.Text = con.datos.Rows[i][7].ToString();
                        mNombreTarjetaEmpresa.Text = con.datos.Rows[i][8].ToString();
                        mCvrTarjetaEmpresa.Text = con.datos.Rows[i][12].ToString();
                        mTipoEmpresa.SelectedValue = con.datos.Rows[i][11].ToString();
                        mMesTarjetaEmpresa.SelectedValue = con.datos.Rows[i][9].ToString();
                        mAñoTarjetaEmpresa.SelectedValue = con.datos.Rows[i][10].ToString();
                        mTipoTarjetaEmpresa.SelectedValue = con.datos.Rows[i][11].ToString();
                        mSuscripcion.SelectedValue = con.datos.Rows[i][14].ToString();
                    }
                }
            }

        }
    }
}