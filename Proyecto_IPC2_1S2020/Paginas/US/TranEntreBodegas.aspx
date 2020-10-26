<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/US/UserServicio.Master" AutoEventWireup="true" CodeBehind="TranEntreBodegas.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.US.Formulario_web14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; display: block">
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Bodega Antes:" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="mTipo" runat="server" ForeColor="#FFFF05" AutoPostBack="true" OnSelectedIndexChanged="mTipo_SelectedIndexChanged">
                <asp:ListItem>Saldos</asp:ListItem>
                <asp:ListItem>Lotes</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="Label10" runat="server" Text="Logica" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="mLogica" runat="server" Enabled="False">
                <asp:ListItem>UEPS</asp:ListItem>
                <asp:ListItem>PEPS</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Producto" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mListaProductos" runat="server" AutoPostBack="true" OnSelectedIndexChanged="mListaProductos_SelectedIndexChanged">
            </asp:DropDownList>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            

            <br />
            <asp:Label ID="Label4" runat="server" Text="Cantidad" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mCantidad" runat="server" ReadOnly="True"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label8" runat="server" Text="Seleccione Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="BodegaAntes" runat="server" AutoPostBack="true" OnSelectedIndexChanged="BodegaAntes_SelectedIndexChanged">
            </asp:DropDownList>


            &nbsp;<br />
            <asp:Label ID="Label7" runat="server" Text="Seleccione Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="NivelAntes" runat="server">
            </asp:DropDownList>
            <br />

        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />

            <br />
            <asp:Button ID="btnIntercambiar" runat="server" Text="Intercambiar" OnClick="btnIntercambiar_Click" />
            <br />
            <br />
            <asp:GridView ID="tablaSaldos" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>
            <br />
            <asp:GridView ID="tablaLotes" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>
            <br />

        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Bodega Despues:" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label12" runat="server" Text="Seleccione Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="BodegaDespues" AutoPostBack="true" runat="server" OnSelectedIndexChanged="BodegaDespues_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label13" runat="server" Text="Seleccione Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="PasilloDespues" AutoPostBack="true" runat="server" OnSelectedIndexChanged="PasilloDespues_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label14" runat="server" Text="Seleccione Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="EstanteDespues" AutoPostBack="true" runat="server" OnSelectedIndexChanged="EstanteDespues_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label19" runat="server" Text="Seleccione Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="NivelDespues" runat="server">
            </asp:DropDownList>
            <br />

        </div>

    </div>
</asp:Content>
