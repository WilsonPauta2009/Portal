<%@ Page Title="CLIENTES: Estado de Cuenta..." Language="C#" MasterPageFile="~/PlantillaInformes.master" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<script runat="server">
    ClsInfo Info = new ClsInfo();
    static System.Data.DataTable Tabu = new System.Data.DataTable();
    private int exportedRows = 0;

    protected void Btn_Click(object sender, EventArgs e)
    {
        if (txtIden.Text.Trim().Length == 0) TxtInte.Text = "%"; else TxtInte.Text = txtIden.Text.ToUpper();
        if (txtRefe.Text.Trim().Length == 0) TxtVent.Text = "%"; else TxtVent.Text = txtRefe.Text.ToUpper();
        if (txtData.Text.Trim().Length == 0) TxtDatu.Text = "%"; else TxtDatu.Text = txtData.Text.ToUpper();

        TxtCart.Text = ddlCart.SelectedValue;
        TxtDivi.Text = ddlDivi.SelectedValue;
        TxtTiVe.Text = ddlTipo.SelectedValue;
        TxtDocu.Text = ddlDocu.SelectedValue;

        RptView.LocalReport.Refresh();
        
        // Tabu = (System.Data.DataTable)RptView.LocalReport.DataSources[0].Value;
        wdgEstado.DataSource = ODts;
        wdgEstado.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WdtFeIn.Value = DateTime.Now;
            TxtEmpr.Text = ClsDatos.mEmpr;
            Info.GetCarteraDocumentos(ddlDocu, TxtEmpr.Text, "%", "%");
            TxtInte.Text = "%";
        }
    }

    protected void RdoBtnTipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        TxtCual.Text = RdoBtnTipo.SelectedValue;
    }

    protected void ddlDivi_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlTipo_SelectedIndexChanged(null, null);
    }

    protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        Info.GetCarteraDocumentos(ddlDocu, TxtEmpr.Text, ddlDivi.SelectedValue, ddlTipo.SelectedValue);
    }

    private void Export()
    {
        string fileName = HttpUtility.UrlEncode("EstadoDeCuentas");
        // fileName = fileName.Replace("+", "%20");
        fileName = HttpUtility.UrlDecode(fileName);
        //this.eExporter.DownloadName = fileName;
        //this.eExporter.Export(wdgEstado);
    }

    //protected void eExporter_Exported(object sender, ExcelExportedEventArgs e)
    //{
    //    exportedRows++;
    //}

    private void ExportXLS()
    {
        string fileName = HttpUtility.UrlEncode("CuentasXCobrar");
        fileName = fileName.Replace("+", "%20");
        fileName = HttpUtility.UrlDecode(fileName);
        this.WEE.WorkbookFormat = Infragistics.Documents.Excel.WorkbookFormat.Excel2007;
        this.WEE.DownloadName = fileName;
        this.WEE.DataExportMode = DataExportMode.DataInGridOnly;
        this.WEE.Export(wdgEstado);
    }
    
    protected void Exp_Click(object sender, ImageClickEventArgs e)
    {
        ExportXLS();
        //wdgEstado.DataSource = ODts;
        //wdgEstado.DataBind();
        ////Export();
        //if (wdgEstado.Rows.Count > 0)
        //{
        //    string fileName = HttpUtility.UrlEncode("EstadoDeCuentas.xlsx");
        //    fileName = fileName.Replace("+", "%20");
        //    fileName = HttpUtility.UrlDecode(fileName);

        //    WEE.DownloadName = fileName;
        //    WEE.DataExportMode = DataExportMode.DataInGridOnly;
        //    WEE.WorkbookFormat = Infragistics.Documents.Excel.WorkbookFormat.Excel2007;
        //    // Dtg.Rows.CreateRecord();
        //    // ControlDataRecord rFila = new ControlDataRecord();
        //    // rFila.Items[0].Value = "wilson.pauta@yahoo.com";
        //    // Dtg.Rows.Add(rFila);
        //    WEE.Export(false, wdgEstado);
        //}
    }

    protected void WEE_Exported(object sender, ExcelExportedEventArgs e)
    {
        exportedRows++;
    }
</script>

