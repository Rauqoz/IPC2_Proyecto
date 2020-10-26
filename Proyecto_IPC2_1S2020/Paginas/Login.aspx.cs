using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using Proyecto_IPC2_1S2020.Models;

namespace Proyecto_IPC2_1S2020.Paginas {
    public partial class Login : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }
        ConexionDB con = new ConexionDB();

        protected void Logear_Click(object sender, EventArgs e) {
            //Response.Redirect("./Formulario web2.aspx");
            //Menu1.Items.Add(new MenuItem("nombre", null, null, "~/Paginas/Login.aspx"));

            if (user.Value.Length != 0 && pass.Value.Length != 0) {
                con.login();
                if (con.existenDatos()) {
                    Boolean entro = false;
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (user.Value.Equals(con.datos.Rows[i][3].ToString()) && pass.Value.Equals(con.datos.Rows[i][4].ToString())) {
                            if (con.datos.Rows[i][5].ToString().Equals("ah")) {
                                Models.userActual.usuarioActual = con.datos.Rows[i][3].ToString();
                                Response.Redirect("./AH/iniAH.aspx");
                            }
                            else if (con.datos.Rows[i][5].ToString().Equals("as")) {
                                Models.userActual.usuarioActual = con.datos.Rows[i][3].ToString();
                                Response.Redirect("./AS/initAS.aspx");
                            }
                            else if (con.datos.Rows[i][5].ToString().Equals("us")) {
                                Models.userActual.usuarioActual = con.datos.Rows[i][3].ToString();
                                Response.Redirect("./US/IniUS.aspx");
                            }
                        }
                    }
                    if (entro == false) {
                        Response.Write("<script>alert('Usuario No Existe')</script>");
                    }
                }
                else {
                    Response.Write("<script>alert('No Existen Datos')</script>");
                }
            }
            else {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }

        }
    }
}