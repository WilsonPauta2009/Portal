<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="EmployType.aspx.cs" Inherits="EmployType" Title="EMPLEADOS: Tipos..." %>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" frame="void" width="100%">
        <tr>
            <td align="center" style="background-color: #3c3c3c">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True"
                    Font-Names="Arial Narrow" Font-Size="11pt"
                    ForeColor="#99CCFF" Text="Empleados: TIPO"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="100%">
                <table width="100%">
                    <tr>
                        <td align="center" valign="top">
                            <asp:GridView ID="GrdEmplType" runat="server" AutoGenerateSelectButton="True"
                                CellPadding="4" Font-Names="Arial" Font-Size="8pt" GridLines="Vertical"
                                ForeColor="Black" OnSelectedIndexChanged="GrdEmplType_SelectedIndexChanged"
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                                BorderWidth="1px" Width="100%" Height="100%">
                                <AlternatingRowStyle BackColor="White" />
                                <FooterStyle BackColor="#CCCC99" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"
                                    Font-Names="Arial" Font-Size="8pt" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </td>
                        <td align="center" valign="top">
                            <table id="TabMain" border="0" cellpadding="0" cellspacing="0" frame="below" bgcolor="White">
                                <tr>
                                    <td valign="top" align="center">
                                        <table id="TabDato" border="0" cellpadding="0" cellspacing="2">
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Código :"></asp:Label></th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtIden" runat="server" Columns="2" Font-Names="Arial" Font-Size="8pt"
                                                        MaxLength="2" TabIndex="1" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" BorderStyle="Inset" BorderWidth="1px" Width="25px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RfvCodi" runat="server" ControlToValidate="TxtIden"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator></th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblNomb" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Tipo :"></asp:Label></th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtNomb" runat="server" Columns="20" Font-Names="Arial" Font-Size="8pt"
                                                        MaxLength="20" TabIndex="2" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" BorderStyle="Inset" BorderWidth="1px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RfvNomb" runat="server" ControlToValidate="TxtNomb"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator></th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="top">
                                                    <asp:Label ID="LblObse" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Observaciones :"></asp:Label></th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtObse" runat="server" Columns="0" Font-Names="Arial" Font-Size="8pt"
                                                        MaxLength="100" Height="46px" TextMode="MultiLine" Width="180px" TabIndex="3" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" BorderStyle="Inset" BorderWidth="1px"></asp:TextBox></th>
                                            </tr>
                                        </table>
                                    </td>
                                    <td valign="top" bgcolor="#3C3C3C">
                                        <table id="TabBoto" border="0" cellpadding="5" cellspacing="2">
                                            <tr>
                                                <td style="width: 107px">
                                                    <asp:Button ID="BtnProc" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="PROCESAR" OnClick="BtnProc_Click" TabIndex="4" Width="105px" /></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 107px">
                                                    <asp:Button ID="BtnList" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Visualizar" OnClick="BtnList_Click" CausesValidation="False" TabIndex="5" Width="105px" /></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 107px">
                                                    <asp:Button ID="BtnCerr" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Cerrar" CausesValidation="False" OnClick="BtnCerr_Click" TabIndex="6" Width="105px" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center"
                style="border-top-style: ridge; border-top-width: 1px; border-bottom-width: 0px; border-bottom-style: none">
                <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                    ForeColor="DarkRed">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top"></td>
        </tr>
    </table>
</asp:Content>

