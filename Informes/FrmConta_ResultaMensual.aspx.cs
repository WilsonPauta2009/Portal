using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class FrmConta_ResultaMensual : System.Web.UI.Page
{
    ClsInfo Info = new ClsInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        TxtEmpr.Text = ClsDatos.mEmpr;
        TxtUsua.Text = Session["iden"].ToString();

        if (!IsPostBack)
        {
            WdtFeIn.Value = DateTime.Now;
            WdtFeFn.Value = DateTime.Now;
            Info.GetCostos_(WebCeCo, ClsDatos.mEmpr);
        }
    }
 
    protected void BtnFilt_Click(object sender, EventArgs e)
    {
        RptView.LocalReport.Refresh();
    }
}
