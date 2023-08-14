<%@ Page Language="C#" MasterPageFile="Plantilla.master" AutoEventWireup="true" Title="ITEMS..." %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<script runat="server">
    //using System.Data;

    // ClsPostVenta PoVe = new ClsPostVenta();
    ClsDatos dato = new ClsDatos();
    System.Data.DataTable Tabu = new System.Data.DataTable("arti");
    System.Data.DataRow rFila;

    private string sLine, sMarc, sSecc, sSubS, sCoDe;
    private double dPrIn, dPrFn;
    private bool bNext;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        //bool bVeri = false;

        //try { if (Session["sIden"].ToString().Length > 0) bVeri = true; }
        //catch { }

        //if (bVeri)
        //{
        if (!Page.IsPostBack)
        {
            /*((Label)Master.FindControl("LblHead")).Text = Session["sApNo"].ToString();*/
            dato.WEBLoadLine (ddlLine, ClsDatos.mEmpr);
            ddlLine.DataBind();
            // dato.CargarDescuentos(DrpDwnDcto, ClsDatos.mEmpr);
            dato.WEBLoadMarc(ddlMarc, ClsDatos.mEmpr, ddlLine.SelectedValue);
            dato.WEBLoadSecc(ddlSecc, ClsDatos.mEmpr, ddlLine.SelectedValue);
            dato.WEBLoadSubS(ddlSubS, ClsDatos.mEmpr, ddlLine.SelectedValue);
        }
        else
        {
            ddlLine.Enabled = chkLine.Checked;
            ddlMarc.Enabled = chkMarc.Checked;
            ddlSecc.Enabled = chkSecc.Checked;
            ddlSubS.Enabled = chkSubS.Checked;
            // DrpDwnDcto.Enabled = ChkDcto.Checked;

            TxtPrecIni.Enabled = ChkPrec.Checked;
            TxtPrecFin.Enabled = ChkPrec.Checked;
        }

        Tabu.Columns.Add("arti", typeof(string));
        Tabu.Columns.Add("nomb", typeof(string));
        Tabu.Columns.Add("prec", typeof(double));

        chkLine.Attributes.Add("onclick", "javascript:CheckBox_DropDownList('ctl00$ContPlacHold$chkLine','ctl00$ContPlacHold$ddlLine')");
        chkMarc.Attributes.Add("onclick", "javascript:CheckBox_DropDownList('ctl00$ContPlacHold$chkMarc','ctl00$ContPlacHold$ddlMarc')");
        chkSecc.Attributes.Add("onclick", "javascript:CheckBox_DropDownList('ctl00$ContPlacHold$chkSecc','ctl00$ContPlacHold$ddlSecc')");
        chkSubS.Attributes.Add("onclick", "javascript:CheckBox_DropDownList('ctl00$ContPlacHold$chkSubS','ctl00$ContPlacHold$ddlSubS')");
        // ChkDcto.Attributes.Add("onclick", "javascript:CheckBox_DropDownList('ctl00$ContPlacHold$ChkDcto','ctl00$ContPlacHold$DrpDwnDcto')");
        ChkPrec.Attributes.Add("onclick", "javascript:CheckBox_TextBox('ctl00$ContPlacHold$ChkPrec','ctl00$ContPlacHold$TxtPrecIni', 'ctl00$ContPlacHold$TxtPrecFin')");

        //}
        //else Response.Redirect("LogUser.aspx?pModu=ARTI", true);
    }

    private bool Testeo()
    {
        LblMesg.Visible = false;
        bNext = true; sLine = "%"; sMarc = "%"; sSecc = "%"; sSubS = "%";
        
        if (chkLine.Checked) sLine = ddlLine.SelectedValue.ToString().Trim();
        if (chkMarc.Checked) sMarc = ddlMarc.SelectedValue.ToString().Trim();
        if (chkSecc.Checked) sSecc = ddlSecc.SelectedValue.ToString().Trim();
        if (chkSubS.Checked) sSubS = ddlSubS.SelectedValue.ToString().Trim();
        
        if (ChkPrec.Checked)
        {
            bNext = false;

            if ((TxtPrecIni.Text.Trim().Length > 0) || (TxtPrecIni.Text.Trim().Length > 0))
            {
                try
                {
                    dPrIn = double.Parse(TxtPrecIni.Text);
                    dPrFn = double.Parse(TxtPrecFin.Text);

                    if (dPrIn > dPrFn) LblMesg.Text = "Precio inicial mayor al precio final...";
                    else bNext = true;
                }
                catch { LblMesg.Text = "Los valores de precios están mal ingresados..."; }
            }
            else LblMesg.Text = "Debe ingresar el rango de precios...";
        }
        else { dPrIn = 0; dPrFn = 0; }

        return bNext;
    }

    private void LoadBinding()
    {
        string sArti;
        Tabu.Clear();
        imag.Visible = true;
        LblArti.Text = "";
        LblNomb.Text = "";
        LblPric.Text = "";

        // search photo's product, if success assign this file, otherwise the file LOGO.JPG
        for (int r = 0; r < GrdItem.Rows.Count; r++)
        {
            rFila = Tabu.NewRow();
            rFila["arti"] = ((Button)GrdItem.Rows[r].FindControl("BtnArti")).Text;
            rFila["nomb"] = ((Label)GrdItem.Rows[r].FindControl("TxtDesc")).Text;
            rFila["prec"] = ((Label)GrdItem.Rows[r].FindControl("TxtPrec")).Text;
            //rFila["arti"] = GrdItem.Rows[r].Cells[1].Text;
            //rFila["nomb"] = GrdItem.Rows[r].Cells[2].Text;
            //rFila["prec"] = GrdItem.Rows[r].Cells[3].Text;
            Tabu.Rows.Add(rFila);
        }

        DltItem.DataSource = Tabu;
        DltItem.DataBind();

        // search photo's product, if success assign this file, otherwise the file LOGO.JPG
        for (int r = 0; r < GrdItem.Rows.Count; r++)
        {
            sArti = ((CheckBox)DltItem.Items[r].FindControl("ChkArti")).Text.Trim();

            //if (System.IO.File.Exists(string.Format("{0}{1}{2}{3}", Server.MapPath("..\\fotos\\items"), "\\", sArti.Replace("/", "-"), ".jpg")))
            //    ((Image)DltItem.Items[r].FindControl("ImgArti")).ImageUrl = string.Format("{0}{1}{2}", "../fotos/items/", sArti.Replace("/", "-"), ".jpg");
            //else
            //    ((Image)DltItem.Items[r].FindControl("ImgArti")).ImageUrl = string.Format("{0}logo.jpg", "../fotos/items/");

            if (System.IO.File.Exists(string.Format("{0}{1}{2}{3}", Server.MapPath("fotos\\items"), "\\", sArti.Replace("/", "-"), ".jpg")))
                ((Image)DltItem.Items[r].FindControl("ImgArti")).ImageUrl = string.Format("{0}{1}{2}", "fotos/items/", sArti.Replace("/", "-"), ".jpg");
            else
                ((Image)DltItem.Items[r].FindControl("ImgArti")).ImageUrl = string.Format("{0}logo.jpg", "fotos/items/");

            ((Image)DltItem.Items[r].FindControl("ImgArti")).AlternateText = r.ToString().Trim();
            ((Image)DltItem.Items[r].FindControl("ImgArti")).Attributes.Add("onclick", string.Format("fnOpen('pagina.aspx?i1={0}&i2={1}&i3={2}')", sArti.Trim(), ((Label)GrdItem.Rows[r].FindControl("TxtDesc")).Text, ((Label)GrdItem.Rows[r].FindControl("TxtPrec")).Text));
            ((Image)DltItem.Items[r].FindControl("ImgArti")).Attributes.Add("onmouseover", string.Format("imgOnMouseOver(this, '{0}', '{1}', '{2:#,#0.00}')", sArti.Trim(), ((Label)GrdItem.Rows[r].FindControl("TxtDesc")).Text, double.Parse(((Label)GrdItem.Rows[r].FindControl("TxtPrec")).Text)));
        }
    }

    protected void GrdItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GrdItem.DataSource = Session["item"];
        GrdItem.DataMember = "item";
        GrdItem.PageIndex = e.NewPageIndex;
        GrdItem.DataBind();

        //GrdDato.DataBind();
        LoadBinding();
    }

    //protected void BtnBusc_Click(object sender, EventArgs e)
    //{
    //    if (Testeo())
    //    {
    //        // Session["item"] = dato.CargarDatosItems(ClsDatos.mEmpr, TxtIden.Text.Trim().ToUpper() + "%", sLine, dDcto, dPrIn, dPrFn, sCate, RdoBtnStoc.SelectedValue.ToString());
    //        GrdItem.DataSource = Session["item"];
    //        GrdItem.DataMember = "item";
    //        GrdItem.DataBind();
    //        LoadBinding();
    //        imag.Visible = true;
    //        //GrdDato.DataBind();
    //    }
    //    else { LblMesg.Visible = true; imag.Visible = false; }
    //}

    //protected void ImgArti_Click(object sender, ImageClickEventArgs e)
    //{
    //    //Imag.Visible = true;
    //    //Imag.ImageUrl = ((ImageButton)sender).ImageUrl;
    //    LblArti.Text = ((CheckBox)DltItem.Items[int.Parse(((ImageButton)sender).AlternateText)].FindControl("ChkArti")).Text;
    //    LblNomb.Text = ((Label)DltItem.Items[int.Parse(((ImageButton)sender).AlternateText)].FindControl("LblName")).Text;
    //    LblPric.Text = "$ " + ((Label)DltItem.Items[int.Parse(((ImageButton)sender).AlternateText)].FindControl("LblVent")).Text;
    //}

    protected void ddlLine_SelectedIndexChanged(object sender, EventArgs e)
    {
        dato.WEBLoadMarc(ddlMarc, ClsDatos.mEmpr, ddlLine.SelectedValue);
        dato.WEBLoadSecc(ddlSecc, ClsDatos.mEmpr, ddlLine.SelectedValue);
        dato.WEBLoadSubS(ddlSubS, ClsDatos.mEmpr, ddlLine.SelectedValue);
    }

    protected void btnBusc_Click(object sender, ImageClickEventArgs e)
    {
        if (Testeo())
        {
            sCoDe = "%";
            if (TxtIden.Text.Trim().Length > 0) sCoDe += TxtIden.Text.Trim().ToUpper() + "%";
            
            Session["item"] = dato.CargarDatosItems(ClsDatos.mEmpr, sCoDe, sLine, sMarc, sSecc, sSubS);
            GrdItem.DataSource = Session["item"];
            GrdItem.DataMember = "item";
            GrdItem.DataBind();
            LoadBinding();
            imag.Visible = true;
            //GrdDato.DataBind();
        }
        else { LblMesg.Visible = true; imag.Visible = false; }
    }
