using System;
//using System.Data;
//using System.Configuration;
//using System.Collections;
//using System.Web;
//using System.Web.Security;
using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;

public partial class Plantilla : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
        try
        {
            LblHead.Text = Session["sApNo"].ToString();
            BtnCerr.Visible = true;
        }
        catch
        {
            LblHead.Text = "";
            BtnCerr.Visible = false;
        }
        */
    }

    protected void BtnBusc_Click(object sender, ImageClickEventArgs e)
    {
        //bool bVeri = false;

        //try { if (Session["sIden"].ToString().Length > 0) bVeri = true; }
        //catch { }

        //if (bVeri) Response.Redirect("articulos.aspx", true);
        //else Response.Redirect("LogUser.aspx?pModu=ARTI", true);

        Response.Redirect("articulos.aspx", true);
    }

    protected void BtnHome_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("default.aspx", true);
        /*if (System.IO.File.Exists("default.aspx")) Response.Redirect("default.aspx", true);
        else if (System.IO.File.Exists("../default.aspx")) Response.Redirect("../default.aspx", true);*/
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        /*Session.RemoveAll();
        try { Server.Transfer("default.aspx", false); }
        catch { Server.Transfer("../default.aspx", false); }*/        
    }

    protected void BtnJoye_Click(object sender, ImageClickEventArgs e)
    {
        //bool bVeri = false;

        //try { if (Session["sIden"].ToString().Length > 0) bVeri = true; }
        //catch { }

        //if (bVeri) Response.Redirect("frmjoyas.aspx", true);
        //else Response.Redirect("LogUser.aspx?pModu=JOYE", true);
    }

    protected void BtnLoko_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("", false);
    }

    protected void BtnFace_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://fv.com/SoftLution", false);
    }
    
    protected void BtnTwit_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("https://twitter.com/", false);
    }

    protected void BtnGoog_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("https://www.google.com.ec", false);
    }
    protected void btnNomi_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect(@"./nomina", false);
    }

    protected void btnElec_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect(@"./electronico", false);
    }

    protected void btnVent_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect(@"./empresarial", false);
    }

    protected void btnCaWe_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("frmCata1.aspx", false);
    }
}