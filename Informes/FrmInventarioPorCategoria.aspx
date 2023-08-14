<%@ Page Title="Ventas totalizadas" Language="C#" MasterPageFile="~/PlantillaInformes.master" AutoEventWireup="true" CodeFile="FrmInventarioPorCategoria.aspx.cs" Inherits="InventarioPorCategoria" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<script runat="server">
</script>

<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <asp:Panel ID="Pnl" runat="server" DefaultButton="BtnFilt">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="center" style="border-top-style: groove; border-bottom-style: groove; border-top-width: 1px; border-bottom-width: 1px">
                <table id="TabHead" class="style1">
                    <tr>
                        <td align="left" style="width: 100%">
                            <table id="TabLeft" cellpadding="3" cellspacing="0" class="style1" 
                                style="width: 34%" bgcolor="#CCCCCC">
                                <tr>
                                    <td align="left" style="border-right-style: solid; border-width: 1px; border-color: #FFFFFF; border-bottom-style: solid;">
                                        <asp:Label ID="LblFeIn" runat="server" Font-Bold="True" Font-Names="Arial" 
                                            Font-Size="8pt" ForeColor="Black" Text="CATEGORIAS :"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="border-top-style: solid; border-right-style: solid; border-width: 1px; border-color: #FFFFFF">
                                        <asp:DropDownList ID="DdlCate" runat="server" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt" Width="224px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="right">
                                        <asp:Label ID="TxtCate" runat="server" Font-Bold="True" 
                                            Font-Names="Courier New" Font-Size="8pt" ForeColor="Black" Visible="False"></asp:Label>
                                        <asp:Label ID="TxtEmpr" runat="server" Font-Bold="True" 
                                            Font-Names="Courier New" Font-Size="8pt"
                                        ForeColor="Black" Visible="False"></asp:Label>
                                        <asp:Label ID="TxtUsua" runat="server" Font-Bold="True" 
                                            Font-Names="Courier New" Font-Size="8pt"
                                        ForeColor="Black" Visible="False"></asp:Label>
                                            <asp:Button ID="BtnFilt" runat="server" Font-Bold="True" Font-Names="Arial" 
                                            Font-Size="8pt" Text="Filtrar" onclick="BtnFilt_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="SptMana" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="RptView" runat="server" BackColor="WhiteSmoke" 
                    Font-Names="Verdana" Font-Size="8pt" ShowPrintButton="False" 
                    ShowRefreshButton="False" Width="100%">
                    <ServerReport DisplayName="Inventario_Categoria" Timeout="1000000" />
                    <LocalReport DisplayName="Inventario_Categoria" 
                        ReportPath="Informes\InfInventarioCategoria.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ODts" Name="Dts_TabItem" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom" height="10px">
                <asp:ObjectDataSource ID="ODts" runat="server" 
                    SelectMethod="InventarioByCategoria" TypeName="ClsInfo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TxtEmpr" Name="pEmpr" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="TxtCate" Name="pCate" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>

