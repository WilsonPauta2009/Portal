<%@ Page Title="POSTVENTA" Language="C#" MasterPageFile="~/PlantillaMAIN.master" %>



<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    string[] sFile = System.IO.Directory.GetFiles(Server.MapPath("./imgs/locales"), "*.jpg");

        //    for (byte f = 0; f < sFile.Length; f++)
        //    {
        //        string[] sImag = sFile[f].Split('\\');
        //        Infragistics.Web.UI.ListControls.ImageItem Imag = new Infragistics.Web.UI.ListControls.ImageItem();
        //        Imag.ImageUrl = string.Format("./imgs/locales/{0}", sImag[sImag.Length - 1]);
        //        Imag.ToolTip = sImag[sImag.Length - 1];
        //        Wiv.Items.Add(Imag);
        //    }

        //    Random Azar = new Random();
        //    //int iImag = Azar.Next(14);
        //    //string[] sStyle = { "Appletini", "Caribbean", "Claymation", "ElectricBlue", "Harvest", "LucidDream", "Nautilus", "Office2007Black", "Office2007Blue", "Office2007Silver", "Pear", "RedPlanet", "RubberBlack","Trendy"};

        //    int iImag = Azar.Next(3);
        //    string[] sStyle = { "Appletini", "RedPlanet", "RubberBlack" };
        //    Wiv.StyleSetName = sStyle[iImag];
        //}
    }
</script>

<asp:Content ID="CntFirst" ContentPlaceHolderID="CntMAIN" Runat="Server">
    <table cellpadding="0" cellspacing="0" style="width: 90%; height: 100%;" 
        align="center">
        <tr>
            <td id="TabFoto" align="right" valign="middle">
                <ig:WebImageViewer ID="Wiv" runat="server"  
                    StyleSetName="Appletini" Width="90%" ViewStateMode="Enabled" 
                    Height="400px" Visible="False">
                </ig:WebImageViewer>
            </td>
        </tr>
    </table>
    
</asp:Content>