<asp:Content ID="CntMAIN" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%" bgcolor="White" class="table">
        <tr>
            <td align="left" bgcolor="#3C3C3C">
                <asp:Panel ID="Pnl" runat="server" DefaultButton="Btn">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table id="TabLeft" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center"
                                            style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #FFFFFF;">
                                            <asp:Label ID="LblFeIn" runat="server" Font-Bold="True" Font-Names="Arial"
                                                Font-Size="8pt" ForeColor="White" Text="FECHA de CORTE" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <table id="TFeIn" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 75px; height: 22px;">
                                                        <ig:WebDateTimeEditor ID="WdtFeIn" runat="server" EditModeFormat="dd/MM/yyyy"
                                                            Font-Names="Courier New" Font-Size="9pt" Width="75px"
                                                            onfocus="this.style.background='#ffffcc'"
                                                            onblur="this.style.background='white'" TabFrmPresupuestos="5" Visible="False">
                                                        </ig:WebDateTimeEditor>
                                                    </td>
                                                    <td style="width: 10px; height: 22px;">
                                                        <asp:RequiredFieldValidator ID="RfvFeIn" runat="server" ControlToValidate="WdtFeIn"
                                                            ErrorMessage="*" Width="10px" ForeColor="White" Visible="False"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td style="width: 80px; height: 22px;" align="center">
                                                        <asp:Label ID="ForFeIn" runat="server" Font-Bold="True"
                                                            Font-Names="Courier New" Font-Size="8pt"
                                                            ForeColor="White" Text="dd/MM/aaaa" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RdoBtnTipo" runat="server" Font-Names="Arial" Font-Size="8pt" OnSelectedIndexChanged="RdoBtnTipo_SelectedIndexChanged" Width="166px" Font-Bold="True" ForeColor="#99CCFF" CssClass="list-group">
                                    <asp:ListItem Value="D">Detallado x Dividendos</asp:ListItem>
                                    <asp:ListItem Value="A" Selected="True">Totalizado x Ventas</asp:ListItem>
                                    <asp:ListItem Value="V">Dividendos / Vendedor</asp:ListItem>
                                    <asp:ListItem Value="E">Totalizado x Vendedor</asp:ListItem>
                                    <asp:ListItem Value="C">Totalizado x Cliente</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td width="100%">
                                <table cellpadding="1" cellspacing="1" width="100%">
                                    <tr>
                                        <td align="left" valign="middle">
                                            <asp:Label ID="lblTit0" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="CARTERA :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                        <td align="left" valign="middle">
                                            <asp:Label ID="lblTit2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="VENTAS :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                        <td valign="middle" align="left"></td>
                                        <td align="left" valign="middle">
                                            <asp:Label ID="lblTit4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="REFERENCIA (Factura) :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="left">
                                            <asp:DropDownList ID="ddlCart" runat="server" Font-Names="Courier New" Font-Size="8pt" Width="161px">
                                                <asp:ListItem Value="%">[ Total ]</asp:ListItem>
                                                <asp:ListItem Value="CN" Selected="True">Vigente</asp:ListItem>
                                                <asp:ListItem Value="EE">Empleados</asp:ListItem>
                                                <asp:ListItem Value="GE">Grupo ELJURI</asp:ListItem>
                                                <asp:ListItem Value="FE">Familia ELJURI</asp:ListItem>
                                                <asp:ListItem Value="MM">Motos y Motos</asp:ListItem>
                                                <asp:ListItem Value="CA">Castigada</asp:ListItem>
                                                <asp:ListItem Value="FL">Faltantes</asp:ListItem>
                                                <asp:ListItem Value="LG">Legal</asp:ListItem>
                                            </asp:DropDownList>

                                        </td>
                                        <td valign="top" align="left">
                                            <asp:DropDownList ID="ddlTipo" runat="server" Font-Names="Courier New" Font-Size="8pt" Width="161px" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged" AutoPostBack="True">
                                                <asp:ListItem Value="%">[ Todas ]</asp:ListItem>
                                                <asp:ListItem Value="MAY">Mayoreo</asp:ListItem>
                                                <asp:ListItem Value="RET">Retail</asp:ListItem>
                                                <asp:ListItem Value="MAR">Martillo</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" valign="top"></td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtRefe" runat="server" Font-Names="Courier New" Font-Size="8pt" MaxLength="10" Width="130px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="middle">
                                            <asp:Label ID="lblTit1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="DIVISION EMPRESARIAL :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                        <td align="left" valign="middle">
                                            <asp:Label ID="lblTit5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="BODEGA / ALMACEN :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                        <td align="left" valign="middle"></td>
                                        <td align="left" valign="middle">
                                            <asp:Label ID="lblTit3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="INTERVENTOR [ Identificación / Data ] :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top">
                                            <asp:DropDownList ID="ddlDivi" runat="server" Font-Names="Courier New" Font-Size="8pt" Width="161px" OnSelectedIndexChanged="ddlDivi_SelectedIndexChanged" AutoPostBack="True">
                                                <asp:ListItem Value="%">[ Todas ]</asp:ListItem>
                                                <asp:ListItem Value="ELE">Electrodomésticos</asp:ListItem>
                                                <asp:ListItem Value="FER">Ferreteria</asp:ListItem>
                                                <asp:ListItem Value="LIC">Licores</asp:ListItem>
                                                <asp:ListItem Value="MTC">MOTOS Chinas</asp:ListItem>
                                                <asp:ListItem Value="PER">Perfumería</asp:ListItem>
                                                <asp:ListItem Value="POL">Polaris</asp:ListItem>
                                                <asp:ListItem Value="TAB">Tabernas</asp:ListItem>
                                                <asp:ListItem Value="YAM">Yamaha</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:DropDownList ID="ddlDocu" runat="server" Font-Names="Courier New" Font-Size="8pt" Width="270px">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" valign="top"></td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtIden" runat="server" AutoCompleteType="DisplayName" Font-Names="Courier New" Font-Size="8pt" MaxLength="50" Width="220px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="middle"></td>
                                        <td align="left" valign="middle"></td>
                                        <td valign="middle" align="left"></td>
                                        <td align="left" valign="middle">
                                            <asp:Label ID="lblTit6" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="DOCUMENTO :" ForeColor="#CCFFCC"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="middle"></td>
                                        <td align="left" valign="middle"></td>
                                        <td valign="middle" align="left"></td>
                                        <td align="left" valign="middle">
                                            <asp:TextBox ID="txtData" runat="server" AutoCompleteType="DisplayName" Font-Names="Courier New" Font-Size="8pt" MaxLength="50" Width="220px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" width="100%">
                                <asp:Label ID="TxtEmpr" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False" CssClass="txtOff"></asp:Label>
                                <asp:Label ID="TxtCart" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False" CssClass="txtOff"></asp:Label>
                                <asp:Label ID="TxtDivi" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False" CssClass="txtOff"></asp:Label>
                                <asp:Label ID="TxtTiVe" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False" CssClass="txtOff"></asp:Label>
                                <asp:Label ID="TxtInte" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False" CssClass="txtOff"></asp:Label>
                                <asp:Label ID="TxtVent" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False" CssClass="txtOff"></asp:Label>
                                <asp:Label ID="TxtDocu" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False" CssClass="txtOff"></asp:Label>
                                <asp:Label ID="TxtDatu" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False" CssClass="txtOff"></asp:Label>
                                <asp:Label ID="TxtCual" runat="server" Font-Bold="True"
                                    Font-Names="Courier New" Font-Size="8pt"
                                    ForeColor="Black" Visible="False" CssClass="txtOff">A</asp:Label>
                                <asp:Button ID="Btn" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" Text="FILTRAR" OnClick="Btn_Click" CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <ig:WebTab ID="wtEstados" runat="server" Width="100%" Height="100%" electedIndex="0">
                    <Tabs>
                        <ig:ContentTabItem runat="server" Text="Vista">
                            <Template>
                                <rsweb:ReportViewer ID="RptView" runat="server" Width="100%"
                                    Font-Names="Verdana" Font-Size="8pt" BackColor="WhiteSmoke"
                                    ShowPrintButton="False" ShowRefreshButton="False"
                                    InteractiveDeviceInfos="(Colección)" WaitMessageFont-Names="Verdana"
                                    WaitMessageFont-Size="14pt" Height="100%">
                                    <ServerReport Timeout="1000000" ReportServerUrl="" />
                                    <LocalReport ReportPath="Informes\InfEstadoDeCuenta.rdlc"
                                        DisplayName="Estado de Cuenta">
                                        <DataSources>
                                            <rsweb:ReportDataSource DataSourceId="ODts" Name="DtsClieCart" />
                                        </DataSources>
                                    </LocalReport>
                                </rsweb:ReportViewer>
                            </Template>
                        </ig:ContentTabItem>
                        <ig:ContentTabItem runat="server" Text="Lista">
                            <Template>
                                
                                <asp:ImageButton ID="Exp" runat="server" ImageUrl="../imgs/exp/xlsx.jpg" ToolTip="Exportar documento actual..." Width="48px" OnClick="Exp_Click" />

                                <ig:WebExcelExporter ID="WEE" runat="server" WorkbookFormat="Excel2007" OnExported="WEE_Exported" DataExportMode="AllDataInDataSource">
                                </ig:WebExcelExporter>

                                <ig:WebDataGrid ID="wdgEstado" runat="server" EnableAjax="False" Width="100%" Font-Names="Courier New" Font-Size="9pt" Font-Strikeout="False" Font-Underline="False" Height="300px" ItemCssClass="Changefont" EnableDataViewState="True">
                                </ig:WebDataGrid>
                            </Template>
                        </ig:ContentTabItem>
                    </Tabs>
                </ig:WebTab>
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom" height="10px">
                <asp:ObjectDataSource ID="ODts" runat="server" SelectMethod="GetEstadoDeCuenta" TypeName="ClsInfo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TxtCual" Name="pCual" PropertyName="Text" Type="Char" />
                        <asp:ControlParameter ControlID="TxtEmpr" Name="pEmpr" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="WdtFeIn" Name="pFech" PropertyName="Value" Type="DateTime" />
                        <asp:ControlParameter ControlID="TxtInte" Name="pClie" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtCart" Name="pCart" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtDivi" Name="pDivi" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtTiVe" Name="pTiVe" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtVent" Name="pRefe" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtDocu" Name="pDocu" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtDatu" Name="pData" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>

