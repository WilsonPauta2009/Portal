using System;
//using System.Data;
//using System.Configuration;
//using System.Collections;
//using System.Web;
//using System.Web.Security;
using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;
public partial class Organigrama : System.Web.UI.Page
{
    ClsMiscelaneos Misc = new ClsMiscelaneos();

    //enum Notify : int { alert, success, error, warning, information }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) Misc.LoadOrganigrama(uwtOrga, Session["esqu"]);
    }

    protected void BtnAgre_Click(object sender, EventArgs e)
    {
        if (BtnAgre.Text == "Agregar")
        {
            if (TxtSeCo.Text.Length > 0)
            {
                BtnAgre.CausesValidation = true;
                BtnAgre.Text = "Confirmar"; BtnCerr.Text = "Cancelar";
                PnlItem.Enabled = true; PnlUpda.Enabled = false;
                TxtCodi.Text = Misc.GetOrganigramaIden(Session["esqu"]);
                TxtNomb.Focus(); LblMens.Text = "";
            }
            else Misc.jsAlert(this, "ERROR al AGREGAR", "[ Debe primero seleccionar el nodo principal... ]"); // LblMens.Text = "Debe primero seleccionar el nodo principal...";
        }
        else
        {
            if (int.Parse(TxtCodi.Text) > 0)
            {
                string[] sReto = uwtOrga.ActiveNode.Key.ToString().Split(':');
                LblMens.Text = Misc.ProcesarOrganigrama(uwtOrga.ActiveNode, sReto[0], int.Parse(TxtCodi.Text), TxtNomb.Text, Session["iden"].ToString(), int.Parse(sReto[1]));

                uwtOrga.Nodes.Clear();
                Misc.LoadOrganigrama(uwtOrga, Session["esqu"]);
                TxtSele.Text = ""; TxtSeCo.Text = "";


                BtnAgre.CausesValidation = false;
                BtnAgre.Text = "Agregar"; BtnCerr.Text = "Cerrar";
                PnlItem.Enabled = false; PnlUpda.Enabled = true;
                uwtOrga.Focus();
            }
            else Misc.jsAlert(this, "ERROR en CODIGO", "[ code must been most than zero ]");
        }
    }

    //protected void UwtOrga_NodeClicked(object sender, Infragistics.WebUI.UltraWebNavigator.WebTreeNodeEventArgs e)
    //{
    //    TxtSeCo.Text = UwtOrga.SelectedNode.Tag.ToString().Split(':')[1].ToString();
    //    TxtSele.Text = UwtOrga.SelectedNode.Text;
    //    LblMens.Text = "";
    //}

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        if (BtnCerr.Text == "Cerrar") Server.Transfer("First.aspx", false);
        else
        {
            BtnAgre.CausesValidation = false;
            BtnAgre.Text = "Agregar";       BtnCerr.Text = "Cerrar";
            PnlItem.Enabled = false;        PnlUpda.Enabled = true;
            uwtOrga.Focus();                LblMens.Text = "";
        }
    }

    protected void BtnUpda_Click(object sender, EventArgs e)
    {
        if (TxtSele.Text.Trim().Length > 0)
        {
            if (TxtSeCo.Text.Trim().Length > 0)
            {
                string[] sReto = uwtOrga.ActiveNode.Key.ToString().Split(':');
                LblMens.Text = Misc.ProcesarOrganigrama(uwtOrga.ActiveNode, sReto[0], int.Parse(TxtSeCo.Text), TxtSele.Text, Session["iden"].ToString(), int.Parse(sReto[1]));
                
                uwtOrga.Nodes.Clear();
                Misc.LoadOrganigrama(uwtOrga, Session["esqu"]);                
                TxtSele.Text = "";      TxtSeCo.Text = "";
            }
            else Misc.jsAlert(this, "ERROR en SELECCION", "[ debe seleccionar alguna cuenta... ]");
        }
        else Misc.jsAlert(this, "ERROR en TEXTO", "[ no existe ningún texto que actualizar... ]");

        TxtSele.Focus();
    }

    protected void UwtOrga_NodeClick(object sender, Infragistics.Web.UI.NavigationControls.DataTreeNodeClickEventArgs e)
    {
        TxtSeCo.Text = e.Node.Key.ToString().Split(':')[1].ToString();
        TxtSele.Text = e.Node.Text;
        LblMens.Text = "";
    }
}