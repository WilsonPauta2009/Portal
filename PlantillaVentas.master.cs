using System;
//using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;
using System.Data;
using Infragistics.Web.UI.ListControls;

public partial class PlantillaVentas : System.Web.UI.MasterPage
{
    ClsVentas objPedidos = new ClsVentas();
    public delegate void SomethingSelected(object sender, String SelectedValue);
    public event SomethingSelected OnSomethingSelected;

    protected void Page_Init(object Sender, EventArgs e)
    {
        Response.Buffer = true;
        Response.Expires = 0;
        Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        Response.CacheControl = "no-cache";

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                //objPedidos.LoadEmpresa(wdpEmpr, Session["iden"].ToString(), "MOVI");
                wdpEmpr.SelectedItemIndex = 0;
                wdpEmpr_SelectionChanged(null, null);
                PnlTitu.Enabled = (bool)Session["usua"];

                LblUsua.Text = Session["inte"].ToString();
                LblEmpr.Text = Session["fact"].ToString();
                BtnLogo.Visible = (bool)Session["usua"];
                LoadMenu();
            }
            catch { Mnu.Enabled = false; }
        }
    }

    protected void DdlEmpr_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void BtnLogo_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Server.Transfer("Index.aspx", false);
    }
    
    protected void LoadMenuDetail(System.Web.UI.WebControls.MenuItem pMenu)
    {
        // asinga las opciones del menu, que fue recuperado al registrarse
        for (int c = 0; c < pMenu.ChildItems.Count; c++)
        {
            pMenu.ChildItems[c].Enabled = false;

            for (int r = 0; r < ((DataTable)Session["mnu_info"]).Rows.Count; r++)
                if (pMenu.ChildItems[c].Value.Trim() == ((DataTable)Session["mnu_info"]).Rows[r][0].ToString().Trim())
                {
                    pMenu.ChildItems[c].Enabled = true;
                    pMenu.ChildItems[c].Text = ((DataTable)Session["mnu_info"]).Rows[r][1].ToString();
                    break;
                }

            if (pMenu.ChildItems[c].Enabled) { LoadMenuDetail(pMenu.ChildItems[c]); }
        }
    }

    public void loadEmpr(WebDropDown wdpEmpr, WebDropDown wdpSucu, string iden)
    {
        objPedidos.LoadEmpresa(wdpEmpr, iden, "MOVI");
        wdpEmpr.SelectedItemIndex = 0;
        objPedidos.TestUserModule_(wdpSucu, wdpEmpr.SelectedValue, iden, "MOVI");
        wdpSucu.SelectedItemIndex = 0;
    }

    protected void LoadMenu()
    {
        // asinga las opciones del menu, que fue recuperado al registrarse
        for (int c = 0; c < Mnu.Items.Count; c++)
        {
            Mnu.Items[c].Enabled = false;

            for (int r = 0; r < ((DataTable)Session["mnu_info"]).Rows.Count; r++)
                if (Mnu.Items[c].Value.Trim() == ((DataTable)Session["mnu_info"]).Rows[r][0].ToString().Trim())
                {
                    Mnu.Items[c].Enabled = true;
                    Mnu.Items[c].Text = ((DataTable)Session["mnu_info"]).Rows[r][1].ToString();
                    break;
                }

            if (Mnu.Items[c].Enabled) { LoadMenuDetail(Mnu.Items[c]); }
        }

        Mnu.Enabled = true;
    }

    protected void BtnLoko_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://www.aje.com.ec/", false);
    }

    protected void imgExit_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("FirstInfo.aspx", false);
    }
    protected void wdpEmpr_SelectionChanged(object sender, Infragistics.Web.UI.ListControls.DropDownSelectionChangedEventArgs e)
    {
        if (wdpEmpr.SelectedItemIndex >= 0)
        {
            //if (objPedidos.TestUserERP(ClsDatos.mEmpr, Session["iden"].ToString(), "MOVI")) {
            objPedidos.TestUserModule_(wdpSuc, wdpEmpr.SelectedValue, Session["iden"].ToString() /*"0104591417"*/, "MOVI");
            wdpSuc.SelectedItemIndex = 0;
            wdpSuc_SelectionChanged(wdpSuc, null);
            //}
        }
    }
    protected void wdpSuc_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
    {
        try
        {
            OnSomethingSelected(sender, ((WebDropDown)sender).SelectedValue);
        }
        catch { }
    }
}