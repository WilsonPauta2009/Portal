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

public partial class LogUser : System.Web.UI.Page
{
    ClsDatos Logo = new ClsDatos();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnIngr_Click(object sender, EventArgs e)
    {
        string sApNo = "";
        string sIden;
        string sPage = Request.Params[0].ToString();
        //bool bVeri = false;

        //try { if (Session["sIden"].ToString().Length > 0) bVeri = true; }
        //catch { }

        //if (bVeri)
        //{
        //    switch (Request.Params[0].ToString())
        //    {
        //        case "ARTI": Server.Transfer("articulos.aspx", false);
        //            break;
        //        case "JOYE": Server.Transfer("frmjoyas.aspx", false);
        //            break;
        //    }
            
        //}
        //else
        {
            string txtMens = Logo.Logoneo(TxtUsua, TxtClav, out sApNo, out sIden);

            if (txtMens.Length == 0)
            {
                Session["sApNo"] = sApNo;
                Session["sIden"] = sIden;

                switch (Request.Params[0].ToString())
                {
                    case "INFO": sPage = "informes/index.aspx";
                        break;
                    case "ARTI": sPage = "articulos.aspx";
                        break;
                    case "JOYE": sPage = "frmjoyas.aspx";
                        break;
                }

                Response.Redirect(sPage, true);
            }
            else Response.Write(string.Format("<script type='text/jscript' language='javascript'> alert('{0}'); </script>", txtMens));
        }
    }
}
