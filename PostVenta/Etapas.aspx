<%@ Page Language="C#" AutoEventWireup="true" %>


<!-- %@ Register assembly="Infragistics4.Web.v12.1, Version=12.1.20121.2072, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.Web.UI.GridControls" tagprefix="ig" % -->
<!-- %@ Register assembly="Infragistics4.Web.v12.1, Version=12.1.20121.2072, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.Web.UI.ListControls" tagprefix="ig" % -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    ClsPostVenta PoVe = new ClsPostVenta();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //WdtReDe.DataSource = PoVe.LoadLevelDesglose(ClsDatos.mEmpr, "RE", long.Parse(((LinkButton)sender).Text));
        string pNuRe = Request.Params[0].ToString().Trim();

        this.Title = string.Format("SOFTLUTION: N° {0}", pNuRe);
        WdtReDe.DataSource = PoVe.LoadLevelDesglose(ClsDatos.mEmpr, "RE", long.Parse(pNuRe));
        WdtReDe.DataBind();

        if (WdtReDe.Rows.Count > 0)
        {
            WivImag.Items.Clear();
            string sRuta = string.Format("./docs/{0}", pNuRe);

            if (System.IO.File.Exists(Server.MapPath(string.Format("./docs/{0}/cotizacion_{0}.pdf", pNuRe))))
            {
                HylCoti.Visible = true;
                HylCoti.NavigateUrl = string.Format("./docs/{0}/cotizacion_{0}.pdf", pNuRe);
            }
            else HylCoti.Visible = false;

            try
            {
                string[] sFile = System.IO.Directory.GetFiles(Server.MapPath(sRuta), "*.jpg");

                for (byte f = 0; f < sFile.Length; f++)
                {
                    string[] sImag = sFile[f].Split('\\');
                    Infragistics.Web.UI.ListControls.ImageItem Imag = new Infragistics.Web.UI.ListControls.ImageItem();
                    Imag.ImageUrl = string.Format("{0}/{1}", sRuta, sImag[sImag.Length - 1]);
                    Imag.ToolTip = sImag[sImag.Length - 1];
                    WivImag.Items.Add(Imag);
                }

                if (WivImag.Items.Count > 0) WivImag.Visible = true; else WivImag.Visible = false;
            }
            catch { WivImag.Visible = false; }

            PnlReDe.Visible = true;
        }
        else PnlReDe.Visible = false;

        //BtnFilt.Visible = !PnlReDe.Visible;
        //BtnConf.Visible = !PnlReDe.Visible;
        //GrdView_Repa.Enabled = !PnlReDe.Visible;
    }
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SOFTLUTION</title>
</head>
<body>
    <form id="FrmEtapas" runat="server">
    <div>
        <asp:ScriptManager ID="ScpMana" runat="server"></asp:ScriptManager>
        <asp:Panel ID="PnlReDe" runat="server" Visible="False">
            <table cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="left" valign="middle">
                        <asp:HyperLink ID="HylCoti" runat="server" Font-Bold="False" 
                            Font-Names="Courier New" Font-Size="10pt" Visible="False" Target="_blank">Cotización</asp:HyperLink>
                    </td>
                </tr>                        
                <tr>
                    <td>
                        <ig:WebDataGrid ID="WdtReDe" runat="server" AutoGenerateColumns="False" 
                            Font-Size="8pt" StyleSetName="RubberBlack" 
                            Width="100%">
                            <Columns>
                                <ig:GroupField Key="ORIG">
                                    <Columns>
                                        <ig:BoundDataField DataFieldName="ORNO" Key="ORNO">
                                            <Header Text="Etapa" />
                                        </ig:BoundDataField>
                                        <ig:BoundDataField DataFieldName="USOR_" Key="USOR">
                                            <Header Text="Emite" />
                                        </ig:BoundDataField>
                                        <ig:BoundDataField DataFieldName="FEOR" Key="FEOR">
                                            <Header Text="Registro" />
                                        </ig:BoundDataField>
                                        <ig:BoundDataField DataFieldName="OBSE" Key="OBSE">
                                            <Header Text="Observaciones" />
                                        </ig:BoundDataField>
                                    </Columns>
                                    <Header Text="ORIGEN :" />
                                </ig:GroupField>
                                <ig:GroupField Key="DEST">
                                    <Columns>
                                        <ig:BoundDataField DataFieldName="DENO" Key="DENO">
                                            <Header Text="Etapa" />
                                        </ig:BoundDataField>
                                        <ig:BoundDataField DataFieldName="USDE_" Key="USDE">
                                            <Header Text="Recibe" />
                                        </ig:BoundDataField>
                                        <ig:BoundDataField DataFieldName="FEDE" Key="FEDE">
                                            <Header Text="ESTATUS" />
                                        </ig:BoundDataField>
                                        <ig:BoundDataField DataFieldName="ESPE" Key="ESPE">
                                            <Header Text="Observaciones" />
                                        </ig:BoundDataField>
                                    </Columns>
                                    <Header Text="DESTINO :" />
                                </ig:GroupField>
                            </Columns>
                        </ig:WebDataGrid>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ig:WebImageViewer ID="WivImag" runat="server" Height="300px" 
                            StyleSetName="RubberBlack" Visible="False"></ig:WebImageViewer>
                        </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
