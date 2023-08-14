using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Item : System.Web.UI.Page
{
    ClsDatos dato = new ClsDatos();

    protected void Page_Load(object sender, EventArgs e)
    {
        string sArti = Request.Params[0].ToString().Trim();
        LblArti.Text = sArti;
        LblNomb.Text = Request.Params[1].ToString().Trim();
        //LblPric.Text = "$ " + Request.Params[2].ToString().Trim();
        LblPric.Text = Request.Params[2].ToString().Trim();

        //if (System.IO.File.Exists(string.Format("{0}{1}{2}{3}", Server.MapPath("..\\fotos\\items"), "\\", sArti.Replace("/", "-"), ".jpg")))
        //    Imag.ImageUrl = string.Format("{0}{1}{2}", "../fotos/items/", sArti.Replace("/", "-"), ".jpg");
        //else
        //    Imag.ImageUrl = string.Format("{0}logo.jpg", "../fotos/items/");

        if (System.IO.File.Exists(string.Format("{0}{1}{2}{3}", Server.MapPath("fotos\\items"), "\\", sArti.Replace("/", "-"), ".jpg")))
            Imag.ImageUrl = string.Format("{0}{1}{2}", "fotos/items/", sArti.Replace("/", "-"), ".jpg");
        else
            Imag.ImageUrl = string.Format("{0}logo.jpg", "fotos/items/");

        GrdDato.DataSource = dato.CargarDatos(ClsDatos.mEmpr, sArti);
        GrdDato.DataMember = "dato";
        GrdDato.DataBind();

        TxtEtec.Text = ((System.Data.DataTable)GrdDato.DataSource).Rows[0]["etec"].ToString();

        LblLine.Text = ((System.Data.DataTable)GrdDato.DataSource).Rows[0]["dlin"].ToString();
        LblMarc.Text = ((System.Data.DataTable)GrdDato.DataSource).Rows[0]["dmar"].ToString();
        LblSecc.Text = ((System.Data.DataTable)GrdDato.DataSource).Rows[0]["dsec"].ToString();
        LblSubS.Text = ((System.Data.DataTable)GrdDato.DataSource).Rows[0]["dsub"].ToString();
    }
}