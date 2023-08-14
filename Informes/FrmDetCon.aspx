<%@ Page Title="" Language="C#" MasterPageFile="~/PlantillaInformes.master" AutoEventWireup="true" CodeFile="FrmDetCon.aspx.cs" Inherits="FrmDetCon" %>





<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    
    <asp:UpdatePanel ID="upnl_datos" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnl_datos" runat="server" HorizontalAlign="Left" style="padding:5px" DefaultButton="btn_busca">
                        <asp:Label runat="server" ID="txtEmpr" style="display:none"></asp:Label>
                <table width="100%">
                    <tr align="left">
                        <td valign="top" width="90px">
                        <asp:Label runat="server" ID="lbl_FeIn" Text="Fecha Inicial: " style="vertical-align:middle; font-weight: 700;" Font-Names="Arial" Font-Size="8pt"></asp:Label></td>
                        <td width="250px">
                            <ig:WebDatePicker runat="server" ID="wdpFeIn" DropDownCalendarID="wmcFeIn" Culture="es-EC" Width="230px" DisplayModeFormat="MMM-dd-yyyy" Font-Names="Courier New" Font-Size="9pt" />
                            <ig:WebMonthCalendar runat="server" ID="wmcFeIn" Culture="es-EC" FooterContent="Hoy: {0:d}"
                                    EnableWeekNumbers="false"
                                    ChangeMonthToDateClicked="true" 
                                    EnableMonthDropDown="True"  
                                    EnableYearDropDown="True" NextPrevFormat="ShortMonth" Font-Names="Courier New" Font-Size="9pt">
                            </ig:WebMonthCalendar></td>
                        <td valign="top" width="90px">
                            <asp:Label runat="server" ID="lbl_FeFn" Text="Fecha Final: " style="font-weight: 700" Font-Names="Arial" Font-Size="8pt"></asp:Label></td>
                        <td width="250px">
                            <ig:WebDatePicker ID="wdpFeFn" DropDownCalendarID="wmcFeFn" runat="server" Width="230px" DisplayModeFormat="MMM-dd-yyyy" Culture="es-EC" Font-Names="Courier New" Font-Size="9pt"></ig:WebDatePicker>
                            <ig:WebMonthCalendar runat="server" ID="wmcFeFn" Culture="es-EC" FooterContent="Hoy: {0:d}"
                                    EnableWeekNumbers="false"
                                    ChangeMonthToDateClicked="true" 
                                    EnableMonthDropDown="True"  
                                    EnableYearDropDown="True" NextPrevFormat="ShortMonth" Font-Names="Courier New" Font-Size="9pt">
                            </ig:WebMonthCalendar></td>
                        <td align="right" valign="middle" width="100%"><asp:Button CssClass="btn btn-primary btn-xs" runat="server" ID="btn_busca" OnClick="btn_busca_Click" Text="Filtrar" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" /></td>
                    </tr>
                </table>
                <ig:WebTab ID="WebTabu" runat="server" width="100%" Height="100%" style="padding-top:5px;" Font-Bold="True" Font-Names="Arial" Font-Size="8pt">
                    <Tabs>
                        <ig:ContentTabItem runat="server" Text="Facturas">
                            <Template>
                                <rsweb:ReportViewer ID="RptViewFA" runat="server" Width="100%" style="margin-top:5px"
                                        Font-Names="Arial" Font-Size="8pt" BackColor="WhiteSmoke"
                                        ShowPrintButton="False" ShowRefreshButton="False"
                                        InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana"
                                        WaitMessageFont-Size="14pt" Height="" >

                                    <LocalReport ReportPath="Informes\InfDetCon.rdlc">
                                        <DataSources>
                                            <rsweb:ReportDataSource DataSourceId="ODS1" Name="DsDetCon" />
                                        </DataSources>
                                    </LocalReport>
                                </rsweb:ReportViewer>
                            </Template>
                        </ig:ContentTabItem>
                        <ig:ContentTabItem runat="server" Text="Notas De Crédito">
                            <Template>
                                <rsweb:ReportViewer ID="RptViewNC" runat="server" Width="100%" style="margin-top:5px"
                                        Font-Names="Verdana" Font-Size="8pt" BackColor="WhiteSmoke"
                                        ShowPrintButton="False" ShowRefreshButton="False"
                                        InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana"
                                        WaitMessageFont-Size="14pt" Height="" >
                                    <LocalReport ReportPath="Informes\InfDetConDC.rdlc">
                                        <DataSources>
                                            <rsweb:ReportDataSource DataSourceId="ODS2" Name="DsDetConDC" />
                                        </DataSources>
                                    </LocalReport>
                                </rsweb:ReportViewer>
                            </Template>
                        </ig:ContentTabItem>
                    </Tabs>
                </ig:WebTab>
                              


                <asp:ObjectDataSource ID="ODS1" runat="server" SelectMethod="GetDetCon" TypeName="ClsInfo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtEmpr" Name="pEmpr" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="wdpFeIn" Name="pFeIn" PropertyName="Value" Type="DateTime" />
                        <asp:ControlParameter ControlID="wdpFeFn" Name="pFeFn" PropertyName="Value" Type="DateTime" />
                        <asp:Parameter DefaultValue="A" Name="pStat" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                
                <asp:ObjectDataSource ID="ODS2" runat="server" SelectMethod="GetDetConDC" TypeName="ClsInfo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtEmpr" Name="pEmpr" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="wdpFeIn" Name="pFeIn" PropertyName="Value" Type="DateTime" />
                        <asp:ControlParameter ControlID="wdpFeFn" Name="pFeFn" PropertyName="Value" Type="DateTime" />
                        <asp:Parameter DefaultValue="A" Name="pStat" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
      </asp:UpdatePanel>
</asp:Content>

