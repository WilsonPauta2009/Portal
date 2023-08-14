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

public partial class Horarios : System.Web.UI.Page
{
    ClsMiscelaneos Misc = new ClsMiscelaneos();

    protected void Page_Load(object sender, EventArgs e)
    {
        //LblIden.ToolTip = ((DropDownList)Master.FindControl("DdlEmpr")).SelectedValue;
    }

    protected void BtnProc_Click(object sender, EventArgs e)
    {
        Misc.jsAlert (this, "PROCESAR", Misc.ProcesarHorarios(Session["esqu"].ToString(), int.Parse(TxtIden.Text), TxtNomb.Text, WdtEnMa.Value, WdtSaMa.Value, WdtEnTa.Value, WdtSaTa.Value, int.Parse(TxtAtra.Text), int.Parse(TxtFalt.Text), 'A', Session["iden"].ToString()));
    }

    protected void BtnList_Click(object sender, EventArgs e)
    {
        GrdHora.DataSource = Misc.MostrarHorarios(Session["esqu"].ToString());
        GrdHora.DataBind();
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void GrdHora_SelectedIndexChanged(object sender, EventArgs e)
    {
        TxtIden.Text = GrdHora.Rows[GrdHora.SelectedIndex].Cells[1].Text;
        TxtNomb.Text = GrdHora.Rows[GrdHora.SelectedIndex].Cells[2].Text;
        WdtEnMa.Text = GrdHora.Rows[GrdHora.SelectedIndex].Cells[3].Text;
        WdtSaMa.Text = GrdHora.Rows[GrdHora.SelectedIndex].Cells[4].Text;
        WdtEnTa.Text = GrdHora.Rows[GrdHora.SelectedIndex].Cells[5].Text;
        WdtSaTa.Text = GrdHora.Rows[GrdHora.SelectedIndex].Cells[6].Text;
        TxtAtra.Text = GrdHora.Rows[GrdHora.SelectedIndex].Cells[7].Text;
        TxtFalt.Text = GrdHora.Rows[GrdHora.SelectedIndex].Cells[8].Text;
    }
}
