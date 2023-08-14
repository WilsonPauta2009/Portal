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

public partial class ChangePassword : System.Web.UI.Page
{
    ClsMiscelaneos Misc = new ClsMiscelaneos();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void BtnProc_Click(object sender, EventArgs e)
    {
        if (TxtNuev.Text == TxtConf.Text) LblMens.Text = Misc.Procesar_Password(Session["iden"].ToString(), TxtActu.Text, TxtConf.Text);
        else LblMens.Text = "... NO COINCIDE, el nuevo password con la confirmación ...";
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        //Server.Transfer("First.aspx", false);
        Response.Redirect("First.aspx", true);
    }
}
