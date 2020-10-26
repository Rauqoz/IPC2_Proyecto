<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/AH/AdminHelloWord.Master" AutoEventWireup="true" CodeBehind="clientesAH.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.AH.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; display: block">
        <div style="text-align: center; display: inline-table; clear: both">
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Registrar Cliente" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Nit" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cNitEmpresa" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Nombre de la Empresa" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cNombreEmpresa" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Tipo de Empresa" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cTipoEmpresa" runat="server">
                <asp:ListItem>Comercial</asp:ListItem>
                <asp:ListItem>Financiera</asp:ListItem>
                <asp:ListItem>Servicios</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Tamaño de la Empresa (Empleados)" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cTamañoEmpresa" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Tarjeta de Credito" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cTarjetaEmpresa" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Nombre de la Tarjeta" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cNombreTarjetaEmpresa" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Fecha Vencimiento :" ForeColor="#FFFF05"></asp:Label>
            <br />
            <asp:Label ID="Label26" runat="server" Text="Mes" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cMesTarjetaEmpresa" runat="server">
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label9" runat="server" Text="Año" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cAñoTarjetaEmpresa" runat="server">
                <asp:ListItem>2021</asp:ListItem>
                <asp:ListItem>2022</asp:ListItem>
                <asp:ListItem>2023</asp:ListItem>
                <asp:ListItem>2024</asp:ListItem>
                <asp:ListItem>2025</asp:ListItem>
                <asp:ListItem>2026</asp:ListItem>
                <asp:ListItem>2027</asp:ListItem>
                <asp:ListItem>2028</asp:ListItem>
                <asp:ListItem>2029</asp:ListItem>
                <asp:ListItem>2030</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label10" runat="server" Text="Tipo Tarjeta" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cTipoTarjetaEmpresa" runat="server">
                <asp:ListItem>MasterCard</asp:ListItem>
                <asp:ListItem>Visa</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label11" runat="server" Text="CVR" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cCvrTarjetaEmpresa" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label30" runat="server" Text="Suscripcion Tarjeta" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cSuscripcion" runat="server">
                <asp:ListItem>Mensual</asp:ListItem>
                <asp:ListItem>Anual</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnCrearEmpresa" runat="server" Text="Crear Cliente" OnClick="btnCrearEmpresa_Click" />
        </div>
        <div style="text-align: center; display: inline-table; clear: both">
            <br />
            <br />
            <asp:Label ID="Label12" runat="server" Text="Modificar Cliente" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label23" runat="server" Text="Seleccione Cliente" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mSeleccionCliente" runat="server">
            </asp:DropDownList>
            <asp:Button ID="btnCargarDatosEmpresa" runat="server" Text="Cargar" OnClick="btnCargarDatosEmpresa_Click" />
            <br />
            <asp:Label ID="Label13" runat="server" Text="Nit" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mNitEmpresa" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label14" runat="server" Text="Nombre de la Empresa" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mNombreEmpresa" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label15" runat="server" Text="Tipo de Empresa" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mTipoEmpresa" runat="server">
                <asp:ListItem>Comercial</asp:ListItem>
                <asp:ListItem>Financiera</asp:ListItem>
                <asp:ListItem>Servicios</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label16" runat="server" Text="Tamaño de la Empresa (Empleados)" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mTamañoEmpresa" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label17" runat="server" Text="Tarjeta de Credito" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mTarjetaEmpresa" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label18" runat="server" Text="Nombre de la Tarjeta" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mNombreTarjetaEmpresa" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label19" runat="server" Text="Fecha Vencimiento :" ForeColor="#FFFF05"></asp:Label>
            <br />
            <asp:Label ID="Label27" runat="server" Text="Mes" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mMesTarjetaEmpresa" runat="server">
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label20" runat="server" Text="Año" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mAñoTarjetaEmpresa" runat="server">
                <asp:ListItem>2021</asp:ListItem>
                <asp:ListItem>2022</asp:ListItem>
                <asp:ListItem>2023</asp:ListItem>
                <asp:ListItem>2024</asp:ListItem>
                <asp:ListItem>2025</asp:ListItem>
                <asp:ListItem>2026</asp:ListItem>
                <asp:ListItem>2027</asp:ListItem>
                <asp:ListItem>2028</asp:ListItem>
                <asp:ListItem>2029</asp:ListItem>
                <asp:ListItem>2030</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label21" runat="server" Text="Tipo Tarjeta" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mTipoTarjetaEmpresa" runat="server">
                <asp:ListItem>MasterCard</asp:ListItem>
                <asp:ListItem>Visa</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label22" runat="server" Text="CVR" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mCvrTarjetaEmpresa" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label31" runat="server" Text="Suscripcion Tarjeta" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mSuscripcion" runat="server">
                <asp:ListItem>Mensual</asp:ListItem>
                <asp:ListItem>Anual</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnModificarEmpresa" runat="server" Text="Modificar Cliente" OnClick="btnModificarEmpresa_Click" />
        </div>
        <div style="text-align: center; display: inline-table; clear: both">
            <br />
            <br />

            <asp:Label ID="Label28" runat="server" Text="Clientes" ForeColor="#FFFF05"></asp:Label>

            <asp:GridView ID="tablaEmpresas" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>

            <br />

            <asp:Label ID="Label29" runat="server" Text="Tarjetas" ForeColor="#FFFF05"></asp:Label>

            <asp:GridView ID="tablaTarjetas" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>

            <br />
            <asp:Label ID="Label24" runat="server" Text="Eliminar Cliente" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label25" runat="server" Text="Seleccione Cliente" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eSeleccionCliente" runat="server">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Button ID="btnEliminarEmpresa" runat="server" Text="Eliminar Cliente" OnClick="btnEliminarEmpresa_Click" />
        </div>
    </div>
</asp:Content>

