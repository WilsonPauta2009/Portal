<%@ Page Title="" Language="C#" MasterPageFile="~/PlantillaInformes.master" %>





<script runat="server">
    ClsInfo Info = new ClsInfo();
    // static System.Data.DataTable Tabl = new System.Data.DataTable();
    System.Data.DataTable Tabu = new System.Data.DataTable();

    private void Data()
    {
        if (Tabu.Rows.Count > 0)
        {
            GroupField Grp = new GroupField();
            Grp.Key = "DATA";
            Grp.Header.Text = Cmb.Items[Cmb.SelectedIndex].Text.ToString() + ": " + Tabu.Rows[0][0].ToString();
            Dtg.Columns.Add(Grp);

            for (int i = 1; i < Tabu.Columns.Count; i++)
            {
                BoundDataField field = new BoundDataField();
                field.DataFieldName = Tabu.Columns[i].ColumnName;
                field.Key = Tabu.Columns[i].ColumnName;
                field.Header.Text = Tabu.Columns[i].ColumnName;

                Grp.Columns.Add(field);
            }
        }

        Dtg.DataSource = Tabu;
    }
    
    protected void Btn_Click(object sender, EventArgs e)
    {
        if (Cmb.SelectedIndex >= 0)
        {
            Dtg.Columns.Clear();
            LblTitu.Text = Cmb.Items[Cmb.SelectedIndex].Text.ToString();        
            
            switch (Cmb.Items[Cmb.SelectedIndex].Value.ToString())
            {
                case "SP_TAB_LOG01":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    break;
                case "SP_TAB_LOG02":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    break;
                case "SP_TAB_LOG03":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    break;
                case "SP_TAB_LOG04":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    break;
                case "SP_TAB_LOG07_1":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    //GroupField Grp = new GroupField();
                    //Grp.Key = "DATA";
                    //Grp.Header.Text = Cmb.Items[Cmb.SelectedIndex].Text.ToString();
                    //Dtg.Columns. .Add(Grp);
                    //Dtg.co
                    
                    break;
                case "SP_TAB_LOG07_2":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    break;
                case "SP_TAB_LOG08_1":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    break;
                case "SP_TAB_LOG08_2":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    break;
                case "SP_TAB_LOG11":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    break;
                case "SP_TAB_LOG12":
                    Tabu = Info.GetMiscelaneos1_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeIn.Date, WdtFeFn.Date);
                    Data();
                    break;
                case "SP_TAB_LOG09":
                    Tabu = Info.GetMiscelaneos2_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "");
                    Data();
                    break;
                case "SP_TAB_LOG10":
                    Tabu = Info.GetMiscelaneos3_(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "", WdtFeFn.Date);
                    Data();
                    break;
            }
            
            Dtg.DataBind();

            if (Dtg.Rows.Count > 0) Exp.Enabled = true;
            else Exp.Enabled = false;
        }
    }

    //protected void Exp_Click(object sender, EventArgs e)
    //{
    //    //Dtg.Columns.Clear();
    //    //Dtg.DataSource = Info.GetMiscelaneos(Cmb.Items[Cmb.SelectedIndex].Value.ToString(), "");
    //    //Dtg.DataBind();
        
    //    if (Dtg.Rows.Count > 0)
    //    {
    //        string fileName = HttpUtility.UrlEncode(Cmb.Items[Cmb.SelectedIndex].Text);
    //        fileName = fileName.Replace("+", "%20");
    //        fileName = HttpUtility.UrlDecode(fileName);
    //        WEE.DownloadName = fileName;
    //        WEE.DataExportMode = DataExportMode.DataInGridOnly; // (DataExportMode)Enum.Parse(typeof(DataExportMode), this.rblExportData.SelectedValue);
    //        WEE.WorkbookFormat = Infragistics.Documents.Excel.WorkbookFormat.Excel2007;
    //        // bool singleGridPerSheet = true; // (this.rblSheets.SelectedValue == "separate") ? true : false;
    //        WEE.Export(false, Dtg); //  this.wdgCustomers);
    //        // WEE.Export(Dtg);
    //    }
    //}

    protected void Enc_Click(object sender, EventArgs e)
    {
        Enc.Enabled = false;
        Enc.Text = Info.SetProcedure_("SP_ENCERADO_TABLAS");
    }

    protected void Exp_Click(object sender, ImageClickEventArgs e)
    {
        if (Dtg.Rows.Count > 0)
        {
            string fileName = HttpUtility.UrlEncode(Cmb.Items[Cmb.SelectedIndex].Text);
            fileName = fileName.Replace("+", "%20");
            fileName = HttpUtility.UrlDecode(fileName);
            
            WEE.DownloadName = fileName;
            WEE.DataExportMode = DataExportMode.DataInGridOnly;
            WEE.WorkbookFormat = Infragistics.Documents.Excel.WorkbookFormat.Excel2007;
            // Dtg.Rows.CreateRecord();
            // ControlDataRecord rFila = new ControlDataRecord();
            // rFila.Items[0].Value = "wilson.pauta@yahoo.com";
            // Dtg.Rows.Add(rFila);
            WEE.Export(false, Dtg);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WdtFeIn.Value = DateTime.Now;
            WdtFeFn.Value = DateTime.Now;
        }
    }
