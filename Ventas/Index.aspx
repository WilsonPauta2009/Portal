<%@ Page Language="C#" MasterPageFile="~/PlantillaVentas.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="index" Title="Index..." %>
<asp:Content ID="CntIndex" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <asp:Panel ID="PnlLogUser" runat="server" DefaultButton="BtnIngr" Height="420px">
        <table id="Tab001" border="0" cellpadding="0" cellspacing="0" style="height: 100%">
            <tr>
                <td align="center" valign="middle" style="width: 340px">
                    <table id="Tab002" border="0" cellpadding="3" cellspacing="0" style="width: 340px;">
                        <caption>
                            <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt" ForeColor="Red" ViewStateMode="Enabled" Visible="False"></asp:Label>
                        </caption>
                        <tr>
                            <td align="right" valign="middle" style="border-top: 1px solid #FFFFFF; border-color: #003366; width: 107px;padding:2px">
                                <asp:Label ID="LblEmpr" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                                    ForeColor="#000066" Text="Empresa :"></asp:Label></td>
                            <td align="left" valign="middle" style="border-color: #003366; border-top-style: solid; border-top-width: 1px;padding:2px">
                                <asp:DropDownList ID="DdlEmpr" runat="server" Font-Bold="True" 
                                    Font-Names="Arial Narrow" Font-Size="8pt" Width="220px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="middle" style="width: 107px;padding:2px">
                                <asp:Label ID="LblUsua" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                                    ForeColor="#000066" Text="Identificación :"></asp:Label></td>
                            <td align="left" valign="middle" style="padding:2px">
                                <asp:TextBox ID="TxtUsua" runat="server" CausesValidation="True" Font-Names="Courier New"
                                    Font-Size="10pt" Width="110px" onfocus="this.style.background='#ffffcc'" 
                                    onblur="this.style.background='white'" TabIndex="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvIden" runat="server" ControlToValidate="TxtUsua"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="middle" style="width: 107px;padding:2px">
                                <asp:Label ID="LblClav" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                                    ForeColor="#000066" Text="Clave :"></asp:Label></td>
                            <td align="left" valign="middle" style="padding:2px">
                                <asp:TextBox ID="TxtClav" runat="server" CausesValidation="True" Font-Names="Courier New"
                                    Font-Size="10pt" TextMode="Password" Width="110px" TabIndex="2" 
                                    onfocus="this.style.background='#ffffcc'" 
                                    onblur="this.style.background='white'"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvClav" runat="server" ControlToValidate="TxtClav"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr >
                            <td style="border-bottom: 1px solid #FFFFFF; border-color: #003366; width: 107px;padding:2px">
                            </td>
                            <td align="left" valign="bottom" 
                                style="border-color: #003366; border-bottom-style: solid; border-bottom-width: 1px;padding:2px">
                                <asp:Button ID="BtnIngr" runat="server" Font-Bold="True" Font-Names="Arial"
                                    Font-Size="8pt" OnClick="BtnIngr_Click" Text="Conectar..." Width="75px" 
                                    TabIndex="3" /></td>
                        </tr>
                    </table>
                    </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

