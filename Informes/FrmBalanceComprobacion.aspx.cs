using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BalanceComprobacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*bool bVeri = false;

        try
        {*/
            //if (Session["usua"].ToString().Length > 0) bVeri = true;
            TxtEmpr.Text = ClsDatos.mEmpr;
            TxtUsua.Text = Session["iden"].ToString();
        /*}
        catch { }*/

        /*if (bVeri)
        {*/
            if (!Page.IsPostBack)
            {
                WdtFeIn.Value = DateTime.Now;
                WdtFeFn.Value = DateTime.Now;
            }
        /*}
        else Response.Redirect("../LogUser.aspx?pModu=INFO", true);*/
    }

    //protected void BtnCerr_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("../default.aspx", true);
    //}

    //protected void WibProc_Click(object sender, Infragistics.WebUI.WebDataInput.ButtonEventArgs e)
    //{
        
    //}
    
    protected void BtnFilt_Click(object sender, EventArgs e)
    {
        RptView.LocalReport.Refresh();
    }
}
