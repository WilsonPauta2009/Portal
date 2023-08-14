using Infragistics.Web.UI.EditorControls;
using Infragistics.Web.UI.GridControls;
using Infragistics.Web.UI.ListControls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ventas_frmPedidos : System.Web.UI.Page
{
    enum Notify : int { alert, success, error, warning, information }
    ClsVentas objPedidos = new ClsVentas();
    WebDropDown wdpEmpr;
    WebDropDown wdpSucu;
    Label lblTemp;
    MenuItem mIt;
    string msg = "";
    //script para el popup de los mensajes
    protected void Mensaje(string tMsg, string Msg)
    {
        ScriptManager.RegisterStartupScript(Page, GetType(), "JsStatus", "generate('" + tMsg + "', '" + Msg + "');", true);
    }

    private void loadMenu()
    {
        MnMant.Items.Clear();
        mIt = new MenuItem("Agregar");
        mIt.ImageUrl = "~/Iconos/add.png";
        MnMant.Items.Add(mIt);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadMenu();
            lblTemp = (Label)Master.FindControl("lblDiv");
            lblTemp.Visible = true;
            lblTemp = (Label)Master.FindControl("lblSuc");
            lblTemp.Visible = true;
            wdpEmpr = (WebDropDown)Master.FindControl("wdpEmpr");
            wdpEmpr.Visible = true;
            wdpSucu = (WebDropDown)Master.FindControl("wdpSuc");
            wdpSucu.Visible = true;
        }
    }

    protected void btnAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (decimal.Parse(txtPrec.Value.ToString())!= 0)
        {
            if (Session["dataProd"] == null)
            {
                CreateMovis();
            }
            AddMovis(txtItem.Text, txtDesc.Text, hdfExis.Value, txtCant.Value, hdfTipo.Value, txtPeso.Value, 0, hdfCost.Value, txtPrec.Text, txtDcto.Value,
                    (decimal.Parse(txtCant.Value.ToString()) * decimal.Parse(txtPrec.Text)), true, hdfDcto.Value, 0, 
                    hdfTipo.Value=="1"?((double.Parse(txtPrec.Text) - double.Parse(txtDcto.Text))*0.12).ToString("0.00"):"0.00");
            btnCalcula_Click(null, null);
            txtItem.Text = "";
            txtCant.Value = 0;
            txtDesc.Text = "";
            txtPrec.Value = 0;
            txtPeso.Value = 0;
            txtDcto.Value = 0;
            hdfDcto.Value = "0";
            hdfCost.Value = "0";
            hdfExis.Value = "0";
            hdfTipo.Value = "0";
        }
    }

    private void CreateMovis()
    // le agrega los campos correspondientes a la variable
    // (TabMovi) para a su vez luego asignarlos a (DtgItem).
    {
        DataTable TabMovi = new DataTable();
        TabMovi.Columns.Add("item", typeof(string));
        TabMovi.Columns.Add("arti", typeof(string));
        TabMovi.Columns.Add("exis", typeof(double));
        TabMovi.Columns.Add("cant", typeof(double));
        TabMovi.Columns.Add("tipo", typeof(byte));
        TabMovi.Columns.Add("peso", typeof(double));
        TabMovi.Columns.Add("pesa", typeof(double));
        TabMovi.Columns.Add("cost", typeof(double));
        TabMovi.Columns.Add("prec", typeof(double));
        TabMovi.Columns.Add("dcto", typeof(double));
        TabMovi.Columns.Add("subt", typeof(double));
        TabMovi.Columns.Add("chec", typeof(bool));
        TabMovi.Columns.Add("lcost", typeof(double));
        TabMovi.Columns.Add("ekiv", typeof(double));
        TabMovi.Columns.Add("iva", typeof(double));
        Session["dataProd"] = TabMovi;
    }

    private void AddMovis(params object[] pParams)
    {
        bool isExist = false;
        DataTable table = (DataTable)Session["dataProd"];
        DataRow r = table.NewRow();
        foreach (GridRecord key in wdgProductos.Rows)
        {
            DataRow[] a = table.Select("item = " + key.Items.GetValue(1).ToString());
            a[0]["chec"] = bool.Parse(key.Items.GetValue(0).ToString());
            a[0]["item"] = key.Items.GetValue(1).ToString();
            a[0]["arti"] = key.Items.GetValue(2).ToString();
            a[0]["exis"] = double.Parse(key.Items.GetValue(3).ToString());
            a[0]["cant"] = double.Parse(key.Items.GetValue(4).ToString());
            a[0]["tipo"] = byte.Parse(key.Items.GetValue(5).ToString());
            a[0]["pesa"] = double.Parse(key.Items.GetValue(6).ToString());
            a[0]["cost"] = double.Parse(key.Items.GetValue(7).ToString());
            a[0]["prec"] = double.Parse(key.Items.GetValue(8).ToString());
            a[0]["peso"] = double.Parse(key.Items.GetValue(9).ToString());
            a[0]["dcto"] = double.Parse(key.Items.GetValue(10).ToString());
            a[0]["subt"] = double.Parse(key.Items.GetValue(11).ToString());
            a[0]["lcost"] = double.Parse(key.Items.GetValue(12).ToString());
            a[0]["ekiv"] = double.Parse(key.Items.GetValue(13).ToString());
            a[0]["iva"] = double.Parse(key.Items.GetValue(14).ToString());
            if (a[0]["item"].ToString() == txtItem.Text)
            {
                isExist = true;
            }
            else
                isExist = false;
        }
        
        if (isExist)
            Mensaje(Notify.error.ToString(), "El producto ya se encuentra registrado.");
        else
        {
            if (pParams.Count() > 0)
            {
                r.BeginEdit();
                r[0] = pParams[0];
                r[1] = pParams[1];
                r[2] = pParams[2];
                r[3] = pParams[3];
                r[4] = pParams[4];
                r[5] = pParams[5];
                r[6] = pParams[6];
                r[7] = pParams[7];
                r[8] = pParams[8];
                r[9] = pParams[9];
                r[10] = pParams[10];
                r[11] = pParams[11];
                r[12] = pParams[12];
                r[13] = pParams[13];
                r[14] = pParams[14];
                r.EndEdit();
                table.Rows.Add(r);
            }
        }
        Session["dataProd"] = table;
        wdgProductos.ClearDataSource();
        wdgProductos.DataSource = table;
        wdgProductos.DataBind();
    }
    
    protected void CambiaMenu() {
        MnMant.Items.Clear();
        mIt = new MenuItem("Confirmar");
        mIt.ImageUrl = "~/Iconos/Good.png";
        MnMant.Items.Add(mIt);
        mIt = new MenuItem("Cancelar");
        mIt.ImageUrl = "~/Iconos/Bad.png";
        MnMant.Items.Add(mIt);
    }

    protected void MnMant_MenuItemClick(object sender, MenuEventArgs e)
    {
        wdpEmpr = Master.FindControl("wdpEmpr") as WebDropDown;
        wdpSucu = Master.FindControl("wdpSuc") as WebDropDown;
        switch (MnMant.SelectedItem.Text) {
            case "Agregar":
                txtNoPedido.Text = objPedidos.GenerarNroMovimiento(wdpEmpr.SelectedValue, wdpSucu.SelectedValue, "PD").ToString();
                CambiaMenu();
                break;
            case "Confirmar":
                msg = "1";
                msg = objPedidos.ProcesaPedido(wdpEmpr.SelectedValue, wdpSucu.SelectedValue, "PD", int.Parse(txtNoPedido.Text), "0104591417", DateTime.Now, "0104591417", "S", txtObse.Text, "", wdpForPag.SelectedValue);
                if (msg == "1")
                {
                    string m = "1";
                    
                    foreach (GridRecord key in wdgProductos.Rows)
                    {
                        string item = key.Items.GetValue(1).ToString();
                        double cant = double.Parse(key.Items.GetValue(4).ToString());//4 cantidad
                        double prec = double.Parse(key.Items.GetValue(8).ToString());//8 es precio
                        double subt = double.Parse(key.Items.GetValue(11).ToString());//11 subt
                        double dcto = double.Parse(key.Items.GetValue(10).ToString());//10 dcto
                        double cost  = double.Parse(key.Items.GetValue(7).ToString());//7 costo
                        int tipo = int.Parse(key.Items.GetValue(5).ToString());//5 tipo
                        
                        if (m == "1")
                            m = objPedidos.ProcesaPedidoDetalle(wdpEmpr.SelectedValue, wdpSucu.SelectedValue, "PD", int.Parse(txtNoPedido.Text), item, cant , prec, dcto, tipo==1?"12.00":"0.00", 0.00, cost);
                    }
                    if (m == "1")
                    {
                        loadMenu();
                        Session["dataProd"] = null;
                        wdgProductos.ClearDataSource();
                        txtNoPedido.Text = "";
                        txtSuman.Text = "";
                        txtDctoT.Text = "";
                        txtSubt.Text = "";
                        txtIva.Text = "";
                        txtTot.Text = "";
                        Mensaje(Notify.success.ToString(), "Pedido ingresado correctamente.");
                    }
                    else
                        Mensaje(Notify.warning.ToString(), m + "\n Por favor intentelo nuevamente.");
                }
                else {
                    Mensaje(Notify.error.ToString(), msg);
                }
                break;
            case "Cancelar":
                loadMenu();
                Session["dataProd"] = null;
                break;
            case "D":
                break;
            case "E":
                break;
        }
    }

    protected void btnValida_Click(object sender, EventArgs e)
    {
    }

    protected void btnValida_Click1(object sender, EventArgs e)
    {
        wdpEmpr = (WebDropDown)Master.FindControl("wdpEmpr");
        wdpSucu = (WebDropDown)Master.FindControl("wdpSuc");
        txtDirRep.Text = "";
        txtTelRep.Text = "";
        txtInterventor.Text = "";
        if (objPedidos.isExist(txtCed.Text))
        {
            btnAdd.Enabled = true;
            objPedidos.GetUqInterventor(txtInterventor, txtCed.Text);
            objPedidos.GetRepresentante(wdpRepr, txtCed.Text, "");
            wdpRepr_SelectionChanged(null, null);
            objPedidos.FormasDePagoInicial(wdpForPag, wdpEmpr.SelectedValue, wdpSucu.SelectedValue, txtCed.Text);
            txtItem.Focus();
        }
        else { btnAdd.Enabled = false; }
    }
    protected void wdpRepr_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
    {
        TextBox[] txtDatos = new TextBox[2];
        txtDatos[0] = txtDirRep;
        txtDatos[1] = txtTelRep;
        objPedidos.GetRepresentanteDet(wdpRepr, txtDatos, txtCed.Text, wdpRepr.SelectedValue);
    }

    protected void btnLoad_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, GetType(), "hwa", "prueba();", true);
        pnlAddItem_ModalPopupExtender.Show();
    }
    protected void btnItem_Click(object sender, EventArgs e)
    {
        wdpEmpr = (WebDropDown)Master.FindControl("wdpEmpr");
        wdpSucu = (WebDropDown)Master.FindControl("wdpSuc");
        objPedidos.GetArtis(wdgItems, wdpEmpr.SelectedValue, txtCed.Text, txtItem.Text.ToUpper(), wdpSucu.SelectedValue, "", 0);
        pnlAddItem_ModalPopupExtender.Show();
    }
    protected void btn_close_Click(object sender, EventArgs e)
    {
        pnlAddItem_ModalPopupExtender.Hide();
    }

    protected void wdgProductos_RowsDeleting(object sender, RowDeletingEventArgs e)
    {
        DataTable table = (DataTable)Session["dataProd"];
        foreach (string key in e.Row.DataKey)
        {
            DataRow[] a = table.Select("item = " + key);
            table.Rows.Remove(a[0]);
        }
    }

    protected void btnCalcula_Click(object sender, EventArgs e)
    {
        double suma = 0;
        double dcto = 0;
        double d = 0;
        double iva = 0;
        foreach (GridRecord key in wdgProductos.Rows)
        {
            suma = suma + double.Parse(key.Items.GetValue(11).ToString());
            d = double.Parse(key.Items.GetValue(10).ToString());
            d = (double.Parse(key.Items.GetValue(8).ToString()) * d) / 100;
            d = (d * double.Parse(key.Items.GetValue(4).ToString()));
            dcto = dcto + d;
            if (key.Items.GetValue(5).ToString() == "1")
                iva = ((suma - dcto) * 0.12);
        }
        txtSuman.Text = suma.ToString("0.00");
        txtDctoT.Text = (dcto).ToString("0.00");
        txtSubt.Text = (suma - dcto).ToString("0.00");
        txtIva.Text = iva.ToString("0.00");
        if (iva != 0.00)
            txtTot.Text = ((suma - dcto) + iva).ToString("0.00");
        else
            txtTot.Text = (suma - dcto).ToString("0.00");
    }
}