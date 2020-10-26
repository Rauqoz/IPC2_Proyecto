using Proyecto_IPC2_1S2020.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2_1S2020.Paginas.US {
    public partial class Formulario_web11 : System.Web.UI.Page {
        ConexionDB con = new ConexionDB();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                primeraCarga();
            }
        }
        void primeraCarga() {
            con.cargaBodegasDeEmpresa(Models.userActual.id_empreActual);
            if (con.existenDatos()) {
                tablaBodegas.DataSource = con.datos.Copy();
                tablaBodegas.DataBind();
                cListaBodegas.Items.Clear();
                mListaBodegas.Items.Clear();
                eListaBodega.Items.Clear();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    cListaBodegas.Items.Add(con.datos.Rows[i][0].ToString());
                    mListaBodegas.Items.Add(con.datos.Rows[i][0].ToString());
                    eListaBodega.Items.Add(con.datos.Rows[i][0].ToString());
                }
            }
            con.cargaPasillos();
            if (con.existenDatos()) {
                tablaPasillos.DataSource = con.datos.Copy();
                tablaPasillos.DataBind();
                cListaPasillos.Items.Clear();
                mListaPasillo.Items.Clear();
                eListaPasillos.Items.Clear();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    cListaPasillos.Items.Add(con.datos.Rows[i][0].ToString());
                    mListaPasillo.Items.Add(con.datos.Rows[i][0].ToString());
                    eListaPasillos.Items.Add(con.datos.Rows[i][0].ToString());
                }
            }
            con.cargaEstantes();
            if (con.existenDatos()) {
                tablaEstantes.DataSource = con.datos.Copy();
                tablaEstantes.DataBind();
                cListaEstantes.Items.Clear();
                mListaEstante.Items.Clear();
                eListaEstantes.Items.Clear();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    cListaEstantes.Items.Add(con.datos.Rows[i][0].ToString());
                    mListaEstante.Items.Add(con.datos.Rows[i][0].ToString());
                    eListaEstantes.Items.Add(con.datos.Rows[i][0].ToString());
                }
            }
            con.cargaNiveles();
            if (con.existenDatos()) {
                tablaNiveles.DataSource = con.datos.Copy();
                tablaNiveles.DataBind();
                mListaNivel.Items.Clear();
                eListaNiveles.Items.Clear();
                for (int i = 0; i < con.datos.Rows.Count; i++) {
                    mListaNivel.Items.Add(con.datos.Rows[i][0].ToString());
                    eListaNiveles.Items.Add(con.datos.Rows[i][0].ToString());
                }
            }
            limpiar();
        }
        void limpiar() {
            cNombreBodega.Text = "";
            cDescripcionBodega.Value = "";
            cDireccionBodega.Text = "";
            cAnchoPasillo.Text = "";
            cLargoPasillo.Text = "";
            cLetraEstante.Text = "";
            cLargoEstante.Text = "";
            cAnchoEstante.Text = "";
            cAlturaEstante.Text = "";
            cAlturaNivel.Text = "";
            mNombreBodega.Text = "";
            mDescripcionBodega.Value = "";
            mDireccionBodega.Text = "";
            mAnchoPasillo.Text = "";
            mLargoPasillo.Text = "";
            mLetraEstante.Text = "";
            mLargoEstante.Text = "";
            mAnchoEstante.Text = "";
            mAlturaEstante.Text = "";
            mAlturaNivel.Text = "";
        }

        protected void btnCrearBodega_Click(object sender, EventArgs e) {
            if (cNombreBodega.Text.Length == 0 || cDireccionBodega.Text.Length == 0 || cDescripcionBodega.Value.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }
            else {
                con.agregarBodega(cNombreBodega.Text, cDescripcionBodega.Value, cDireccionBodega.Text);
                primeraCarga();
            }
        }

        protected void btnCrearPasillo_Click(object sender, EventArgs e) {
            if (cAnchoPasillo.Text.Length == 0 || cLargoPasillo.Text.Length == 0 || cListaBodegas.Items.Count == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }
            else {
                con.agregarPasillo(cListaBodegas.SelectedValue, cAnchoPasillo.Text, cLargoPasillo.Text);
                primeraCarga();
            }
        }

        protected void btnCrearEstante_Click(object sender, EventArgs e) {
            if (cListaPasillos.Items.Count == 0 || cLetraEstante.Text.Length == 0 || cLargoEstante.Text.Length == 0 || cAnchoEstante.Text.Length == 0 || cAlturaEstante.Text.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }
            else {
                con.agregarEstante(cListaPasillos.SelectedValue, cLetraEstante.Text, cLargoEstante.Text, cAnchoEstante.Text, cAlturaEstante.Text);
                primeraCarga();
            }
        }

        protected void btnCrearNivel_Click(object sender, EventArgs e) {
            if (cListaEstantes.Items.Count == 0 || cAlturaNivel.Text.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
            }
            else {
                con.agregarNivel(cListaEstantes.SelectedValue, cAlturaNivel.Text);
                primeraCarga();
            }
        }

        protected void btnEliminarBodega_Click(object sender, EventArgs e) {
            if (eListaBodega.Items.Count != 0) {
                con.eliminarBodega(eListaBodega.SelectedValue);
            }
        }

        protected void btnEliminarPasillo_Click(object sender, EventArgs e) {
            if (eListaPasillos.Items.Count != 0) {
                con.eliminarBodega(eListaPasillos.SelectedValue);
            }
        }

        protected void btnEliminarEstante_Click(object sender, EventArgs e) {
            if (eListaEstantes.Items.Count != 0) {
                con.eliminarBodega(eListaEstantes.SelectedValue);
            }
        }

        protected void btnEliminarNivel_Click(object sender, EventArgs e) {
            if (eListaNiveles.Items.Count != 0) {
                con.eliminarBodega(eListaNiveles.SelectedValue);
            }
        }

        protected void btnModificarBodega_Click(object sender, EventArgs e) {
            if (mNombreBodega.Text.Length == 0 || mDireccionBodega.Text.Length == 0 || mDescripcionBodega.Value.Length == 0 || mListaBodegas.Items.Count == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
                primeraCarga();
            }
            else {
                con.modificarBodega(mListaBodegas.SelectedValue, mNombreBodega.Text, mDescripcionBodega.Value, mDireccionBodega.Text);
                primeraCarga();
            }
        }

        protected void btnModificarPasillo_Click(object sender, EventArgs e) {
            if (mAnchoPasillo.Text.Length == 0 || mLargoPasillo.Text.Length == 0 || mListaPasillo.Items.Count == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
                primeraCarga();
            }
            else {
                con.modificarPasillo(mListaPasillo.SelectedValue, mAnchoPasillo.Text, mLargoPasillo.Text);
                primeraCarga();
            }
        }

        protected void btnModificarEstante_Click(object sender, EventArgs e) {
            if (mListaEstante.Items.Count == 0 || mLetraEstante.Text.Length == 0 || mLargoEstante.Text.Length == 0 || mAnchoEstante.Text.Length == 0 || mAlturaEstante.Text.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
                primeraCarga();
            }
            else {
                con.modificarEstante(mListaEstante.SelectedValue, mLetraEstante.Text, mLargoEstante.Text, mAnchoEstante.Text, mAlturaEstante.Text);
                primeraCarga();
            }
        }

        protected void btnModificarNivel_Click(object sender, EventArgs e) {
            if (mListaNivel.Items.Count == 0 || mAlturaNivel.Text.Length == 0) {
                Response.Write("<script>alert('Campos Vacios')</script>");
                primeraCarga();
            }
            else {
                con.modificarNivel(mListaNivel.SelectedValue, mAlturaNivel.Text);
                primeraCarga();
            }
        }
    }
}