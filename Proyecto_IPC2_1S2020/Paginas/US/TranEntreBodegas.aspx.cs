using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_1S2020.Paginas.US {
    public partial class Formulario_web14 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();
            }
        }
        void primeraCarga() {
            con.cargaBodegasDeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                BodegaDespues.Items.Clear();
                BodegaDespues.Items.Add("");
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    BodegaDespues.Items.Add(con.datos.Rows[i][0].ToString());
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
            mCantidad.Text = "";
            PasilloDespues.Items.Clear();
            EstanteDespues.Items.Clear();
            NivelAntes.Items.Clear();
            NivelDespues.Items.Clear();
            mListaProductos.Items.Clear();
        }

        protected void mTipo_SelectedIndexChanged(object sender, EventArgs e) {
            mListaProductos.Items.Clear();
            mListaProductos.Items.Add("");
            if (mTipo.SelectedValue.Equals("Saldos")) {
                mLogica.Enabled = false;
                con.cargaSaldosDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        mListaProductos.Items.Add(con.datos.Rows[i][5].ToString());
                    }
                }
            }
            else {
                mLogica.Enabled = true;
                con.cargaLotesDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        mListaProductos.Items.Add(con.datos.Rows[i][6].ToString());
                    }
                }
            }
        }

        protected void mListaProductos_SelectedIndexChanged(object sender, EventArgs e) {
            if (mTipo.SelectedValue.Equals("Saldos")) {
                con.cargaSaldosDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    BodegaAntes.Items.Clear();
                    BodegaAntes.Items.Add("");
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (mListaProductos.SelectedValue.Equals(con.datos.Rows[i][5].ToString())) {
                            BodegaAntes.Items.Add(con.datos.Rows[i][3].ToString());
                            mCantidad.Text = con.datos.Rows[i][4].ToString();
                        }
                    }
                }
            }
            else {
                con.cargaLotesDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    BodegaAntes.Items.Clear();
                    BodegaAntes.Items.Add("");
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (mListaProductos.SelectedValue.Equals(con.datos.Rows[i][6].ToString())) {
                            BodegaAntes.Items.Add(con.datos.Rows[i][3].ToString());
                            mCantidad.Text = con.datos.Rows[i][4].ToString();
                            mLogica.SelectedValue = con.datos.Rows[i][5].ToString();
                        }
                    }
                }
            }
        }

        protected void BodegaAntes_SelectedIndexChanged(object sender, EventArgs e) {
            NivelAntes.Items.Clear();
            NivelAntes.Items.Add("");
            if (mTipo.SelectedValue.Equals("Saldos")) {
                con.cargaSaldosDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][3].ToString().Equals(BodegaAntes.SelectedValue)) {
                            NivelAntes.Items.Add(con.datos.Rows[i][1].ToString());
                        }
                    }
                }
            }
            else {
                con.cargaLotesDeEmpresa(Models.userActual.id_empreActual);
                if (con.existenDatos()) {
                    for (int i = 0; i < con.datos.Rows.Count; i++) {
                        if (con.datos.Rows[i][3].ToString().Equals(BodegaAntes.SelectedValue)) {
                            NivelAntes.Items.Add(con.datos.Rows[i][1].ToString());
                        }
                    }
                }
            }
        }

        protected void BodegaDespues_SelectedIndexChanged(object sender, EventArgs e) {
            PasilloDespues.Items.Clear();
            PasilloDespues.Items.Add("");
            con.cargaPasillos();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (BodegaDespues.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                        PasilloDespues.Items.Add(con.datos.Rows[i][0].ToString());
                    }
                }
            }
        }

        protected void PasilloDespues_SelectedIndexChanged(object sender, EventArgs e) {
            EstanteDespues.Items.Clear();
            EstanteDespues.Items.Add("");
            con.cargaEstantes();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (PasilloDespues.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                        EstanteDespues.Items.Add(con.datos.Rows[i][0].ToString());
                    }
                }
            }
        }

        protected void EstanteDespues_SelectedIndexChanged(object sender, EventArgs e) {
            NivelDespues.Items.Clear();
            NivelDespues.Items.Add("");
            con.cargaNiveles();
            if (con.existenDatos()) {
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    if (EstanteDespues.SelectedValue.Equals(con.datos.Rows[i][1].ToString())) {
                        NivelDespues.Items.Add(con.datos.Rows[i][0].ToString());
                    }
                }
            }
        }

        protected void btnIntercambiar_Click(object sender, EventArgs e) {
            if (mTipo.SelectedIndex < 0) {
                Response.Write("<script>alert('Tipo No Seleccionado')</script>");
            }
            else if (mTipo.SelectedValue.Equals("Saldos")) {
                if (mListaProductos.Items.Count == 0 || BodegaAntes.SelectedValue.Equals("") || NivelAntes.SelectedValue.Equals("") || BodegaDespues.SelectedValue.Equals("") || PasilloDespues.SelectedValue.Equals("") || EstanteDespues.SelectedValue.Equals("") || NivelDespues.SelectedValue.Equals("")) {
                    Response.Write("<script>alert('Campos Vacios')</script>");
                }
                else {
                    con.modificarSaldos(NivelDespues.SelectedValue, mListaProductos.SelectedValue, BodegaDespues.SelectedValue, mCantidad.Text);
                    primeraCarga();
                }
            }
            else if (mTipo.SelectedValue.Equals("Lotes")) {
                if (mListaProductos.Items.Count == 0 || BodegaAntes.SelectedValue.Equals("") || NivelAntes.SelectedValue.Equals("") || BodegaDespues.SelectedValue.Equals("") || PasilloDespues.SelectedValue.Equals("") || EstanteDespues.SelectedValue.Equals("") || NivelDespues.SelectedValue.Equals("")) {
                    Response.Write("<script>alert('Campos Vacios')</script>");
                }
                else {
                    con.modificarLotes(NivelDespues.SelectedValue, mListaProductos.SelectedValue, BodegaDespues.SelectedValue, mCantidad.Text, mLogica.SelectedValue);
                    primeraCarga();
                }
            }
        }
    }
}