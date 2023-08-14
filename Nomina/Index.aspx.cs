using System;
using Infragistics.Web.UI.ListControls;
//using System.Data;
//using System.Configuration;
//using System.Collections;
//using System.Web;
//using System.Web.Security;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;

public partial class index : System.Web.UI.Page
{
    ClsUser Usua = new ClsUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack) { Usua.GetEmpr(DdlEmpr); }
    }

    protected void BtnIngr_Click(object sender, EventArgs e)
    {
        //bool    bUsua;
        //string  sIden, sInte;

        //LblMens.Text = Usua.GetUser(out bUsua, out sIden, out sInte, DdlEmpr.SelectedValue, TxtUsua.Text.ToUpper(), TxtClav.Text.ToLower());

        //if (LblMens.Text.Length > 0) Response.Write(string.Format("<script type='text/jscript' language='javascript'> alert('{0}'); </script>", LblMens.Text));

        //if (bUsua)
        //{
        //    Session["usua"] = bUsua;    Session["iden"] = sIden;
        //    Session["inte"] = sInte;    Session["esqu"] = DdlEmpr.SelectedValue;
        //    Session["fact"] = DdlEmpr.SelectedItem.Text;
        //    Session["menu"] = Usua.LoadTypeByApplication(DdlEmpr.SelectedValue, sIden);
        //    Response.Redirect("First.aspx", true);
        //}

        if (!((WebDropDown)Master.FindControl("wdpDiEm")).Visible)
        {
            bool bUsua;
            string sIden, sInte;
            string sMens = "";

            sMens = Usua.TestUserDdl(out bUsua, out sInte, out sIden, TxtUsua, TxtClav, "RoPa");

            if (bUsua)
            {
                Session["usua"] = bUsua; Session["iden"] = sIden; Session["inte"] = sInte;
                Response.Redirect("first.aspx", true);
            }
            else Usua.jsAlert(this, "SoftLution Nómina", sMens);
        }
        else Response.Redirect("first.aspx", true);
    }
}
