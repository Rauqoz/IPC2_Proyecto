<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/AS/AdminEmpresa.Master" AutoEventWireup="true" CodeBehind="suscripcionAS.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.AS.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; display: block">
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />

            <asp:Label ID="Label1" runat="server" Text="Datos Suscripcion" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />
            <br />

            <asp:GridView ID="tablaSuscripcion" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>

            <br />

        </div>
    </div>
</asp:Content>
