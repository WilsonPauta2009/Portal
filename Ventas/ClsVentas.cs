using Infragistics.Web.UI.EditorControls;
using Infragistics.Web.UI.GridControls;
using Infragistics.Web.UI.ListControls;
using System;
//using System.Collections.Generic;
using System.Data;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
    
public class ClsVentas : ClsDatos
{
    public ClsVentas() { }

    DataTable tabu = new DataTable();

    public DataTable GetFactMotos(params object[] pParams)
    {
        Tabu = null;

        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                Tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PGK_GET_FACT", pParams);
                break;
        }
        return Tabu;
    }


    public void GetFacturas(WebDataGrid wdgFact ,string pEmpr, string pArea, DateTime pFecr) { 
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PGK_GET_FACTURASCREDITO", pEmpr, pArea, pFecr);
                break;
        }
        wdgFact.DataSource = tabu;
        wdgFact.DataBind();
    }

    public DataTable GetPagare(string pNume, string pClic) { 
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PGK_GET_PAGARE", "", pNume, pClic);
                break;
        }
        
        return tabu;
    }

    public DataTable GetPagareCol2(string pNume, string pClic)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PGK_GET_PAGARE_COL2", "", pNume, pClic);
                break;
        }

        return tabu;
    }

    public string IngresaInterventor(TextBox[] txtDatos, WebDropDown[] wdpDatos, WebDatePicker wdpFeNa, int tIid, string clsUser)
    {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_PRO_INTERVENTORES", txtDatos[0].Text,   //Cedula
                                                                    tIid,               //Tipo Identificacion
                                                                    txtDatos[1].Text.ToUpper(),   //Nombre
                                                                    wdpDatos[1].SelectedValue,  //Estado
                                                                    wdpDatos[0].SelectedValue,  //Provincia
                                                                    txtDatos[4].Text.ToUpper(),           //Ciudad
                                                                    txtDatos[2].Text.ToUpper(),           //Direccion1
                                                                    txtDatos[5].Text,           //Telefono1
                                                                    txtDatos[3].Text.ToUpper(),           //Direccion2
                                                                    txtDatos[6].Text,           //Telefono2
                                                                    wdpFeNa.Date,              //Fecha Nac.
                                                                    txtDatos[8].Text,           //Correo
                                                                    txtDatos[9].Text,           //Site
                                                                    null,                       //Representante
                                                                    txtDatos[7].Text,           //Observacion
                                                                    clsUser);              //USuario
                break;
        }
        return msg == "¡¡ zero registers affected !!"? "1" : msg;
    }

    public bool isExist(string pIden) { 
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GETUQINTE", pIden);
                break;
        }
        if (tabu.Rows.Count > 0)
            return true;
        return false;
    }

    public void GetUqInterventor(TextBox[] txtDatos, WebDropDown[] wdpDatos, WebDatePicker wdpFeNa,string pIden) { 
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GETUQINTE", pIden);
                break;
        }

        foreach(DataRow dr in tabu.Rows){
            txtDatos[0].Text = dr["INT_IDEN"].ToString().Trim();
            txtDatos[1].Text = dr["INT_DATA"].ToString().Trim();
            txtDatos[2].Text = dr["INT_DIR1"].ToString().Trim();
            txtDatos[3].Text = dr["INT_DIR2"].ToString().Trim();
            txtDatos[4].Text = dr["INT_CIUD"].ToString().Trim();
            txtDatos[5].Text = dr["INT_TEL1"].ToString().Trim();
            txtDatos[6].Text = dr["INT_TEL2"].ToString().Trim();
            txtDatos[7].Text = dr["INT_OBSE"].ToString().Trim();
            txtDatos[8].Text = dr["INT_MAIL"].ToString().Trim();
            txtDatos[9].Text = dr["INT_SITE"].ToString().Trim();
            txtDatos[10].Text = dr["INT_REPR"].ToString().Trim();
            wdpFeNa.Text = dr["INT_FENA"].ToString().Trim();
            wdpDatos[0].SelectedValue = dr["INT_PROV"].ToString().Trim();
            wdpDatos[1].SelectedValue = dr["INT_ACTI"].ToString().Trim();
            string tIid = dr["INT_TIID"].ToString().Trim();
            if (tIid == "1")
                wdpDatos[2].SelectedValue = dr["INT_TIID"].ToString().Trim();
            else if (tIid == "5") wdpDatos[2].SelectedValue = "3";
            else wdpDatos[2].SelectedValue = "2";
        }
    }


    public void GetInterventor(WebDataGrid wdgInte, string pInte, string pData)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GETINTES", pInte, pData);
                break;
        }
        wdgInte.DataSource = tabu;
    }

    public void GetProvincias(WebDropDown wpdProv) {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GETPROVINCIAS");
                break;
        }
        loadWebDropDown(tabu, wpdProv);
    }

    public void GetTypeCustomer(WebDropDown wpdCust, string pEmpr) { 
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_LOADTYPECUSTOMER", pEmpr);
                break;
        }
        loadWebDropDown(tabu, wpdCust);
    }

    public void GetAgrupaciones(WebDataGrid wdgAgrupacion, string pEmpr, string pTipo, string pIden,string pCodA)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                    tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_AGRUPACION", pEmpr, pTipo, pIden, pCodA);
                break;
        }
        wdgAgrupacion.DataSource = tabu;
    }

    public void GetAgrupacionesDetalle(WebDropDown wdpAgrupacion, string pAclc, string pDacc)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_AGRUPACION_DETALLE", pAclc, pDacc);
                break;
        }
        DataRow nRow = tabu.NewRow();
        nRow["DACCVE"] = "";
        nRow["DACDES"] = "SELECCIONE UNA AGRUPACIÓN.!";
        tabu.Rows.Add(nRow);
        loadWebDropDown(tabu, wdpAgrupacion);
    }

    public DataTable GetAgentes(string pAgec, string pAgen) {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_AGENTE", pAgec, pAgen);
                break;
        }
        return tabu;
    }

    public void GetCondicionPago(WebDropDown wdpCondicion, string pConc, string pCond)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_CONDICION_PAGO", pConc, pCond);
                break;
        }
        DataRow nRow = tabu.NewRow();
        nRow["CPACVE"] = "";
        nRow["CPADES"] = "SELECCIONE UNA CONDICIÓN DE PAGO.!";
        tabu.Rows.Add(nRow);
        loadWebDropDown(tabu, wdpCondicion);
    }

    public void GetSituacionCred(WebDropDown wdpSituacion, string pSitc, string pSitd)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_SITUACION_CRED", pSitc, pSitd);
                break;
        }
        loadWebDropDown(tabu, wdpSituacion);
    }

    public DataTable GetRutas(string pMcve, string pMdes)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_RUTAS", pMcve, pMdes);
                break;
        }

        DataRow nRow = tabu.NewRow();
        nRow["VEMCVE"] = "";
        nRow["VEMDES"] = "SELECCIONE UNA RUTA.";
        tabu.Rows.Add(nRow);
        return tabu;
    }

    public void GetProvinciaCiudad(WebDropDown wdpCiudad, string pCiud, string pProv)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_CLIENTE_PROVINCIA", pProv, pCiud);
                break;
        }

        DataRow nRow = tabu.NewRow();
        nRow["TPPPRO"] = "";
        nRow["TPPCIO"] = "SELECCIONE UNA CIUDAD.";
        tabu.Rows.Add(nRow);
        loadWebDropDown(tabu, wdpCiudad);
    }

    public DataTable GetCarteraCliente(string pEmpr, string pIden, string pTipo, string pCodA)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_CARTERA_CLIENTE", pEmpr, pIden, pTipo, pCodA);
                break;
        }
        return tabu;
    }
    
    public DataTable GetDireccionEntrega(string pEmpr, string pIden, string pTipo, string pClcn, string pCodA)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_DIRECCION_ENTREGA", pEmpr, pIden, pTipo, pClcn, pCodA);
                break;
        }
        return tabu;
    }

    public DataTable GetRutaCliente(string pEmpr, string pIden, string pTipo, string pEdiv, string pCodA)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_RUTA_CLIENTE", pEmpr, pIden, pTipo, pEdiv,pCodA);
                break;
        }
        return tabu;
    }

    public DataTable GetDatosCliente(string pEmpr, string pIden, string pTipo, string pClcn, string pEdiv, string pCodA, TextBox[] txtDatos, WebDropDown[] wdpDatos, CheckBox[] chkDatos)
    {
        tabu = GetCarteraCliente(pEmpr, pIden, pTipo, pCodA);
        foreach (DataRow a in tabu.Rows) {
            txtDatos[0].Text = a["CLIRE1"].ToString();
            txtDatos[1].Text = a["CLIRE2"].ToString();
            txtDatos[2].Text = a["CLIRE3"].ToString();
            txtDatos[3].Text = a["CLIV01"].ToString();
            txtDatos[4].Text = a["CLIV02"].ToString();
            txtDatos[5].Text = a["CLIV03"].ToString();
            txtDatos[6].Text = a["CLIV04"].ToString();
            txtDatos[7].Text = a["CLIV05"].ToString();
            wdpDatos[2].SelectedValue = a["CPACVE"].ToString();
            chkDatos[0].Checked = a["CLIRLU"].ToString() == "1" ? true : false;
            chkDatos[1].Checked = a["CLIRMA"].ToString() == "1" ? true : false;
            chkDatos[2].Checked = a["CLIRMI"].ToString() == "1" ? true : false;
            chkDatos[3].Checked = a["CLIRJU"].ToString() == "1" ? true : false;
            chkDatos[4].Checked = a["CLIRVI"].ToString() == "1" ? true : false;
            chkDatos[5].Checked = a["CLIRSA"].ToString() == "1" ? true : false;
            chkDatos[6].Checked = a["CLIRDO"].ToString() == "1" ? true : false;
            txtDatos[8].Text  = a["CLIR01"].ToString();
            txtDatos[9].Text  = a["CLIR02"].ToString();
            txtDatos[10].Text  = a["CLIR03"].ToString();
            txtDatos[11].Text  = a["CLILCR"].ToString();
            wdpDatos[3].SelectedValue = a["SICCVE"].ToString();
        }
        tabu = GetRutaCliente(pEmpr, pIden, pTipo, pEdiv,pCodA);
        foreach (DataRow a in tabu.Rows)
        {
            wdpDatos[5].SelectedValue = a["ESTREG"].ToString();
            wdpDatos[6].SelectedValue = a["RUTV1E"].ToString();
            wdpDatos[7].SelectedValue = a["RUTV2E"].ToString();
            wdpDatos[8].SelectedValue = a["RUTV3E"].ToString();
            wdpDatos[9].SelectedValue = a["RUTEEL"].ToString();
            wdpDatos[10].SelectedValue = a["EREV1"].ToString();
            wdpDatos[11].SelectedValue = a["EREV2"].ToString();
            wdpDatos[12].SelectedValue = a["EREV3"].ToString();
            txtDatos[12].Text = a["RAZSOC"].ToString();
            txtDatos[13].Text= a["LOCAGE"].ToString();
            txtDatos[14].Text= a["VARI1"].ToString();
            txtDatos[15].Text = a["VARI2"].ToString();
            txtDatos[16].Text = a["REFE1"].ToString();
            txtDatos[17].Text = a["REFE2"].ToString();
            txtDatos[18].Text= a["SEVER1"].ToString();
            txtDatos[19].Text = a["SEVER2"].ToString();
            txtDatos[20].Text = a["SEVER3"].ToString();

            chkDatos[7].Checked = a["DVER11"].ToString() == "1" ? true : false;
            chkDatos[8].Checked = a["DVER12"].ToString() == "1" ? true : false;
            chkDatos[9].Checked = a["DVER13"].ToString() == "1" ? true : false;
            chkDatos[10].Checked = a["DVER14"].ToString() == "1" ? true : false;
            chkDatos[11].Checked = a["DVER15"].ToString() == "1" ? true : false;
            chkDatos[12].Checked = a["DVER16"].ToString() == "1" ? true : false;
            chkDatos[13].Checked = a["DVER17"].ToString() == "1" ? true : false;
            chkDatos[14].Checked = a["DVER21"].ToString() == "1" ? true : false;
            chkDatos[15].Checked = a["DVER22"].ToString() == "1" ? true : false;
            chkDatos[16].Checked = a["DVER23"].ToString() == "1" ? true : false;
            chkDatos[17].Checked = a["DVER24"].ToString() == "1" ? true : false;
            chkDatos[18].Checked = a["DVER25"].ToString() == "1" ? true : false;
            chkDatos[19].Checked = a["DVER26"].ToString() == "1" ? true : false;
            chkDatos[20].Checked = a["DVER27"].ToString() == "1" ? true : false;
            chkDatos[21].Checked = a["DVER31"].ToString() == "1" ? true : false;
            chkDatos[22].Checked = a["DVER32"].ToString() == "1" ? true : false;
            chkDatos[23].Checked = a["DVER33"].ToString() == "1" ? true : false;
            chkDatos[24].Checked = a["DVER34"].ToString() == "1" ? true : false;
            chkDatos[25].Checked = a["DVER35"].ToString() == "1" ? true : false;
            chkDatos[26].Checked = a["DVER36"].ToString() == "1" ? true : false;
            chkDatos[27].Checked = a["DVER37"].ToString() == "1" ? true : false;
            chkDatos[28].Checked = a["DIAE1E"].ToString() == "1" ? true : false;
            chkDatos[29].Checked = a["DIAE2E"].ToString() == "1" ? true : false;
            chkDatos[30].Checked = a["DIAE3E"].ToString() == "1" ? true : false;
            chkDatos[31].Checked = a["DIAE4E"].ToString() == "1" ? true : false;
            chkDatos[32].Checked = a["DIAE5E"].ToString() == "1" ? true : false;
            chkDatos[33].Checked = a["DIAE6E"].ToString() == "1" ? true : false;
            chkDatos[34].Checked = a["DIAE7E"].ToString() == "1" ? true : false;
        }
        return tabu;
    }


    public string ProcesaAgrupacion(string pIden, string pEmpr, string pTipo, string pAclc, string pDacc, string pCodA)
    {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_PRO_AGRUPACION", pIden, pEmpr, pTipo, pAclc, pDacc, pCodA);
                break;
        }
        return msg == "¡¡ zero registers affected !!"? "1" : msg;
    }

    public string ProcesaCliente(string pIden, string pEmpr, string pTipo, string pClv1, string pClv2, string pClv3, string pClv4, string pClv5, string pClr1, string pClr2, string pClr3, string pCodA)
    {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_PRO_CLIENTE", pEmpr, pIden, pTipo, Math.Round(decimal.Parse(pClv1), 2), Math.Round(decimal.Parse(pClv2), 2), Math.Round(decimal.Parse(pClv3), 2), Math.Round(decimal.Parse(pClv4), 2), Math.Round(decimal.Parse(pClv5), 2), pClr1, pClr2, pClr3, pCodA);
                break;
        }
        return msg == "¡¡ zero registers affected !!"? "1" : msg;
    }

    public string ProcesaAgenteCliente(string pIden, string pEmpr, string pTipo, string pAgev, string pAgec, string pCodA) {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_PRO_AGENTECLIENTE", pEmpr, pIden, pTipo, pAgev, pAgec, pCodA);
                break;
        }
        return msg == "¡¡ zero registers affected !!"? "1" : msg;
    }

    public string ProcesaCartera(string pIden, string pEmpr, string pTipo, string pCcve, bool pCrlu, bool pCrma,
						         bool pCrmi, bool pCrju, bool pCrvi, bool pCrsa, bool pCrdo, string pCr01, 
           						 string pCr02, string pCr03, string pClcr, string pScve, string pCmcf, string pCtcf, 
                                 string pCmdf, string pCtdf, bool pRuta, string pCodA)
    {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_PRO_CARTERA_CLIENTE", pEmpr, pIden, pTipo, pCcve,
                                      pCrlu == true ? "1" : "2", pCrma == true ? "1" : "2",
                                      pCrmi == true ? "1" : "2", pCrju == true ? "1" : "2",
                                      pCrvi == true ? "1" : "2", pCrsa == true ? "1" : "2",
                                      pCrdo == true ? "1" : "2",
                                      Math.Round(decimal.Parse(pCr01), 2), Math.Round(decimal.Parse(pCr02), 2),
                                      Math.Round(decimal.Parse(pCr03), 2), Math.Round(decimal.Parse(pClcr), 2),
                                      pScve, pCmcf, pCtcf, pCmdf, pCtdf, pRuta == true ? "1" : "2", pCodA);
                break;
        }
        return msg == "¡¡ zero registers affected !!"? "1" : msg;
    }

    public string ProcesaContacto(string pIden, string pEmpr, string pTipo, string pConNom, string pConPue, decimal pConTel, string pCodA) {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_PRO_CONTACTO_CLIENTE", pEmpr, pIden, pTipo, pConNom, pConPue, pConTel,pCodA);
                break;
        }
        return msg == "¡¡ zero registers affected !!"? "1" : msg;
    }

    public string ProcesaRutaCliente(string pIden, string pEmpr, string pTipo, decimal pFcre, string pUcre, decimal pFmod ,
                                        string pUmod,	string pCage, 	string pRuv1, string pELV1,	decimal pSEVI,	string pRUV2,
                                        string pELV2,	decimal pSVR2,	string pRUV3, string pELV3,	decimal pSVR3,	string pRUEN,
                                        string pNoC1,	string pPuC1,	decimal pTeC1, string pNoC2,string pPuC2,	decimal pTeC2,
                                        string pNoC3,	string pPuC3,	decimal pTeC3, string pCom1,string pCom2,	decimal pRFE1,
                                        decimal pRFE2,	string pEstr,	decimal pFELO, string pUSLO,string pDiE1,	string pDiE2,
                                        string pDiE3,	string pDiE4,	string pDiE5, string pDiE6,	string pDiE7,	string pRsoc,
                                        decimal pFina,	string pUina,	string pVr11, string pVr12,	string pVr13,	string pVr14,
                                        string pVr15,	string pVr16,	string pVr17, string pVr21,	string pVr22,	string pVr23,
                                        string pVr24,	string pVr25,	string pVr26, string pVr27,	string pVr31,	string pVr32,
                                        string pVr33,	string pVr34,	string pVR35, string pVr36,	string pVr37,	string pEdiv,
                                        string pCodA
        ) {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_PRO_RUTA_CLIENTE",
                    pEmpr, pIden, pTipo, pFcre, pUcre, pFmod,
                                                                     pUmod, pCage, pRuv1, pELV1, pSEVI, pRUV2,
                                                                     pELV2, pSVR2, pRUV3, pELV3, pSVR3, pRUEN,
                                                                     pNoC1, pPuC1, pTeC1, pNoC2, pPuC2, pTeC2,
                                                                     pNoC3, pPuC3, pTeC3, pCom1, pCom2, pRFE1,
                                                                     pRFE2, pEstr, pFELO, pUSLO, pDiE1, pDiE2,
                                                                     pDiE3, pDiE4, pDiE5, pDiE6, pDiE7, pRsoc,
                                                                     pFina, pUina, pVr11, pVr12, pVr13, pVr14,
                                                                     pVr15, pVr16, pVr17, pVr21, pVr22, pVr23,
                                                                     pVr24, pVr25, pVr26, pVr27, pVr31, pVr32,
                                                                     pVr33, pVr34, pVR35, pVr36, pVr37, pEdiv,
                                                                     pCodA
                                                                     );
                break;
        }
        return msg == "¡¡ zero registers affected !!"? "1" : msg;
    }

    public string ProcesaDireccionEntrega(string pEmpr,	string pIden, string pTipo,	string pClcn, string pCldr,	string pClco, string pClpo,	string pClde, string pClpa,	string pClcp,
                                            string pClda, decimal pClt1, decimal pClt2, string pCltx, decimal pClfx
        ) {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_PRO_DIRECCION_ENTREGA", pEmpr, pIden, pTipo,pClcn, pCldr, pClco, pClpo, pClde, pClpa, pClcp, pClda, pClt1, pClt2, pCltx, pClfx);
                break;
        }
        return msg == "¡¡ zero registers affected !!" ? "1" : msg; 
    }

    public string ProcesaGarante(params object[] pParams)
    {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_PRO_GARANTE_CLIENTE", pParams);
                break;
        }
        return msg == "¡¡ zero registers affected !!" ? "1" : msg;
    }

    public string ProcesaClienteExtr(params object[] pParams)
    {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                //msg = ibm.ProcesarS("ADAMWEB.SP_ADAM_GENERATE_CLIENTE", pParams);
                //msg = ibm.ProcesarS("ADAMWEB.SP_ADAM_GENERATE_CLIENTE_EXTR", pParams);
                break;
        }
        return msg == "¡¡ zero registers affected !!" ? "1" : msg; 
    }

    public void GetAdamIden(WebDropDown wdpCodA, TextBox txtCodA, params object[] pParams)
    {
        tabu = null;
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_ADAM_IDEN1", pParams);
                break;
        }
        if (tabu.Rows.Count > 1)
        {
            txtCodA.Visible = false;
            loadWebDropDown(tabu, wdpCodA);
            wdpCodA.Visible = true;
        }
        else if(tabu.Rows.Count != 0)
        {
            wdpCodA.Visible = false;
            txtCodA.Text = tabu.Rows[0]["VCLIE"].ToString();
            txtCodA.Visible = true;
        }
    }

    public void GetGaranteCliente(TextBox[] txt_datos, WebDropDown wdpProvincia, params object[] pParams)
    {
        tabu = null;
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GET_GARANTE_CLIENTE", pParams);
                break;
        }
        foreach (DataRow a in tabu.Rows)
        {
            txt_datos[0].Text = a["glicve"].ToString();
            txt_datos[1].Text = a["glino1"].ToString();
            txt_datos[2].Text = a["glino2"].ToString();
            txt_datos[3].Text = a["glidir"].ToString();
            //txt_datos[4].Text = a["glicol"].ToString();
            //txt_datos[5].Text = a["glipob"].ToString();
            txt_datos[6].Text = a["glite1"].ToString();
            txt_datos[7].Text = a["glite2"].ToString();
            txt_datos[8].Text = a["glirf1"].ToString();
            txt_datos[9].Text = a["glirf2"].ToString();
            wdpProvincia.SelectedValue = a["glicol"].ToString();
        }
    }

    public void loadWebDropDown(DataTable tabu, WebDropDown wdpDato) {
        wdpDato.DataSource = tabu;
        wdpDato.TextField = tabu.Columns[1].ColumnName;
        wdpDato.ValueField = tabu.Columns[0].ColumnName;
        wdpDato.DataBind();
    }

    public void loadWebDropDown(DataTable tabu, RadComboBox rcbDato)
    {
        rcbDato.DataSource = tabu;
        rcbDato.DataTextField = tabu.Columns[1].ColumnName;
        rcbDato.DataValueField = tabu.Columns[0].ColumnName;
        rcbDato.DataBind();
    }

    //PEDIDOS

    public void LoadEmpresa(WebDropDown wdpEmpresa, string pEmpr, string pUsua) {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.CON_GetEmpresaERP", pEmpr, pUsua);
                break;
        }

        loadWebDropDown(tabu, wdpEmpresa);
    }

    public bool TestUserERP(string pEmpr, string pUsua, string pApli) {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                if (ibm.RecuperarPorProcedimiento("ADAMWEB.VAR_TestUserModule", pEmpr, pUsua, pApli).Rows[0][0].ToString() == "T") bReto = true;
                break;
        }

        return bReto;
    }

    public void TestUserModule_(WebDropDown wdpSucursal, string pEmpr, string pUsua, string pApli)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GetUsuariosAreas", pEmpr, pUsua, pApli);
                break;
        }

        loadWebDropDown(tabu, wdpSucursal);
    }

    public long GenerarNroMovimiento(string pEmpr, string pArea, string pTipo) {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                lReto = long.Parse(ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GetNumMovimiento", pEmpr, pArea, pTipo).Rows[0][0].ToString());
                break;
        }
        return lReto;
    }


    public void GetUqInterventor(TextBox txtDato, string pIden)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GETUQINTE", pIden);
                break;
        }

        foreach (DataRow dr in tabu.Rows)
        {
            txtDato.Text = dr["INT_DATA"].ToString().Trim();
        }
    }

    public void GetRepresentante(WebDropDown wdpRepr, string pRepr, string pIden)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GETREPRESENTANTE", pRepr, pIden);
                break;
        }
        loadWebDropDown(tabu, wdpRepr);
    }

    public void GetRepresentanteDet(WebDropDown wdpRepr, TextBox[] txtDatos, string pRepr, string pIden)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GETREPRESENTANTE", pRepr, pIden);
                break;
        }
        foreach (DataRow a in tabu.Rows)
        {
            txtDatos[0].Text = a["INT_DIR1"].ToString();
            txtDatos[1].Text = a["INT_TEL1"].ToString();
            break;
        }
    }

    public void FormasDePagoInicial(WebDropDown wdpForP, string pEmpr, string pArea, string pIden)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GetFormasDePagosIni", pEmpr, pArea, pIden);
                break;
        }

        loadWebDropDown(tabu, wdpForP);
    }
    
    public void GetArtis(WebDataGrid wdgItems ,params object[] pParams) { 
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento_DataTable("ADAMWEB.PKG_GetArtis", "items", pParams);
                break;
        }
        wdgItems.DataSource = tabu;
        wdgItems.DataBind();
    }

    public void GetUqArti(TextBox[] txtDatos, WebNumericEditor[] txtValo, params object[] pParams)
    {
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento_DataTable("ADAMWEB.PKG_GetArtis", "items", pParams);
                break;
        }
        foreach (DataRow a in tabu.Rows)
        {
            txtDatos[0].Text=a["ARE_ART_IDEN"].ToString().Trim();
            txtDatos[1].Text = a["ART_DESC"].ToString().Trim();
            txtValo[0].Text = a["ART_COST"].ToString().Trim();
            txtValo[1].Text = a["ARE_ART_PESO"].ToString().Trim();
        }
    }

    public string ProcesaPedido(params object[] pParams)
    {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.PRO_MOVIMIENTOS_CAB",  pParams);
                break;
        }
        return msg == "¡¡ zero registers affected !!" ? "1" : msg;
    }

    public string ProcesaPedidoDetalle(params object[] pParams)
    {
        string msg = "";
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                break;
            case DataBase.MicrosoftSqlServer:
                break;
            case DataBase.IbmDB2:
                msg = ibm.ProcesarS("ADAMWEB.SP_MOVIMIENTOS_DET", pParams);
                break;
        }
        return msg == "¡¡ zero registers affected !!" ? "1" : msg;
    }

    public void WEBLoadClasifica(RadComboBox pCmb, params object[] pParams)
    {
        tabu = null;
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                // ORCL_LoadDropDownList(pCmb, "WEB.GetTypesOfItem", pParams);
                break;
            case DataBase.MicrosoftSqlServer:
                // LoadDropDownList(pCmb, "WEB_GetTypesOfItem", pParams);
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("ADAMWEB.PKG_GetClasifica", pParams);
                //IBM_LoadDropDownList(pCmb, "ADAMWEB.WEB_LoadMarc", pParams);
                break;
        }
        loadWebDropDown(tabu, pCmb);
    }

    public DataTable pkg_getProductos(params object [] pParams)
    {
        tabu = null;
        switch (mBase)
        {
            case DataBase.OracleDatabase:
                // ORCL_LoadDropDownList(pCmb, "WEB.GetTypesOfItem", pParams);
                break;
            case DataBase.MicrosoftSqlServer:
                // LoadDropDownList(pCmb, "WEB_GetTypesOfItem", pParams);
                break;
            case DataBase.IbmDB2:
                tabu = ibm.RecuperarPorProcedimiento("adamweb.pkget_productos", pParams);
                //IBM_LoadDropDownList(pCmb, "ADAMWEB.WEB_LoadMarc", pParams);
                break;
        }
        return tabu;
    }
}