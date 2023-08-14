using System;
public partial class InfCashManagement : System.Web.UI.Page
{
    ClsInfo Info = new ClsInfo();
    ClsRolDePagos RoPa = new ClsRolDePagos();

    protected void Page_Load(object sender, EventArgs e)
    {
        //WebView.Report = Repo;
        //Repo.DataSource = Info.Informe_Empleados(Session["esqu"].ToString());

        //Repo.Run();
        //WebView.DataBind();
        //Repo.Show();

        //Dts.ConnectionString = System.Configuration.ConfigurationSettings.AppSettings["CadenaDeConexion"];
        //Dts.ConnectionString = Info.CadenaDeConexion;
        //RptView.DataBind();

        if (!IsPostBack)
        {
            RoPa.ObtenerRolMainActive(TxtIden, TxtFeIn, TxtFeFn, Session["esqu"].ToString());
            wdgCash.DataSource = Info.GetRolCash(Session["esqu"].ToString(), int.Parse(TxtIden.Text));
        }
    }

    protected void BtnCerr_Click(object sender, EventArgs e)
    {
        //Server.Transfer("First.aspx", false);
        weeData.DownloadName = Session["esqu"].ToString() + "_ID_" + TxtIden.Text;
        weeData.Export(wdgCash);
    }
}
