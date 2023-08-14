<%@ Page Title="POSTVENTA: Historial..."
    Language="C#"
    MasterPageFile="~/PlantillaMAIN.master"
    AutoEventWireup="true"
%>



<script runat="server">
    ClsPostVenta PoVe = new ClsPostVenta();
    
    protected override void OnLoad(EventArgs e)
    {
        //base.OnLoad(e);
        //if (!IsPostBack) { GrdView_Hist.DataSource = PoVe.Load_InvoiceDelivered_All('F', ClsDatos.mEmpr, RdoBtnPsVe.SelectedValue[0]); GrdView_Hist.DataBind(); Analyze_Ddl();  }
        
        base.OnLoad(e);
        string sErro = "";

        try
        {
            if (!IsPostBack) { PoVe.AreasPostVentaInvoiceDelivered(WebPsVe, ClsDatos.mEmpr, 'R', Session["iden"].ToString()); }
        }
        catch (Exception xErro) { sErro = xErro.Message; }
        finally
        {
            // Response.Clear();

            ((Label)Page.Master.FindControl("LblUsua")).Text = sErro;

            //if (sErro.Trim().Length == 0)
            //{
            //    if (((Button)Page.Master.FindControl("BtnCerr")).Visible) Response.Redirect("first.aspx");
            //    else Response.Redirect("default.aspx");
            //}
        }
    }

    private void Analyze_Ddl()
    {
        for (int t = 0; t < GrdView_Hist.Rows.Count; t++)
            ((LinkButton)GrdView_Hist.FindControl(string.Format("ctl{0:00}$NuRe", t + 3))).Attributes.Add("onClick", string.Format("fnOpen('Etapas.aspx?i1={0}');", ((LinkButton)GrdView_Hist.FindControl(string.Format("ctl{0:00}$NuRe", t + 3))).Text));
    }

    protected void RdoBtnPost_OnCheckedChanged(object sender, EventArgs e)
    {
        TxtNuVe.Enabled = false;
        TxtNuRe.Enabled = false;
        TxtClie.Enabled = false;
        CmpVldNuRe.Enabled = false;
        CmpVldNuVe.Enabled = false;
        ReqVldClie.Enabled = false;
        WebPsVe.Focus();
    }

    protected void RdoBtnNoVe_CheckedChanged(object sender, EventArgs e)
    {
        TxtNuRe.Enabled = false;
        TxtNuVe.Enabled = true;
        TxtClie.Enabled = false;

        CmpVldNuRe.Enabled = false;
        CmpVldNuVe.Enabled = true;
        ReqVldClie.Enabled = false;
        TxtNuVe.Focus();
    }

    protected void RdoBtnNoRe_OnCheckedChanged(object sender, EventArgs e)
    {
        TxtNuRe.Enabled = true;
        TxtNuVe.Enabled = false;
        TxtClie.Enabled = false;
        
        CmpVldNuRe.Enabled = true;
        CmpVldNuVe.Enabled = false;
        ReqVldClie.Enabled = false;
        TxtNuRe.Focus();
    }

    protected void RdoBtnClie_OnCheckedChanged(object sender, EventArgs e)
    {
        TxtClie.Enabled = true;
        TxtNuRe.Enabled = false;
        TxtNuVe.Enabled = false;
        
        CmpVldNuRe.Enabled = false;
        CmpVldNuVe.Enabled = false;
        ReqVldClie.Enabled = true;
        TxtClie.Focus();
    }
    
    protected void GrdView_Hist_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        if (RdoBtnPost.Checked && WebPsVe.SelectedItemIndex >= 0) GrdView_Hist.DataSource = PoVe.LoadInvoiceDelivered('F', ClsDatos.mEmpr, int.Parse(WebPsVe.SelectedValue), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnNoRe.Checked) GrdView_Hist.DataSource = GrdView_Hist.DataSource = PoVe.LoadInvoiceDelivered('N', ClsDatos.mEmpr, long.Parse(TxtNuRe.Text), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnNoVe.Checked) GrdView_Hist.DataSource = GrdView_Hist.DataSource = PoVe.LoadInvoiceDelivered('V', ClsDatos.mEmpr, long.Parse(TxtNuVe.Text), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnClie.Checked) GrdView_Hist.DataSource = PoVe.LoadInvoiceDelivered('C', ClsDatos.mEmpr, TxtClie.Text.ToUpper().Trim(), RdoBtnPsVe.SelectedValue[0]);
        
        //GrdView_Hist.DataSource = PoVe.Load_InvoiceDelivered_All('F', ClsDatos.mEmpr, RdoBtnPsVe.SelectedValue[0]);
        
        GrdView_Hist.PageIndex = e.NewPageIndex;
        GrdView_Hist.DataBind();
        Analyze_Ddl();
    }

    protected void BtnFilt_Click(object sender, ImageClickEventArgs e)
    {
        if (RdoBtnPost.Checked && WebPsVe.SelectedItemIndex >= 0) GrdView_Hist.DataSource = PoVe.LoadInvoiceDelivered('F', ClsDatos.mEmpr, int.Parse(WebPsVe.SelectedValue), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnNoRe.Checked) GrdView_Hist.DataSource = GrdView_Hist.DataSource = PoVe.LoadInvoiceDelivered('N', ClsDatos.mEmpr, long.Parse(TxtNuRe.Text), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnNoVe.Checked) GrdView_Hist.DataSource = GrdView_Hist.DataSource = PoVe.LoadInvoiceDelivered('V', ClsDatos.mEmpr, long.Parse(TxtNuVe.Text), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnClie.Checked) GrdView_Hist.DataSource = PoVe.LoadInvoiceDelivered('C', ClsDatos.mEmpr, TxtClie.Text.ToUpper().Trim(), RdoBtnPsVe.SelectedValue[0]);
        
        //GrdView_Hist.DataSource = PoVe.LoadReparacionesInvoice('A', ClsDatos.mEmpr, RdoBtnPsVe.SelectedValue[0]);
        GrdView_Hist.DataBind();
        Analyze_Ddl();
        //((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", t + 3))).Attributes.Add("onClick", string.Format("fnOpen('Etapas.aspx?i1={0}');", ((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", t + 3))).Text));
    }

    //protected void NuRe_Click(object sender, EventArgs e)
    //{
    //    WdtReDe.DataSource = PoVe.LoadLevelDesglose(ClsDatos.mEmpr, "RE", long.Parse(((LinkButton)sender).Text));
    //    WdtReDe.DataBind();

    //    if (WdtReDe.Rows.Count > 0)
    //    {
    //        WivImag.Items.Clear();
    //        string sRuta = string.Format("./docs/{0}", ((LinkButton)sender).Text);

    //        if (System.IO.File.Exists(Server.MapPath (string.Format("./docs/{0}/cotizacion_{0}.pdf", ((LinkButton)sender).Text))))
    //        {
    //            HylCoti.Visible = true;
    //            HylCoti.NavigateUrl = string.Format("./docs/{0}/cotizacion_{0}.pdf", ((LinkButton)sender).Text);
    //        }
    //        else HylCoti.Visible = false;
            
    //        try
    //        {
    //            string[] sFile = System.IO.Directory.GetFiles(Server.MapPath(sRuta), "*.jpg");
                
    //            for (byte f = 0; f < sFile.Length; f++)
    //            {
    //                string[] sImag = sFile[f].Split('\\');
    //                Infragistics.Web.UI.ListControls.ImageItem Imag = new Infragistics.Web.UI.ListControls.ImageItem();
    //                Imag.ImageUrl = string.Format("{0}/{1}", sRuta, sImag[sImag.Length - 1]);
    //                Imag.ToolTip = sImag[sImag.Length - 1];
    //                WivImag.Items.Add(Imag);
    //            }

    //            if (WivImag.Items.Count > 0) WivImag.Visible = true; else WivImag.Visible = false;
    //        }
    //        catch { WivImag.Visible = false; }
            
    //        PnlReDe.Visible = true;
    //    }
    //    else PnlReDe.Visible = false;

    //    //BtnFilt.Visible = !PnlReDe.Visible;
    //    GrdView_Hist.Enabled = !PnlReDe.Visible;
    //}

    //protected void BtnVisu_Click(object sender, ImageClickEventArgs e)
    //{
    //    PnlReDe.Visible = false;
    //    BtnFilt.Visible = !PnlReDe.Visible;
    //    //BtnConf.Visible = !PnlReDe.Visible;
    //    GrdView_Hist.Enabled = !PnlReDe.Visible;
    //}    
