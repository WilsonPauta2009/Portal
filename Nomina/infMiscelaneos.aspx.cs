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

public partial class infMiscelaneos : System.Web.UI.Page
{
    ClsInfo info = new ClsInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) info.GetRepos(ddlInfo, Session["esqu"], "RoPa", Session["iden"]);
        //wdgEmpl.DataSource = Info.InformeEmpleados(Session["esqu"].ToString());
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void BtnExpo_Click(object sender, EventArgs e)
    {
        weeData.DownloadName = Session["esqu"].ToString() + "_Empleados";
        weeData.Export(wdgEmpl);
    }
}
