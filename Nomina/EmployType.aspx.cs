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

public partial class EmployType : System.Web.UI.Page
{
    ClsMiscelaneos Misc = new ClsMiscelaneos();

    protected void Page_Load(object sender, EventArgs e)
    {
        //TxtEmpr.ToolTip = ((DropDownList)Master.FindControl("DdlEmpr")).SelectedValue;
        //TxtEmpr.Text = ((DropDownList)Master.FindControl("DdlEmpr")).Text;
        //LblIden.ToolTip = ((DropDownList)Master.FindControl("DdlEmpr")).SelectedValue;
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void BtnProc_Click(object sender, EventArgs e)
    {
        Misc.jsAlert (this, "PROCESAR", Misc.ProcesarEmpleadoTipo(Session["esqu"].ToString(), int.Parse(TxtIden.Text), TxtNomb.Text, TxtObse.Text, 'A', Session["iden"].ToString()));
    }

    protected void BtnList_Click(object sender, EventArgs e)
    {
        GrdEmplType.DataSource = Misc.MostrarEmpleadoTipo(Session["esqu"].ToString());
        GrdEmplType.DataBind();
    }

    protected void GrdEmplType_SelectedIndexChanged(object sender, EventArgs e)
    {
        TxtIden.Text = GrdEmplType.Rows[GrdEmplType.SelectedIndex].Cells[1].Text;
        TxtNomb.Text = GrdEmplType.Rows[GrdEmplType.SelectedIndex].Cells[2].Text;
        TxtObse.Text = GrdEmplType.Rows[GrdEmplType.SelectedIndex].Cells[3].Text;
    }
}
