using System;
using System.Data;
//using System.Configuration;
//using System.Collections;
using System.Web;
//using System.Web.Security;
using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;
//using Infragistics.WebUI.UltraWebNavigator;

public partial class PlantillaInformes : System.Web.UI.MasterPage
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
        try
        {
            PnlTitu.Enabled = (bool)Session["usua"];
            LblUsua.Text = Session["inte"].ToString();
            //LblEmpr.Text = Session["fact"].ToString();
            BtnLogo.Visible = (bool)Session["usua"];
            if (/*rcbDiEm.Items.Count == 0*/!rcbDiEm.Visible) { Usua.LoadEmpresa(rcbDiEm, Session["iden"].ToString(), "WePo"); }
            rcbDiEm_SelectedIndexChanged(null, null);
            rcbDiEm.Visible = true; // rcbDiEm.Enabled = false;
        }
        catch { rcbDiEm.Visible = false; Mnu.Enabled = false; }
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

            for (int r = 0; r < ((DataTable)Session["mnuWePo"]).Rows.Count; r++)
                if (pMenu.ChildItems[c].Value.Trim() == ((DataTable)Session["mnuWePo"]).Rows[r][0].ToString().Trim())
                {
                    pMenu.ChildItems[c].Enabled = true;
                    pMenu.ChildItems[c].Text = ((DataTable)Session["mnuWePo"]).Rows[r][1].ToString();
                    break;
                }

            if (pMenu.ChildItems[c].Enabled) { LoadMenuDetail(pMenu.ChildItems[c]); }
        }        
    }

    protected void LoadMenu()
    {
        // asinga las opciones del menu, que fue recuperado al registrarse
        for (int c = 0; c < Mnu.Items.Count; c++)
        {
            Mnu.Items[c].Enabled = false;

            for (int r = 0; r < ((DataTable)Session["mnuWePo"]).Rows.Count; r++)
                if (Mnu.Items[c].Value.Trim() == ((DataTable)Session["mnuWePo"]).Rows[r][0].ToString().Trim())
                {
                    Mnu.Items[c].Enabled = true;
                    Mnu.Items[c].Text = ((DataTable)Session["mnuWePo"]).Rows[r][1].ToString();
                    break;
                }

            if (Mnu.Items[c].Enabled) { LoadMenuDetail(Mnu.Items[c]); }
        }

        Mnu.Enabled = true;
    }

    protected void BtnLoko_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("http://portal.electroexito.com/", false);
        Response.Redirect("../", false);
    }

    //protected void imgExit_Click(object sender, ImageClickEventArgs e)
    //{
    //    Response.Redirect("firstInfo.aspx", false);
    //}

    protected void rcbDiEm_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        if (rcbDiEm.SelectedIndex >= 0 && rcbDiEm.Enabled)
        {
            Session["esqu"] = rcbDiEm.SelectedValue;
            ClsDatos.mEmpr = rcbDiEm.SelectedValue;
            //Session["fact"] = DdlEmpr.SelectedItem.Text;
            // retorna el DataTable del menu correspondiente al usuario que se reconocio
            //Session["mnuWePo"] = Usua.LoadTypeByApplication(rcbDiEm.SelectedValue, Session["iden"].ToString(), "WePo");
            //LoadMenu();
        }
        else if (!rcbDiEm.Enabled) rcbDiEm.SelectedValue = Session["esqu"].ToString();

        if (rcbDiEm.SelectedIndex >= 0)
        {
            Session["mnuWePo"] = Usua.LoadTypeByApplication(rcbDiEm.SelectedValue, Session["iden"].ToString(), "WePo");
            LoadMenu();
        }
    }
}