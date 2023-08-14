using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlantillaMAIN : System.Web.UI.MasterPage
{
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
        //Server.ClearError();        
        if (!Page.IsPostBack) HylManu.NavigateUrl = string.Format("./manuales/postventa.pdf");

        try
        {
            //PnlTitu.Enabled = (bool)Session["usua"];
            //DdlEmpr.Visible = (bool)Session["usua"];
            BtnCerr.Visible = (bool)Session["usua"];
            LblUsua.Text = Session["inte"].ToString();
            //LblEmpr.Text = Session["fact"].ToString();
            //Usua.GetEmpr(DdlEmpr, Session["iden"].ToString());
            //BtnLogo.Visible = (bool)Session["usua"];
            //LoadMenu();
            //Wdm.Enabled = true;
            PnlMenu.Visible = true;
        }
        catch { PnlMenu.Visible = false; LblUsua.Text = ""; BtnCerr.Visible = false; }
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Clear();
        Response.Redirect("default.aspx");
    }
    
    protected void BtnEnPr_Click(object sender, ImageClickEventArgs e)
    {
        Response.Clear();
        Response.Redirect("reparaciones.aspx");
    }

    protected void BtnFact_Click(object sender, ImageClickEventArgs e)
    {
        Response.Clear();
        Response.Redirect("facturadas.aspx");
    }

    protected void BtnCeIn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Clear();
        Response.Redirect("first.aspx");
    }

    protected void BtnHist_Click(object sender, ImageClickEventArgs e)
    {
        Response.Clear();
        Response.Redirect("historial.aspx");
    }

    protected void BtnLoko_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://192.168.4.251/aje", false);
    }
}