</script>

<asp:Content ID="CntMAIN" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" bgcolor="#3C3C3C">

                <asp:Button ID="Enc" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" OnClick="Enc_Click" Text="ENCERADO DE TABLAS" />

            </td>
        </tr>
        <tr>
            <td align="left">
                <table cellpadding="2" cellspacing="2">
                    <tr>
                        <td>                            
                            <table id="TabLeft" cellpadding="3" cellspacing="0" class="style1" style="width: 42%" bgcolor="#3C3C3C">
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
                            <ig:WebExcelExporter ID="WEE" runat="server" WorkbookFormat="Excel2007" ExportMode="InBrowser">
                            </ig:WebExcelExporter>
                        </td>
                        <td style="height: 53px">
                            <asp:DropDownList ID="Cmb" runat="server" Font-Names="Tahoma" Font-Size="8pt" Font-Bold="True" Width="400px">
                                <asp:ListItem Value="SP_TAB_LOG01">Cambios en el numero de autorizacion, resolucion y fecha</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG03">Cambios en los datos de la empresa</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG02">Adicion y eliminacion de puntos</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG04">Acciones en los Puntos (Nuevo, Modificado, Eliminado)</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG12">Creacion de Usuarios</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG07_1">Transaccional de FACTURAS</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG07_2">Transaccional de NOTAS DE CREDITO</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG08_2">Consolidado de notas de credito emitidas</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG09">Secuencial de Documentos</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG10">Logs Contables</asp:ListItem>
                                <asp:ListItem Value="SP_TAB_LOG11">Roles de usuario</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="height: 53px">
                            <asp:Button ID="Btn" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" Text="FILTRAR" OnClick="Btn_Click" CausesValidation="False" />
                        </td>
                        <td align="right" width="100%" style="height: 53px">

                            <asp:ImageButton ID="Exp" runat="server" ImageUrl="../imgs/exp/xlsx.jpg" OnClick="Exp_Click" ToolTip="Exportar documento actual..." Enabled="False" Width="48px" />

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">

                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="11pt" ForeColor="#336699"></asp:Label>

            </td>
        </tr>
        <tr style="border-style: inset none none none; border-width: 1px; font-family: Arial; font-size: 7px;">
            <td>
                <ig:WebDataGrid ID="Dtg" runat="server" Height="350px" Width="100%" StyleSetName="ElectricBlue" EnableDataViewState="True" Font-Names="Arial" Font-Size="7pt" AutoGenerateColumns="False" >
                </ig:WebDataGrid>
            </td>
        </tr>
    </table>
</asp:Content>

