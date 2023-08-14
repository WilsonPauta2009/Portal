<%@ Page Title="Registro de REPARACIONES" Language="C#" MasterPageFile="~/PlantillaMAIN.master" %>

<script runat="server">
    System.Data.DataTable Tab = new System.Data.DataTable();
    ClsPostVenta PoVe = new ClsPostVenta();
    
    protected void BtnConf_Click(object sender, ImageClickEventArgs e)
    {
        PoVe.ProcesarReparacion(ClsDatos.mEmpr, 9, long.Parse(TxtNuRe.Text), Session["iden"].ToString(),
            DateTime.Now, Session["iden"].ToString(), TxtObse.Text,
            DateTime.Now.AddDays(15), DrpDwnMarc.SelectedValue, "", DrpDwnCali.SelectedValue,
            DrpDwnEsfe.SelectedValue, DrpDwnBraz.SelectedValue, DrpDwnCaja.SelectedValue, RdoBtnSexo.SelectedValue, RdoBtnGara.SelectedValue, "RE",
            "C:" + Session["iden"].ToString(), TxtRefe.Text);

        TxtNuRe.Focus();
    }

    protected void BtnFilt_Click(object sender, ImageClickEventArgs e)
    {
        //try
        //{
            BtnConf.Enabled = false;
            // verificamos que exista esa REPARACION
            PoVe.GetIngresos(out Tab, ClsDatos.mEmpr, 9, "RE", long.Parse(TxtNuRe.Text));

            if (Tab != null) // si existe
            {
                //LblInte.Text = Tab.Rows[0]["rep_inte"].ToString();
                //TxtRefe.Text = Tab.Rows[0]["rep_cnia"].ToString();
                TxtObse.Text = Tab.Rows[0]["rep_desc"].ToString();
                DrpDwnMarc.SelectedValue = Tab.Rows[0]["rep_marc"].ToString();
                //Txt10.Text = Tab.Rows[0]["rep_rein"].ToString();
                TxtRefe.Text = Tab.Rows[0]["rep_refe"].ToString();
                DrpDwnCali.SelectedValue = Tab.Rows[0]["rep_cali"].ToString();
                DrpDwnEsfe.SelectedValue = Tab.Rows[0]["rep_maqu"].ToString();
                DrpDwnBraz.SelectedValue = Tab.Rows[0]["rep_braz"].ToString();
                DrpDwnCaja.SelectedValue = Tab.Rows[0]["rep_caja"].ToString();

                RdoBtnSexo.SelectedValue = Tab.Rows[0]["rep_pers"].ToString().Trim();

                if (Tab.Rows[0]["rep_pers"].ToString().Trim() == "DAMA") RdoBtnSexo.Items[0].Selected = true;
                else RdoBtnSexo.Items[1].Selected = true;

                if (Tab.Rows[0]["rep_gara"].ToString().Trim() == "SI") RdoBtnGara.Items[0].Selected = true;
                else if (Tab.Rows[0]["rep_gara"].ToString().Trim() == "NO") RdoBtnGara.Items[1].Selected = true;
                else RdoBtnGara.Items[2].Selected = true; ;

                BtnConf.Enabled = true;
            }
            else // enceramos los datos
            {
                //LblInte.Text = "";
                TxtRefe.Text = "";
                TxtObse.Text = "";
                //Txt11.Text = "";
                //TxtLoCo.Text = ""; Txt10.Text = "";
            }
        //}
        //catch { }
    }
</script>

