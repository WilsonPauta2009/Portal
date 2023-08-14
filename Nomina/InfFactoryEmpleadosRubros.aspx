<%@ Page Title="Rol de pagos" Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="InfFactoryEmpleadosRubros.aspx.cs" Inherits="InfFactoryEmpleadosRubros" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<script runat="server">
</script>

<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr bgcolor="#3C3C3C" style="height: 35px">
            <td align="center" valign="middle">
                <table id="TabCabe" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="center" valign="middle"></td>
                        <td align="center" valign="middle">
                            <ig:WebDropDown ID="wddFech" runat="server" DisplayMode="DropDownList" StyleSetName="Windows7" Font-Names="Arial" Font-Size="8pt" Width="90px" AutoPostBack="True" OnSelectionChanged="wddFech_SelectionChanged">
                                <Items>
                                    <ig:DropDownItem Selected="False" Text="" Value="">
                                    </ig:DropDownItem>
                                </Items>
                            </ig:WebDropDown>
                        </td>
                        <td align="center" valign="middle" width="50%">
                            <asp:Button ID="BtnCerr" runat="server" CausesValidation="False" Font-Bold="True"
                                Font-Names="Arial Narrow" Font-Size="8pt" OnClick="BtnCerr_Click" TabIndex="0" Text="CERRAR" />
                        </td>
                        <td align="center" valign="middle">
                            <asp:TextBox ID="txtEsqu" runat="server" Visible="False"></asp:TextBox>
                            <asp:TextBox ID="txtIden" runat="server" Visible="False">0</asp:TextBox>
                            <asp:Button ID="BtnCont" runat="server" CausesValidation="False" Font-Bold="True"
                                Font-Names="Arial Narrow" Font-Size="8pt" TabIndex="7" Text="Contabilización del ROL" OnClick="BtnCont_Click" ToolTip="Una vez Contabilizado, se cierra el ROL Actual y abre el periodo siguiente..." Visible="False" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadTabStrip ID="rtsData" runat="server" SelectedIndex="0" Skin="Metro" MultiPageID="rmpData" RenderMode="Mobile" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" AutoPostBack="True" CausesValidation="False">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="Rol De Pagos" Selected="True">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Rol De Provisiones">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>

            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadMultiPage ID="rmpData" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="9pt" Height="100%" RenderMode="Mobile" Width="100%" SelectedIndex="0">
                    <telerik:RadPageView ID="rpvRoPa" runat="server">
                        <rsweb:ReportViewer ID="rptRoPa" runat="server" BackColor="WhiteSmoke" Font-Names="Verdana" Font-Size="8pt" Height="100%" SizeToReportContent="True" SplitterBackColor="" ToolbarDividerColor="" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" AsyncRendering="False">
                            <LocalReport ReportPath="Nomina\RepFactoryEmpleadosRubros.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="ODts" Name="Dts_TabFactEmplRubr" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="rpvRoPr" runat="server">
                        <rsweb:ReportViewer ID="rptRoPr" runat="server" BackColor="WhiteSmoke" ClientIDMode="AutoID" Font-Names="Verdana" Font-Size="8pt" Height="100%" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SizeToReportContent="True" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" AsyncRendering="False">
                            <LocalReport ReportPath="Nomina\RepFactoryEmpleadosProvisiones.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="OTab" Name="Dts_TabFactEmplProv" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ODts" runat="server" SelectMethod="GetRolPagosActive" TypeName="ClsInfo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtEsqu" Name="pEsqu" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtIden" Name="pIden" PropertyName="Text" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="OTab" runat="server" SelectMethod="GetRolProvisionesActive" TypeName="ClsInfo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtEsqu" Name="wEsqu" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtIden" Name="wIden" PropertyName="Text" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
