using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;

public partial class InfFactoryEmpleadosRubros : System.Web.UI.Page
{
    //ClsDatos dato = new ClsDatos();
    ClsRolDePagos RoPa = new ClsRolDePagos();
    ClsInfo info = new ClsInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        /*Dts.ConnectionString = dato.CadenaDeConexion;
        RptView.DataBind();*/      

        if (!Page.IsPostBack)
        {
            txtEsqu.Text = Session["esqu"].ToString();
            rptRoPa.LocalReport.DisplayName = string.Format("RolDePagos_{0}_Actual", Session["esqu"].ToString());
            rptRoPr.LocalReport.DisplayName = string.Format("RolDeProvisiones_{0}_Actual", Session["esqu"].ToString());
            RoPa.spReto = RoPa.GetACL_Ctrl(this, "WebSoftLution", Session["esqu"].ToString(), Session["iden"].ToString(), "RoPa", "InfRoPa");
            if (RoPa.spReto[1].ToString().Trim() == "A") BtnCont.Visible = true;
            info.GetFechasRol(wddFech, Session["esqu"].ToString());
        }

        //rptRoPr.LocalReport.Refresh();
        //rptRoPr.ShowToolBar = true;
    }
    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void BtnCont_Click(object sender, EventArgs e)
    {
        RoPa.jsAlert (this, "ERP SoftLution: Contabilización de ROL", RoPa.RolContabilizar(Session["esqu"].ToString(), Session["iden"].ToString()));
    }

    protected void wddFech_SelectionChanged(object sender, Infragistics.Web.UI.ListControls.DropDownSelectionChangedEventArgs e)
    {
        txtIden.Text = wddFech.SelectedValue.ToString().Trim();

        if (BtnCont.Visible)
        {
            if (txtIden.Text == "0") BtnCont.Enabled = true; BtnCont.Enabled = false;
        }

        rptRoPa.LocalReport.DisplayName = string.Format("RolDePagos_{0}_{1}", Session["esqu"].ToString(), wddFech.Items[wddFech.SelectedItemIndex].Text.Replace("[", "").Replace("]", "").Trim());
        rptRoPr.LocalReport.DisplayName = string.Format("RolDeProvisiones_{0}_{1}", Session["esqu"].ToString(), wddFech.Items[wddFech.SelectedItemIndex].Text.Replace("[", "").Replace("]", "").Trim());
    }
}