</script>

<asp:Content ID="Cnt_MAIN" ContentPlaceHolderID="CntMAIN" Runat="Server">
    <table cellpadding="0" cellspacing="0" style="width: 100%" id="TabPrin">
        <tr>
            <td>
                <asp:Panel ID="PnlFilt" runat="server" DefaultButton="BtnFilt">                
                    <table cellspacing="1" style="width: 100%" id="TabHead" bgcolor="#F5EFEF">
                        <tr>
                            <td align="right" width="8%">
                                <asp:RadioButtonList ID="RdoBtnPsVe" runat="server" Font-Names="Arial" 
                                    Font-Size="8pt" Font-Bold="True" TextAlign="Left" 
                                    AutoPostBack="True" Enabled="False">
                                    <asp:ListItem Selected="True" Value="R">RELOJES</asp:ListItem>
                                    <asp:ListItem Value="J">JOYERIA</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td bgcolor="White">
                                <asp:Panel ID="PnlRubr" runat="server">                   
                                    <table id="TabRubr" cellspacing="1" style="width: 100%" cellpadding="1">
                                        <tr style="height: 30px">
                                            <td align="left" valign="middle">
                                                <asp:RadioButton ID="RdoBtnPost" runat="server" AutoPostBack="True" 
                                                    Checked="True" Font-Names="Arial" Font-Size="8pt" GroupName="GrpRubr" 
                                                    OnCheckedChanged="RdoBtnPost_OnCheckedChanged" Text="PUNTOS DE VENTA" />
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:RadioButton ID="RdoBtnNoRe" runat="server" AutoPostBack="True" 
                                                    Font-Names="Arial" Font-Size="8pt" GroupName="GrpRubr" 
                                                    OnCheckedChanged="RdoBtnNoRe_OnCheckedChanged" Text="Nº Reparación" />
                                            </td>
                                            <td align="left" valign="middle">
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:RadioButton ID="RdoBtnNoVe" runat="server" AutoPostBack="True" 
                                                    Font-Names="Arial" Font-Size="8pt" GroupName="GrpRubr" 
                                                    OnCheckedChanged="RdoBtnNoVe_CheckedChanged" Text="Nº Venta" />
                                            </td>
                                            <td align="left" valign="middle">
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:RadioButton ID="RdoBtnClie" runat="server" AutoPostBack="True" 
                                                    Font-Names="Arial" Font-Size="8pt" GroupName="GrpRubr" 
                                                    OnCheckedChanged="RdoBtnClie_OnCheckedChanged" Text="CLIENTE" />
                                            </td>
                                             <td align="left" valign="middle">
                                             </td>
                                        </tr>
                                        <tr style="height: 30px">
                                            <td align="left" valign="middle">
                                                <ig:WebDropDown ID="WebPsVe" runat="server" DisplayMode="DropDownList" 
                                                    StyleSetName="RedPlanet" Width="230px">
                                                </ig:WebDropDown>
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:TextBox ID="TxtNuRe" runat="server" Enabled="False" 
                                                    Font-Names="Courier New" Font-Size="9pt" Width="100px">0</asp:TextBox>
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:CompareValidator ID="CmpVldNuRe" runat="server" 
                                                    ControlToValidate="TxtNuRe" ErrorMessage="[X]" Font-Bold="True" 
                                                    Font-Names="Courier New" Font-Size="8pt" Operator="GreaterThan" Type="Integer" 
                                                    ValueToCompare="0" Enabled="False" ForeColor="Red"></asp:CompareValidator>
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:TextBox ID="TxtNuVe" runat="server" 
                                                    Font-Names="Courier New" Font-Size="9pt" Width="100px" Enabled="False">0</asp:TextBox>
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:CompareValidator ID="CmpVldNuVe" runat="server" 
                                                    ControlToValidate="TxtNuVe" ErrorMessage="[X]" Font-Bold="True" 
                                                    Font-Names="Courier New" Font-Size="8pt" Operator="GreaterThan" Type="Integer" 
                                                    ValueToCompare="0" Enabled="False" ForeColor="Red"></asp:CompareValidator>
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:TextBox ID="TxtClie" runat="server" 
                                                    Font-Names="Courier New" Font-Size="9pt" Width="130px" Enabled="False"></asp:TextBox>
                                            </td>
                                             <td align="left" valign="middle">
                                                 <asp:RequiredFieldValidator ID="ReqVldClie" runat="server" 
                                                     ControlToValidate="TxtClie" Enabled="False" ErrorMessage="[R]" Font-Bold="True" 
                                                     Font-Names="Courier New" Font-Size="8pt"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td width="5%" align="center" valign="middle">
                                <asp:ImageButton ID="BtnFilt" runat="server" ImageUrl="iconos/search.png" 
                                    onclick="BtnFilt_Click" ToolTip=":: FILTRAR ::" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center" 
                style="background-color: #FFFFFF;">
                <asp:Label ID="LblMesg" runat="server" Font-Names="Arial Narrow" 
                    Font-Size="8pt" ForeColor="#003399"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table cellpadding="0" cellspacing="0" style="width: 100%" id="Tab000" 
                    bgcolor="White">
                        <tr>
                            <td width="50px" align="center" valign="top">
                                <asp:Image ID="Img" runat="server" ImageUrl="./imgs/_Historial.jpg" />
                            </td>
                            <td valign="top">
                                <asp:GridView ID="GrdView_Hist" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                    Font-Names="Courier New" Font-Size="8pt" ViewStateMode="Enabled" 
                                    onpageindexchanging="GrdView_Hist_PageIndexChanging" Width="100%" 
                                    ForeColor="#333333" GridLines="None" PageSize="20">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="LoCo" HeaderText="Pto. de Venta" 
                                            ReadOnly="True" />
                                        <asp:TemplateField HeaderText="Reparación">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="NuRe" runat="server" Font-Bold="True" 
                                                    Font-Names="Courier New" Font-Size="8pt" Text=<%# DataBinder.Eval(Container.DataItem,"NuRe") %>
                                                    CommandName=<%# DataBinder.Eval(Container.DataItem,"Iden") %> 
                                                    CausesValidation="False" ></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Vent" HeaderText="FACTURA" />
                                        <asp:BoundField DataField="FeFa" HeaderText="FECHA" />
                                        <asp:BoundField DataField="Clie" HeaderText="CLIENTE / CONCESIONARIO" 
                                            ReadOnly="True" />
                                        <asp:BoundField DataField="Mark" HeaderText="MARCA" ReadOnly="True" />
                                        <asp:TemplateField HeaderText="REGISTRO">
                                            <ItemTemplate>
                                                <asp:Label ID="FeRe" runat="server" Width="75px" Text=<%# DataBinder.Eval(Container.DataItem,"FeEn") %>></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="FeRe" HeaderText="RECIBE" />
                                        <asp:BoundField DataField="Dias" HeaderText="DIAS" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerSettings Position="TopAndBottom" PageButtonCount="30" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </td>
                        </tr>
                </table>                
            </td>
        </tr>
    </table>
</asp:Content>

