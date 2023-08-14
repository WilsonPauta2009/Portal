using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.EditorControls;

public partial class FrmRolDePagos_Specifications : System.Web.UI.Page
{
    ClsMiscelaneos Misc = new ClsMiscelaneos();
    ClsRolDePagos RoPa = new ClsRolDePagos();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            grdPara.DataSource = RoPa.SelectRolParametros(Session["esqu"].ToString());
            grdPara.DataBind();

            grdComi.DataSource = RoPa.SelectRolComisionesVentas(Session["esqu"].ToString());
            grdComi.DataBind();

            RoPa.ObtenerFinancieras(DdlBanc);
            BtnFilt_Click(null, null);
        }
    }

    protected void BtnFilt_Click(object sender, EventArgs e)
    {
        GrdMisc.DataSource = Misc.MostrarPersonalIngreso(Session["esqu"].ToString(), 'P');
        GrdMisc.Caption = @"... PERSONAL REGISTRADO ...";
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
        if (byte.Parse(GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[7].Text.Trim()) == 0) chkFoRe.Checked = false; else chkFoRe.Checked = true;
        if (byte.Parse(GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[10].Text.Trim()) == 0) chkDeTe.Checked = false; else chkDeTe.Checked = true;
        if (byte.Parse(GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[11].Text.Trim()) == 0) chkDeCu.Checked = false; else chkDeCu.Checked = true;

        TxtNCta.Text = "";
        RoPa.RecuperarFinanciera(DdlBanc, DdlTipo, TxtNCta, Session["esqu"].ToString(), TxtIden.Text);
        RoPa.RecuperarComisiones(grdComi, Session["esqu"].ToString(), TxtIden.Text, 0);
        RoPa.RecuperarParametros(grdPara, Session["esqu"].ToString(), TxtIden.Text, 0);
        BtnProc.Enabled = true;
    }

    protected void BtnProc_Click(object sender, ImageClickEventArgs e)
    {
        RoPa.ProcesarComisionesDeshabilitar(Session["esqu"].ToString(), TxtIden.Text, Session["iden"].ToString());
        for (int i = 0; i < grdComi.Rows.Count; i++)
            if (((CheckBox)grdComi.Rows[i].Cells[0].FindControl("SELE")).Checked)
            {
                RoPa.ProcesarComisiones(Session["esqu"].ToString(), TxtIden.Text, grdComi.Rows[i].Cells[1].Text, ((WebNumericEditor)grdComi.Rows[i].Cells[3].FindControl("PORC")).Value, Session["iden"].ToString());                
                ((CheckBox)grdComi.Rows[i].Cells[0].FindControl("SELE")).Checked = false;
                ((WebNumericEditor)grdComi.Rows[i].Cells[3].FindControl("PORC")).Value = 0.00;
            }

        RoPa.ProcesarParametrosDeshabilitar(Session["esqu"].ToString(), TxtIden.Text, Session["iden"].ToString());
        for (int i = 0; i < grdPara.Rows.Count; i++)
            if (((CheckBox)grdPara.Rows[i].Cells[0].FindControl("SELE")).Checked)
            {
                RoPa.ProcesarParametros(Session["esqu"].ToString(), grdPara.Rows[i].Cells[1].Text, TxtIden.Text, ((TextBox)grdPara.Rows[i].Cells[3].FindControl("ESPE")).Text, Session["iden"].ToString());
                ((CheckBox)grdPara.Rows[i].Cells[0].FindControl("SELE")).Checked = false;
                ((TextBox)grdPara.Rows[i].Cells[3].FindControl("ESPE")).Text = "";
            }

        byte dValo = 0; if (chkFoRe.Checked) dValo = 1;
        RoPa.ProcesarParametros(Session["esqu"].ToString(), 98, TxtIden.Text, dValo.ToString(), Session["iden"].ToString());
        GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[7].Text = dValo.ToString();

        dValo = 0; if (chkDeTe.Checked) dValo = 1;
        RoPa.ProcesarParametros(Session["esqu"].ToString(), 103, TxtIden.Text, dValo.ToString(), Session["iden"].ToString());
        GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[10].Text = dValo.ToString();

        dValo = 0; if (chkDeCu.Checked) dValo = 1;
        RoPa.ProcesarParametros(Session["esqu"].ToString(), 104, TxtIden.Text, dValo.ToString(), Session["iden"].ToString());
        GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[11].Text = dValo.ToString();

        RoPa.jsAlert(this, "Financiera - Parámetros - Comisiones", RoPa.ProcesarFinancieras(Session["esqu"].ToString(), TxtIden.Text, int.Parse(DdlBanc.SelectedValue), TxtNCta.Text, DdlTipo.SelectedValue, Session["iden"].ToString()));
    }

    protected void BtnCerr_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }
}