</script>

<asp:Content ID="Cont01" ContentPlaceHolderID="ContPlacHold" runat="Server">
    <asp:Panel ID="Pnl" runat="server" DefaultButton="btnBusc" Width="100%">
        <table id="TabStar" cellpadding="0" cellspacing="0" border="0" width="100%" style="background-image: url('./Imgs/portal/Fondo02.jpg')">
            <tr>
                <td>
                    <table id="TabDato" border="0" cellpadding="0" cellspacing="7" width="100%" bgcolor="#000000">
                        <tr>
                            <td align="right" valign="middle">
                                <asp:Label ID="Lbl01" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#99FFCC" Text="Código / Descripción :" Width="140px"></asp:Label>
                            </td>
                            <td align="left" valign="middle">
                                <asp:TextBox ID="TxtIden" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Names="Courier New" Font-Size="9pt" Width="165px"></asp:TextBox>
                            </td>
                            <td align="right" valign="middle">
                                <asp:CheckBox ID="chkLine" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#99FFCC" Text="Línea" TextAlign="Left" Width="100px" />
                            </td>
                            <td align="left" valign="middle">
                                <asp:DropDownList ID="ddlLine" runat="server" Font-Names="Arial" Font-Size="8pt" Width="220px" AutoPostBack="True" OnSelectedIndexChanged="ddlLine_SelectedIndexChanged" Enabled="False">
                                </asp:DropDownList>
                            </td>
                            <td align="right" valign="middle">
                                <asp:CheckBox ID="chkSecc" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#99FFCC" Text="Sección" TextAlign="Left" Width="100px" />
                            </td>
                            <td valign="middle">
                                <asp:DropDownList ID="ddlSecc" runat="server" Enabled="False" Font-Names="Arial" Font-Size="8pt" Width="220px">
                                </asp:DropDownList>
                            </td>
                            <td rowspan="3" width="100px" align="center" valign="middle" bgcolor="White">
                                <asp:ImageButton ID="btnBusc" runat="server" ImageUrl="btns/filtrar.png" OnClick="btnBusc_Click" Width="50px" ToolTip="Buscar información..." />
                            </td>
                        </tr>
                        <tr valign="middle">
                            <td align="right">
                                <asp:CheckBox ID="ChkPrec" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#99FFCC" Text="Precio entre :" TextAlign="Left" Width="100px" Visible="False" />
                            </td>
                            <td align="left">
                                <table id="TabPrec" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="left" style="width: 50px; height: 23px">
                                            <asp:TextBox ID="TxtPrecIni" runat="server" BorderStyle="Solid" BorderWidth="1px" Enabled="False" Font-Names="Courier New" Font-Size="9pt" Width="70px" Visible="False"></asp:TextBox>
                                        </td>
                                        <td align="center" style="width: 20px; height: 23px">
                                            <asp:Label ID="Lbl02" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="9pt" Text="y" Width="5px" ForeColor="#99FFCC" Visible="False"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="TxtPrecFin" runat="server" BorderStyle="Solid" BorderWidth="1px" Enabled="False" Font-Names="Courier New" Font-Size="9pt" Width="70px" Visible="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right">
                                <asp:CheckBox ID="chkMarc" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#99FFCC" Text="Marca" TextAlign="Left" Width="100px" />
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlMarc" runat="server" Enabled="False" Font-Names="Arial" Font-Size="8pt" Width="220px">
                                </asp:DropDownList>
                            </td>
                            <td align="right">
                                <asp:CheckBox ID="chkSubS" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#99FFCC" Text="SubSección" TextAlign="Left" Width="100px" />
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSubS" runat="server" Enabled="False" Font-Names="Arial" Font-Size="8pt" Width="220px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr>
                <td valign="top" width="100%" align="center">
                    <table id="TabLeft" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td valign="top" align="center" width="100%">
                                <table id="TabHead" border="0" cellpadding="5" cellspacing="5" width="100%">
                                    <tr>
                                        <td valign="top" align="center">
                                            <table id="TabIzqu" border="0" cellpadding="0" cellspacing="0" width="350px">
                                                <tr style="height: 16px">
                                                    <td align="center">
                                                        <asp:Label ID="LblArti" runat="server" Font-Bold="True" Font-Names="Arial"
                                                            Font-Size="10pt" ForeColor="#CCFFCC" BackColor="#3C3C3C" Width="100%" />
                                                    </td>
                                                </tr>
                                                <tr style="height: 14px">
                                                    <td align="left" valign="middle">
                                                        <asp:Label ID="LblNomb" runat="server" Font-Names="Arial" Font-Size="8pt"
                                                            ForeColor="White" Font-Bold="True" Width="100%" BackColor="Gray" />
                                                    </td>
                                                </tr>
                                                <tr style="height: 350px">
                                                    <td align="center" valign="middle">
                                                        <asp:Image ID="imag" runat="server" Height="350px"
                                                            Width="350px" ImageUrl="./imgs/raton.png" Visible="False" />
                                                    </td>
                                                </tr>
                                                <tr style="height: 16px">
                                                    <td align="center" valign="middle">
                                                        <asp:Label ID="LblPric" runat="server" Font-Names="Arial" Font-Size="10pt"
                                                            ForeColor="#CCFFCC" Font-Bold="True" BackColor="#3C3C3C" Width="100%" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top" align="center">
                                            <table cellpadding="0" cellspacing="0" id="TabCent">
                                                <tr>
                                                    <td align="center" style="width: 100%">
                                                        <asp:GridView ID="GrdItem" runat="server" AllowPaging="True"
                                                            AllowSorting="True" AutoGenerateColumns="False" CellPadding="0"
                                                            Font-Names="Courier New" Font-Size="10pt" ForeColor="White" GridLines="None"
                                                            OnPageIndexChanging="GrdItem_PageIndexChanging" PageSize="20"
                                                            ShowHeader="False">
                                                            <FooterStyle Font-Bold="True" />
                                                            <RowStyle />
                                                            <Columns>
                                                                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="ARTICULO">
                                                                    <ItemTemplate>
                                                                        <table border="0" cellpadding="0" cellspacing="0" frame="void">
                                                                            <tr>
                                                                                <td align="right" valign="middle">
                                                                                    <asp:Label ID="LblCodi" runat="server" Font-Bold="True" Font-Size="8pt"
                                                                                        ForeColor="#004040" Text="Código :" Visible="False"></asp:Label>
                                                                                </td>
                                                                                <td align="left" valign="middle">
                                                                                    <asp:Button ID="BtnArti" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="9pt"
                                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "arti") %>' Visible="False" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" valign="middle">
                                                                                    <asp:Label ID="LblDesc" runat="server" Font-Bold="True" Font-Size="8pt" ForeColor="#004040" Text="Descripción :" Visible="False"></asp:Label>
                                                                                </td>
                                                                                <td align="left" valign="middle">
                                                                                    <asp:Label ID="TxtDesc" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="9pt" ForeColor="Black"
                                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "nomb") %>' Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" valign="middle">
                                                                                    <asp:Label ID="LblPrec" runat="server" Font-Bold="True" Font-Size="8pt" ForeColor="#004040" Text="Precio :" Visible="False"></asp:Label>
                                                                                </td>
                                                                                <td align="left" valign="middle">
                                                                                    <asp:Label ID="TxtPrec" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="9pt" ForeColor="Black"
                                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "prec") %>' Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" valign="middle">
                                                                                    <asp:Label ID="LblDcto" runat="server" Font-Bold="True" Font-Size="8pt" ForeColor="#004040" Text="Descuento(%) :" Visible="False"></asp:Label>
                                                                                </td>
                                                                                <td align="left" valign="middle">
                                                                                    <asp:Label ID="TxtDcto" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="9pt" ForeColor="Black"
                                                                                        Text='<%# DataBinder.Eval(Container.DataItem, "dcto") %>' Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle Font-Bold="False" ForeColor="#003399" HorizontalAlign="Center" />
                                                            <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle Font-Bold="True" ForeColor="Black" />
                                                            <AlternatingRowStyle ForeColor="#284775" />
                                                            <PagerSettings PageButtonCount="20" Mode="NumericFirstLast" />
                                                            <EditRowStyle />
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="middle" style="width: 100%">
                                                        <asp:DataList ID="DltItem" runat="server" RepeatColumns="5"
                                                            RepeatDirection="Horizontal" CellSpacing="5">
                                                            <ItemTemplate>
                                                                <table id="TabArti" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td style="width: 110px">
                                                                            <asp:CheckBox ID="ChkArti" runat="server" Font-Bold="True"
                                                                                Font-Names="Arial Narrow" Font-Size="8pt" ForeColor="White"
                                                                                Text='<%# DataBinder.Eval(Container.DataItem, "arti") %>' Visible="False"
                                                                                Width="100px" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" colspan="1" style="width: 110px">
                                                                            <asp:ImageButton ID="ImgArti" runat="server" BorderStyle="Inset"
                                                                                BorderWidth="1px" Height="100px" Width="100px"
                                                                                onmouseout="imgOnMouseOut()"
                                                                                CausesValidation="False" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 110px">
                                                                            <asp:Label ID="LblName" runat="server"
                                                                                Text='<%# DataBinder.Eval(Container.DataItem, "nomb") %>' Visible="False"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 110px">
                                                                            <asp:Label ID="LblVent" runat="server"
                                                                                Text='<%# DataBinder.Eval(Container.DataItem, "prec") %>' Visible="False"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Label ID="LblMesg" runat="server" BackColor="#8B272D" Font-Bold="False" Font-Names="Arial"
                                    Font-Size="10pt" ForeColor="White" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
