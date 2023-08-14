using Infragistics.Web.UI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrmDetCon : System.Web.UI.Page
{
    ClsInfo Info = new ClsInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtEmpr.Text = ClsDatos.mEmpr;
            // txtUsua.Text = Session["iden"].ToString();
            
            wdpFeIn.Value = DateTime.Now;
            wdpFeFn.Value = DateTime.Now;
        }
    }

    protected void btn_busca_Click(object sender, EventArgs e)
    {
        RptViewFA.LocalReport.Refresh();
        RptViewNC.LocalReport.Refresh();
    }
}