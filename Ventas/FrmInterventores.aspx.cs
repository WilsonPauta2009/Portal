using Infragistics.Web.UI.GridControls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDeValidacion;
using Infragistics.Web.UI.ListControls;
using System.Text.RegularExpressions;

public partial class Ventas_FrmInterventores : System.Web.UI.Page
{
    ClsVentas objVentas = new ClsVentas();
    enum Notify : int { alert, success, error, warning, information }
    string codA = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Carg las provincias para los intervventores
            objVentas.GetProvincias(wdpProv);
            wdpProv.SelectedItemIndex = 0;
            //Carga el tipo de estado para los interventores
            objVentas.GetTypeCustomer(wdpCust, ClsDatos.mEmpr);
        }
    }
    //script para el popup de los mensajes
    protected void Mensaje(string tMsg, string Msg)
    {
        ScriptManager.RegisterStartupScript(Page, GetType(), "JsStatus", "generate('" + tMsg + "', '" + Msg + "');", true); 
    }

    protected void wdMenu_MenuItemClick(object sender, MenuEventArgs e)
    //protected void wdMenu_ItemClick(object sender, Infragistics.Web.UI.NavigationControls.DataMenuItemEventArgs e)
    {
        string msg = "";
        switch (int.Parse(e.Item.Value))
        {
            case 0: if (wdMenu.SelectedItem.Text == "EJECUTAR")//Opcion para la busqueda de interventores
                {
                    objVentas.GetInterventor(wdgInte, txtIden.Text, txtInte.Text.ToUpper());
                    wdMenu.SelectedItem.Text = "CONSULTA";
                }
                else
                    wdMenu.SelectedItem.Text = "EJECUTAR";
                break;
            case 1:
                if (ValInformacion())
                {
                    int iTipo = ValidaDocumento(); //Ingreso o actualización de interventor.
                    if (iTipo != 0)
                    {
                        if (email_bien_escrito(txtMail.Text))
                        {
                            msg = objVentas.IngresaInterventor(PreText(), PreDrop(), wdtFecN, iTipo, Session["iden"].ToString());
                            //objVentas.GetAdamIden(wdoCodA,txtCodAdam, ClsDatos.mEmpr, "C", txtIden.Text);
                            if (msg == "1")
                            {
                                //Limpieza de variables de sesion para direcciones de entrega y contactos.
                                Session["data"] = null;
                                Session["dataDir"] = null;
                                //Carga detalles del cliente antes de abrir la ventana de mantenimientos
                                btn_popup_Click(null, null);
                                pnl_agrupacion_ModalPopupExtender.Show();
                                Mensaje(Notify.success.ToString(), "¡¡ Registro procesado correctamente !!");
                            }
                            else
                                Mensaje(Notify.alert.ToString(), "¡¡ Error al procesar el cliente. !! " + msg);
                        }

                        else
                        {
                            txtMail.Focus();
                            Mensaje(Notify.error.ToString(), "¡¡ El correo electronico ingresado es incorrecto. !! " + msg);
                        }
                    }
                    else
                        Mensaje(Notify.alert.ToString(), "¡¡ El número o tipo de documento ingresado es incorrecto.\n Por favor verifiquelo e intentelo nuevamente.!!");   
                }
                break;
        }
    }

    protected void Clear()
    {
        txtInte.Text = "";
        txtDire.Text = "";
        txtDir1.Text = "";
        txtCiud.Text = "";
        txtTel1.Text = "";
        txtTel2.Text = "";
        txtObsv.Text = "";
        txtRepr.Text = "";
        txtMail.Text = "";
        txtPweb.Text = "";
        txtCodAdam.Text = "";
        txtCedGar.Text = "";
        txtCedCon.Text = "";
        txtNomGar.Text = "";
        txtNomCon.Text = "";
        txtDirGar.Text = "";
        txtTelGar.Text = "";
        txtTelCon.Text = "";
    }

    protected TextBox[] PreText()
    {         
        TextBox[] txtDatos = new TextBox[12];
        txtDatos[0] = txtIden;
        txtDatos[1] = txtInte;
        txtDatos[2] = txtDire;
        txtDatos[3] = txtDir1;
        txtDatos[4] = txtCiud;
        txtDatos[5] = txtTel1;
        txtDatos[6] = txtTel2;
        txtDatos[7] = txtObsv;
        txtDatos[8] = txtMail;
        txtDatos[9] = txtPweb;
        txtDatos[10] = txtRepr;
        return txtDatos;
    }

    protected TextBox[] PreTextDetalle()
    {
        TextBox[] txtDatos = new TextBox[21];
        txtDatos[0] = txtRef;
        txtDatos[1] = txtRef1;
        txtDatos[2] = txtRef2;
        txtDatos[3] = txtVar;
        txtDatos[4] = txtVar1;
        txtDatos[5] = txtVar2;
        txtDatos[6] = txtVar3;
        txtDatos[7] = txtVar4;
        txtDatos[8] = txtPreEs;
        txtDatos[9] = txtPreEs1;
        txtDatos[10] = txtPreEs2;
        txtDatos[11] = txtLimCre;
        txtDatos[12] = txtRazSoc;
        txtDatos[13] = txtLoc;
        txtDatos[14] = txtComer1;
        txtDatos[15] = txtComer2;
        txtDatos[16] = txtRefer1;
        txtDatos[17] = txtRefer2;
        txtDatos[18] = txtSevi;
        txtDatos[19] = txtSevi1;
        txtDatos[20] = txtSevi2;
        return txtDatos;
    }

    protected WebDropDown[] PreDrop()
    {
        WebDropDown[] wdpDatos = new WebDropDown[3];
        wdpDatos[0] = wdpProv;
        wdpDatos[1] = wdpCust;
        wdpDatos[2] = wdpIden;
        return wdpDatos;
    }

    protected WebDropDown[] PreDropDetalle()
    {
        WebDropDown[] wdpDatos = new WebDropDown[13];
        wdpDatos[2] = wdpCondPag;
        wdpDatos[3] = wdpSitCred;
        wdpDatos[4] = wdpDivision;
        wdpDatos[5] = wdpEstado;
        wdpDatos[6] = wdpRutV1;
        wdpDatos[7] = wdpRutV2;
        wdpDatos[8] = wdpRutV3;
        wdpDatos[9] = wdpRutEntr;
        wdpDatos[10] = wdpEstV1;
        wdpDatos[11] = wdpEstV2;
        wdpDatos[12] = wdpEstV3;
        return wdpDatos;
    }

    protected CheckBox[] prepCheckDetalle() { 
        CheckBox[] chkDatos = new CheckBox[35];
        chkDatos[0] = chkLun;
        chkDatos[1] = chkMar;
        chkDatos[2] = chkMie;
        chkDatos[3] = chkJue;
        chkDatos[4] = chkVie;
        chkDatos[5] = chkSab;
        chkDatos[6] = chkDom;
        
        chkDatos[7] = chkVisRut11;
        chkDatos[8] = chkVisRut12;
        chkDatos[9] = chkVisRut13;
        chkDatos[10] = chkVisRut14;
        chkDatos[11] = chkVisRut15;
        chkDatos[12] = chkVisRut16;
        chkDatos[13] = chkVisRut17;

        chkDatos[14] = chkVisRut21;
        chkDatos[15] = chkVisRut22;
        chkDatos[16] = chkVisRut23;
        chkDatos[17] = chkVisRut24;
        chkDatos[18] = chkVisRut25;
        chkDatos[19] = chkVisRut26;
        chkDatos[20] = chkVisRut27;

        chkDatos[21] = chkVisRut31;
        chkDatos[22] = chkVisRut32;
        chkDatos[23] = chkVisRut33;
        chkDatos[24] = chkVisRut34;
        chkDatos[25] = chkVisRut35;
        chkDatos[26] = chkVisRut36;
        chkDatos[27] = chkVisRut37;

        chkDatos[28] = chkRutEnt1;
        chkDatos[29] = chkRutEnt2;
        chkDatos[30] = chkRutEnt3;
        chkDatos[31] = chkRutEnt4;
        chkDatos[32] = chkRutEnt5;
        chkDatos[33] = chkRutEnt6;
        chkDatos[34] = chkRutEnt7;
        return chkDatos;
    }

    protected void wdgInte_RowSelectionChanged(object sender, Infragistics.Web.UI.GridControls.SelectedRowEventArgs e)
    {
        string id = "";
        int index = 0;
        foreach (GridRecord row in e.CurrentSelectedRows)
        {
            if (row == null)
            {
                IDPair pair = e.CurrentSelectedRows.GetIDPair(index);
                id = pair.Key[0].ToString();
            }
            else
            {
                id = row.DataKey[0].ToString();
            }
        }
        //Carga detalles de Interventor

        objVentas.GetUqInterventor(PreText(), PreDrop(), wdtFecN, id);
        objVentas.GetAdamIden(wdoCodA, txtCodAdam, ClsDatos.mEmpr, "C", txtIden.Text, "A");
    }
        
    protected void btn_valida_Click(object sender, EventArgs e)
    {
        //Comprueba existencia de interventor
        if (!objVentas.isExist(txtIden.Text))
        {
            Clear();
            ValidaDocumento();
        }
        else
        {
            //Carga detalles de Interventor
            objVentas.GetUqInterventor(PreText(), PreDrop(), wdtFecN, txtIden.Text);
            objVentas.GetAdamIden(wdoCodA, txtCodAdam, ClsDatos.mEmpr, "C", txtIden.Text, "A");
        }
    }

    protected int ValidaDocumento()
    {
        Cls_Validacion Vld = new Cls_Validacion(txtIden.Text);
        byte iTipo = 0;
        bool validado;

        // validar los tipos de codigo del interventor
        // segun el valor seleccionado en el combo (CmbInte)

        validado = false;

        switch (int.Parse(wdpIden.SelectedValue))
        {
            case 1: // cedula
                if (Vld.Vld_CedulaDeIdentidad() == Cls_Validacion.EnumValidar.VCorrecto)
                {
                    validado = true;
                    iTipo = 1;
                }
                else
                {
                    Mensaje(Notify.error.ToString(), "La cédula ingresada es incorrecta.");
                }
                break;

            case 2: // r.u.c.
                if (Vld.Vld_SociedadPrivada() != Cls_Validacion.EnumValidar.VCorrecto)
                {
                    if (Vld.Vld_SociedadPublica() != Cls_Validacion.EnumValidar.VCorrecto)
                    {
                        if (Vld.Vld_PersonaNatural() == Cls_Validacion.EnumValidar.VCorrecto)
                        {
                            validado = true;
                            iTipo = 2;
                        }
                        else
                        {
                            Mensaje(Notify.error.ToString(), "El RUC. que ha ingresado es incorrecto.");
                        }
                    }
                    else
                    {
                        validado = true;
                        iTipo = 4;
                    }
                }
                else
                {
                    validado = true;
                    iTipo = 3;
                }
                break;

            case 3: // pasaporte
                if (txtIden.Text.Trim().Length > 0)
                {
                    validado = true;
                    iTipo = 5;
                }
                break;
        }
        if (validado)
            txtInte.Focus();
        else
            txtIden.Focus();
        return iTipo;
    }

    private bool ValInformacion()
    {
        bool bValI = false;
        string sMens = "";

        if (txtInte.Text.Trim().Length > 0)
        {
            if (txtMail.Text.Trim().Length > 0)
            {
                //if (Txt_03.Text.Trim().Length > 0)
                //{
                    if (txtCiud.Text.Trim().Length > 0)
                    {
                        if (txtDire.Text.Trim().Length > 0)
                        {
                            if (txtTel1.Text.Trim().Length > 0) bValI = true;
                            else { sMens = "TELEFONO o CELULAR"; txtTel1.Focus(); }
                        }
                        else { sMens = "DIRECCION"; txtDire.Focus(); }
                    }
                    else { sMens = "CIUDAD"; txtCiud.Focus(); }
                //}
                //else { sMens = "PROVINCIA"; Cmb_01.Focus(); }
            }
            else { sMens = "CORREO ELECTRONICO"; txtMail.Focus(); }
        }
        else { sMens = "APELLIDOS Y NOMBRES o RAZON SOCIAL"; txtInte.Focus(); }

        if (!bValI) sMens = "Debe ingresar: " + sMens;

        if (sMens.Length > 0) Mensaje(Notify.warning.ToString(), sMens);
        return bValI;
    }
    protected void btn_popup_Click(object sender, EventArgs e)
    {
        //objVentas.GetAdamIden(wdoCodA, txtCodAdam, ClsDatos.mEmpr, "C", txtIden.Text);
        codA = GetAdam();
        DataTable dt = new DataTable();

        objVentas.GetCondicionPago(wdpCondPag, "", "");
        wdpCondPag.SelectedValue = "";

        objVentas.GetSituacionCred(wdpSitCred, "", "");
        wdpSitCred.SelectedValue = "A";
        if (Session["dataDir"] == null)
        {
            Session["dataDir"] = objVentas.GetDireccionEntrega(ClsDatos.mEmpr, txtIden.Text, "C", "0", codA);
            wdgDirEnt.DataSource = (DataTable)Session["dataDir"];
            wdgDirEnt.DataBind();
        }

        objVentas.GetAgrupaciones(wdgAgrupacion, ClsDatos.mEmpr, "C", txtIden.Text, codA);
                
        dt = objVentas.GetRutas("", "");
        objVentas.loadWebDropDown(dt, wdpRutV1);
        wdpRutV1.SelectedValue = "";
        objVentas.loadWebDropDown(dt, wdpRutV2);
        wdpRutV2.SelectedValue = "";
        objVentas.loadWebDropDown(dt, wdpRutV3);
        wdpRutV3.SelectedValue = "";
        objVentas.loadWebDropDown(dt, wdpRutEntr);
        wdpRutEntr.SelectedValue = "";
        objVentas.GetProvinciaCiudad(wdpCiuEnt, "", "");
        wdpCiuEnt.SelectedValue = "";
        objVentas.GetProvinciaCiudad(wdpProvGar, "", "");
        wdpProvGar.SelectedValue = "";

        DataTable dtCont = objVentas.GetDatosCliente(ClsDatos.mEmpr, txtIden.Text, "C", "0", wdpDivision.SelectedValue.ToString(), codA, PreTextDetalle(), PreDropDetalle(), prepCheckDetalle());

        if (Session["data"] == null)
        {
            Session["data"] = dtContactos();
            foreach (DataRow a in dtCont.Rows)
            {
                AddContacto(a["NOMCO1"].ToString().ToUpper(), a["TELCO1"].ToString(), a["PUECO1"].ToString().ToUpper());
                AddContacto(a["NOMCO2"].ToString().ToUpper(), a["TELCO2"].ToString(), a["PUECO2"].ToString().ToUpper());
                AddContacto(a["NOMCO3"].ToString().ToUpper(), a["TELCO3"].ToString(), a["PUECO3"].ToString().ToUpper());
            }
        }

        txtRazSoc.Text = txtRazSoc.Text.Trim() == "" ? txtInte.Text : txtRazSoc.Text;
        TextBox[] txt_datos = new TextBox[10];
        txt_datos[0] = txtCedGar;
        txt_datos[1] = txtNomGar;
        txt_datos[2] = txtNomCon;
        txt_datos[3] = txtDirGar;
        txt_datos[6] = txtTelGar;
        txt_datos[7] = txtTlfCon;
        txt_datos[8] = txtCedGar;
        txt_datos[9] = txtCedCon;
        objVentas.GetGaranteCliente(txt_datos, wdpProvGar, ClsDatos.mEmpr, txtIden.Text, "C", codA);
    }

    protected void btn_close_Click(object sender, EventArgs e)
    {
        lbl_a.Text = "";
        Session["data"] = null;
        Session["dataDir"] = null;
        pnl_agrupacion_ModalPopupExtender.Hide();
        wdpRutV1.DataSource = null;
        wdpRutV2.DataSource = null;
        wdpRutV3.DataSource = null;
        wdpRutEntr.DataSource = null;
        wdpSitCred.DataSource = null;
        wdpSitCred.DataSource = null;
        wdgAgen.ClearDataSource();
        wdgAgrupacion.ClearDataSource();
        wdgInte.ClearDataSource();
    }
    //Valida que todas las agrupaciones esten seleccionadas
    protected bool validaAgrupa()
    {
        string idDAgr = "";
        bool val = true;
        foreach (GridRecord row in wdgAgrupacion.Rows)
        {
            idDAgr = row.Items.GetValue(2).ToString();
            if (idDAgr == "")
                val = false;
            else
            {
                if(val) val = true;
            }
        }
        return val;
    }

    protected void btn_guardar_Click(object sender, EventArgs e)
    {
        string msg = "";
        string fecR = "";
        codA = GetAdam();
        Page.Validate();
        if (Page.IsValid)
        {
            msg = objVentas.ProcesaCliente(txtIden.Text, ClsDatos.mEmpr, "C", txtVar.Text == "" ? "0" : txtVar.Text, txtVar1.Text == "" ? "0" : txtVar1.Text, txtVar2.Text == "" ? "0" : txtVar2.Text, txtVar3.Text == "" ? "0" : txtVar3.Text, txtVar4.Text == "" ? "0" : txtVar4.Text, txtRef.Text.ToUpper(), txtRef1.Text.ToUpper(), txtRef2.Text.ToUpper(), codA);
            //Mensaje
            if(msg != "1") Mensaje(Notify.alert.ToString(), "Error, Al procesar el cliente. !!" + msg);

            msg = objVentas.ProcesaAgenteCliente(txtIden.Text, ClsDatos.mEmpr, "C", txtAgen.Text.Split(char.Parse("]"))[0].Replace("[", ""), txtAgen1.Text.Split(char.Parse("]"))[0].Replace("[", ""), codA);
            //Mensaje
            if (msg != "1") Mensaje(Notify.alert.ToString(), "Error, Al procesar los agentes. !!" + msg);

            msg = objVentas.ProcesaContacto(txtIden.Text, ClsDatos.mEmpr, "C", txtInte.Text, "", 0, codA);
            //Mensaje
            if (msg != "1") Mensaje(Notify.alert.ToString(), "Error, Al procesar el contacto. !!" + msg);
                        
            string[] ciudad = wdpProvGar.SelectedItem.ToString().Split(char.Parse("]"));
            if(txtCedGar.Text.Trim()!="")
                msg = objVentas.ProcesaGarante(ClsDatos.mEmpr, txtIden.Text, "C", txtNomGar.Text, txtNomCon.Text, txtDirGar.Text, wdpProvGar.SelectedValue, ciudad[1], decimal.Parse(txtTelGar.Text == "" ? "0" : txtTelGar.Text), decimal.Parse(txtTelCon.Text == "" ? "0" : txtTelCon.Text), txtCedGar.Text, txtCedCon.Text, codA);
            //Mensaje
            if (msg != "1") Mensaje(Notify.alert.ToString(), "Error, Al procesar el garante. !!" + msg);

            msg = objVentas.ProcesaCartera(txtIden.Text, ClsDatos.mEmpr, "C", wdpCondPag.SelectedValue, chkLun.Checked, chkMar.Checked, chkMie.Checked, chkJue.Checked, chkVie.Checked, chkSab.Checked, chkDom.Checked, txtPreEs.Text == "" ? "0" : txtPreEs.Text, txtPreEs1.Text == "" ? "0" : txtPreEs1.Text, txtPreEs2.Text == "" ? "0" : txtPreEs2.Text, txtLimCre.Text, wdpSitCred.SelectedValue, "2", "0.00", "2", "0.00", rbRut.Checked,codA);
            if (msg != "1") Mensaje(Notify.alert.ToString(), "Error, Al procesar la cartera de cliente. !!" + msg);

            foreach (GridRecord row in wdgDirEnt.Rows)
            {
                msg = objVentas.ProcesaDireccionEntrega(ClsDatos.mEmpr, txtIden.Text, "C", row.Items.GetValue(0).ToString(), row.Items.GetValue(1).ToString(), row.Items.GetValue(2).ToString(), row.Items.GetValue(3).ToString(), "", "", "", "", decimal.Parse(row.Items.GetValue(4).ToString()), 0, "", 0);
            }
            //Mensaje
            if (msg != "1") Mensaje(Notify.alert.ToString(), "Error, Al procesar las direcciones de entrega. !!" + msg);
            
            if (validaAgrupa())
            {
                foreach (GridRecord row in wdgAgrupacion.Rows)
                {
                    msg = objVentas.ProcesaAgrupacion(txtIden.Text, ClsDatos.mEmpr, "C", row.Items.GetValue(0).ToString(), row.Items.GetValue(2).ToString(), codA);
                }
            }
            else Mensaje(Notify.error.ToString(), "!! Se necesita que seleccione todas las agrupaciones. !!");
            //Mensaje
            if (msg != "1") Mensaje(Notify.alert.ToString(), "Error, Al procesar las agrupaciones del cliente. !!" + msg);

            fecR = System.DateTime.Now.ToShortDateString().Replace("/", "");
            msg = objVentas.ProcesaRutaCliente(txtIden.Text, ClsDatos.mEmpr, "C", decimal.Parse(fecR), Session["iden"].ToString(), decimal.Parse(fecR), Session["iden"].ToString(), txtLoc.Text, wdpRutV1.SelectedValue, wdpEstV1.SelectedValue, decimal.Parse(txtSevi.Text), wdpRutV2.SelectedValue, wdpEstV2.SelectedValue, decimal.Parse(txtSevi1.Text),
                                        wdpRutV3.SelectedValue, wdpEstV3.SelectedValue, decimal.Parse(txtSevi2.Text), wdpRutEntr.SelectedValue, "", "", 0, "", "", 0, "", "", 0, txtComer1.Text, txtComer2.Text, decimal.Parse(txtRefer1.Text), decimal.Parse(txtRefer2.Text),
                                        wdpEstado.SelectedValue, 0, "", chkRutEnt1.Checked == true ? "1" : "2", chkRutEnt2.Checked == true ? "1" : "2", chkRutEnt3.Checked == true ? "1" : "2", chkRutEnt4.Checked == true ? "1" : "2", chkRutEnt5.Checked == true ? "1" : "2",
                                        chkRutEnt6.Checked == true ? "1" : "2", chkRutEnt7.Checked == true ? "1" : "2", txtRazSoc.Text, 0, "", chkVisRut11.Checked == true ? "1" : "2", chkVisRut12.Checked == true ? "1" : "2", chkVisRut13.Checked == true ? "1" : "2",
                                        chkVisRut14.Checked == true ? "1" : "2", chkVisRut15.Checked == true ? "1" : "2", chkVisRut16.Checked == true ? "1" : "2", chkVisRut17.Checked == true ? "1" : "2", chkVisRut21.Checked == true ? "1" : "2", chkVisRut22.Checked == true ? "1" : "2", chkVisRut23.Checked == true ? "1" : "2",
                                        chkVisRut24.Checked == true ? "1" : "2", chkVisRut25.Checked == true ? "1" : "2", chkVisRut26.Checked == true ? "1" : "2", chkVisRut27.Checked == true ? "1" : "2", chkVisRut31.Checked == true ? "1" : "2", chkVisRut32.Checked == true ? "1" : "2", chkVisRut33.Checked == true ? "1" : "2",
                                        chkVisRut34.Checked == true ? "1" : "2", chkVisRut35.Checked == true ? "1" : "2", chkVisRut36.Checked == true ? "1" : "2", chkVisRut37.Checked == true ? "1" : "2", wdpDivision.SelectedValue, codA);
            //Mensaje
            if (msg != "1") Mensaje(Notify.alert.ToString(), "Error, Al procesar las rutas de visita cliente. !!" + msg);
            fecR = System.DateTime.Now.ToShortDateString().Replace("/", "");
            int cont = 0;
            string[] datosCon = new string[9];
            foreach (GridRecord row in wdgContactos.Rows)
            {
                datosCon[cont] = row.Items.GetValue(1).ToString(); cont++;//Nombre
                datosCon[cont] = row.Items.GetValue(2).ToString(); cont++;//Telefono
                datosCon[cont] = row.Items.GetValue(3).ToString(); cont++;//Puesto
            }
            if (wdgContactos.Rows.Count >= 1)
            {
                msg = objVentas.ProcesaRutaCliente(txtIden.Text, ClsDatos.mEmpr, "C", decimal.Parse(fecR), Session["iden"].ToString(), decimal.Parse(fecR), Session["iden"].ToString(), ClsDatos.mEmpr, "", "", 0, "", "", 0,
                    "", "", 0, "", datosCon[0], datosCon[2], decimal.Parse(string.IsNullOrEmpty(datosCon[1]) ? "0" : datosCon[1]), string.IsNullOrEmpty(datosCon[3]) ? "" : datosCon[3],string.IsNullOrEmpty(datosCon[5])?"":datosCon[5], decimal.Parse(string.IsNullOrEmpty(datosCon[4]) ? "0" : datosCon[4]),
                    string.IsNullOrEmpty(datosCon[6])?"":datosCon[6], string.IsNullOrEmpty(datosCon[8])?"":datosCon[8], decimal.Parse(string.IsNullOrEmpty(datosCon[7]) ? "0" : datosCon[7]), "", "", 0, 0, "", 0, "", "", "", "", "", "", "", "", "", 0, "", "", "", "",
                                        "", "", "", "", "", "", "",
                                        "", "", "", "", "", "", "",
                                        "", "", "", "", "C", codA);
            }
            else { msg = "0"; Mensaje(Notify.alert.ToString(), "Error, Necesita registrar contactos para el cliente. !!" + msg); }

            if (msg != "1") Mensaje(Notify.alert.ToString(), "Error, Al procesar los contactos del agente. !!" + msg);
            else { Mensaje(Notify.success.ToString(), "!! Registro procesado correctamente.. !!"); pnl_agrupacion_ModalPopupExtender.Hide(); }
        }
        else
            Mensaje(Notify.alert.ToString(), "Debe llenar todos los datos de las pestañas.");
    }

    protected void btn_Agrupaciones_Click(object sender, EventArgs e)
    {
        objVentas.GetAgrupacionesDetalle(wdpDAgrupa, hdfAgrupa.Value, "%");
        wdpDAgrupa.SelectedValue = "";
    }

    protected void AddContacto(string nom, string tel, string pues) {
        DataTable table = (DataTable)Session["data"];
        DataRow r = table.NewRow();
        r.BeginEdit();
        r[0] = table.Rows.Count == 0 ? "0" : (int.Parse(table.Rows[table.Rows.Count - 1]["id"].ToString()) + 1).ToString();
        r[1] = nom;
        r[2] = tel;
        r[3] = pues;
        r.EndEdit();
        table.Rows.Add(r);
        Session["data"] = table;
        wdgContactos.DataSource = table;
        wdgContactos.DataBind();
    }

    protected void AddDireccion(string dir, string ciu, string pob, string tel)
    {
        DataTable table = (DataTable)Session["dataDir"];
        DataRow r = table.NewRow();
        r.BeginEdit();
        r[1] = table.Rows.Count == 0 ? "1" : (int.Parse(table.Rows[table.Rows.Count - 1]["CLDCEN"].ToString()) + 1).ToString();
        r[2] = dir;
        r[3] = ciu;
        r[4] = pob;
        r[9] = tel;
        r.EndEdit();
        table.Rows.Add(r);
        Session["dataDir"] = table;
        wdgDirEnt.DataSource = table;
        wdgDirEnt.DataBind();
    }
    
    public DataTable dtContactos()
    {
        DataTable dtCont = new DataTable();
        dtCont.Columns.Add("id");
        dtCont.Columns.Add("NOMCON");
        dtCont.Columns.Add("TELCON");
        dtCont.Columns.Add("PUECON");
        return dtCont;
    }

    protected void btnAddDir_Click(object sender, EventArgs e)
    {
        string[] ciudad = wdpCiuEnt.SelectedItem.ToString().Split(char.Parse("]"));
        AddDireccion(txtDirEnt.Text.ToUpper(), wdpCiuEnt.SelectedValue.ToString(), ciudad[1].Trim(), "0");
    }

    protected void wdgDirEnt_RowsDeleting(object sender, RowDeletingEventArgs e)
    {
        DataTable table = (DataTable)Session["dataDir"];
        foreach (decimal key in e.Row.DataKey)
        {
            DataRow[] a = table.Select("CLDCEN = " + key);
            table.Rows.Remove(a[0]);
        }
    }

    protected void wdgContactos_RowsDeleting(object sender, RowDeletingEventArgs e)
    {
        DataTable table = (DataTable)Session["data"];
        foreach (string key in e.Row.DataKey)
        {
            DataRow[] a = table.Select("id = " + key);
            table.Rows.Remove(a[0]);
        }
    }

    protected void btnAddCon_Click(object sender, ImageClickEventArgs e)
    {
        if (wdgContactos.Rows.Count < 3)
            AddContacto(txtConNom.Text.ToUpper(), txtTelCon.Text.ToUpper(), txtPueCon.Text.ToUpper());
        else
        {
            Mensaje(Notify.alert.ToString(), "Se puede agregar unicamente 3 contactos.");
        }
    }

    protected void imgAddAg1_Click(object sender, ImageClickEventArgs e)
    {
        Agen.Value = "1";
        pnlAgen_ModalPopupExtender.Show();
        wdgAgen.DataSource = objVentas.GetAgentes("", "").Rows.Cast<DataRow>().Take(10).CopyToDataTable();
        wdgAgen.DataBind();
    }

    protected void imgAddAg2_Click(object sender, ImageClickEventArgs e)
    {
        Agen.Value = "2";
        pnlAgen_ModalPopupExtender.Show();
        wdgAgen.DataSource = objVentas.GetAgentes("", "").Rows.Cast<DataRow>().Take(10).CopyToDataTable();
        wdgAgen.DataBind();
    }

    protected void btnBusAg_Click(object sender, EventArgs e)
    {
        wdgAgen.DataSource = objVentas.GetAgentes(txtCodAg.Text, txtAge.Text);
        wdgAgen.DataBind();
    }

    protected void wdgAgen_ColumnSelectionChanged(object sender, SelectedColumnEventArgs e)
    {
        string a = e.ToString();
    }
    protected void btnCerrarAgg_Click(object sender, EventArgs e)
    {
        wdgAgen.ClearDataSource();
        pnlAgen_ModalPopupExtender.Hide();
    }

    private Boolean email_bien_escrito(String email)
    {
        String expresion;
        expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
        if (Regex.IsMatch(email, expresion))
        {
            if (Regex.Replace(email, expresion, String.Empty).Length == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    protected void wdpDivision_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
    {
        codA = GetAdam();
        objVentas.GetDatosCliente(ClsDatos.mEmpr, txtIden.Text, "C", "0", wdpDivision.SelectedValue.ToString(), codA, PreTextDetalle(), PreDropDetalle(), prepCheckDetalle());
    }

    protected string GetAdam() {
        if (wdoCodA.Visible == true)
            return wdoCodA.SelectedValue;
        else
            return txtCodAdam.Text;
    }
}