<asp:Content ID="CntMAIN" ContentPlaceHolderID="CntMAIN" Runat="Server">
    <table id="Tab001" cellpadding="0" cellspacing="0" style="width: 780px" bgcolor="White">
        <tr>
            <td align="center" valign="top" width="50px">
                <asp:Image ID="Img" runat="server" ImageUrl="./imgs/_registro.jpg" />
            </td>
            <td align="center" valign="middle">
                <table cellpadding="2" cellspacing="2" style="width: 100%" id="Tab002">
                    <tr>
                        <td>
                            <table id="Tab003" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="LblNuRe" runat="server" Text="Nº REPARACION" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt"></asp:Label>
                                    </td>
                                    <td width="5%">
                                    </td>
                                    <td width="75%">
                                        <asp:Label ID="LblObse" runat="server" Text="DESCRIPCION DEL DAÑO" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <asp:TextBox ID="TxtNuRe" runat="server" 
                                            Font-Names="Courier New" Font-Size="9pt" Width="100%" 
                                            CausesValidation="True">0</asp:TextBox>
                                                
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:CompareValidator ID="CmpVldNuRe" runat="server" 
                                            ControlToValidate="TxtNuRe" ErrorMessage="[X]" Font-Bold="True" 
                                            Font-Names="Courier New" Font-Size="8pt" Operator="GreaterThan" Type="Integer" 
                                            ValueToCompare="0"></asp:CompareValidator>
                                    </td>    
                                    <td>
                                        <asp:TextBox ID="TxtObse" runat="server" Font-Names="Courier New" 
                                            Font-Size="9pt" Height="30px" MaxLength="255" TextMode="MultiLine" 
                                            Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-top-style: inset; border-bottom-style: inset; border-top-width: 1px; border-bottom-width: 1px; border-top-color: #000000; border-bottom-color: #000000">
                            <table id="Tab004" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td width="16%" valign="middle" align="center">
                                        <asp:Label ID="LblRefe" runat="server" Text="REFERENCIA" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt" Width="100%"></asp:Label>
                                    </td>
                                    <td>
                                    </td>
                                    <td width="16%" valign="middle" align="center">
                                        <asp:Label ID="LblMarc" runat="server" Text="MARCA" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt"></asp:Label>
                                    </td>
                                    <td width="16%" valign="middle" align="center">
                                        <asp:Label ID="LblCali" runat="server" Text="CALIBRE" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt"></asp:Label>
                                    </td>
                                    <td width="16%" valign="middle" align="center">
                                        <asp:Label ID="LblEsfe" runat="server" Text="ESFERA" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt"></asp:Label>
                                    </td>
                                    <td width="16%" valign="middle" align="center">
                                        <asp:Label ID="LblBraz" runat="server" Text="BRAZALETE" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt"></asp:Label>
                                    </td>
                                    <td width="65%" valign="middle" align="center">
                                        <asp:Label ID="LblCaja" runat="server" Text="CAJA" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <asp:TextBox ID="TxtRefe" runat="server" Font-Names="Courier New" 
                                            Font-Size="9pt" Width="95%" MaxLength="10"></asp:TextBox>
                                                 
                                    </td>
                                    <td>
                                         <asp:RequiredFieldValidator ID="ReqVldClie" runat="server" 
                                            ControlToValidate="TxtRefe" ErrorMessage="[R]" Font-Bold="True" 
                                            Font-Names="Courier New" Font-Size="8pt"></asp:RequiredFieldValidator>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:DropDownList ID="DrpDwnMarc" runat="server" Font-Names="Courier New" 
                                            Font-Size="8pt" Width="98%">
                                            <asp:ListItem>[ Otra ]</asp:ListItem>
                                            <asp:ListItem>TISSOT GEN</asp:ListItem>
                                            <asp:ListItem>TISSOT TOU</asp:ListItem>
                                            <asp:ListItem>SWATCH</asp:ListItem>
                                            <asp:ListItem>RADO</asp:ListItem>
                                            <asp:ListItem>LONGINES</asp:ListItem>
                                            <asp:ListItem>CALVIN KLE</asp:ListItem>
                                            <asp:ListItem>ULYSEE NAR</asp:ListItem>
                                            <asp:ListItem>FREDERIC</asp:ListItem>
                                            <asp:ListItem>EDOX</asp:ListItem>
                                            <asp:ListItem>MIDO</asp:ListItem>
                                            <asp:ListItem>CERTINA</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:DropDownList ID="DrpDwnCali" runat="server" Font-Names="Courier New" 
                                            Font-Size="8pt" Width="98%">
                                            <asp:ListItem>[ Otro ]</asp:ListItem>
                                            <asp:ListItem>QUARZO</asp:ListItem>
                                            <asp:ListItem>AUTOMATICO</asp:ListItem>
                                            <asp:ListItem>CUERDA</asp:ListItem>
                                            <asp:ListItem>SOLAR</asp:ListItem>
                                            <asp:ListItem>AUTOQUARTZ</asp:ListItem>
                                            <asp:ListItem>AUTOCRONO</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:DropDownList ID="DrpDwnEsfe" runat="server" Font-Names="Courier New" 
                                            Font-Size="8pt" Width="98%">
                                            <asp:ListItem>[ Otro ]</asp:ListItem>
                                            <asp:ListItem>BLANCA</asp:ListItem>
                                            <asp:ListItem>NEGRA</asp:ListItem>
                                            <asp:ListItem>AZUL</asp:ListItem>
                                            <asp:ListItem>AMARILLA</asp:ListItem>
                                            <asp:ListItem>GRIS</asp:ListItem>
                                            <asp:ListItem>CELESTE</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:DropDownList ID="DrpDwnBraz" runat="server" Font-Names="Courier New" 
                                            Font-Size="8pt" Width="98%">
                                            <asp:ListItem>[ Otro ]</asp:ListItem>
                                            <asp:ListItem>ACERO</asp:ListItem>
                                            <asp:ListItem>ENCHAPADO</asp:ListItem>
                                            <asp:ListItem>ORO</asp:ListItem>
                                            <asp:ListItem>TITANIO</asp:ListItem>
                                            <asp:ListItem>TITAN PULI</asp:ListItem>
                                            <asp:ListItem>ALUMINIO</asp:ListItem>
                                            <asp:ListItem>BICOLOR</asp:ListItem>
                                            <asp:ListItem>RUBBER</asp:ListItem>
                                            <asp:ListItem>CUERO</asp:ListItem>
                                            <asp:ListItem>CERAMICA</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:DropDownList ID="DrpDwnCaja" runat="server" Font-Names="Courier New" 
                                            Font-Size="8pt" Width="98%">
                                            <asp:ListItem>[ Otro ]</asp:ListItem>
                                            <asp:ListItem>ACERO</asp:ListItem>
                                            <asp:ListItem>ENCHAPADO</asp:ListItem>
                                            <asp:ListItem>ORO</asp:ListItem>
                                            <asp:ListItem>TITANIO</asp:ListItem>
                                            <asp:ListItem>TITAN PULI</asp:ListItem>
                                            <asp:ListItem>ALUMINIO</asp:ListItem>
                                            <asp:ListItem>BICOLOR</asp:ListItem>
                                            <asp:ListItem>CERAMICA</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom-style: inset; border-bottom-width: 1px; border-bottom-color: #000000">
                            <table cellpadding="0" cellspacing="0" style="width: 100%" id="Tab005">
                                <tr>
                                    <td align="center" valign="middle" width="50%">
                                        <asp:Label ID="LblGara" runat="server" Text="¿ GARANTIA ?" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt" Width="100%"></asp:Label>
                                    </td>
                                    <td align="center" valign="middle" width="50%" 
                                        style="border-left-style: inset; border-left-width: 1px; border-left-color: #000000">
                                        <asp:Label ID="LblSexo" runat="server" Text="¿ Correponda a ?" Font-Bold="True" 
                                            Font-Names="Arial" Font-Size="8pt" Width="100%"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <asp:RadioButtonList ID="RdoBtnGara" runat="server" Font-Names="Courier New" 
                                            Font-Size="8pt" RepeatDirection="Horizontal">
                                            <asp:ListItem>SI</asp:ListItem>
                                            <asp:ListItem>NO</asp:ListItem>
                                            <asp:ListItem Value="RE" Selected="True">Reparacion</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td align="center" valign="top" 
                                        style="border-left-style: inset; border-left-width: 1px; border-left-color: #000000">
                                        <asp:RadioButtonList ID="RdoBtnSexo" runat="server" Font-Names="Courier New" 
                                            Font-Size="8pt" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="DAMA">Dama</asp:ListItem>
                                            <asp:ListItem Value="CABALLERO">Caballero</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>                                
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">

                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td width="50%">
                                <asp:ImageButton ID="BtnFilt" runat="server" ImageUrl="iconos/search.png" 
                                    onclick="BtnFilt_Click" ToolTip=":: FILTRAR ::" CausesValidation="False" />
                                    </td>
                                    <td>

                            <asp:ImageButton ID="BtnConf" runat="server" ImageUrl="iconos/save.png" 
                                onclick="BtnConf_Click" ToolTip=":: PROCESAR INFORMACION ::" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

