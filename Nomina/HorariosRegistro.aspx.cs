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

public partial class HorariosRegistro : System.Web.UI.Page
{
    ClsMiscelaneos Misc = new ClsMiscelaneos();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Misc.Obtener_EntradaSalida(DdlHoTi, Session["esqu"].ToString());
            WdtFeIn.Value = DateTime.Now;
            WdtFeSa.Value = DateTime.Now;
        }
    }

    protected void BtnProc_Click(object sender, EventArgs e)
    {
        LblMens.Text = Misc.Procesar_EntradaSalida (Session["esqu"].ToString(), int.Parse(TxtRelo.Text), WdtFeIn.Value, WdtFeSa.Value,
            int.Parse(DdlHoTi.SelectedValue), TxtObse.Text, Session["iden"].ToString());
    }

    protected void BtnList_Click(object sender, EventArgs e)
    {
        GrdMisc.AutoGenerateSelectButton = false;
        GrdMisc.DataSource = Misc.Mostrar_EntradaSalida(Session["esqu"].ToString(), int.Parse(TxtRelo.Text), WdtFeIn.Value, WdtFeSa.Value);
        GrdMisc.Caption = @"... REGISTRO DE ASISTENCIA ...";
        GrdMisc.DataBind();
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void GrdMisc_SelectedIndexChanged(object sender, EventArgs e)
    {
        TxtRelo.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[2].Text;

        TxtIden.Text = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[0].Text;
        Tint_inte.Text = Misc.TextHTML(GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[1].Text);
        TxtEmTi.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[3].Text;
        TxtOrga.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[4].Text;
        TxtHora.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[5].Text;

        //switch (GrdMisc.Caption)
        //{
        //    case @"... PERSONAL ACTIVO ...":
        //        WdtFeIn.Value = DateTime.Parse(GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[6].Text);
        //        break;
        //    case @"... EMPLEAD@S, asingados su: # de Reloj, Tipo, Organigrama, Horario ...":
        //        break;
        //}
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
}
