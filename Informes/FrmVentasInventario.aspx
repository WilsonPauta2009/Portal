<%@ Page Title="Ventas || Items || Inventario" Language="C#" MasterPageFile="~/PlantillaInformes.master" AutoEventWireup="true" CodeFile="FrmVentasInventario.aspx.cs" Inherits="FrmVentasInventario" %>


<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <asp:Panel ID="Pnl" runat="server" DefaultButton="BtnFilt">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" style="width: 100%" bgcolor="White">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <table id="TabHead">
                    <tr>
                        <td align="left">
                            <table id="TabLeft" cellpadding="3" cellspacing="0" class="style1" 
                                style="width: 42%">
                                <tr>
                                    <td align="center" style="border-right-style: solid; border-width: 1px; border-color: #FFFFFF; border-bottom-style: solid;">
                                        <asp:Label ID="LblFeIn" runat="server" Font-Bold="True" Font-Names="Arial" 
                                            Font-Size="8pt" ForeColor="White" Text="FECHA INICIAL"></asp:Label>
                                    </td>
                                    <td align="center" 
                                        
                                        style="border-color: #FFFFFF; border-style: none none solid solid; border-width: 1px;">
                                        <asp:Label ID="LblFeFn" runat="server" Font-Bold="True" Font-Names="Arial" 
                                            Font-Size="8pt" ForeColor="White" Text="FECHA FINAL"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="border-top-style: solid; border-right-style: solid; border-width: 1px; border-color: #FFFFFF">
                                        <table id="TFeIn" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 75px">
                                                    <ig:WebDateTimeEditor ID="WdtFeIn" runat="server" EditModeFormat="dd/MM/yyyy" 
                                                        Font-Names="Courier New" Font-Size="9pt" Width="75px" 
                                                        onfocus="this.style.background='#ffffcc'" 
                                                        onblur="this.style.background='white'">
                                                    </ig:WebDateTimeEditor>
                                                </td>
                                                <td style="width: 10px">
                                                    <asp:RequiredFieldValidator ID="RfvFeIn" runat="server" ControlToValidate="WdtFeIn"
                                                    ErrorMessage="*" Width="10px" ForeColor="White"></asp:RequiredFieldValidator>
                                                </td>
                                                <td style="width: 80px" align="center">
                                                    <asp:Label ID="ForFeIn" runat="server" Font-Bold="True" 
                                                        Font-Names="Courier New" Font-Size="8pt"
                                                    ForeColor="White" Text="dd/MM/aaaa"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="center" style="border-left-style: solid; border-width: 1px; border-color: #FFFFFF; border-top-style: solid;">
                                        <table id="TFeFn" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 75px">
                                                    <ig:WebDateTimeEditor ID="WdtFeFn" runat="server" EditModeFormat="dd/MM/yyyy" 
                                                        Font-Names="Courier New" Font-Size="9pt" Width="75px" 
                                                        onfocus="this.style.background='#ffffcc'" 
                                                        onblur="this.style.background='white'">
                                                    </ig:WebDateTimeEditor>
                                                </td>
                                                <td style="width: 10px">
                                                    <asp:RequiredFieldValidator ID="RfvFeFn" runat="server" ControlToValidate="WdtFeFn"
                                                    ErrorMessage="*" Width="10px" ForeColor="White"></asp:RequiredFieldValidator>
                                                </td>
                                                <td style="width: 80px" align="center">
                                                    <asp:Label ID="ForFeFn" runat="server" Font-Bold="True" 
                                                        Font-Names="Courier New" Font-Size="8pt"
                                                    ForeColor="White" Text="dd/MM/aaaa"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="left" width="100%">
                            <table id="TabRubr" cellspacing="1" style="width: 100%" cellpadding="1">
                                <tr>
                                    <td align="left" valign="middle" style="height: 23px">
                                        <asp:Label ID="LblCate" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" Text="SECCIONES :" ForeColor="#CCFFCC"></asp:Label>
                                    </td>
                                    <td align="left" valign="middle" style="height: 23px">
                                        <asp:Label ID="LblLine" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" Text="LINEAS :" ForeColor="#CCFFCC"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="middle">
                                        <asp:DropDownList ID="WebSecu" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="280px">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="left" valign="middle">
                                        <asp:DropDownList ID="WebLine" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="280px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>                        
                        <td align="right">
                            <asp:Label ID="TxtEmpr" runat="server" Font-Bold="True" 
                                Font-Names="Courier New" Font-Size="8pt"
                            ForeColor="Black" Visible="False"></asp:Label>
                            <asp:Label ID="TxtUsua" runat="server" Font-Bold="True" 
                                Font-Names="Courier New" Font-Size="8pt"
                            ForeColor="Black" Visible="False"></asp:Label>
                                <asp:Label ID="TxtSecu" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt" ForeColor="Black" Visible="False"></asp:Label>
                            <asp:Label ID="TxtLine" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt" ForeColor="Black" Visible="False"></asp:Label>
                                <asp:Button ID="BtnFilt" runat="server" Font-Bold="True" Font-Names="Arial" 
                                Font-Size="8pt" Text="Filtrar" onclick="BtnFilt_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="RptView" runat="server" Width="100%" 
                    Font-Names="Verdana" Font-Size="8pt" BackColor="WhiteSmoke" 
                    ShowPrintButton="False" ShowRefreshButton="False" 
                    InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana" 
                    WaitMessageFont-Size="14pt" Height="100%">
                    <ServerReport DisplayName="Ventas_Gastos" Timeout="1000000" />
                    <LocalReport ReportPath="Informes\InfVentasInventario.rdlc" 
                        DisplayName="Ventas_Items_Inventario">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ODts" Name="DtsInfo" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom" height="10px">
                <asp:ObjectDataSource ID="ODts" runat="server" SelectMethod="Inf_VentInve" 
                    TypeName="ClsInfo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TxtEmpr" 
                            Name="pEmpr" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtSecu" Name="pSecu" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtLine" Name="pLine" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="WdtFeIn" Name="pFeIn" PropertyName="Value" Type="DateTime" />
                        <asp:ControlParameter ControlID="WdtFeFn" Name="pFeFn" PropertyName="Value" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>

