<%@ Page Language="C#" MasterPageFile="Plantilla.master" AutoEventWireup="true" CodeFile="LogUser.aspx.cs" Inherits="LogUser" Title="Identificación..." %>

<asp:Content ID="Content_Log" ContentPlaceHolderID="ContPlacHold" Runat="Server">    
    <!-- form id="frmLogUser" -->
        <asp:Panel ID="PnlLogUser" runat="server" DefaultButton="BtnIngr" Width="100%">
            <table id="Tab001" border="0" cellpadding="0" cellspacing="0" style="width:95%;" align="left">
                <tr>
                    <td align="right" valign="middle" colspan="0" dir="ltr" rowspan="0">
                        <table id="Tab002" border="0" cellpadding="3" cellspacing="0" style="width: 200px;">
                            <tr>
                                <td align="right" valign="middle" width="35%" style="border-top-style: solid; border-top-width: 1px">
                                    <asp:Label ID="LblUsua" runat="server" Text="Usuario :" Font-Bold="True" 
                                        Font-Names="Tahoma" Font-Size="9pt" ForeColor="#003399">
                                    </asp:Label>
                                </td>
                                <td align="left" valign="middle" style="border-top-style: solid; border-top-width: 1px">
                                    <asp:TextBox ID="TxtUsua" runat="server" Width="100px" Font-Names="Courier New" 
                                        Font-Size="10pt" CausesValidation="True" onfocus="this.style.background='#ffffcc'" 
                                        onblur="this.style.background='white'" ToolTip="nick del usuario">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RfvIden" runat="server" 
                                        ControlToValidate="TxtUsua" ErrorMessage="*" ForeColor="#8C272D">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="middle" width="35%">
                                    <asp:Label ID="LblClav" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                                        ForeColor="#003399" Text="Clave :">
                                    </asp:Label>
                                </td>
                                <td align="left" valign="middle">
                                    <asp:TextBox ID="TxtClav" runat="server" CausesValidation="True" Font-Names="Courier New"
                                        Font-Size="10pt" TextMode="Password" Width="100px" onfocus="this.style.background='#ffffcc'" 
                                        onblur="this.style.background='white'" ToolTip="clave del usuario">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RfvClav" runat="server" ControlToValidate="TxtClav"
                                        ErrorMessage="*" ForeColor="#8C272D">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="35%" style="border-bottom-style: solid; border-bottom-width: 1px">                                    
                                </td>
                                <td align="left" valign="bottom" 
                                    style="border-bottom-style: solid; border-bottom-width: 1px">
                                    <asp:Button ID="BtnIngr" runat="server" Font-Bold="True" Font-Names="Arial" 
                                        Font-Size="9pt" onclick="BtnIngr_Click" Text="Ingresar" 
                                        ClientIDMode="AutoID" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
       </asp:Panel> 
    <!-- /form -->
</asp:Content>