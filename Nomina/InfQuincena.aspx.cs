using System;
//using System.Data;
//using System.Configuration;
//using System.Collections;
//using System.Web;
//using System.Web.Security;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;
//using Microsoft.Reporting.WebForms;

public partial class InfQuincena : System.Web.UI.Page
{
    ClsInfo Info = new ClsInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) wdgEmpl.DataSource = Info.InformeQuicena(Session["esqu"].ToString());
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void BtnExpo_Click(object sender, EventArgs e)
    {
        weeData.DownloadName = Session["esqu"].ToString() + "_QUICENA";
        weeData.Export(wdgEmpl);
    }
}
