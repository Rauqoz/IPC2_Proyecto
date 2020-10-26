<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto_IPC2_1S2020.Paginas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link href="Login.css" type="text/css" rel="stylesheet" />
</head>
<body style="background: #0A1747;">
    <div class="login-page">
        <div class="form">
            <form id="form1" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Sistema de Login" Font-Size="Larger" ForeColor="#0A1747"></asp:Label>
                <input runat="server" id="user" type="text" placeholder="username" />
                <input runat="server" id="pass" type="password" placeholder="password" /><asp:Button ID="Logear" runat="server" BackColor="#0A1747" OnClick="Logear_Click" Text="Login" ForeColor="White" />
            </form>
        </div>
    </div>
</body>
</html>
