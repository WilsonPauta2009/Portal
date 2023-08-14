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

public partial class EmployDefine : System.Web.UI.Page
{
    ClsMiscelaneos Misc = new ClsMiscelaneos();
    ClsUnique Uniq = new ClsUnique();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Misc.CargarHorarios(DdlHora, Session["esqu"].ToString());
            Misc.CargarTiposEmpleado(DdlTipo, Session["esqu"].ToString());
            Misc.LoadOrganigrama(UwtOrga, Session["esqu"].ToString());
            DdlHora_SelectedIndexChanged(null, null);
            DdlTipo_SelectedIndexChanged(null, null);
        }
    }

    protected void BtnProc_Click(object sender, EventArgs e)
    {
        /*LblMens.Text = string.Format("{0}; {1}; {2}; {3}; {4}; {5}; {6};", Session["esqu"].ToString(),
                TxtRelo.Text,
                TxtIden.Text,
                LblEmTi.ToolTip,
                LblOrar.ToolTip,
                LblOrga.ToolTip,
                Session["iden"].ToString());*/
        
        try
        {
            Misc.jsAlert (this, "PROCESAR", Misc.ProcesarEmpleadosTipoRelojOrganigrama (Session["esqu"].ToString(), int.Parse(TxtRelo.Text), TxtIden.Text, int.Parse(LblEmTi.ToolTip), int.Parse(LblOrar.ToolTip), int.Parse(LblOrga.ToolTip), Session["iden"].ToString()));
            BtnProc.Enabled = false;
        }
        catch (Exception ex) { Misc.jsAlert (this, "ERROR", ex.Message); }
    }

    protected void BtnList_Click(object sender, EventArgs e)
    {
        GrdMisc.DataSource = Misc.MostrarEmpleadosTipoRelojOrganigrama(Session["esqu"].ToString(), 'P');
        GrdMisc.Caption = @"Empleados \ Reloj \ Tipo \ Organigrama \ Horario";
        GrdMisc.DataBind();

        GrdTemp.DataSource = Misc.MostrarEmpleadosTipoRelojOrganigrama(Session["esqu"].ToString(), 'C');
        GrdTemp.DataBind();
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    //protected void UwtOrga_NodeClicked(object sender, Infragistics.WebUI.UltraWebNavigator.WebTreeNodeEventArgs e)
    //{
    //    //LblOrga.ToolTip = UwtOrga.ActiveNode. .Tag.ToString().Split(':')[1].ToString();
    //    //TxtOrga.Text = UwtOrga.SelectedNode.Text;
    //    //LblMens.Text = "";
    //}

    protected void DdlHora_SelectedIndexChanged(object sender, EventArgs e)
    {
        Uniq.GetUniqueHorario(Session["esqu"].ToString(), int.Parse(DdlHora.SelectedValue), Lhor_enma, Lhor_sama, Lhor_enta, Lhor_sata);
        TxtHora.Text = DdlHora.SelectedItem.Text;
        LblOrar.ToolTip = DdlHora.SelectedValue;
    }

    protected void DdlTipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        Uniq.GetUniqueEmpleadoTipo(Session["esqu"].ToString(), int.Parse(DdlTipo.SelectedValue), Lemp_tip_obse);
        TxtEmTi.Text = DdlTipo.SelectedItem.Text;
        LblEmTi.ToolTip = DdlTipo.SelectedValue;
    }

    protected void BtnFilt_Click(object sender, EventArgs e)
    {
        if (!Uniq.GetUniqueInterventor(Tint_inte, Session["esqu"].ToString(), TxtIden.Text))
        {
            GrdMisc.DataSource = Misc.MostrarInterventores (Session["esqu"].ToString(), TxtIden.Text, Tint_inte.Text);
            GrdMisc.Caption = "EMPLEADOS";
            GrdMisc.DataBind();
        }
    }

    protected void GrdMisc_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (GrdMisc.Caption)
        {
            case "EMPLEADOS":
                TxtIden.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[1].Text;
                Tint_inte.Text = Misc.TextHTML(GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[2].Text);
                BtnProc.Enabled = true;
                BtnActu.Enabled = false;
                break;
            case @"Empleados \ Reloj \ Tipo \ Organigrama \ Horario":
                TxtRelo.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[2].Text;

                TxtIden.Text = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[0].Text;
                Tint_inte.Text = Misc.TextHTML(GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[1].Text);

                DdlTipo.SelectedValue = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[1].Text;
                LblEmTi.ToolTip = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[1].Text;
                TxtEmTi.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[3].Text;

                LblOrga.ToolTip = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[2].Text;
                TxtOrga.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[4].Text;

                DdlHora.SelectedValue = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[3].Text;
                LblOrar.ToolTip = GrdTemp.Rows[GrdMisc.SelectedIndex].Cells[3].Text;
                TxtHora.Text = GrdMisc.Rows[GrdMisc.SelectedIndex].Cells[5].Text;
                BtnProc.Enabled = false;
                BtnActu.Enabled = true;
                break;
        }
    }

    protected void BtnActu_Click(object sender, EventArgs e)
    {
        try
        {
            Misc.jsAlert (this, "REGISTRAR", Misc.ActualizarEmpleadosTipoRelojOrganigrama(Session["esqu"].ToString(), int.Parse(TxtRelo.Text), TxtIden.Text, int.Parse(LblEmTi.ToolTip), int.Parse(LblOrar.ToolTip), int.Parse(LblOrga.ToolTip), Session["iden"].ToString()));
            BtnActu.Enabled = false;
        }
        catch (Exception ex) { Misc.jsAlert(this, "ERROR", ex.Message); }
    }

    protected void UwtOrga_NodeClick(object sender, Infragistics.Web.UI.NavigationControls.DataTreeNodeClickEventArgs e)
    {
        LblOrga.ToolTip = e.Node.Key.ToString().Split(':')[1].ToString();
        TxtOrga.Text = e.Node.Text;
    }
}
