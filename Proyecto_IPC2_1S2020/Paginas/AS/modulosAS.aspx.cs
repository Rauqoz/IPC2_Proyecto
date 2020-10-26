using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto_IPC2_1S2020.Models;

namespace Proyecto_IPC2_1S2020.Paginas.AS {
    public partial class Formulario_web11 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();
            }
        }
        void primeraCarga() {
            txtSuscripcion.Text = Models.userActual.suscripcion;
            con.cargarModulos();
            if (con.existenDatos()) {
                tablaModulosDisponibles.DataSource = con.datos.Copy();
                tablaModulosDisponibles.DataBind();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    cListaModulos.Items.Add(con.datos.Rows[i][1].ToString());
                }
            }
            con.cargarEmpresas();
            int tamañoE = 0;
            for (int i = 0; i < con.datos.Rows.Count; i++) {
                if (con.datos.Rows[i][0].ToString().Equals(Models.userActual.id_empreActual)) {
                    tamañoE = int.Parse(con.datos.Rows[i][4].ToString());
                }
            }
            con.cargarPrecios();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (tamañoE > 0 && con.datos.Rows[i][1].ToString().Equals("A")) {
                        cListaPrecios.Items.Add(con.datos.Rows[i][1].ToString());
                    }
                    else if (tamañoE >= 11 && con.datos.Rows[i][1].ToString().Equals("B")) {
                        cListaPrecios.Items.Add(con.datos.Rows[i][1].ToString());
                    }
                    else if (tamañoE >= 16 && con.datos.Rows[i][1].ToString().Equals("C")) {
                        cListaPrecios.Items.Add(con.datos.Rows[i][1].ToString());
                    }
                    else if (tamañoE >= 26 && con.datos.Rows[i][1].ToString().Equals("D")) {
                        cListaPrecios.Items.Add(con.datos.Rows[i][1].ToString());
                    }
                    else if (tamañoE >= 41 && con.datos.Rows[i][1].ToString().Equals("E")) {
                        cListaPrecios.Items.Add(con.datos.Rows[i][1].ToString());
                    }
                    else if (tamañoE >= 51 && con.datos.Rows[i][1].ToString().Equals("F")) {
                        cListaPrecios.Items.Add(con.datos.Rows[i][1].ToString());
                    }
                }
            }
            con.cargarModulosDeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                tablaModulosActuales.DataSource = con.datos.Copy();
                tablaModulosActuales.DataBind();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    eListaModulos.Items.Add(con.datos.Rows[i][1].ToString());
                }
            }

        }

        protected void cContratarModulos0_Click(object sender, EventArgs e) {
            if (eListaModulos.Items.Count != 0) {
                con.cargarModulos();
                string id_modulo = "";
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][1].ToString().Equals(eListaModulos.SelectedValue)) {
                            id_modulo = con.datos.Rows[i][0].ToString();
                        }
                    }
                    con.eliminarModuloDeEmpresa(id_modulo, Models.userActual.id_empreActual);
                    primeraCarga();
                }
            }
        }

        protected void cContratarModulos_Click(object sender, EventArgs e) {

        }
    }
}