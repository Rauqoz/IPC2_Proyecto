using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto_IPC2_1S2020.Models;

namespace Proyecto_IPC2_1S2020.Paginas.AS {
    public partial class Formulario_web1 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();
            }
        }
        void primeraCarga() {
            con.cargarTarjetasDeEmpresa(Models.userActual.id_empreActual);
            tablaSuscripcion.DataSource = con.datos.Copy();
            tablaSuscripcion.DataBind();
        }
    }
}