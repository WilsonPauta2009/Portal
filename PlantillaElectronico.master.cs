using System;
//using System.Collections.Generic;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;

public partial class PlantillaElectronico : System.Web.UI.MasterPage
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

    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
        //    PnlTitu.Enabled = (bool)Session["usua"];

        //    LblUsua.Text = Session["inte"].ToString();
        //    LblEmpr.Text = Session["fact"].ToString();
        //    BtnLogo.Visible = (bool)Session["usua"];
        //    //LoadMenu();
        //}
        //catch {  }
    }

    protected void DdlEmpr_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Session["esqu"] = DdlEmpr.SelectedValue;
    }

    protected void BtnLogo_Click(object sender, EventArgs e)
    {
        //Session.Clear();
        //Session.Abandon();
        Session.RemoveAll();
        Server.Transfer("Index.aspx", false);
    }

    //protected void LoadMenu(Items pItem)
    //{   

    //    for (int c = 0; c < pItem.Count; c++)
    //    {
    //        for (int r = 0; r < ((DataTable)Session["mnu_info"]).Rows.Count; r++)
    //            if (pItem[c].AccessKey.Trim() == ((DataTable)Session["mnu_info"]).Rows[r][0].ToString().Trim())
    //            {
    //                pItem[c].Hidden = false; //.Tools[((DataTable)Session["menu"]).Rows[c][0].ToString()].SharedProps.Visible = true;
    //                pItem[c].Text = ((DataTable)Session["mnu_info"]).Rows[r][1].ToString();//.Tools[((DataTable)Session["menu"]).Rows[c][0].ToString()].SharedProps.Caption = ((DataTable)Session["menu"]).Rows[c][1].ToString();
    //                pItem[c].Tag = ((DataTable)Session["mnu_info"]).Rows[r][2].ToString();//.Tools[((DataTable)Session["menu"]).Rows[c][0].ToString()].SharedProps.Tag = ((DataTable)Session["menu"]).Rows[c][2].ToString();                    
    //            }

    //        LoadMenu(pItem[c].Items);
    //    }  
    //}


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

    //protected void LoadMenu()
    //{
    //    // asinga las opciones del menu, que fue recuperado al registrarse
    //    for (int c = 0; c < Mnu.Items.Count; c++)
    //    {
    //        Mnu.Items[c].Enabled = false;

    //        for (int r = 0; r < ((DataTable)Session["mnu_info"]).Rows.Count; r++)
    //            if (Mnu.Items[c].Value.Trim() == ((DataTable)Session["mnu_info"]).Rows[r][0].ToString().Trim())
    //            {
    //                Mnu.Items[c].Enabled = true;
    //                Mnu.Items[c].Text = ((DataTable)Session["mnu_info"]).Rows[r][1].ToString();
    //                break;
    //            }

    //        if (Mnu.Items[c].Enabled) { LoadMenuDetail(Mnu.Items[c]); }
    //    }

    //    Mnu.Enabled = true;
    //}

    protected void BtnLoko_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("http://190.12.30.238/", false);
        Response.Redirect("../", false);
    }

    protected void imgExit_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("FirstInfo.aspx", false);
    }

    protected void BtnSoft_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("http://fb.com/SoftLution", false);
    }
}