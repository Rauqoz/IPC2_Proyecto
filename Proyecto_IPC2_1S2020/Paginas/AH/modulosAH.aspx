<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/AH/AdminHelloWord.Master" AutoEventWireup="true" CodeBehind="modulosAH.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.AH.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="todo" style="text-align: center; display: block;">
        <div class="left" style="text-align: center; display: inline-table; clear: both;">
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Modulos Existentes" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnActualizarModulos" runat="server" Text="Actualizar Modulos" OnClick="btnActualizarModulos_Click" />

            <asp:GridView ID="tablaModulos" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>

        </div>
        <div class="left" style="text-align: center; display: inline-table; clear: both;">
            <br />
            <br />
            <asp:Label ID="Label18" runat="server" Text="Crear Modulo" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label19" runat="server" Text="Nombre" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cNombre" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label20" runat="server" Text="Abreviatura" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="cAbreviatura" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label21" runat="server" Text="Descripcion" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <textarea runat="server" id="cDescrip" cols="20" name="S6" rows="2"></textarea><br />
            <asp:Label ID="Label22" runat="server" Text="Default" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cDefault" runat="server">
                <asp:ListItem Selected="True">No</asp:ListItem>
                <asp:ListItem>Si</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnCrearModulo0" runat="server" Text="Crear Modulo" OnClick="Button4_Click" />
            <br />
            <br />
            <asp:Label ID="Label23" runat="server" Text="Modificar Modulo" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label24" runat="server" Text="Modulo a Modificar" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mListaModulos" runat="server">
            </asp:DropDownList>
            <asp:Button ID="cargarModificarModulo" runat="server" Text="Cargar" OnClick="cargarModificarModulo_Click" />
            <br />
            <asp:Label ID="Label25" runat="server" Text="Nombre" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mNombre" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label26" runat="server" Text="Abreviatura" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="mAbreviatura" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label27" runat="server" Text="Descripcion" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <textarea runat="server" id="mDescripcion" cols="20" name="S5" rows="2"></textarea><br />
            <asp:Label ID="Label28" runat="server" Text="Default" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="mDefault" runat="server">
                <asp:ListItem Selected="True">No</asp:ListItem>
                <asp:ListItem>Si</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnModificarModulo" runat="server" Text="Modificar Modulo" OnClick="btnModificarModulo_Click" />
            <br />
            <br />
            <asp:Label ID="Label29" runat="server" Text="Eliminar Modulo" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label30" runat="server" Text="Modulo a Eliminar" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="eListaModulos" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnEliminarModulo" runat="server" Text="Eliminar Modulo" OnClick="btnEliminarModulo_Click" />

        </div>
        <div style="display: inline-table; text-align: center; clear: both;" aria-selected="false">
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Definir Precio" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            <textarea id="TextArea3" name="S3" aria-readonly="True" aria-disabled="False" contenteditable="false" readonly="readonly" style="width: 256px; height: 102px;" aria-expanded="false" aria-pressed="false" aria-selected="false" draggable="false">1 a 10 empleados Rango "A"
11 a 15  empleados Rango "B"
16 a 25  empleados Rango "C"
25 a 40  empleados Rango "D"
40 a 50  empleados Rango "E"
50 o mas empleados Rango "F"</textarea><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label17" runat="server" Text="Rango" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="dRangoAgregar" runat="server">
        <asp:ListItem>A</asp:ListItem>
        <asp:ListItem>B</asp:ListItem>
        <asp:ListItem>C</asp:ListItem>
        <asp:ListItem>D</asp:ListItem>
        <asp:ListItem>E</asp:ListItem>
        <asp:ListItem>F</asp:ListItem>
    </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label32" runat="server" Text="Precio Mensual" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tPrecioMensual" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label33" runat="server" Text="Precio Anual" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tPrecioAnual" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Button ID="btnDefinirPrecio" runat="server" Text="Definir Precio" OnClick="btnDefinirPrecio_Click" />
            <br />
            <br />
            <asp:Label ID="Label34" runat="server" Text="Eliminar Precio" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />

            <asp:GridView ID="tablaPrecios" runat="server">
                <HeaderStyle BackColor="#0A1747" ForeColor="#FFFF05" />
                <RowStyle BorderColor="White" BorderStyle="Double" Font-Size="Small" ForeColor="White" />
            </asp:GridView>

            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label36" runat="server" Text="Rango" ForeColor="#FFFF05"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="dRangoEliminar" runat="server">
    </asp:DropDownList>
            &nbsp;<br />
            <asp:Button ID="btnEliminarPrecio" runat="server" Text="Eliminar Precio" OnClick="btnDefinirPrecio0_Click" />
            <br />
            <br />
            <asp:Label ID="Label31" runat="server" Text="Definir Tasa de Cambio" ForeColor="#FFFF05"></asp:Label>
            <br />
            <br />
            <asp:Label ID="tTasa" runat="server" Text="0000" ForeColor="#FFFF05"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox9" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Button ID="btnDefinirTasa" runat="server" Text="Definir Tasa" />
        </div>
    </div>


</asp:Content>
