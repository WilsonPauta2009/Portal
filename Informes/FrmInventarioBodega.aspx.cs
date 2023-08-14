using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Informes_FrmPresupuestos : System.Web.UI.Page
{
    ClsInfo Info = new ClsInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        TxtEmpr.Text = ClsDatos.mEmpr;
        TxtUsua.Text = Session["iden"].ToString();
        
        if (!Page.IsPostBack)
        {
            Info.GetAreas_(WebAlma, ClsDatos.mEmpr);
            Info.GetIndiceLin_(WebLine, ClsDatos.mEmpr);

            WebAlma.DataBind();
            WebAlma.SelectedIndex = 1;
            TxtAlma.Text = WebAlma.Items[WebAlma.SelectedIndex].Value.Trim();
            TxtLine.Text = "%";
        }
    }

    protected void BtnFilt_Click(object sender, EventArgs e)
    {
        if (WebAlma.SelectedIndex == 0) TxtAlma.Text = "%"; else TxtAlma.Text = WebAlma.Items[WebAlma.SelectedIndex].Value.Trim();
        if (WebLine.SelectedIndex == 0) TxtLine.Text = "%"; else TxtLine.Text = WebLine.Items[WebLine.SelectedIndex].Value.Trim();
        RptView.LocalReport.Refresh();
    }
}
