using CapaDeValidacion;
using Infragistics.Web.UI.ListControls;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ventas_FrmPagare : System.Web.UI.Page
{
    WebDropDown wdpEmpr;
    WebDropDown wdpSucu;
    Label lblTemp;
    Cls_NumerosALetras Numlet = new Cls_NumerosALetras("dólares");
    ClsVentas objVentas = new ClsVentas();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblTemp = (Label)Master.FindControl("lblDiv");
            lblTemp.Visible = true;
            lblTemp = (Label)Master.FindControl("lblSuc");
            lblTemp.Visible = true;
            wdpEmpr = (WebDropDown)Master.FindControl("wdpEmpr");
            wdpEmpr.Visible = true;
            wdpSucu = (WebDropDown)Master.FindControl("wdpSuc");
            wdpSucu.Visible = true;
            wdpFecr.Date = DateTime.Now;
            //btnBusca_Click(null, null);
        }
    }

    protected void btnBusca_Click(object sender, EventArgs e)
    {
        wdpEmpr = (WebDropDown)Master.FindControl("wdpEmpr");
        wdpSucu = (WebDropDown)Master.FindControl("wdpSuc");
        objVentas.GetFacturas(wdgFacturas, wdpEmpr.SelectedValue, wdpSucu.SelectedValue, wdpFecr.Date);
    }
}