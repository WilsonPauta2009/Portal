<%@ Page Title="Ventas X Indices" Language="C#" MasterPageFile="~/PlantillaInformes.master" AutoEventWireup="true" CodeFile="FrmIndices.aspx.cs" Inherits="Informes_FrmIndices" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <asp:Panel ID="Pnl" runat="server" DefaultButton="BtnFilt">
        <table id="TabCont" border="0" cellpadding="0" cellspacing="0" style="width: 100%" bgcolor="White">
            <tr>
                <td align="center" bgcolor="#3C3C3C">
                    <table id="TabHead">
                        <tr>
                            <td align="left">
                                <table id="TabLeft" cellpadding="3" cellspacing="0">
                                    <tr>
                                        <td align="center" style="border-right-style: solid; border-width: 1px; border-color: #FFFFFF; border-bottom-style: solid;">
                                            <asp:Label ID="LblFeIn" runat="server" Font-Bold="True" Font-Names="Arial"
                                                Font-Size="8pt" ForeColor="White" Text="FECHA INICIAL"></asp:Label>
                                        </td>
                                        <td align="center"
                                            style="border-left: 1px solid #FFFFFF; border-right: 1px none #FFFFFF; border-top: 1px none #FFFFFF; border-bottom: 1px solid #FFFFFF; width: 162px;">
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
                                            style="border-left: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 162px; border-right-color: #FFFFFF; border-right-width: 1px; border-bottom-color: #FFFFFF; border-bottom-width: 1px;">
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
                            <td align="center" valign="middle" width="100%">
                                <table id="TabRubr" cellspacing="1" style="width: 100%" cellpadding="1">
                                <tr>
                                    <td align="left" valign="middle">
                                        <asp:RadioButton ID="RdoBtnLine" runat="server" AutoPostBack="True"
                                            Checked="True" Font-Names="Arial" Font-Size="8pt" GroupName="GrpRubr"
                                            Text="LINEA" ForeColor="#CCFFCC" />
                                    </td>
                                    <td align="left" valign="middle">
                                        <asp:RadioButton ID="RdoBtnSecc" runat="server" AutoPostBack="True"
                                            Font-Names="Arial" Font-Size="8pt" GroupName="GrpRubr"
                                            Text="SECCION" Visible="True" ForeColor="#CCFFCC" />
                                    </td>
                                    <td align="left" valign="middle">
                                        <asp:RadioButton ID="RdoBtnMarc" runat="server" AutoPostBack="True"
                                            Font-Names="Arial" Font-Size="8pt" GroupName="GrpRubr"
                                            Text="MARCA" Visible="True" ForeColor="#CCFFCC" />
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
                                <asp:Label ID="TxtIndi" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt" ForeColor="Black" Visible="False"></asp:Label>
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
                        Font-Names="Verdana" Font-Size="8pt" BackColor="WhiteSmoke"
                        ShowPrintButton="False" ShowRefreshButton="False"
                        InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana"
                        WaitMessageFont-Size="14pt" Height="100%">
                        <ServerReport DisplayName="Ventas_Totalizadas" Timeout="1000000"
                            ReportPath="/Informes/InfVentPrep"
                            ReportServerUrl="http://localhost/ReportServer" />
                        <LocalReport ReportPath="Informes\InfVentIndi.rdlc" DisplayName="Ventas_Indices">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ODts" Name="Tabu" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                </td>
            </tr>
            <tr>
                <td align="right" valign="bottom" height="10px">
                    <asp:ObjectDataSource ID="ODts" runat="server" SelectMethod="Inf_VentIndi" TypeName="ClsInfo">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TxtEmpr" Name="pEmpr" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="WdtFeIn" Name="pFeIn" PropertyName="Value" Type="DateTime" />
                            <asp:ControlParameter ControlID="WdtFeFn" Name="pFeFn" PropertyName="Value" Type="DateTime" />
                            <asp:ControlParameter ControlID="TxtIndi" Name="pIndi" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

