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

public partial class First : System.Web.UI.Page
{
    //ClsElectronico objDocumentos = new ClsElectronico();
    ClsVentas objDato = new ClsVentas();
    ClsUser Usua = new ClsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["esqu"] = ((DropDownList)Master.FindControl("DdlEmpr")).SelectedValue;
        
        string[] sFile = System.IO.Directory.GetFiles(Server.MapPath("../imgs/azar"), "*.jpg");
        Random Azar = new Random();
        int iImag = Azar.Next(sFile.Length) + 1;
        string[] sImag = sFile[iImag - 1].Split('\\');
        imgBack.ImageUrl = string.Format("../imgs/azar/{0}", sImag[sImag.Length - 1]);
        

        if (!Page.IsPostBack)
        {
            string data = Request.QueryString["data"];

            if (string.IsNullOrEmpty(data))
            {
                objDato.LoadEmpresa(((WebDropDown)Master.FindControl("wdpDiEm")), Session["iden"].ToString(), "RoPa");                
                ((WebDropDown)Master.FindControl("wdpDiEm")).Visible = true;
                ((WebDropDown)Master.FindControl("wdpDiEm")).SelectedItemIndex = 0;
                wdpDiEm_SelectionChanged(null, null);
            }
            else ((WebDropDown)Master.FindControl("wdpDiEm")).Visible = false;
        }
    }

    private void wdpDiEm_SelectionChanged(object sender, Infragistics.Web.UI.ListControls.DropDownSelectionChangedEventArgs e)
    {
        if (((WebDropDown)Master.FindControl("wdpDiEm")).SelectedItemIndex >= 0)
        {
            Session["esqu"] = ((WebDropDown)Master.FindControl("wdpDiEm")).Items[((WebDropDown)Master.FindControl("wdpDiEm")).SelectedItemIndex].Value;
            Session["menu"] = Usua.LoadTypeByApplication(Session["esqu"].ToString(), Session["iden"].ToString());
        }
    }
}
