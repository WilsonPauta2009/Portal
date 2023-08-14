<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="InfCashManagement.aspx.cs" Inherits="InfCashManagement" Title="Informe: Empleados..." %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="#99CCFF" Text="Informe de Rol de Pagos: Entidad Financiera"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 35px" align="right" valign="middle">
                <ig:WebExcelExporter ID="weeData" runat="server" WorkbookFormat="Excel2007">
                </ig:WebExcelExporter>
                <asp:Button ID="BtnCerr" runat="server" CausesValidation="False" Font-Bold="True"
                    Font-Names="Arial Narrow" Font-Size="8pt" OnClick="BtnCerr_Click" TabIndex="1"
                    Text="Exportar a MS Excel" />
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" width="100%">
                <table width="90%" cellpadding="10" cellspacing="10">
                    <tr>
                        <td align="right" valign="top">
                            <table id="TabDato" border="0" cellpadding="0" cellspacing="5" bgcolor="White">
                                <tr>
                                    <th align="right" valign="top">
                                        <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial"
                                            Font-Size="8pt" Text="Identificacion :"></asp:Label>
                                    </th>
                                    <th align="left" valign="middle">
                                        <asp:Label ID="TxtIden" runat="server" Font-Bold="False"
                                            Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                    </th>
                                </tr>
                                <tr>
                                    <th align="right" valign="top">
                                        <asp:Label ID="LblFeIn" runat="server" Font-Bold="True" Font-Names="Arial"
                                            Font-Size="8pt" Text="Fecha Inicial :"></asp:Label>
                                    </th>
                                    <th align="left" style="height: 14px" valign="middle">
                                        <asp:Label ID="TxtFeIn" runat="server" Font-Bold="False"
                                            Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                    </th>
                                </tr>
                                <tr>
                                    <th align="right">
                                        <asp:Label ID="LblFeFn" runat="server" Font-Bold="True" Font-Names="Arial"
                                            Font-Size="8pt" Text="Fecha Final :"></asp:Label>
                                    </th>
                                    <th align="left">
                                        <asp:Label ID="TxtFeFn" runat="server" Font-Bold="False"
                                            Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                    </th>
                                </tr>
                            </table>
                        </td>
                        <td align="left" valign="top">
                            <ig:WebDataGrid ID="wdgCash" runat="server" Height="100%" Font-Names="Courier New" Font-Size="8pt" StyleSetName="ElectricBlue" EnableDataViewState="True">
                            </ig:WebDataGrid>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
</asp:Content>

