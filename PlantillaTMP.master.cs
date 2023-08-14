using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class PlantillaTMP : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*try
        {
            LblHead.Text = Session["sApNo"].ToString();
            BtnCerr.Visible = true;
        }
        catch
        {
            LblHead.Text = "";
            BtnCerr.Visible = false;
        }*/
    }

    protected void BtnBusc_Click(object sender, ImageClickEventArgs e)
    {
        bool bVeri = false;

        try { if (Session["sIden"].ToString().Length > 0) bVeri = true; }
        catch { }

        if (bVeri) Response.Redirect("articulos.aspx", true);
        else Response.Redirect("LogUser.aspx?pModu=ARTI", true);
    }

    protected void BtnHome_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("default.aspx", true);
        /*if (System.IO.File.Exists("default.aspx")) Response.Redirect("default.aspx", true);
        else if (System.IO.File.Exists("../default.aspx")) Response.Redirect("../default.aspx", true);*/
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        try { Server.Transfer("default.aspx", false); }
        catch { Server.Transfer("../default.aspx", false); }
        
        /*if (System.IO.File.Exists("default.aspx")) Response.Redirect("default.aspx", true);
        else if (System.IO.File.Exists("../default.aspx")) Response.Redirect("../default.aspx", true);*/
    }

    protected void BtnJoye_Click(object sender, ImageClickEventArgs e)
    {
        bool bVeri = false;

        try { if (Session["sIden"].ToString().Length > 0) bVeri = true; }
        catch { }

        if (bVeri) Response.Redirect("frmjoyas.aspx", true);
        else Response.Redirect("LogUser.aspx?pModu=JOYE", true);
    }
}