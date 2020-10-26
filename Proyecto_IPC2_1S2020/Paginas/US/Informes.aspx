<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/US/UserServicio.Master" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.US.Formulario_web15" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; display: block">
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Bodega" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />
            <asp:DropDownList ID="bodegas" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Button ID="btnSaldos" runat="server" Text="Reporte Saldo" OnClick="btnSaldos_Click" />

        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Productos" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />
            <asp:DropDownList ID="productos" runat="server">
            </asp:DropDownList>


            <br />
            <asp:Button ID="Button1" runat="server" Text="Reporte Lotes" OnClick="Button1_Click" />

        </div>

    </div>
</asp:Content>
