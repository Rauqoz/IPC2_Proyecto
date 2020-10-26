<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/AS/AdminEmpresa.Master" AutoEventWireup="true" CodeBehind="modulosAS.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.AS.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; display: block">
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />

            <asp:Label ID="Label1" runat="server" Text="Modulos disponibles" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />

            <asp:GridView ID="tablaModulosDisponibles" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>


            <br />

            <asp:Label ID="Label2" runat="server" Text="Precios disponibles" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />

            <asp:GridView ID="tablaPreciosDisponibles" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>

            <br />
            <textarea id="TextArea3" name="S3" aria-readonly="True" aria-disabled="False" contenteditable="false" readonly="readonly" style="width: 256px; height: 102px;" aria-expanded="false" aria-pressed="false" aria-selected="false" draggable="false" cols="20" rows="1">1 a 10 empleados Rango "A"
11 a 15  empleados Rango "B"
16 a 25  empleados Rango "C"
26 a 40  empleados Rango "D"
41 a 50  empleados Rango "E"
51 o mas empleados Rango "F"</textarea><br />
            <br />

            <asp:Label ID="Label3" runat="server" Text="Contratar Modulos" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />

            <asp:Label ID="Label4" runat="server" Text="Modulos Disponibles" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cListaModulos" runat="server">
            </asp:DropDownList>


            <br />

            <asp:Label ID="txtSuscripcion" runat="server" Text="0000" ForeColor="#FFFF05"></asp:Label>


            <br />

            <asp:Label ID="Label5" runat="server" Text="Precios Disponibles" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="cListaPrecios" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Button ID="cContratarModulos" runat="server" Text="Contratar Modulos" OnClick="cContratarModulos_Click" />


            <br />
            <br />

            <asp:Label ID="Label6" runat="server" Text="Modulos Actuales" ForeColor="#FFFF05"></asp:Label>


            <br />
            <br />

            <asp:GridView ID="tablaModulosActuales" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>


            <br />
            <br />

            <asp:Label ID="Label9" runat="server" Text="Dar de Baja Modulo" ForeColor="#FFFF05"></asp:Label>


            <br />

            <asp:Label ID="Label8" runat="server" Text="Eliminar Modulo" ForeColor="#FFFF05"></asp:Label>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <asp:DropDownList ID="eListaModulos" runat="server">
            </asp:DropDownList>


            <br />


            <asp:Button ID="cContratarModulos0" runat="server" Text="Eliminar Modulos" OnClick="cContratarModulos0_Click" />


        </div>
    </div>
</asp:Content>
