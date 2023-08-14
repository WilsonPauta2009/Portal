using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

public partial class FrmRolParametros : System.Web.UI.Page
{
    ClsRolDePagos RoPa = new ClsRolDePagos();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnProc_Click(object sender, EventArgs e)
    {
        RoPa.jsAlert (this, "PROCESAR", RoPa.ProcesarRolParametros(Session["esqu"].ToString(), int.Parse(TxtIden.Text), TxtNomb.Text, double.Parse(TxtValo.Text), DdlTipo.SelectedValue, DdlKind.SelectedValue, DdlMovi.SelectedValue, Session["iden"].ToString(), TxtCtId.Text.Trim()));
    }

    protected void BtnList_Click(object sender, EventArgs e)
    {
        GrdRoPa.Caption = "Rol de Pagos: PARAMETROS";
        GrdRoPa.DataSource = RoPa.BrowseRolParametros(Session["esqu"].ToString());
        GrdRoPa.DataBind();
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void GrdRoPa_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (GrdRoPa.Caption)
        {
            case "Cuentas Transaccionales":
                TxtCtId.Text = GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[1].Text;
                LblCtNo.Text = RoPa.TextHTML(GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[2].Text);
                break;
            case "Rol de Pagos: PARAMETROS":
                TxtIden.Text = GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[1].Text;
                TxtNomb.Text = RoPa.TextHTML(GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[2].Text);
                TxtValo.Text = GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[3].Text;

                DdlTipo.SelectedValue = GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[4].Text;
                DdlKind.SelectedValue = GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[5].Text;
                DdlMovi.SelectedValue = GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[6].Text;

                TxtCtId.Text = GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[7].Text;
                LblCtNo.Text = RoPa.TextHTML(GrdRoPa.Rows[GrdRoPa.SelectedIndex].Cells[8].Text);
                break;
        }        
    }

    protected void BtnCtas_Click(object sender, EventArgs e)
    {
        GrdRoPa.Caption = "Cuentas Transaccionales";
        GrdRoPa.DataSource = RoPa.BrowsePlanDeCuentas(Session["esqu"].ToString(), "%", "RL");
        GrdRoPa.DataBind();
    }
}