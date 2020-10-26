using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_1S2020.Paginas.US {
    public partial class Formulario_web1 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            con.joinUsuariosEmpresa();
            for (int i = 0; i < con.datos.Rows.Count; i++) {
                if (con.datos.Rows[i][3].ToString().Equals(Models.userActual.usuarioActual)) {
                    Models.userActual.id_empreActual = con.datos.Rows[i][6].ToString();
                    Models.userActual.id_usuarioActual = con.datos.Rows[i][0].ToString();
                }
            }
            //Response.Write("<script>alert('" + Models.userActual.id_empreActual + "')</script>");
        }
    }
}