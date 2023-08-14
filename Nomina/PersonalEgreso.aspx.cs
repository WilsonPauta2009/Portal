using System;
//using System.Data;
//using System.Configuration;
//using System.Collections;
//using System.Web;
//using System.Web.Security;
using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;

public partial class PersonalEgreso : System.Web.UI.Page
{
    ClsMiscelaneos Misc = new ClsMiscelaneos();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) { Misc.PersonalSalidaMotivo(DdlMoti, Session["esqu"].ToString()); WdtFeSa.Value = DateTime.Now; }
    }

    protected void BtnFilt_Click(object sender, EventArgs e)
    {
        GrdMisc.AutoGenerateSelectButton = true;
        GrdMisc.DataSource = Misc.MostrarPersonalIngreso(Session["esqu"].ToString(), 'P');
        GrdMisc.Caption = @"... PERSONAL ACTIVO ...";
        GrdMisc.DataBind();

        GrdTemp.DataSource = Misc.MostrarPersonalIngreso(Session["esqu"].ToString(), 'C');
        GrdTemp.DataBind();
    }

    protected void GrdMisc_SelectedIndexChanged(object sender, EventArgs e)
    {
        TxtRelo.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[2].Text;

        TxtIden.Text = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[0].Text;
        Tint_inte.Text = Misc.TextHTML(GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[1].Text);
        TxtEmTi.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[3].Text;
        TxtOrga.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[4].Text;
        TxtHora.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[5].Text;

        switch (GrdMisc.Caption)
        {
            case @"... PERSONAL ACTIVO ...":
                WdtFeIn.Value = DateTime.Parse(GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[6].Text);
                break;
            case @"... EMPLEAD@S, asingados su: # de Reloj, Tipo, Organigrama, Horario ...":
                break;
        }
    }

    protected void BtnConf_Click(object sender, ImageClickEventArgs e)
    {
        Misc.jsAlert(this, "Personal EGRESO", Misc.ProcesarPersonalSalida(Session["esqu"].ToString(), TxtIden.Text, WdtFeIn.Value, WdtFeSa.Value, int.Parse(DdlMoti.SelectedValue), TxtOrga.Text, TxtEmTi.Text, TxtHora.Text, TxtObse.Text, Session["iden"].ToString()));
    }

    protected void BtnVisu_Click(object sender, ImageClickEventArgs e)
    {
        GrdMisc.AutoGenerateSelectButton = false;
        GrdMisc.DataSource = Misc.MostrarPersonalSalida(Session["esqu"].ToString());
        GrdMisc.Caption = @"... EX-EMPLEADOS ...";
        GrdMisc.DataBind();
    }

    protected void BtnCerr_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }
}
