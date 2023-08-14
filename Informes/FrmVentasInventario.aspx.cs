using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class FrmVentasInventario : System.Web.UI.Page
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

            Info.GetIndiceSec_(WebSecu, ClsDatos.mEmpr);
            Info.GetIndiceLin_(WebLine, ClsDatos.mEmpr);

            TxtSecu.Text = "%";
            TxtLine.Text = "%";
        }
    }
 
    protected void BtnFilt_Click(object sender, EventArgs e)
    {
        // WdtFeIn.DataBind();

        if (WebSecu.SelectedIndex == 0) TxtSecu.Text = "%"; else TxtSecu.Text = WebSecu.Items[WebSecu.SelectedIndex].Value;
        if (WebLine.SelectedIndex == 0) TxtLine.Text = "%"; else TxtLine.Text = WebLine.Items[WebLine.SelectedIndex].Value;

        RptView.LocalReport.Refresh();
    }
}