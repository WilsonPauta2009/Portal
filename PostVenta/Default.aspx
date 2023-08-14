<%@ Page Title="Log In..." Language="C#" MasterPageFile="~/PlantillaMAIN.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="PostVenta_Default" %>

<asp:Content ID="CntKERN" ContentPlaceHolderID="CntMAIN" Runat="Server">
    <asp:Panel ID="PnlLogUser" runat="server" DefaultButton="BtnIngr" Height="100%">
        <table id="Tab001" border="0" cellpadding="0" cellspacing="0" style="height: 100%">
            <tr>
                <td align="center" valign="middle" style="width: 255px">
                    <table id="Tab002" border="0" cellpadding="3" cellspacing="0" style="width: 320px;">
                        <caption>
                        </caption>
                        <tr>
                            <td align="right" valign="middle" 
                                style="border-top-style: solid; border-top-width: 1px">
                                <asp:Label ID="LblEmpr" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                                    ForeColor="#000040" Text="Empresa :"></asp:Label></td>
                            <td align="left" valign="middle" 
                                style="border-top-style: solid; border-top-width: 1px">
                                <asp:DropDownList ID="DdlEmpr" runat="server" Font-Bold="False" 
                                    Font-Names="Arial" Font-Size="8pt" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="middle" style="height: 30px">
                                <asp:Label ID="LblUsua" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                                    ForeColor="#000040" Text="Identificación :"></asp:Label></td>
                            <td align="left" valign="middle" style="height: 30px">
                                <asp:TextBox ID="TxtUsua" runat="server" CausesValidation="True" Font-Names="Courier New"
                                    Font-Size="10pt" Width="110px" onfocus="this.style.background='#ffffcc'" 
                                    onblur="this.style.background='white'" TabIndex="1"></asp:TextBox>
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
                            <td style="border-bottom-style: solid; border-bottom-width: 1px">
                            </td>
                            <td align="left" valign="bottom" 
                                style="border-bottom-style: solid; border-bottom-width: 1px">
                                <asp:Button ID="BtnIngr" runat="server" Font-Bold="True" Font-Names="Arial"
                                    Font-Size="8pt" OnClick="BtnIngr_Click" Text="Conectar..." Width="75px" 
                                    TabIndex="3" /></td>
                        </tr>
                    </table>
                    <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                        ForeColor="Red" Visible="False"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

