<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/US/UserServicio.Master" AutoEventWireup="true" CodeBehind="GestionCostosUS.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.US.Formulario_web12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; display: block">
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Creacion:" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="cTipo" runat="server" ForeColor="#FFFF05" AutoPostBack="true" OnSelectedIndexChanged="cTipo_SelectedIndexChanged">
                <asp:ListItem>Saldos</asp:ListItem>
                <asp:ListItem>Lotes</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Seleccione Producto" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaProducto" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label3" runat="server" Text="Cantidad Productos" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cCantidad" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Label ID="Label4" runat="server" Text="Seleccione Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaBodega" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cListaBodegas_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label5" runat="server" Text="Seleccione Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaPasillo" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cListaPasillos_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label6" runat="server" Text="Seleccione Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaEstante" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cListaEstantes_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label7" runat="server" Text="Seleccione Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaNivel" runat="server" OnSelectedIndexChanged="cListaNivel_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label9" runat="server" Text="Logica" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="cListaLogica" runat="server" Enabled="False">
                <asp:ListItem>UEPS</asp:ListItem>
                <asp:ListItem>PEPS</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnCrearSaldos" runat="server" Text="Crear Saldo" OnClick="btnCrearSaldos_Click" />


        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Modificacion:" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="mTipo" runat="server" ForeColor="#FFFF05" AutoPostBack="true" OnSelectedIndexChanged="mTipo_SelectedIndexChanged">
                <asp:ListItem>Saldos</asp:ListItem>
                <asp:ListItem>Lotes</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label10" runat="server" Text="Seleccione Producto" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mListaProducto" runat="server" AutoPostBack="true" OnSelectedIndexChanged="mListaProductos_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label11" runat="server" Text="Cantidad Productos" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mCantidad" runat="server" TextMode="Number"></asp:TextBox>


            <br />
            <asp:Label ID="Label12" runat="server" Text="Seleccione Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mListaBodega" AutoPostBack="true" runat="server" OnSelectedIndexChanged="mListaBodegas_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label13" runat="server" Text="Seleccione Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mListaPasillo" AutoPostBack="true" runat="server" OnSelectedIndexChanged="mListaPasillos_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label14" runat="server" Text="Seleccione Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mListaEstante" AutoPostBack="true" runat="server" OnSelectedIndexChanged="mListaEstantes_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label15" runat="server" Text="Seleccione Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mListaNivel" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label16" runat="server" Text="Logica" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="mListaLogica" runat="server" Enabled="False">
                <asp:ListItem>UEPS</asp:ListItem>
                <asp:ListItem>PEPS</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnModificarSaldo" runat="server" Text="Modificar Saldo" OnClick="btnModificarSaldo_Click" />


        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label17" runat="server" Text="Eliminacion:" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="eTipo" runat="server" ForeColor="#FFFF05" AutoPostBack="true" OnSelectedIndexChanged="eTipo_SelectedIndexChanged">
                <asp:ListItem>Saldos</asp:ListItem>
                <asp:ListItem>Lotes</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label18" runat="server" Text="Seleccione Producto" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eListaProducto" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Button ID="btnEliminarSaldo" runat="server" Text="Eliminar Saldo" OnClick="btnEliminarSaldo_Click" />


        </div>

        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label19" runat="server" Text="Productos" ForeColor="#FFFF05"></asp:Label>


            <br />


            <asp:GridView ID="tablaProductos" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>


            <asp:Label ID="Label20" runat="server" Text="Saldos" ForeColor="#FFFF05"></asp:Label>


            <br />


            <asp:GridView ID="tablaSaldos" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>


            <asp:Label ID="Label21" runat="server" Text="Lotes" ForeColor="#FFFF05"></asp:Label>


            <br />


            <asp:GridView ID="tablaLotes" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>


            <br />


        </div>
    </div>

</asp:Content>
