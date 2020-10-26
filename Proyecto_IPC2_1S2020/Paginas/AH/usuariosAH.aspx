<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/AH/AdminHelloWord.Master" AutoEventWireup="true" CodeBehind="usuariosAH.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.AH.Formulario_web12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; display: block">
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />

            <asp:Label ID="Label1" runat="server" Text="Crear Usuarios Administradores" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Seleccionar Empresa" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cSeleccionarEmpresa" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label16" runat="server" Text="Nombre" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="cNombre" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label17" runat="server" Text="Correo" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="cCorreo" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label19" runat="server" Text="Puesto" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="cPuesto" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label18" runat="server" Text="Celular" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="cCelular" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Usuario" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cUsuario" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Contraseña" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="cContraseña" runat="server"></asp:TextBox>

            <br />
            <asp:Button ID="bntCrearUsuario" runat="server" Text="Crear Usuario" OnClick="bntCrearUsuario_Click" />

            <br />
            <br />

            <asp:Label ID="Label15" runat="server" Text="Usuarios Administradores" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />

            <asp:GridView ID="tablaUsuarios" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>

        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text="Modificar Usuarios Administradores" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Seleccionar Empresa" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mSeleccionarEmpresa" runat="server">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="mMostrarUsuarios" runat="server" Text="Mostrar Usuarios" OnClick="mMostrarUsuarios_Click" />
            <br />
            <asp:Label ID="Label13" runat="server" Text="Seleccionar Usuario" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:DropDownList ID="mSeleccionarUsuario" runat="server">
            </asp:DropDownList>
            <asp:Button ID="mCargar" runat="server" Text="Cargar" OnClick="mCargar_Click" />
            <br />
            <asp:Label ID="Label20" runat="server" Text="Nombre" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="mNombre" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label21" runat="server" Text="Correo" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="mCorreo" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label22" runat="server" Text="Puesto" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="mPuesto" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label23" runat="server" Text="Celular" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="mCelular" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Usuario" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mUsuario" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Contraseña" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:TextBox ID="mContraseña" runat="server"></asp:TextBox>

            <br />
            <asp:Button ID="btnModificarUsuario" runat="server" Text="Modificar Usuario" OnClick="btnModificarUsuario_Click" />

        </div>
        <div style="text-align: center; display: inline-table; clear: both">

            <br />
            <br />

            <asp:Label ID="Label9" runat="server" Text="Eliminar Usuarios Administradores" ForeColor="#FFFF05"></asp:Label>

            <br />
            <br />
            <asp:Label ID="Label10" runat="server" Text="Seleccionar Empresa" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eSeleccionarEmpresa" runat="server">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="eMostrarUsuarios" runat="server" Text="Mostrar Usuarios" OnClick="eMostrarUsuarios_Click" />
            <br />
            <asp:Label ID="Label14" runat="server" Text="Seleccionar Usuario" ForeColor="#FFFF05"></asp:Label>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:DropDownList ID="eSeleccionarUsuario" runat="server">
            </asp:DropDownList>
            &nbsp;<br />
            <asp:Button ID="btnEliminarUsuario" runat="server" Text="Eliminar Usuario" OnClick="btnEliminarUsuario_Click" />

        </div>
    </div>
</asp:Content>
