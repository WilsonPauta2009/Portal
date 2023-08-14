using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrmHorasExtra : System.Web.UI.Page
{
    ClsRolDePagos RoPa = new ClsRolDePagos();

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void BtnProc_Click(object sender, EventArgs e)
    {
        RoPa.jsAlert (this, "Horas EXTRA", RoPa.ProcesarHorasExtra(grdHoEx, Session["esqu"].ToString(), Session["iden"].ToString(), long.Parse(TxtIden.Text), 1, 0, Session["iden"].ToString()));
    }

    protected void grdHoEx_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        grdHoEx.EditIndex = e.NewEditIndex;
        grdHoEx.DataSource = (System.Data.DataTable)Session["hoex"];
        grdHoEx.DataBind();
    }

    protected void grdHoEx_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        double dBasi = double.Parse(((Infragistics.Web.UI.EditorControls.WebNumericEditor)grdHoEx.Rows[e.RowIndex].Cells[5].FindControl("BASI")).Value.ToString());

        ((System.Data.DataTable)Session["hoex"]).Rows[e.RowIndex][2] = int.Parse(((TextBox)grdHoEx.Rows[e.RowIndex].Cells[2].FindControl("VAHS")).Text);
        ((System.Data.DataTable)Session["hoex"]).Rows[e.RowIndex][3] = int.Parse(((TextBox)grdHoEx.Rows[e.RowIndex].Cells[3].FindControl("VAHE")).Text);
        ((System.Data.DataTable)Session["hoex"]).Rows[e.RowIndex][4] = int.Parse(((TextBox)grdHoEx.Rows[e.RowIndex].Cells[4].FindControl("VAHN")).Text);

        ((System.Data.DataTable)Session["hoex"]).Rows[e.RowIndex][6] = Math.Round(((dBasi * 1.50) * int.Parse(((TextBox)grdHoEx.Rows[e.RowIndex].Cells[2].FindControl("VAHS")).Text)), 2) +
            Math.Round(((dBasi * 2.00) * int.Parse(((TextBox)grdHoEx.Rows[e.RowIndex].Cells[3].FindControl("VAHE")).Text)), 2) +
            Math.Round(((dBasi * 0.25) * int.Parse(((TextBox)grdHoEx.Rows[e.RowIndex].Cells[4].FindControl("VAHN")).Text)), 2);

        grdHoEx.DataSource = (System.Data.DataTable)Session["hoex"];
        grdHoEx.EditIndex = -1;
        grdHoEx.DataBind();
    }

    protected void grdHoEx_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        grdHoEx.EditIndex = -1;
        grdHoEx.DataSource = (System.Data.DataTable)Session["hoex"];
        grdHoEx.DataBind();
    }
}
