<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="infMiscelaneos.aspx.cs" Inherits="infMiscelaneos" Title="Informes: MISCELANEOS..." %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="right" valign="middle" bgcolor="#3C3C3C" height="35px">
                <table style="width: 100%">
                    <tr>
                        <td align="center" valign="middle" width="34%">
                            <asp:DropDownList ID="ddlInfo" runat="server" Font-Names="Arial" Font-Size="8pt">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 33%" align="center" valign="middle">
                            <asp:Button ID="BtnExpo" runat="server" CausesValidation="False" Font-Bold="True"
                                Font-Names="Arial" Font-Size="8pt" OnClick="BtnExpo_Click" TabIndex="1"
                                Text="Exportar a MS Excel" />
                        </td>
                        <td align="center" valign="middle">
                            <asp:Button ID="BtnCerr" runat="server" CausesValidation="False" Font-Bold="True"
                                Font-Names="Arial" Font-Size="8pt" OnClick="BtnCerr_Click" TabIndex="7"
                                Text="CERRAR" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <ig:WebDataGrid ID="wdgEmpl" runat="server" Height="100%" Font-Names="Courier New" Font-Size="8pt" StyleSetName="Office2007Silver" EnableDataViewState="True">
                </ig:WebDataGrid>
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom">
                <ig:WebExcelExporter ID="weeData" runat="server" WorkbookFormat="Excel2007">
                </ig:WebExcelExporter>
            </td>
        </tr>
    </table>
</asp:Content>

