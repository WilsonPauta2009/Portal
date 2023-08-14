using System;
//using System.Data;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.SqlClient;

public partial class FrmDiasWorking : System.Web.UI.Page
{
    ClsRolDePagos RoPa = new ClsRolDePagos();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RoPa.ObtenerRolMainActive(TxtIden, TxtFeIn, TxtFeFn, Session["esqu"].ToString());
            Session["tabl"] = RoPa.RecoveryDiasWorking(Session["esqu"].ToString(), long.Parse(TxtIden.Text));
            grdDias.DataSource = (System.Data.DataTable)Session["tabl"];
            grdDias.DataBind();
        }
    }
    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void BtnProc_Click(object sender, EventArgs e)
    {
        RoPa.jsAlert(this, "PROCESAR", RoPa.ProcesarDiasWorking(grdDias, Session["esqu"].ToString(), Session["iden"].ToString(), long.Parse(TxtIden.Text), 1.00, "[ nothing ]", Session["iden"].ToString()));
    }

    protected void grdDias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdDias.EditIndex = -1;
        grdDias.DataSource = (System.Data.DataTable)Session["tabl"];
        grdDias.DataBind();
    }

    protected void grdDias_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdDias.EditIndex = e.NewEditIndex;
        grdDias.DataSource = (System.Data.DataTable)Session["tabl"];
        grdDias.DataBind();
    }

    protected void grdDias_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ((System.Data.DataTable)Session["tabl"]).Rows[e.RowIndex][2] = int.Parse(((TextBox)grdDias.Rows[e.RowIndex].Cells[2].FindControl("DITR")).Text);
        ((System.Data.DataTable)Session["tabl"]).Rows[e.RowIndex][3] = ((TextBox)grdDias.Rows[e.RowIndex].Cells[3].FindControl("OBSE")).Text;
        grdDias.DataSource = (System.Data.DataTable)Session["tabl"];
        grdDias.EditIndex = -1;
        grdDias.DataBind();
    }
}
