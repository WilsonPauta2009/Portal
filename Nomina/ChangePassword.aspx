<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" Title="Cambio de Password..." %>
<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <table id="TabCent" border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" bgcolor="White">
        <tr>
            <td align="center" valign="middle">
                <table id="TabCont" border="1" cellpadding="0" cellspacing="0" align="center" style="width: 230px">
                    <tr>
                        <td align="center" style="height: 22px;" bgcolor="WhiteSmoke">
                            <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                                Font-Size="11pt" ForeColor="#000066" Text="Cambio de Password"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Panel ID="PnlEmpl" runat="server" DefaultButton="BtnProc">
                                <table id="TabDato" border="0" cellpadding="0" cellspacing="5" 
                                    style="width: 187px">
                                    <tr>
                                        <th align="right" style="background-color: black; width: 63px;" valign="middle">
                                            <asp:Label ID="LblActu" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                ForeColor="Cyan" Text="Actual :"></asp:Label></th>
                                        <th align="left" valign="middle">
                                            <asp:TextBox ID="TxtActu" runat="server" Columns="10" Font-Names="Arial" Font-Size="8pt"
                                                MaxLength="10" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                TabIndex="1" TextMode="Password" Width="85px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RfvActu" runat="server" ControlToValidate="TxtActu"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </th>
                                    </tr>
                                    <tr>
                                        <th align="right" style="background-color: black; width: 63px;" valign="middle">
                                            <asp:Label ID="LblNuev" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                ForeColor="Cyan" Text="Nuevo :"></asp:Label></th>
                                        <th align="left" valign="middle">
                                            <asp:TextBox ID="TxtNuev" runat="server" Columns="10" Font-Names="Arial" Font-Size="8pt"
                                                MaxLength="10" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                TabIndex="2" TextMode="Password" Width="85px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RfvNuev" runat="server" ControlToValidate="TxtNuev"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></th>
                                    </tr>
                                    <tr>
                                        <th align="right" style="background-color: black; width: 63px; height: 22px;" valign="middle">
                                            <asp:Label ID="LblConf" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                ForeColor="Cyan" Text="Confirmar :"></asp:Label></th>
                                        <th align="left" valign="middle" style="height: 22px">
                                            <asp:TextBox ID="TxtConf" runat="server" Columns="10" Font-Names="Arial" Font-Size="8pt"
                                                MaxLength="10" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                TabIndex="3" TextMode="Password" Width="85px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RfvConf" runat="server" ControlToValidate="TxtConf"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></th>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td align="center" style="height: 22px">
                                        <asp:Button ID="BtnProc" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                                            Font-Size="8pt" TabIndex="4" Text="CONFIRMAR" OnClick="BtnProc_Click" />
                                    </td>
                                    <td align="center" style="height: 22px">
                                        <asp:Button ID="BtnCerr" runat="server" CausesValidation="False" Font-Bold="True"
                                            Font-Names="Arial Narrow" Font-Size="8pt" TabIndex="5"
                                            Text="CERRAR" OnClick="BtnCerr_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                ForeColor="DarkRed"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

