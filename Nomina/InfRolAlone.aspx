<%@ Page Title="Rol de pagos" Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="InfRolAlone.aspx.cs" Inherits="InfRolAlone" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="Infragistics45.WebUI.WebDataInput.v18.1, Version=18.1.20181.23, Culture=neutral, PublicKeyToken=7DD5C3163F2CD0CB" Namespace="Infragistics.WebUI.WebDataInput" TagPrefix="igtxt" %>

<script runat="server">
</script>

<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td style="height: 35px" align="right" valign="middle" bgcolor="#3C3C3C" width="100%">
                <table border="0.25px" style="width: 100%">
                    <tr>
                        <td align="center" valign="middle">
                            &nbsp;</td>
                        <td align="left" valign="middle">
                            <ig:WebDropDown ID="wddFech" runat="server" DisplayMode="DropDownList" StyleSetName="Windows7" Font-Names="Arial" Font-Size="8pt" Width="90px" AutoPostBack="True" OnSelectionChanged="wddFech_SelectionChanged">
                                <Items>
                                    <ig:DropDownItem Selected="False" Text="" Value="">
                                    </ig:DropDownItem>
                                </Items>
                            </ig:WebDropDown>
                        </td>
                        <td align="left" valign="middle">
                            <ig:WebDropDown ID="wddEmpl" runat="server" DisplayMode="DropDownList" Font-Names="Arial" Font-Size="8pt" Width="380px">
                                <Items>
                                    <ig:DropDownItem Selected="False" Text="" Value="">
                                    </ig:DropDownItem>
                                </Items>
                            </ig:WebDropDown>
                        </td>
                        <td align="center" valign="middle">
                            <igtxt:WebImageButton ID="wibRoIn" runat="server" CausesValidation="False" Text="Generar Rol" OnClick="wibRoIn_Click" UseBrowserDefaults="False">
                                <Alignments TextImage="TextRightImageLeft" />
                                <Appearance>
                                    <Image Height="48px" Url="../Imgs/png/select.png" />
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                    </ButtonStyle>
                                </Appearance>
                                <FocusAppearance>
                                    <ButtonStyle BackColor="#FCE6AB" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                    </ButtonStyle>
                                    <InnerBorder ColorBottom="0, 33, 27, 96" ColorLeft="0, 33, 27, 96" ColorRight="0, 33, 27, 96" ColorTop="0, 33, 27, 96" StyleBottom="Solid" StyleLeft="Solid" StyleRight="Solid" StyleTop="Solid" WidthBottom="1px" WidthLeft="1px" WidthRight="1px" WidthTop="1px" />
                                </FocusAppearance>
                                <HoverAppearance>
                                    <ButtonStyle BackColor="#F9DA9B" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                    </ButtonStyle>
                                    <InnerBorder ColorBottom="0, 33, 27, 96" ColorLeft="0, 33, 27, 96" ColorRight="0, 33, 27, 96" ColorTop="0, 33, 27, 96" StyleBottom="Solid" StyleLeft="Solid" StyleRight="Solid" StyleTop="Solid" WidthBottom="1px" WidthLeft="1px" WidthRight="1px" WidthTop="1px" />
                                </HoverAppearance>
                                <PressedAppearance ContentShift="None">
                                    <ButtonStyle BackColor="#F79646" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                    </ButtonStyle>
                                    <InnerBorder ColorBottom="0, 33, 27, 96" ColorLeft="0, 33, 27, 96" ColorRight="0, 33, 27, 96" ColorTop="0, 33, 27, 96" StyleBottom="Solid" StyleLeft="Solid" StyleRight="Solid" StyleTop="Solid" WidthBottom="1px" WidthLeft="1px" WidthRight="1px" WidthTop="1px" />
                                </PressedAppearance>
                                <DisabledAppearance>
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                    </ButtonStyle>
                                </DisabledAppearance>
                            </igtxt:WebImageButton>
                        </td>
                        <td align="center" valign="middle">
                            <igtxt:WebImageButton ID="wibRILo" runat="server" CausesValidation="False" Text="Generar Rol en LOTE" UseBrowserDefaults="False" OnClick="wibRILo_Click" Visible="False">
                                <Alignments TextImage="TextRightImageLeft" />
                                <Appearance>
                                    <Image Height="48px" Url="../Imgs/png/pdf.png" />
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                    </ButtonStyle>
                                </Appearance>
                                <FocusAppearance>
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BackColor="#FCE6AB">
                                    </ButtonStyle>
                                    <InnerBorder ColorBottom="0, 33, 27, 96" ColorLeft="0, 33, 27, 96" ColorRight="0, 33, 27, 96" ColorTop="0, 33, 27, 96" StyleBottom="Solid" StyleLeft="Solid" StyleRight="Solid" StyleTop="Solid" WidthBottom="1px" WidthLeft="1px" WidthRight="1px" WidthTop="1px" />
                                </FocusAppearance>
                                <HoverAppearance>
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BackColor="#F9DA9B">
                                    </ButtonStyle>
                                    <InnerBorder ColorBottom="0, 33, 27, 96" ColorLeft="0, 33, 27, 96" ColorRight="0, 33, 27, 96" ColorTop="0, 33, 27, 96" StyleBottom="Solid" StyleLeft="Solid" StyleRight="Solid" StyleTop="Solid" WidthBottom="1px" WidthLeft="1px" WidthRight="1px" WidthTop="1px" />
                                </HoverAppearance>
                                <PressedAppearance ContentShift="None">
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BackColor="#F79646">
                                    </ButtonStyle>
                                    <InnerBorder ColorBottom="0, 33, 27, 96" ColorLeft="0, 33, 27, 96" ColorRight="0, 33, 27, 96" ColorTop="0, 33, 27, 96" StyleBottom="Solid" StyleLeft="Solid" StyleRight="Solid" StyleTop="Solid" WidthBottom="1px" WidthLeft="1px" WidthRight="1px" WidthTop="1px" />
                                </PressedAppearance>
                                <DisabledAppearance>
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                    </ButtonStyle>
                                </DisabledAppearance>
                            </igtxt:WebImageButton>
                        </td>
                        <td align="center" valign="middle">
                            <igtxt:WebImageButton ID="wibCerr" runat="server" CausesValidation="False" Text="CERRAR" OnClick="wibCerr_Click" UseBrowserDefaults="False">
                                <Alignments TextImage="TextRightImageLeft" />
                                <Appearance>
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BackColor="Control" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px">
                                    </ButtonStyle>
                                </Appearance>
                                <FocusAppearance ContentShift="None">
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BorderColor="#909090">
                                    </ButtonStyle>
                                </FocusAppearance>
                                <HoverAppearance ContentShift="UpLeft">
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                        <BorderDetails ColorBottom="104, 104, 104" ColorLeft="248, 248, 248" ColorRight="104, 104, 104" ColorTop="248, 248, 248" />
                                    </ButtonStyle>
                                </HoverAppearance>
                                <PressedAppearance>
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                        <BorderDetails ColorBottom="248, 248, 248" ColorLeft="104, 104, 104" ColorRight="248, 248, 248" ColorTop="104, 104, 104" />
                                    </ButtonStyle>
                                </PressedAppearance>
                                <DisabledAppearance>
                                    <ButtonStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                    </ButtonStyle>
                                </DisabledAppearance>
                            </igtxt:WebImageButton>
                        </td>
                    </tr>
                </table>
                <asp:TextBox ID="TxtIden" runat="server" Visible="False">0</asp:TextBox>
                <asp:TextBox ID="TxtEsqu" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="TxtEmpl" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="RptView" runat="server" Width="100%"
                    Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Colección)"
                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="" PromptAreaCollapsed="True" BackColor="WhiteSmoke" SizeToReportContent="True">
                    <LocalReport ReportPath="Nomina\RepRolAlone.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ODts" Name="Dts_RolAlone" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ODts" runat="server"
                    SelectMethod="GetRolAloneActive" TypeName="ClsInfo" OldValuesParameterFormatString="original_{0}">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TxtEsqu" Name="pEsqu" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="TxtEmpl" Name="pEmpl" PropertyName="Text"
                            Type="String" />
                        <asp:ControlParameter ControlID="TxtIden" DefaultValue="0" Name="pIden" PropertyName="Text" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
</asp:Content>
