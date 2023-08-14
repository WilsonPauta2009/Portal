using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostVenta_Default : System.Web.UI.Page
{
    ClsUser Usua = new ClsUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) { Usua.GetEmpr(DdlEmpr); }
    }

    protected void BtnIngr_Click(object sender, EventArgs e)
    {
        bool bUsua;
        string sIden, sInte;

        LblMens.Text = Usua.GetUser(out bUsua, out sIden, out sInte, DdlEmpr.SelectedValue, TxtUsua.Text.ToUpper(), TxtClav.Text.ToLower(), "POVE");

        if (LblMens.Text.Length > 0) Response.Write(string.Format("<script type='text/jscript' language='javascript'> alert('{0}'); </script>", LblMens.Text));

        if (bUsua)
        {
            Session["usua"] = bUsua; Session["iden"] = sIden;
            Session["inte"] = sInte; Session["esqu"] = DdlEmpr.SelectedValue;
            ClsDatos.mEmpr = DdlEmpr.SelectedValue;
            Session["fact"] = DdlEmpr.SelectedItem.Text;
            // retorna el DataTable del menu correspondiente al usuario que se reconocio
            // Session["mnu_info"] = Usua.LoadTypeByApplication(DdlEmpr.SelectedValue, sIden, "INFO");
            Response.Redirect("First.aspx", true);
        }
    }
}