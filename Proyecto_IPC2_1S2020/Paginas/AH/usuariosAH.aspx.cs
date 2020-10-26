using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_1S2020.Paginas.AH {
    public partial class Formulario_web12 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();
            }
        }
        void primeraCarga() {
            con.cargarUsuarios();
            if (con.existenDatos()) {
                tablaUsuarios.DataSource = con.datos.Copy();
                tablaUsuarios.DataBind();
            }
            con.cargarEmpresas();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (!con.datos.Rows[i][1].ToString().Equals("Hello Word")) {
                        cSeleccionarEmpresa.Items.Add(con.datos.Rows[i][1].ToString());
                    }
                }
            }
            con.joinUsuariosEmpresa();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (!con.datos.Rows[i][7].ToString().Equals("Hello Word")) {
                        mSeleccionarEmpresa.Items.Add(con.datos.Rows[i][7].ToString());
                        eSeleccionarEmpresa.Items.Add(con.datos.Rows[i][7].ToString());
                    }
                }
            }
            limpiar();
        }
        void limpiar() {
            cNombre.Text = "";
            cCorreo.Text = "";
            cPuesto.Text = "";
            cCelular.Text = "";
            cUsuario.Text = "";
            cContraseña.Text = "";
            mNombre.Text = "";
            mCorreo.Text = "";
            mPuesto.Text = "";
            mCelular.Text = "";
            mUsuario.Text = "";
            mContraseña.Text = "";
        }

        protected void bntCrearUsuario_Click(object sender, EventArgs e) {
            string codigoEmpre = "";
            string codigoEmple = "";
            if (cNombre.Text.Length == 0 || cCorreo.Text.Length == 0 || cPuesto.Text.Length == 0 || cCelular.Text.Length == 0 || cUsuario.Text.Length == 0 || cContraseña.Text.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }
            else {
                con.cargarEmpresas();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (con.datos.Rows[i][1].ToString().Equals(cSeleccionarEmpresa.SelectedValue)) {
                        codigoEmpre = con.datos.Rows[i][0].ToString();
                    }
                }
                con.agregarEmpleado(codigoEmpre, cNombre.Text, cCorreo.Text, cPuesto.Text, cCelular.Text);
                con.cargarEmpleados();
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][2].ToString().Equals(cNombre.Text)) {
                            codigoEmple = con.datos.Rows[i][0].ToString();
                        }
                    }
                }
                string tipo_uesr = "as";
                con.agregarUsuario(codigoEmpre, codigoEmple, cUsuario.Text, cContraseña.Text, tipo_uesr);
                primeraCarga();

            }
        }

        protected void mMostrarUsuarios_Click(object sender, EventArgs e) {
            if (mSeleccionarEmpresa.Items.Count != 0) {
                con.joinUsuariosEmpresa();
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][7].ToString().Equals(mSeleccionarEmpresa.SelectedValue)) {
                            mSeleccionarUsuario.Items.Add(con.datos.Rows[i][3].ToString());
                        }
                    }
                }
            }
        }

        protected void mCargar_Click(object sender, EventArgs e) {
            if (mSeleccionarUsuario.Items.Count != 0) {
                con.joinUsuariosEmpleado();
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][3].ToString().Equals(mSeleccionarUsuario.SelectedValue)) {
                            mNombre.Text = con.datos.Rows[i][8].ToString();
                            mCorreo.Text = con.datos.Rows[i][9].ToString();
                            mPuesto.Text = con.datos.Rows[i][10].ToString();
                            mCelular.Text = con.datos.Rows[i][11].ToString();
                            mUsuario.Text = con.datos.Rows[i][3].ToString();
                            mContraseña.Text = con.datos.Rows[i][4].ToString();
                        }
                    }
                }
            }
        }

        protected void btnModificarUsuario_Click(object sender, EventArgs e) {
            if (mNombre.Text.Length == 0 || mCorreo.Text.Length == 0 || mPuesto.Text.Length == 0 || mPuesto.Text.Length == 0 || mCelular.Text.Length == 0 || mUsuario.Text.Length == 0 || mContraseña.Text.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }
            else {
                con.joinUsuariosEmpleado();
                string id_user = "";
                string id_empre = "";
                string id_emple = "";
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (con.datos.Rows[i][3].ToString().Equals(mSeleccionarUsuario.SelectedValue)) {
                        id_user = con.datos.Rows[i][0].ToString();
                        id_empre = con.datos.Rows[i][7].ToString();
                        id_emple = con.datos.Rows[i][6].ToString();
                        break;
                    }
                }
                con.modificarEmpleado(id_emple, id_empre, mNombre.Text, mCorreo.Text, mPuesto.Text, mCelular.Text);
                con.modificarUsuario(id_user, id_empre, id_emple, mUsuario.Text, mContraseña.Text);
                primeraCarga();
            }
        }

        protected void eMostrarUsuarios_Click(object sender, EventArgs e) {
            if (eSeleccionarEmpresa.Items.Count != 0) {
                con.joinUsuariosEmpresa();
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][7].ToString().Equals(mSeleccionarEmpresa.SelectedValue)) {
                            eSeleccionarUsuario.Items.Add(con.datos.Rows[i][3].ToString());
                        }
                    }
                }
            }
        }

        protected void btnEliminarUsuario_Click(object sender, EventArgs e) {
            if (eSeleccionarUsuario.Items.Count != 0) {
                con.eliminarUsuario(eSeleccionarUsuario.SelectedValue);
            }
        }
    }
}