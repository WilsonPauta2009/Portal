<%@ Page Title="POSTVENTA: Facturadas..."
    Language="C#"
    MasterPageFile="~/PlantillaMAIN.master"
    AutoEventWireup="true"
%>



<script runat="server">
    ClsPostVenta PoVe = new ClsPostVenta();
    
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        string sErro = "";
        
        try
        {
            if (!IsPostBack)
                {
                    PoVe.LoadAreasPostVentaInvoice(WebPsVe, ClsDatos.mEmpr, 'R', Session["iden"].ToString());
                    PoVe.LoadEtapasPostVentaInvoice(WebEtap, ClsDatos.mEmpr, 'R', Session["iden"].ToString());
                }
            else
                for (int r = 0; r < GrdView_Fact.Rows.Count; r++)
                {
                    ((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlEtap", r + 3))).Enabled = ((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$AcDe", r + 3))).Checked;
                    ((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlUsua", r + 3))).Enabled = ((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$AcDe", r + 3))).Checked;
                    ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", r + 3))).Enabled = ((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$AcDe", r + 3))).Checked;
                    if (((RadioButtonList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$RdoBtnElec", r + 3))).Visible) ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", r + 3))).Enabled = true;

                    ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Anot", r + 3))).Enabled = ((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$ChkAnot", r + 3))).Checked;
                }
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
    
    protected void RdoBtnPost_OnCheckedChanged(object sender, EventArgs e)
    {
        TxtNuRe.Enabled = false;
        TxtClie.Enabled = false;
        CmpVldNuRe.Enabled = false;
        ReqVldClie.Enabled = false;
        WebPsVe.Focus();
    }

    protected void RdoBtnNoRe_OnCheckedChanged(object sender, EventArgs e)
    {
        TxtNuRe.Enabled = true;
        
        TxtClie.Enabled = false;
        CmpVldNuRe.Enabled = true;
        ReqVldClie.Enabled = false;
        TxtNuRe.Focus();
    }

    protected void RdoBtnClie_OnCheckedChanged(object sender, EventArgs e)
    {
        TxtClie.Enabled = true;
        TxtNuRe.Enabled = false;
        CmpVldNuRe.Enabled = false;
        ReqVldClie.Enabled = true;
        
        TxtClie.Focus();
    }

    protected void RdoBtnPsVe_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        PoVe.LoadAreasPostVenta(WebPsVe, ClsDatos.mEmpr, RdoBtnPsVe.SelectedValue.ToString(), Session["iden"].ToString());
        WebPsVe.DataBind();
    }

    private void Analyze_Ddl()
    {
        char cReto = 'X';
        //PnlReDe.Visible = false;
        
        for (int t = 0; t < GrdView_Fact.Rows.Count; t++)
        {
            // enceramos los objetos
            ((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", t + 3))).Attributes.Add("onclick", string.Format("fnOpen('Etapas.aspx?i1={0}');", ((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", t + 3))).Text));
            ((Label)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Mens", t + 3))).Text = "";
            ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", t + 3))).Visible = false;
            ((Panel)GrdView_Fact.FindControl(string.Format("ctl{0:00}$PnlEtap", t + 3))).Visible = false;
            ((RadioButtonList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$RdoBtnElec", t + 3))).Visible = false;

            try
            {
                //((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$ChkAnot", t + 3))).Attributes.Add("onclick", string.Format("javascript:CheckBox_Object('ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$ChkAnot','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Anot')", t + 3));
                // checks within the database, if it view the controls
                cReto = PoVe.LoadDataEtapaNext(((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlEtap", t + 3))), ClsDatos.mEmpr, "RE", long.Parse(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", t + 3))).Text), Session["iden"].ToString());

                switch (cReto)
                {
                    case '1':
                        ((Panel)GrdView_Fact.FindControl(string.Format("ctl{0:00}$PnlEtap", t + 3))).Visible = true;
                        ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", t + 3))).Visible = true;
                        ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", t + 3))).Enabled = false;
                        //((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$AcDe", t + 3))).Attributes.Add("onclick", string.Format("javascript:CheckBox_Selected_TextBox('ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$AcDe','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$DdlEtap', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Obse', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$DdlUsua')", t + 3));
                        ((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$AcDe", t + 3))).Attributes.Add("onclick", string.Format("javascript:CheckBox_TextBox('ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$AcDe','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$DdlEtap', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Obse', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$DdlUsua', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$ChkAnot','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Anot', '1')", t + 3));
                        ((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$ChkAnot", t + 3))).Attributes.Add("onclick", string.Format("javascript:CheckBox_TextBox('ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$AcDe','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$DdlEtap', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Obse', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$DdlUsua', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$ChkAnot','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Anot', '2')", t + 3));
                        
                        ((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlEtap", t + 3))).ToolTip = string.Format("{0:00}", t + 3);
                        ((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlEtap", t + 3))).DataBind();
                        PoVe.LoadDataUsuaNextInvoice(((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlUsua", t + 3))), ClsDatos.mEmpr, "RE", ((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlEtap", t + 3))).SelectedValue, long.Parse(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", t + 3))).Text));
                        break;
                    case '2':
                        //((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$ChkAnot", t + 3))).Attributes.Add("onclick", string.Format("javascript:CheckBox_Object('ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$ChkAnot','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Anot')", t + 3));
                        ((RadioButtonList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$RdoBtnElec", t + 3))).Attributes.Add("onclick", string.Format("javascript:CheckBox_RadioButton('ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$RdoBtnElec', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Obse', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$ChkAnot','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Anot', '1')", t + 3));
                        ((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$ChkAnot", t + 3))).Attributes.Add("onclick", string.Format("javascript:CheckBox_RadioButton('ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$RdoBtnElec', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Obse', 'ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$ChkAnot','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Anot', '2')", t + 3));
                        
                        ((RadioButtonList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$RdoBtnElec", t + 3))).Visible = true;
                        ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", t + 3))).Visible = true;
                        ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", t + 3))).Enabled = false;
                        break;
                    default:
                        ((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$ChkAnot", t + 3))).Attributes.Add("onclick", string.Format("javascript:CheckBox_Object('ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$ChkAnot','ctl00$CntMAIN$GrdView_Fact$ctl{0:00}$Anot')", t + 3));
                        break;
                }
            }
            catch
            {
                ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", t + 3))).Visible = false;
                ((Panel)GrdView_Fact.FindControl(string.Format("ctl{0:00}$PnlEtap", t + 3))).Visible = false;
            }
        }

        if (GrdView_Fact.Rows.Count > 0) BtnConf.Visible = true; else BtnConf.Visible = false;
    }

    protected void GrdView_Fact_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (RdoBtnPost.Checked && WebPsVe.SelectedItemIndex >= 0) GrdView_Fact.DataSource = PoVe.LoadReparacionesInvoice('A', ClsDatos.mEmpr, int.Parse(WebPsVe.SelectedValue), RdoBtnPsVe.SelectedValue[0]);
        if (RdoBtnEtap.Checked && WebEtap.SelectedItemIndex >= 0) GrdView_Fact.DataSource = PoVe.LoadReparacionesInvoice('E', ClsDatos.mEmpr, int.Parse(WebEtap.SelectedValue), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnNoRe.Checked) GrdView_Fact.DataSource = PoVe.LoadReparacionesInvoice('N', ClsDatos.mEmpr, long.Parse(TxtNuRe.Text), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnClie.Checked) GrdView_Fact.DataSource = PoVe.LoadReparacionesInvoice('C', ClsDatos.mEmpr, TxtClie.Text.ToUpper().Trim(), RdoBtnPsVe.SelectedValue[0]);
        
        GrdView_Fact.PageIndex = e.NewPageIndex;
        GrdView_Fact.DataBind();
        Analyze_Ddl();
    }

    protected void BtnFilt_Click(object sender, ImageClickEventArgs e)
    {   
        if (RdoBtnPost.Checked && WebPsVe.SelectedItemIndex >= 0) GrdView_Fact.DataSource = PoVe.LoadReparacionesInvoice('A', ClsDatos.mEmpr, int.Parse(WebPsVe.SelectedValue), RdoBtnPsVe.SelectedValue[0]);
        if (RdoBtnEtap.Checked && WebEtap.SelectedItemIndex >= 0) GrdView_Fact.DataSource = PoVe.LoadReparacionesInvoice('E', ClsDatos.mEmpr, int.Parse(WebEtap.SelectedValue), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnNoRe.Checked) GrdView_Fact.DataSource = PoVe.LoadReparacionesInvoice('N', ClsDatos.mEmpr, long.Parse(TxtNuRe.Text), RdoBtnPsVe.SelectedValue[0]);
        else if (RdoBtnClie.Checked) GrdView_Fact.DataSource = PoVe.LoadReparacionesInvoice('C', ClsDatos.mEmpr, TxtClie.Text.ToUpper().Trim(), RdoBtnPsVe.SelectedValue[0]);

        GrdView_Fact.DataBind();
        Analyze_Ddl();
    }

    protected void BtnConf_Click(object sender, ImageClickEventArgs e)
    {
        // LblMesg.Text = "";

        for (int r = 0; r < GrdView_Fact.Rows.Count; r++)
        {
            if (((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$ChkAnot", r + 3))).Checked && ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Anot", r + 3))).Text.Trim().Length >= 0)
            {
                PoVe.EtapaSave(ClsDatos.mEmpr, int.Parse(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", r + 3))).CommandName), "RE",
                        long.Parse(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", r + 3))).Text), "RE",
                        95, ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Anot", r + 3))).Text, ClsDatos.mEmpr, Session["iden"].ToString());

                PoVe.SendMail_PostVenta(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", r + 3))).Text, ((Label)Page.Master.FindControl("LblUsua")).Text,
                    ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Anot", r + 3))).Text);
            }
                
            if (((Panel)GrdView_Fact.FindControl(string.Format("ctl{0:00}$PnlEtap", r + 3))).Visible)
            {
                if (((CheckBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$AcDe", r + 3))).Checked)
                {
                    PoVe.EtapaSave(ClsDatos.mEmpr, int.Parse(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", r + 3))).CommandName), "RE",
                        long.Parse(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", r + 3))).Text), "RE",
                        int.Parse(((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlEtap", r + 3))).SelectedValue), ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", r + 3))).Text,
                        ((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlUsua", r + 3))).SelectedValue, Session["iden"].ToString());

                    PoVe.SendMail_PostVenta(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", r + 3))).Text, string.Format("Enviado a: {0}", ((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlEtap", r + 3))).SelectedItem.Text),
                        ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", r + 3))).Text);
                }
            }
            else if (((RadioButtonList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$RdoBtnElec", r + 3))).Visible)
            {
                if (((RadioButtonList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$RdoBtnElec", r + 3))).SelectedValue != "P")
                {
                    PoVe.SaveConfirm(ClsDatos.mEmpr, "RE", long.Parse(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", r + 3))).Text), Session["iden"].ToString(), ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", r + 3))).Text, ((RadioButtonList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$RdoBtnElec", r + 3))).SelectedValue);
                    if (((RadioButtonList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$RdoBtnElec", r + 3))).SelectedValue == "A") PoVe.SendMail_PostVenta(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", r + 3))).Text, "Confirma", ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", r + 3))).Text);
                    else PoVe.SendMail_PostVenta(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", r + 3))).Text, "Rechaza", ((TextBox)GrdView_Fact.FindControl(string.Format("ctl{0:00}$Obse", r + 3))).Text);
                }
            }
        }
        //Analyze_Ddl();
        BtnFilt_Click(null, null);
    }

    protected void DdlEtap_SelectedIndexChanged(object sender, EventArgs e)
    {
        int nure = int.Parse(((DropDownList)sender).ToolTip);
        ((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlEtap", nure))).DataBind();
        PoVe.LoadDataUsuaNextInvoice(((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlUsua", nure))), ClsDatos.mEmpr, "RE", ((DropDownList)GrdView_Fact.FindControl(string.Format("ctl{0:00}$DdlEtap", nure))).SelectedValue, long.Parse(((LinkButton)GrdView_Fact.FindControl(string.Format("ctl{0:00}$NuRe", nure))).Text));
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

    //    BtnFilt.Visible = !PnlReDe.Visible;
    //    BtnConf.Visible = !PnlReDe.Visible;
    //    GrdView_Fact.Enabled = !PnlReDe.Visible;
    //}

    //protected void BtnVisu_Click(object sender, ImageClickEventArgs e)
    //{
    //    PnlReDe.Visible = false;
    //    BtnFilt.Visible = !PnlReDe.Visible;
    //    BtnConf.Visible = !PnlReDe.Visible;
    //    GrdView_Fact.Enabled = !PnlReDe.Visible;
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
                                    OnSelectedIndexChanged="RdoBtnPsVe_OnSelectedIndexChanged" 
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
                                                <asp:RadioButton ID="RdoBtnEtap" runat="server" AutoPostBack="True" 
                                                    Font-Names="Arial" Font-Size="8pt" GroupName="GrpRubr" 
                                                    OnCheckedChanged="RdoBtnPost_OnCheckedChanged" Text="ETAPAS" />
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:RadioButton ID="RdoBtnNoRe" runat="server" AutoPostBack="True" 
                                                    Font-Names="Arial" Font-Size="8pt" GroupName="GrpRubr" 
                                                    OnCheckedChanged="RdoBtnNoRe_OnCheckedChanged" Text="Nº Reparación" />
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
                                                <ig:WebDropDown ID="WebPsVe" runat="server" DisplayMode="DropDownList" StyleSetName="RedPlanet"  Width="230px">
                                                </ig:WebDropDown>
                                            </td>
                                            <td align="left" valign="middle">
                                                <ig:WebDropDown ID="WebEtap" runat="server" DisplayMode="DropDownList" StyleSetName="RedPlanet"  Width="250px">
                                                </ig:WebDropDown>
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:TextBox ID="TxtNuRe" runat="server" 
                                                    Font-Names="Courier New" Font-Size="9pt" Width="100px" Enabled="False">0</asp:TextBox>
                                            </td>
                                            <td align="left" valign="middle">
                                                <asp:CompareValidator ID="CmpVldNuRe" runat="server" 
                                                    ControlToValidate="TxtNuRe" ErrorMessage="[X]" Font-Bold="True" 
                                                    Font-Names="Courier New" Font-Size="8pt" Operator="GreaterThan" Type="Integer" 
                                                    ValueToCompare="0" Enabled="False"></asp:CompareValidator>
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
                            <td width="2%">
                            </td>
                            <td width="5%" align="center" valign="middle">
                                <asp:ImageButton ID="BtnConf" runat="server" ImageUrl="iconos/save.png" 
                                    onclick="BtnConf_Click" ToolTip=":: PROCESAR INFORMACION ::" Visible="False" 
                                    CausesValidation="False" />
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
                                <asp:Image ID="Img" runat="server" ImageUrl="./imgs/_Facturadas.jpg" />
                            </td>
                            <td valign="top">
                                <asp:GridView ID="GrdView_Fact" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" 
                                    Font-Names="Courier New" Font-Size="8pt" ViewStateMode="Enabled" 
                                    onpageindexchanging="GrdView_Fact_PageIndexChanging" Width="100%" BackColor="White" 
                                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                    <Columns>
                                        <asp:BoundField DataField="LoCo" HeaderText="Pto. de Venta" 
                                            ReadOnly="True" />
                                        <asp:TemplateField HeaderText="Reparación">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="NuRe" runat="server" Font-Bold="True" 
                                                    Font-Names="Courier New" Font-Size="8pt" Text=<%# DataBinder.Eval(Container.DataItem,"NuRe") %>
                                                    CommandName=<%# DataBinder.Eval(Container.DataItem,"Iden") %> 
                                                    CausesValidation="False"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Vent" HeaderText="FACTURA" />
                                        <asp:BoundField DataField="Clie" HeaderText="CLIENTE / CONCESIONARIO" 
                                            ReadOnly="True" />
                                        <asp:BoundField DataField="Mark" HeaderText="MARCA" ReadOnly="True" />
                                        <asp:TemplateField HeaderText="REGISTRO">
                                            <ItemTemplate>
                                                <asp:Label ID="FeRe" runat="server" Width="75px" Text=<%# DataBinder.Eval(Container.DataItem,"FeEn") %>></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Dife" HeaderText="DIAS" />
                                        <asp:TemplateField HeaderText="Etapa ACTUAL">
                                            <ItemTemplate>
                                                <asp:Label ID="Etap" runat="server" Font-Bold="True" Font-Names="Courier New" 
                                                    Font-Size="8pt" ForeColor="#003399" Text=<%# DataBinder.Eval(Container.DataItem,"Etap") %>
                                                    ToolTip=<%# DataBinder.Eval(Container.DataItem,"FeRe") %>></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Próxima ETAPA">
                                            <ItemTemplate>
                                                <table ID="Tab001" width="350px" cellpadding="0" cellspacing="0">                                    
                                                    <tr>
                                                        <td>
                                                            <asp:Panel ID="PnlEtap" runat="server" Visible="False">
                                                                <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                                    <tr>
                                                                        <td align="left" valign="middle" width="5%">
                                                                            <asp:CheckBox ID="AcDe" runat="server" />
                                                                        </td>                                                        
                                                                        <td width="35%">
                                                                            <asp:DropDownList ID="DdlEtap" runat="server" AutoPostBack="True" 
                                                                                Enabled="False" Font-Names="Arial Narrow" Font-Size="8pt" 
                                                                                onselectedindexchanged="DdlEtap_SelectedIndexChanged" ViewStateMode="Enabled" 
                                                                                Width="100%">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DdlUsua" runat="server" Enabled="False" 
                                                                                Font-Names="Arial Narrow" Font-Size="8pt" ViewStateMode="Enabled" 
                                                                                Width="100%">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>                                                                        
                                                    <tr>
                                                        <td align="left" valign="middle">
                                                            <asp:RadioButtonList ID="RdoBtnElec" runat="server" 
                                                                Font-Bold="True" Font-Names="Arial Narrow" Font-Size="8pt" 
                                                                RepeatDirection="Horizontal" Visible="False" ForeColor="Black">
                                                                <asp:ListItem Selected="True" Value="P">Pendiente</asp:ListItem>
                                                                <asp:ListItem Value="A">Confirma</asp:ListItem>
                                                                <asp:ListItem Value="H">Rechaza</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" valign="middle">
                                                           <asp:TextBox ID="Obse" runat="server" MaxLength="255" ViewStateMode="Enabled" 
                                                                Width="100%" Font-Names="Courier New" Font-Size="8pt" Visible="False" 
                                                                Enabled="False" ToolTip="máximo 255 caracteres" BackColor="#CCCCCC"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" valign="middle">
                                                            <asp:Label ID="Mens" runat="server" Font-Bold="True" Font-Names="Courier New" 
                                                                Font-Size="8pt" ForeColor="Red"></asp:Label>
                                                         </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" valign="middle" style="border-top-style: inset; border-top-width: 1px; border-bottom-style: outset; border-bottom-width: 1px">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                                <tr>
                                                                    <td align="left" valign="middle" width="25%">
                                                                        <asp:CheckBox ID="ChkAnot" runat="server" Text="Anotación:" Font-Bold="True" Font-Names="Tahoma" Font-Size="8" BorderStyle="NotSet" />
                                                                    </td>                                                        
                                                                    <td valign="middle">
                                                                        <asp:TextBox ID="Anot" runat="server" MaxLength="255" ViewStateMode="Enabled" 
                                                                            Width="98%" Font-Names="Courier New" Font-Size="8pt" Visible="True" 
                                                                            Enabled="False" BorderStyle="NotSet" ToolTip="máximo 255 caracteres"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            
                                                         </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                    <PagerSettings Position="TopAndBottom" PageButtonCount="30" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <RowStyle ForeColor="#000066" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                </asp:GridView>
                            </td>
                        </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

