using Infragistics.Web.UI.GridControls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ventas_FrmFactMotos : System.Web.UI.Page
{
    enum Notify : int { alert, success, error, warning, information }
    ClsVentas objVentas = new ClsVentas();
    string PathDocu;
    DataTable tabu = new DataTable();

    //script para el popup de los mensajes
    protected void Mensaje(string tMsg, string Msg)
    {
        ScriptManager.RegisterStartupScript(Page, GetType(), "JsStatus", "generate('" + tMsg + "', '" + Msg + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            WdtFeIn.Value = DateTime.Now;
            WdtFeFn.Value = DateTime.Now;
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        tabu = objVentas.GetFactMotos(ClsDatos.mEmpr, txtObse.Text, wdpTipo.SelectedValue, WdtFeIn.Date, WdtFeFn.Date);
        wdgFaturas.DataSource = tabu;
        wdgFaturas.DataBind();

        //string tmpPDF = "", tmpXML = "";
        //ClsFirmaElectronica.ClsMain.ibm_client = ClsDatos.ibm_client;

        //for (int r = 0; r < wdgFaturas.Rows.Count; r++)
        //{
        //    ClsFirmaElectronica.ClsFirmaWP m = new ClsFirmaElectronica.ClsFirmaWP(wdgFaturas.Rows[r].Cells[0].Text, wdgFaturas.Rows[r].Cells[6].Text, int.Parse(wdgFaturas.Rows[r].Cells[7].Text));

        //    string doc = wdgFaturas.Rows[r].Cells[3].Text;
        //    tmpPDF = @m.PathDocu + @"FA\PDF\" + doc + ".pdf";
        //    tmpXML = @m.PathDocu + @"FA\A\" + doc + ".xml";

        //    if (System.IO.File.Exists(tmpPDF)) ((HyperLink)wdgFaturas.Rows[r].FindControl("btnPdf")).NavigateUrl = tmpPDF;
        //    if (System.IO.File.Exists(tmpXML)) ((HyperLink)wdgFaturas.Rows[r].FindControl("btnXml")).NavigateUrl = tmpXML;
        //}

        //wdgFaturas.DataBind());
    }

    protected void btnXml_Click(object sender, ImageClickEventArgs e)
    {
        //string tmp;
        //ClsFirmaElectronica.ClsMain.ibm_client = ClsDatos.ibm_client;
        //if (wdgFaturas.Behaviors.Selection.SelectedRows.Count > 0)
        //{
        //    foreach (GridRecord selectedRow in wdgFaturas.Behaviors.Selection.SelectedRows)     // errors out here with selectedRow returning null
        //    {
        //        ClsFirmaElectronica.ClsFirmaWP m = new ClsFirmaElectronica.ClsFirmaWP(selectedRow.Items.GetValue(0).ToString(), selectedRow.Items.GetValue(6).ToString(), int.Parse(selectedRow.Items.GetValue(7).ToString()));
        //        string doc = selectedRow.Items.GetValue(3).ToString();

        //        tmp = /*@"\\\\10.10.3.26\\ece\\AJE-YAMAHA\\FA\\"*/  @m.PathDocu + @"FA\A\" + doc + ".xml";
        //        if (!File.Exists(tmp))
        //        {
        //            Mensaje(Notify.warning.ToString(), string.Format("\x00a1\x00a1 FACTURA ELECTRONICA NO ENCONTRADA: {0} !!", doc + ".xml"));
        //        }
        //        else
        //        {
        //            Response.Redirect("Download.ashx?id=1" + "&ruta=" + tmp + "&file=" + doc);
        //            //Process.Start(tmp);
        //        }
        //    }
        //}
    }

    protected void btnPdf_Click(object sender, ImageClickEventArgs e)
    {
        //string tmp;
        //if (wdgFaturas.Behaviors.Selection.SelectedRows.Count > 0)
        //{
        //    foreach (GridRecord selectedRow in wdgFaturas.Behaviors.Selection.SelectedRows)     // errors out here with selectedRow returning null
        //    {
        //        ClsFirmaElectronica.ClsFirmaWP m = new ClsFirmaElectronica.ClsFirmaWP(selectedRow.Items.GetValue(0).ToString(), selectedRow.Items.GetValue(6).ToString(), int.Parse(selectedRow.Items.GetValue(7).ToString()));
        //        string doc = selectedRow.Items.GetValue(3).ToString();
        //        tmp = /*"\\\\10.10.3.26\\ece\\AJE-YAMAHA\\FA\\"*/  @m.PathDocu + @"FA\PDF\" + doc + ".pdf";
        //        if (!File.Exists(tmp))
        //        {
        //            Mensaje(Notify.warning.ToString(), string.Format("\x00a1\x00a1 FACTURA ELECTRONICA NO ENCONTRADA: {0} !!", doc + ".pdf"));
        //        }
        //        else
        //        {
        //            Response.Redirect("Download.ashx?id=2" + "&ruta=" + tmp + "&file=" + doc);
        //        }
        //    }
        //}
    }

    protected void btnX_Click(object sender, EventArgs e)
    {
        btnXml_Click(null, null);
    }

    protected void btnP_Click(object sender, EventArgs e)
    {
        btnPdf_Click(null, null);
    }

    protected void wdgFaturas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string tmp = "";
        ClsFirmaElectronica.ClsMain.ibm_client = ClsDatos.ibm_client;
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = wdgFaturas.Rows[index];

        ClsFirmaElectronica.ClsFirmaWP m = new ClsFirmaElectronica.ClsFirmaWP(row.Cells[0].Text, row.Cells[6].Text, int.Parse(row.Cells[7].Text));
        string doc = "";
        if (e.CommandName == "XML")
        {
            doc = row.Cells[3].Text;
            tmp = /*"\\\\10.10.3.26\\ece\\AJE-YAMAHA\\FA\\"*/  @m.PathDirectory + @"FA\A\" + doc + ".xml";
            if (!File.Exists(tmp))
            {
                Mensaje(Notify.warning.ToString(), string.Format("\x00a1\x00a1 Documento XML no encontrado: {0} !!", doc + ".pdf"));
            }
            else
            {
                Response.Redirect("Download.ashx?id=1" + "&ruta=" + tmp + "&file=" + doc);
            }
        }
        else
        {
            doc = row.Cells[3].Text;
            tmp = /*"\\\\10.10.3.26\\ece\\AJE-YAMAHA\\FA\\"*/  @m.PathDirectory + @"FA\PDF\" + doc + ".pdf";
            if (!File.Exists(tmp))
            {
                Mensaje(Notify.warning.ToString(), string.Format("\x00a1\x00a1 Documento RIDE(pdf) no encontrado: {0} !!", doc + ".pdf"));
            }
            else
            {
                Response.Redirect("Download.ashx?id=2" + "&ruta=" + tmp + "&file=" + doc);
            }
        }
    }
}