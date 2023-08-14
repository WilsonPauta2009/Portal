using System;
using System.Data;
//using System.Configuration;
//using System.Collections;
using System.Web;
//using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;
//using Infragistics.WebUI.UltraWebNavigator;

public partial class PlantillaNomina : System.Web.UI.MasterPage
{
    ClsUser Usua = new ClsUser();

    //protected override void OnInit(EventArgs e)
    //{
    //    base.OnInit(e);
    //    Response.CacheControl = "no-cache";
    //    Response.AddHeader("Pragma", "no-cache");
    //    Response.Expires = -1;

    //    LblUsua.Text = DateTime.Now.ToString();
    //}

    protected void Page_Init(object Sender, EventArgs e)
    {
        Response.Buffer = true;
        Response.Expires = 0;
        Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        Response.CacheControl = "no-cache";

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
    }

    //public void Mensaje(Page pPage, string tMsg, string Msg)
    //{
    //    ScriptManager.RegisterStartupScript(pPage, pPage.GetType(), "JsStatus", "generate('" + tMsg + "', '" + Msg + "');", true);
    //}

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            PnlTitu.Enabled = (bool)Session["usua"];
            //DdlEmpr.Visible = (bool)Session["usua"];
            LblUsua.Text = Session["inte"].ToString();
            LblEmpr.Text = Session["esqu"].ToString();
            ClsDatos.mEmpr = Session["esqu"].ToString();
            //Usua.GetEmpr(DdlEmpr, Session["iden"].ToString());
            BtnLogo.Visible = (bool)Session["usua"];
            LoadMenu();
            Mnu.Enabled = true;
            //LoadMenu(UwmPrin.Items);
            //UwmPrin.DataBind();
            //((Panel)Master.FindControl("PnlTitu")).Enabled = (bool)Session["usua"];
            //((DropDownList)Master.FindControl("DdlEmpr")).Visible = (bool)Session["usua"];
            //Usua.GetEmpr((DropDownList)Master.FindControl("DdlEmpr"), Session["iden"].ToString());
            //((Label)Master.FindControl("LblUsua")).Text = Session["inte"].ToString();
        }
        catch { Mnu.Enabled = false; }

        //wdpDiEm.Visible = Mnu.Enabled;
    }

    //protected void DdlEmpr_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //Session["esqu"] = DdlEmpr.SelectedValue;
    //}

    protected void BtnLogo_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Server.Transfer("Index.aspx", false);
    }

    protected void LoadMenu()
    {
        for (int c = 0; c < Mnu.Items.Count; c++)
        {
            Mnu.Items[c].Enabled = false;

            for (int r = 0; r < ((DataTable)Session["menu"]).Rows.Count; r++)
                if (Mnu.Items[c].Value.Trim() == ((DataTable)Session["menu"]).Rows[r][0].ToString().Trim())
                {
                    Mnu.Items[c].Enabled = true;
                    Mnu.Items[c].Text = ((DataTable)Session["menu"]).Rows[r][1].ToString();
                    LoadMenuRecursive(Mnu.Items[c]);
                }
        }
    }

    protected void LoadMenuRecursive(MenuItem pMnu)
    {
        for (int c = 0; c < pMnu.ChildItems.Count; c++)
        {
            pMnu.ChildItems[c].Enabled = false;

            for (int r = 0; r < ((DataTable)Session["menu"]).Rows.Count; r++)
                if (pMnu.ChildItems[c].Value.Trim() == ((DataTable)Session["menu"]).Rows[r][0].ToString().Trim())
                {
                    pMnu.ChildItems[c].Enabled = true;
                    pMnu.ChildItems[c].Text = ((DataTable)Session["menu"]).Rows[r][1].ToString();
                    LoadMenuRecursive(pMnu.ChildItems[c]);
                }
        }
    }

    protected void BtnLoko_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("http://190.12.30.238", false);
        Response.Redirect("../", false);
    }

    protected void wdpDiEm_SelectionChanged(object sender, Infragistics.Web.UI.ListControls.DropDownSelectionChangedEventArgs e)
    {
        if (wdpDiEm.SelectedItemIndex >= 0)
        {
            Session["esqu"] = wdpDiEm.Items[wdpDiEm.SelectedItemIndex].Value;
            Session["menu"] = Usua.LoadTypeByApplication(Session["esqu"].ToString(), Session["iden"].ToString());
        }
    }

    protected void BtnSoft_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://fb.com/SoftLution", false);
    }
}