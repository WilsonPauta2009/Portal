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

public partial class KSystem_Reparaciones : System.Web.UI.Page
{
    ClsDatos dato = new ClsDatos();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["repa"] = dato.CargarReparaciones(Request.Params["tipo"].ToString());
            GrdRepa.DataSource = Session["repa"];
            GrdRepa.DataBind();
        }
    }

    protected void GrdRepa_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GrdRepa.DataSource = Session["repa"];
        GrdRepa.PageIndex = e.NewPageIndex;
        GrdRepa.DataBind();
    }
}
