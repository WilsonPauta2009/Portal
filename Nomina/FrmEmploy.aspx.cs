using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CapaDeValidacion;


public partial class FrmEmploy : System.Web.UI.Page
{
    ClsNomina cls = new ClsNomina();

    protected void Page_Load(object sender, EventArgs e)
    {
        //((Panel)Master.FindControl("PnlTitu")).Enabled = (bool)Session["usua"];
        //((DropDownList)Master.FindControl("DdlEmpr")).Visible = (bool)Session["usua"];
        //Usua.GetEmpr((DropDownList)Master.FindControl("DdlEmpr"), Session["iden"].ToString());
        //((Label)Master.FindControl("LblUsua")).Text = Session["inte"].ToString();
        // ===================================================================================

        if (!Page.IsPostBack)
        {
            cls.LoadProvincias(DdlProv);
        }
    }

    protected void BtnProc_Click(object sender, ImageClickEventArgs e)
    {
        Cls_Validacion Vld = new Cls_Validacion(TxtIden.Text);
        byte iTipo = 0;
        bool validado;

        // validate, the kind of code of internventor, according with the selected value

        validado = false;

        switch (DdlIden.SelectedIndex)
        {
            case 0: // cedula
                if (Vld.Vld_CedulaDeIdentidad() == Cls_Validacion.EnumValidar.VCorrecto)
                {
                    validado = true;
                    iTipo = 1;
                }
                break;

            case 1: // r.u.c.
                if (Vld.Vld_SociedadPrivada() != Cls_Validacion.EnumValidar.VCorrecto)
                {
                    if (Vld.Vld_SociedadPublica() != Cls_Validacion.EnumValidar.VCorrecto)
                    {
                        if (Vld.Vld_PersonaNatural() == Cls_Validacion.EnumValidar.VCorrecto)
                        {
                            validado = true;
                            iTipo = 2;
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

            case 2: // pasaporte
                if (TxtIden.Text.Trim().Length > 0)
                {
                    validado = true;
                    iTipo = 5;
                }
                break;
            case 3: // otro - no especificado
                if (TxtIden.Text.Trim().Length > 0)
                {
                    validado = true;
                    iTipo = 0;
                }
                break;
        }
        
        		
        if (validado)
        {
            int Tel1, Tel2;

            try	{ Tel1 = Convert.ToInt32(Tint_tel1.Text); } catch { Tel1 = 0; }
            try	{ Tel2 = Convert.ToInt32(Tint_tel2.Text); } catch { Tel2 = 0; }

            LblMens.Text = cls.SQL_ProcesarInte(Session["iden"],
                TxtIden.Text, iTipo, Tint_inte.Text.Trim(), Tint_dir1.Text, Tint_tel1.Text,
                Tint_dir2.Text, Tint_tel2.Text, DdlProv.SelectedValue,
                Tint_ciud.Text, WdtFeNa.Date, Tint_mail.Text, Tint_obse.Text);

            //, TxtMail.Text, "", "", TxtObse.Text, (string)Session["sUsua"]);
        }
        else LblMens.Text = "¡¡ identificación no validable !!";
    }

    protected void BtnFind_Click(object sender, EventArgs e)
    {
        LblMens.Text = cls.SQL_GetUniqueInte (  TxtIden.Text, DdlIden, DdlProv, WdtFeNa,
                                                Tint_inte, Tint_ciud, Tint_dir1, Tint_tel1,
                                                Tint_dir2, Tint_tel2, Tint_mail, Tint_obse);
    }
    protected void BtnCanc_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }
}
