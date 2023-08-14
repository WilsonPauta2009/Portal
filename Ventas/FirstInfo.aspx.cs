using System;
//using System.Data;
//using System.Configuration;
//using System.Collections;
//using System.Web;
//using System.Web.Security;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;

public partial class FirstInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["esqu"] = ((DropDownList)Master.FindControl("DdlEmpr")).SelectedValue;
        
        string[] sFile = System.IO.Directory.GetFiles(Server.MapPath("./azar"), "*.jpg");
        Random Azar = new Random();
        int iImag = Azar.Next(sFile.Length) + 1;
        string[] sImag = sFile[iImag - 1].Split('\\');
        imgBack.ImageUrl = string.Format("./azar/{0}", sImag[sImag.Length - 1]);
        
    }
}
