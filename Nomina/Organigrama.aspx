<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="Organigrama.aspx.cs" Inherits="Organigrama" Title="Organigrama..." %>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" id="TabCont" frame="void" width="100%">
        <tr>
            <td align="center" style="background-color: #3C3C3C" height="31px" valign="middle">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="#99CCFF" Text="ORGANIGRAMA"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <table border="1" cellpadding="0" cellspacing="0" style="width: 100%;" id="TabCent" frame="void">
                    <tr>
                        <td valign="top" align="left" bgcolor="WhiteSmoke" style="width: 100%">
                            <ig:WebDataTree ID="uwtOrga" runat="server" DefaultImage="ig_treeFolder.gif" Font-Names="Arial Narrow"
                                Font-Size="8pt" HoverClass="" Indentation="20"
                                Width="100%" OnNodeClicked="UwtOrga_NodeClicked"
                                DefaultSelectedImage="ig_treeFolderOpen.gif" FileUrl="" TargetFrame=""
                                TargetUrl="" WebTreeTarget="ClassicTree" Font-Bold="True"
                                OnNodeClick="UwtOrga_NodeClick"
                                StyleSetName="Windows7" Height="100%">
                                <AutoPostBackFlags NodeClick="On" />
                            </ig:WebDataTree>
                        </td>
                        <td valign="top">
                            <table id="TabDato" border="0" cellpadding="0" cellspacing="0" width="310px">
                                <tr>
                                    <td>
                                        <asp:Panel ID="PnlUpda" runat="server" DefaultButton="BtnUpda">
                                            <asp:UpdatePanel ID="udpActu" runat="server" UpdateMode="Always">
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="uwtOrga" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <table id="TabSele" border="0" cellpadding="0" cellspacing="3" width="100%">
                                                        <tr>
                                                            <td align="right" valign="middle">
                                                                <asp:Label ID="LblSeCo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                                    Text="Código :"></asp:Label></td>
                                                            <td align="center" valign="middle">
                                                                <asp:Label ID="TxtSeCo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" ForeColor="#0000C0"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="middle">
                                                                <asp:Label ID="LblSele" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                                    Text="Seleccionado :">
                                                                </asp:Label>
                                                            </td>
                                                            <td align="left" valign="middle">
                                                                <asp:TextBox ID="TxtSele" runat="server" Font-Names="Arial" Font-Size="8pt" Width="170px" BorderStyle="Inset" BorderWidth="1px" MaxLength="35"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RfvSele" runat="server" ControlToValidate="TxtSele"
                                                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td align="left">
                                                                <asp:Button ID="BtnUpda" runat="server" Text="Actualizar..." Font-Bold="True" Font-Names="Arial" Font-Size="8pt" CausesValidation="False" OnClick="BtnUpda_Click" /></td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 25px" valign="middle" bgcolor="#3C3C3C" align="center">
                                        <asp:Label ID="LblDato" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                            ForeColor="White" Text="DATOS (Agregar)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Panel ID="PnlItem" runat="server" DefaultButton="BtnAgre" Enabled="False">
                                            <table id="TabItem" border="0" cellpadding="0" cellspacing="3" style="background-color: gainsboro" width="100%">
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="LblCodi" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Código :"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TxtCodi" runat="server" Columns="3" Font-Names="Arial" Font-Size="8pt" Width="30px" BorderStyle="Ridge" BorderWidth="1px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RfvCodi" runat="server" ErrorMessage="*" ControlToValidate="TxtCodi"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="LblNomb" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Nombre :"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TxtNomb" runat="server" Columns="30" Font-Names="Arial" Font-Size="8pt" Width="190px" BorderStyle="Ridge" BorderWidth="1px" MaxLength="35"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RfvNomb" runat="server" ErrorMessage="*" ControlToValidate="TxtNomb"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="lblCoSe" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Código Sectorial :"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="middle">
                                                        <asp:DropDownList ID="ddlCoSe" runat="server" Font-Names="Courier New" Font-Size="8pt" Width="100%">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="height: 17px">&nbsp;</td>
                                                    <td align="left" style="height: 17px" valign="middle">
                                                        <asp:Label ID="lblCoSe0" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt" ForeColor="#003366" Text="txtCoSe"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" bgcolor="#3C3C3C">
                            <table id="TabBoto" border="0" cellpadding="5" cellspacing="2">
                                <tr>
                                    <td>
                                        <asp:Button ID="BtnAgre" runat="server" Text="Agregar" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" OnClick="BtnAgre_Click" CausesValidation="False" Width="70px" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="BtnCerr" runat="server" Text="Cerrar" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" CausesValidation="False" OnClick="BtnCerr_Click" Width="70px" /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center"
                style="border-top-width: 1px; border-bottom-width: 1px; border-top-style: ridge; border-bottom-style: outset" bgcolor="White">
                <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" ForeColor="#C00000"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

