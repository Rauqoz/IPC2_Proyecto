<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/US/UserServicio.Master" AutoEventWireup="true" CodeBehind="TranPorBodega.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.US.Formulario_web13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="text-align: center; display: block">
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Entrada:" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="cTipo" runat="server" ForeColor="#FFFF05" AutoPostBack="true" OnSelectedIndexChanged="cTipo_SelectedIndexChanged">
                <asp:ListItem>Saldos</asp:ListItem>
                <asp:ListItem>Lotes</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="Label10" runat="server" Text="Logica" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="cLogica" runat="server" Enabled="False">
                <asp:ListItem>UEPS</asp:ListItem>
                <asp:ListItem>PEPS</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Producto" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaProducto" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label3" runat="server" Text="Proveedor" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaProveedores" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label4" runat="server" Text="Cantidad" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cCantidad" runat="server" TextMode="Number"></asp:TextBox>

            <br />
            <asp:Label ID="Label5" runat="server" Text="Costo" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cCosto" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label23" runat="server" Text="Dia" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;

            <asp:DropDownList ID="cDia" runat="server" OnSelectedIndexChanged="cDia_SelectedIndexChanged">
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
            </asp:DropDownList>


            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label24" runat="server" Text="Mes" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;

            <asp:DropDownList ID="cMes" runat="server">
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
            </asp:DropDownList>


            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label25" runat="server" Text="Año" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;

            <asp:DropDownList ID="cAño" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label8" runat="server" Text="Seleccione Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaBodega" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cListaBodega_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label9" runat="server" Text="Seleccione Pasillo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaPasillo" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cListaPasillo_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label6" runat="server" Text="Seleccione Estante" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaEstante" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cListaEstante_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label7" runat="server" Text="Seleccione Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaNivel" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnCrearEntrada" runat="server" Text="Crear Entrada" OnClick="btnCrearEntrada_Click" />

        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Salida:" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="eTipo" runat="server" ForeColor="#FFFF05" AutoPostBack="true" OnSelectedIndexChanged="eTipo_SelectedIndexChanged">
                <asp:ListItem>Saldos</asp:ListItem>
                <asp:ListItem>Lotes</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="Label12" runat="server" Text="Logica" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="eLogica" runat="server" Enabled="False">
                <asp:ListItem>UEPS</asp:ListItem>
                <asp:ListItem>PEPS</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label13" runat="server" Text="Producto" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eListaProducto" runat="server" AutoPostBack="true" OnSelectedIndexChanged="eListaProducto_SelectedIndexChanged">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label14" runat="server" Text="Cliente" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eListaClientes" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label15" runat="server" Text="Cantidad" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eCantidad" AutoPostBack="true" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label16" runat="server" Text="Costo" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="eCosto" runat="server" ReadOnly="True"></asp:TextBox>
            <br />
            <asp:Label ID="Label26" runat="server" Text="Dia" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;

            <asp:DropDownList ID="eDia" runat="server">
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
            </asp:DropDownList>


            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label27" runat="server" Text="Mes" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;

            <asp:DropDownList ID="eMes" runat="server">
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
            </asp:DropDownList>


            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server" Text="Año" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;

            <asp:DropDownList ID="eAño" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Label ID="Label17" runat="server" Text="Seleccione Bodega" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eListaBodega" runat="server" AutoPostBack="true" OnSelectedIndexChanged="eListaBodega_SelectedIndexChanged">
            </asp:DropDownList>


            &nbsp;<br />
            <asp:Label ID="Label20" runat="server" Text="Seleccione Nivel" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eListaNivel" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnCrearSalida" runat="server" Text="Crear Salida" OnClick="btnCrearSalida_Click" />

        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label21" runat="server" Text="Saldos" ForeColor="#FFFF05"></asp:Label>
            <br />
            <asp:GridView ID="tablaSaldos" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>
            <asp:Label ID="Label22" runat="server" Text="Lotes" ForeColor="#FFFF05"></asp:Label>
            <br />
            <asp:GridView ID="tablaLotes" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>
            <asp:Label ID="Label29" runat="server" Text="Clientes" ForeColor="#FFFF05"></asp:Label>
            <asp:GridView ID="tablaClientes" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>
            <asp:Label ID="Label30" runat="server" Text="Proveedores" ForeColor="#FFFF05"></asp:Label>
            <asp:GridView ID="tablaProveedores" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>
            <asp:Label ID="Label31" runat="server" Text="Productos" ForeColor="#FFFF05"></asp:Label>
            <asp:GridView ID="tablaProductos" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>
            <asp:Label ID="Label32" runat="server" Text="Entradas" ForeColor="#FFFF05"></asp:Label>
            <asp:GridView ID="tablaEntradas" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>
            <asp:Label ID="Label33" runat="server" Text="Salidas" ForeColor="#FFFF05"></asp:Label>
            <asp:GridView ID="tablaSalidas" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
