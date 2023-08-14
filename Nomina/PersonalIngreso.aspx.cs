using System;
using System.Web.UI;
public partial class PersonalIngreso : System.Web.UI.Page
{
    ClsMiscelaneos Misc = new ClsMiscelaneos();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) { WdtFeIn.Value = DateTime.Now; Misc.CargarCeCo(DdlCeCo, Session["esqu"].ToString(), Session["iden"].ToString()); DdlCeCo.SelectedIndex = 0; }
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
            case @"... PERSONAL INGRESADO ...":
                //TxtIden.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[1].Text;
                //Tint_inte.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[2].Text.Replace(ClsDatos.CarENIE[0], ClsDatos.CarENIE[1]);
                WdtFeIn.Value = DateTime.Parse(GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[6].Text);
                //TxtBasi.Text = string.Format("{0:#,##0.00}", double.Parse(GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[5].Text));
                TxtBasi.Value = double.Parse(GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[5].Text);
                DdlCeCo.SelectedValue = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[6].Text;

                txtMovi.Value = double.Parse(GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[8].Text);
                txtBoEm.Value = double.Parse(GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[9].Text);
                txtQuPo.Value = double.Parse(GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[12].Text);
                break;
            case @"... EMPLEAD@S, asignado: # de Reloj, Tipo, Organigrama, Horario ...":
                //TxtRelo.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[2].Text;

                //TxtIden.Text = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[0].Text;
                //Tint_inte.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[1].Text.Replace(ClsDatos.CarENIE[0], ClsDatos.CarENIE[1]);

                //LblEmTi.ToolTip = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[1].Text;
                //TxtEmTi.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[3].Text;

                //LblOrga.ToolTip = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[2].Text;
                //TxtOrga.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[4].Text;

                //LblOrar.ToolTip = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[3].Text;
                //TxtHora.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[5].Text;
                TxtBasi.Value = 0.00;
                txtQuPo.Value = 0.00;
                txtBoEm.Value = 0.00;
                txtMovi.Value = 0.00;
                WdtFeIn.Focus();
                break;
        }
    }

    protected void BtnFilt_Click(object sender, EventArgs e)
    {
        GrdMisc.DataSource = Misc.BuscarEmpleadosTipoRelojOrganigrama(Session["esqu"].ToString(), TxtIden.Text, Tint_inte.Text, 'P');
        GrdMisc.Caption = @"... EMPLEAD@S, asignado: # de Reloj, Tipo, Organigrama, Horario ...";
        GrdMisc.DataBind();

        GrdTemp.DataSource = Misc.BuscarEmpleadosTipoRelojOrganigrama(Session["esqu"].ToString(), TxtIden.Text, Tint_inte.Text, 'C');
        GrdTemp.DataBind();
    }

    protected void BtnVisu_Click(object sender, ImageClickEventArgs e)
    {
        GrdMisc.DataSource = Misc.MostrarPersonalIngreso(Session["esqu"].ToString(), 'P');
        GrdMisc.Caption = @"... PERSONAL INGRESADO ...";
        GrdMisc.DataBind();

        GrdTemp.DataSource = Misc.MostrarPersonalIngreso(Session["esqu"].ToString(), 'C');
        GrdTemp.DataBind();
    }

    protected void BtnCerr_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void BtnConf_Click(object sender, ImageClickEventArgs e)
    {
        //LblMens.Text = Misc.Procesar_PersonalIngreso(Session["esqu"].ToString(), TxtIden.Text, WdtFeIn.Value, double.Parse(TxtBasi.Text), TxtObse.Text, Session["iden"].ToString());
        Misc.jsAlert (this, "EMPLEADOS", Misc.ProcesarPersonalIngreso(Session["esqu"].ToString(), TxtIden.Text, WdtFeIn.Value, TxtBasi.Value, txtMovi.Value, txtBoEm.Value, DdlCeCo.Items[DdlCeCo.SelectedIndex].Value, txtQuPo.Value, TxtObse.Text, Session["iden"].ToString()));
    }
}
