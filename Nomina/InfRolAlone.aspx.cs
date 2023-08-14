using System;
using System.Web.UI;
//using Microsoft.Reporting.WebForms;

public partial class InfRolAlone : System.Web.UI.Page
{
    ClsRolDePagos dato = new ClsRolDePagos();
    ClsInfo info = new ClsInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RptView.LocalReport.EnableExternalImages = true;

            //ReportParameter pImag = new ReportParameter("pImag", "./imgs/_empr/" + Session["esqu"].ToString() + ".jpg");
            //RptView.LocalReport.SetParameters(new ReportParameter[] { pImag });

            dato.spReto = dato.GetACL_Ctrl(this, "WebSoftLution", Session["esqu"].ToString(), Session["iden"].ToString(), "RoPa", "InfRoIn");
            if (dato.spReto[1].ToString().Trim() == "R") wddEmpl.Enabled = false;

            TxtEsqu.Text = Session["esqu"].ToString();
            TxtEmpl.Text = Session["iden"].ToString();
            RptView.LocalReport.DisplayName = Session["iden"].ToString();

            info.GetFechasRol(wddFech, Session["esqu"].ToString());
            wddFech.DataBind();

            if (dato.spReto[1].ToString().Trim() == "R") { dato.GetRolEmpleados(wddEmpl, Session["esqu"].ToString(), Session["iden"].ToString()); } else { dato.GetRolEmpleados(wddEmpl, Session["esqu"].ToString(), "%"); }
            wddEmpl.DataBind();

            //wibRoIn.Visible = wddEmpl.Enabled;
            //if (wddEmpl.Items.Count == 0) { rblRoPa.SelectedIndex = 1; rblRoPa.Enabled = false; wddFech.Visible = true; dato.GetRolEmpleados(wddEmpl, Session["esqu"].ToString(), wddFech.Items[0].Value); }

            try { wddEmpl.SelectedValue = Session["iden"].ToString(); } catch { wddEmpl.SelectedItemIndex = 0; }
        }

    }

    protected void wibRoIn_Click(object sender, Infragistics.WebUI.WebDataInput.ButtonEventArgs e)
    {
        //if (rblRoPa.SelectedValue.ToString() == "A") TxtIden.Text = "0";
        //else
        TxtIden.Text = wddFech.Items[wddFech.SelectedItemIndex].Value.ToString();
        TxtEmpl.Text = wddEmpl.SelectedValue.ToString();
        RptView.LocalReport.DisplayName = string.Format("{0}_{1}", wddFech.Items[wddFech.SelectedItemIndex].Text, wddEmpl.Items[wddEmpl.SelectedItemIndex].Text.ToString());
        RptView.LocalReport.Refresh();
    }

    protected void wibCerr_Click(object sender, Infragistics.WebUI.WebDataInput.ButtonEventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void wibRILo_Click(object sender, Infragistics.WebUI.WebDataInput.ButtonEventArgs e)
    {
        RptView.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;

        for (int w=0; w < wddEmpl.Items.Count; w++)
        {
            TxtEmpl.Text = wddEmpl.Items[w].Value.ToString();
            RptView.LocalReport.DisplayName = wddEmpl.Items[w].Text.Trim();
            RptView.LocalReport.Refresh();
            RptView.DataBind();

            Microsoft.Reporting.WebForms.Warning[] warnings = null;
            string[] streamIds = null;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string filetype = string.Empty;

            string exportType = "PDF";
            filetype = exportType == "PDF" ? "PDF" : exportType;
            byte[] bytes = RptView.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
         
            //System.IO.MemoryStream ms = new System.IO.MemoryStream(bytes);
            //Response.Buffer = true;
            //Response.Clear();
            //Response.ContentType = "Application/pdf";
            //Response.AddHeader("content-disposition", string.Format(@"attachment; filename={0}.pdf", RptView.LocalReport.DisplayName));
            //Response.BinaryWrite(ms.ToArray());
            //Response.Flush();
            //Response.End();
        }        
    }

    //protected void rblRoPa_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (rblRoPa.SelectedValue.ToString() == "H") wddFech.Visible = true; else wddFech.Visible = false;
    //}

    //protected void wddEmpl_SelectionChanged(object sender, Infragistics.Web.UI.ListControls.DropDownSelectionChangedEventArgs e)
    //{
    //    if (wddEmpl.SelectedItemIndex >= 0) info.GetFechasRol(wddFech, Session["esqu"].ToString(), wddEmpl.Items[wddEmpl.SelectedItemIndex].Value);
    //    else info.GetFechasRol(wddFech, Session["esqu"].ToString(), wddEmpl.Items[0].Value);
    //}

    protected void wddFech_SelectionChanged(object sender, Infragistics.Web.UI.ListControls.DropDownSelectionChangedEventArgs e)
    {
        if (wddEmpl.Enabled) { dato.GetRolEmpleados(wddEmpl, Session["esqu"].ToString(), "%", wddFech.Items[wddFech.SelectedItemIndex].Value); }
        //else dato.GetRolEmpleados(wddEmpl, Session["esqu"].ToString());
    }
}
