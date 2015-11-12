<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Veiculo.aspx.cs" Inherits="AulaEntityFramework.Veiculo1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    Motorista
                </td>
                <td>
                    <asp:TextBox ID="txtMotorista" runat="server" Enabled="false"/>
                </td>
            </tr>
            <tr>
                <td>Marca</td>
                <td>
                    <asp:DropDownList ID="DropdownMarca" runat="server">
                        <asp:ListItem Value="">Selecione...</asp:ListItem>
                        <asp:ListItem Value="1">FORD</asp:ListItem>
                        <asp:ListItem Value="2">MERCEDES</asp:ListItem>
                        <asp:ListItem Value="3">FIAT</asp:ListItem>
                        <asp:ListItem Value="4">JAC</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Modelo</td>
                <td><asp:TextBox ID="txtModelo" runat="server"/></td>
            </tr>
            <tr>
                <td>Placa</td>
                <td><asp:TextBox ID="txtPlaca" runat="server"/></td>
            </tr>
            <tr>
                <td>Ano</td>
                <td><asp:TextBox ID="txtAno" runat="server"/></td>
            </tr>
        </table>
        <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click"/>
        <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar"/>
    </div>
    <br /><br />
    <div>
        <asp:Label ID="lblMsg" runat="server" Text=""/>
        <asp:GridView ID="GridViewVeiculos" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:ButtonField CommandName="acidentes" Text="Acidentes" ButtonType="Button"/>
                <asp:CommandField ButtonType="Button" SelectText="Editar" ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
