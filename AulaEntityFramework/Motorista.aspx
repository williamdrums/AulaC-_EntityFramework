<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Motorista.aspx.cs" Inherits="AulaEntityFramework.Motorista1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblID" runat="server" Text=""/>

        <table>
            <tr>
                <td>Nome: </td>
                <td><asp:TextBox ID="txtNome" runat="server" /> </td>
            </tr>
            <tr>
                <td>Endereço: </td>
                <td><asp:TextBox ID="txtEndereco" runat="server" /> </td>
            </tr>
            <tr>
                <td>CNH: </td>
                <td><asp:TextBox ID="txtCNH" runat="server" /> </td>
            </tr>
        </table>
        <asp:Button ID="btnCadastrarMotorista" runat="server" Text="Cadastrar" OnClick="btnCadastrarMotorista_Click"/>
        <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" OnClick="btnAtualizar_Click"/>
    </div>
    <br /><br />
    <asp:GridView ID="GridViewMotorista" runat="server" DataKeyNames="Id" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewMotorista_SelectedIndexChanged" OnRowCommand="GridViewMotorista_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:ButtonField CommandName="detalhes" Text="Detalhes" ButtonType="Button"/>
            <asp:CommandField ButtonType="Button" SelectText="Editar" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </form>
</body>
</html>
