using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_1S2020.Paginas.US {
    public partial class Formulario_web15 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();
            }
        }
        void primeraCarga() {
            con.cargaBodegasDeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                bodegas.Items.Clear();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    bodegas.Items.Add(con.datos.Rows[i][0].ToString());
                }
            }
            con.cargaLotesParaReportes();
            if (con.existenDatos()) {
                productos.Items.Clear();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    productos.Items.Add(con.datos.Rows[i][0].ToString());
                }
            }
        }

        protected void btnSaldos_Click(object sender, EventArgs e) {
            if (bodegas.Items.Count == 0) {

            }
            else {
                con.pdfSaldos(bodegas.SelectedValue);
            }
        }

        protected void Button1_Click(object sender, EventArgs e) {
            if (productos.Items.Count == 0) {

            }
            else {
                con.pdfLotes(productos.SelectedValue);
            }
        }
    }
}