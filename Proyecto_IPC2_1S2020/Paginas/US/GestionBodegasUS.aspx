<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/US/UserServicio.Master" AutoEventWireup="true" CodeBehind="GestionBodegasUS.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.US.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; display: block">
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Creacion:" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Nombre Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cNombreBodega" runat="server"></asp:TextBox>


            <br />
            <asp:Label ID="Label3" runat="server" Text="Descripcion Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <textarea id="cDescripcionBodega" runat="server" cols="20" name="S1" rows="2"></textarea><br />
            <asp:Label ID="Label4" runat="server" Text="Direccion Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="cDireccionBodega" runat="server"></asp:TextBox>


            <br />
            <asp:Button ID="btnCrearBodega" runat="server" Text="Crear Bodega" OnClick="btnCrearBodega_Click" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="id Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaBodegas" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Ancho Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="cAnchoPasillo" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Label ID="Label7" runat="server" Text="Largo Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="cLargoPasillo" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Button ID="btnCrearPasillo" runat="server" Text="Crear Pasillo" OnClick="btnCrearPasillo_Click" />


            <br />
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="id Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="cListaPasillos" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label9" runat="server" Text="Letra Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="cLetraEstante" runat="server" MaxLength="1"></asp:TextBox>


            <br />
            <asp:Label ID="Label10" runat="server" Text="Largo Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="cLargoEstante" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Label ID="Label11" runat="server" Text="Ancho Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="cAnchoEstante" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Label ID="Label12" runat="server" Text="Altura Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="cAlturaEstante" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Button ID="btnCrearEstante" runat="server" Text="Crear Estante" OnClick="btnCrearEstante_Click" />


            <br />
            <br />
            <br />
            <asp:Label ID="Label13" runat="server" Text="id Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="cListaEstantes" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label14" runat="server" Text="Altura Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="cAlturaNivel" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Button ID="btnCrearNivel" runat="server" Text="Crear Nivel" OnClick="btnCrearNivel_Click" />


        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label15" runat="server" Text="Modificacion:" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />
            <asp:Label ID="Label29" runat="server" Text="id Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="mListaBodegas" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label16" runat="server" Text="Nombre Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mNombreBodega" runat="server"></asp:TextBox>


            <br />
            <asp:Label ID="Label17" runat="server" Text="Descripcion Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <textarea id="mDescripcionBodega" runat="server" cols="20" name="S1" rows="2"></textarea><br />
            <asp:Label ID="Label18" runat="server" Text="Direccion Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="mDireccionBodega" runat="server"></asp:TextBox>


            <br />
            <asp:Button ID="btnModificarBodega" runat="server" Text="Modificar Bodega" OnClick="btnModificarBodega_Click" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label19" runat="server" Text="id Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mListaPasillo" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label20" runat="server" Text="Ancho Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="mAnchoPasillo" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Label ID="Label21" runat="server" Text="Largo Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="mLargoPasillo" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Button ID="btnModificarPasillo" runat="server" Text="Modificar Pasillo" OnClick="btnModificarPasillo_Click" />


            <br />
            <br />
            <br />
            <asp:Label ID="Label22" runat="server" Text="id Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="mListaEstante" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label23" runat="server" Text="Letra Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="mLetraEstante" runat="server" MaxLength="1"></asp:TextBox>


            <br />
            <asp:Label ID="Label24" runat="server" Text="Largo Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="mLargoEstante" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Label ID="Label25" runat="server" Text="Ancho Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="mAnchoEstante" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Label ID="Label26" runat="server" Text="Altura Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="mAlturaEstante" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Button ID="btnModificarEstante" runat="server" Text="Modificar Estante" OnClick="btnModificarEstante_Click" />


            <br />
            <br />
            <br />
            <asp:Label ID="Label27" runat="server" Text="id Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="mListaNivel" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label28" runat="server" Text="Altura Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:TextBox ID="mAlturaNivel" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Button ID="btnModificarNivel" runat="server" Text="Modificar Nivel" OnClick="btnModificarNivel_Click" />


        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label30" runat="server" Text="Eliminar:" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />
            <asp:Label ID="Label31" runat="server" Text="id Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="eListaBodega" runat="server">
            </asp:DropDownList>


            &nbsp;<br />
            <asp:Button ID="btnEliminarBodega" runat="server" Text="Eliminar Bodega" OnClick="btnEliminarBodega_Click" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label35" runat="server" Text="id Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eListaPasillos" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Button ID="btnEliminarPasillo" runat="server" Text="Eliminar Pasillo" OnClick="btnEliminarPasillo_Click" />


            <br />
            <br />
            <br />
            <asp:Label ID="Label38" runat="server" Text="id Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="eListaEstantes" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Button ID="btnEliminarEstante" runat="server" Text="Eliminar Estante" OnClick="btnEliminarEstante_Click" />


            <br />
            <br />
            <br />
            <asp:Label ID="Label43" runat="server" Text="id Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="eListaNiveles" runat="server">
            </asp:DropDownList>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <br />
            <asp:Button ID="btnEliminarNivel" runat="server" Text="Eliminar Nivel" OnClick="btnEliminarNivel_Click" />


        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label32" runat="server" Text="Actuales:" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />
            <asp:Label ID="Label44" runat="server" Text="Bodegas" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />

            <asp:GridView ID="tablaBodegas" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>


            <asp:Label ID="Label45" runat="server" Text="Pasillos" ForeColor="#FFFF05"></asp:Label>


            <br />

            <asp:GridView ID="tablaPasillos" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>


            <asp:Label ID="Label46" runat="server" Text="Estantes" ForeColor="#FFFF05"></asp:Label>


            <br />

            <asp:GridView ID="tablaEstantes" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>


            <asp:Label ID="Label47" runat="server" Text="Niveles" ForeColor="#FFFF05"></asp:Label>


            <br />

            <asp:GridView ID="tablaNiveles" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>


        </div>


    </div>
</asp:Content>
