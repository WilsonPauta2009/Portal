<%@ Page Title="Ventas X Presupuesto" Language="C#" MasterPageFile="~/PlantillaInformes.master" AutoEventWireup="true" CodeFile="FrmVentasPresupuestos.aspx.cs" Inherits="FrmVentasPresupuestos" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>



<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <asp:Panel ID="Pnl" runat="server" DefaultButton="BtnFilt">
        <table id="TabCont" border="0" cellpadding="0" cellspacing="0" style="width: 100%" bgcolor="White">
            <tr>
                <td align="center" bgcolor="#3C3C3C">
                    <table id="TabHead">
                        <tr>
                            <td align="left">
                                <table id="TabLeft" cellpadding="3" cellspacing="0" style="width: 42%">
                                    <tr>
                                        <td align="center"
                                            style="border-right-style: solid; border-width: 1px; border-color: #FFFFFF; border-bottom-style: solid;">
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
                                        <td align="center"
                                            style="border-top-style: solid; border-right-style: solid; border-width: 1px; border-color: #FFFFFF">
                                            <table id="TFeIn" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 75px">
                                                        <ig:WebDateTimeEditor ID="WdtFeIn" runat="server" EditModeFormat="dd/MM/yyyy"
                                                            Font-Names="Courier New" Font-Size="9pt" Width="75px"
                                                            onfocus="this.style.background='#ffffcc'"
                                                            onblur="this.style.background='white'" TabFrmPresupuestos="5">
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
                                        <td align="center"
                                            style="border-left-style: solid; border-width: 1px; border-color: #FFFFFF; border-top-style: solid;">
                                            <table id="TFeFn" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 75px">
                                                        <ig:WebDateTimeEditor ID="WdtFeFn" runat="server" EditModeFormat="dd/MM/yyyy"
                                                            Font-Names="Courier New" Font-Size="9pt" Width="75px"
                                                            onfocus="this.style.background='#ffffcc'"
                                                            onblur="this.style.background='white'" TabFrmPresupuestos="5">
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
                            <td align="left" valign="middle">
                                <asp:RadioButtonList ID="rdoBtnTipo" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#CCFFCC" OnSelectedIndexChanged="rdoBtnTipo_SelectedIndexChanged" Width="177px">
                                    <asp:ListItem Value="PREP" Selected="True">PRESUPUESTO / Rendimiento</asp:ListItem>
                                    <asp:ListItem Value="COST">COSTO / Utilidad</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td align="center" valign="middle" width="100%">
                                <table id="TabRubr" cellspacing="0" cellpadding="5">
                                    <tr>
                                        <td align="left" valign="middle" style="height: 17px">
                                            <asp:Label ID="LblTipo" runat="server" Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" Text="Agrupado por :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                        <td align="left" valign="middle" style="height: 17px">
                                            <asp:Label ID="LblVent" runat="server" Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" Text="VENTAS :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                        <td align="left" valign="middle" style="height: 17px">
                                            <asp:Label ID="LblLine" runat="server" Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" Text="LINEAS :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="middle">
                                            <asp:DropDownList ID="WebTipo" runat="server" Width="200px" Font-Names="Courier New" Font-Size="9pt">
                                                <asp:ListItem Value="AREA">Bodega \ Almacen</asp:ListItem>
                                                <asp:ListItem Value="ZONA">Zona</asp:ListItem>
                                                <asp:ListItem Value="CLIE">Cliente</asp:ListItem>
                                                <asp:ListItem Value="MARC">Marca</asp:ListItem>
                                                <asp:ListItem Value="VEND">Vendedor</asp:ListItem>
                                                <asp:ListItem Value="BOCL">Bodega \ Almacen - Cliente</asp:ListItem>
                                                <asp:ListItem Value="ZOCL">Zona - Cliente</asp:ListItem>
                                                <asp:ListItem Value="ZOVE">Zona - Vendedor</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" valign="middle">
                                            <asp:DropDownList ID="WebVent" runat="server" Width="130px" Font-Names="Courier New" Font-Size="9pt">
                                                <asp:ListItem Value="%">[ Total ]</asp:ListItem>
                                                <asp:ListItem Value="MAY">Mayoreo</asp:ListItem>
                                                <asp:ListItem Value="RET">Retail</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" valign="middle" width="100%">
                                            <asp:DropDownList ID="WebLine" runat="server" Width="280px" Font-Names="Courier New" Font-Size="9pt">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" width="80px">
                                <asp:Label ID="TxtEmpr" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False"></asp:Label>
                                <asp:Label ID="TxtUsua" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False"></asp:Label>
                                <asp:Label ID="TxtLine" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt" ForeColor="Black" Visible="False"></asp:Label>
                                <asp:Label ID="TxtTipo" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt" ForeColor="Black" Visible="False"></asp:Label>
                                <asp:Label ID="TxtVent" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt" ForeColor="Black" Visible="False"></asp:Label>
                                <asp:Label ID="TxtLeye" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt" ForeColor="Black" Visible="False"></asp:Label>
                                <asp:Label ID="TxtTiRe" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt" ForeColor="Black" Visible="False"></asp:Label>
                                <asp:Button ID="BtnFilt" runat="server" Font-Bold="True" Font-Names="Arial"
                                    Font-Size="8pt" Text="Filtrar" OnClick="BtnFilt_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <rsweb:ReportViewer ID="RptView" runat="server" Width="100%"
                        Font-Names="Verdana" Font-Size="8pt" BackColor="#CCCCCC"
                        ShowPrintButton="False" ShowRefreshButton="False"
                        InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana"
                        WaitMessageFont-Size="14pt" Height="100%">
                        <ServerReport DisplayName="Ventas_Totalizadas" Timeout="1000000"
                            ReportPath="/Informes/InfVentPrep"
                            ReportServerUrl="http://localhost/ReportServer" />
                        <LocalReport ReportPath="Informes\InfVentPrep.rdlc"
                            DisplayName="Ventas_x_Presupuestos">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ODts" Name="DtsInfo" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                </td>
            </tr>
            <tr>
                <td align="right" valign="bottom" height="10px">
                    <asp:ObjectDataSource ID="ODts" runat="server" SelectMethod="Inf_VentPrep"
                        TypeName="ClsInfo">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TxtEmpr" Name="pEmpr" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TxtUsua" Name="pUsua" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="WdtFeIn" Name="pFeIn" PropertyName="Value" Type="DateTime" />
                            <asp:ControlParameter ControlID="WdtFeFn" Name="pFeFn" PropertyName="Value" Type="DateTime" />
                            <asp:ControlParameter ControlID="TxtLine" Name="pLine" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TxtTipo" Name="pTipo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TxtVent" Name="pVent" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TxtLeye" Name="pLeye" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TxtTiRe" Name="pTiRe" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

