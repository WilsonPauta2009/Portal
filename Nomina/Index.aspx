<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="index" Title="Index..." %>
<asp:Content ID="CntIndex" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <table id="Tab000" border="0" cellpadding="0" cellspacing="0" style="height: 400px; width: 100%">
        <tr>
            <td align="center" valign="middle">
                <asp:Panel ID="PnlLogUser" runat="server" DefaultButton="BtnIngr">
                    <table id="Tab001" border="0" cellpadding="0" cellspacing="0" width="200px">
                        <tr align="center" valign="middle">
                            <td align="center" valign="middle">
                                <table id="Tab002" border="0" cellpadding="3" cellspacing="0" border-top-style: outset; border-bottom-style: outset; border-top-width: 1px; border-bottom-width: 1px;" bgcolor="White">
                                    <caption>
                                        <asp:Image ID="imgLoIn" runat="server" ImageUrl="./imgs/logIn.png" Height="40px" />
                                    </caption>
                                    <tr>
                                        <td align="right" valign="middle">
                                            <asp:Label ID="LblUsua" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                                                ForeColor="#000040" Text="Usuario :"></asp:Label></td>
                                        <td align="left" valign="middle">
                                            <asp:TextBox ID="TxtUsua" runat="server" CausesValidation="True" Font-Names="Courier New"
                                                Font-Size="10pt" onfocus="this.style.background='#ffffcc'" 
                                                onblur="this.style.background='white'" TabIndex="1" Width="110px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RfvIden" runat="server" ControlToValidate="TxtUsua"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="middle">
                                            <asp:Label ID="LblClav" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                                                ForeColor="#000040" Text="Clave :"></asp:Label></td>
                                        <td align="left" valign="middle">
                                            <asp:TextBox ID="TxtClav" runat="server" CausesValidation="True" Font-Names="Courier New"
                                                Font-Size="10pt" TextMode="Password" Width="110px" TabIndex="2" 
                                                onfocus="this.style.background='#ffffcc'" 
                                                onblur="this.style.background='white'"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RfvClav" runat="server" ControlToValidate="TxtClav"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left" valign="bottom">
                                            <asp:Button ID="BtnIngr" runat="server" Font-Bold="True" Font-Names="Arial"
                                                Font-Size="8pt" OnClick="BtnIngr_Click" Text="Conectar..." Width="75px" 
                                                TabIndex="3" /></td>
                                    </tr>
                                </table>
                                </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

