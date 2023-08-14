<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="PersonalEgreso.aspx.cs" Inherits="PersonalEgreso" Title="Personal: SALIDA..." %>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="1" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="#99CCFF" Text="PERSONAL: Salida"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <table width="100%">
                    <tr>
                        <td align="center" valign="top">
                            <table cellpadding="0" cellspacing="0" class="style1" bgcolor="WhiteSmoke" width="410px">
                                <tr>
                                    <td>
                                        <asp:Panel ID="PnlEmpl" runat="server" DefaultButton="BtnFilt">
                                            <table id="TabDato" border="0" cellpadding="0" cellspacing="2">
                                                <tr>
                                                    <th align="right" style="background-color: black" valign="middle">
                                                        <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            ForeColor="Cyan" Text="Identificación :"></asp:Label></th>
                                                    <th align="left" valign="middle">
                                                        <asp:TextBox ID="TxtIden" runat="server" Columns="13" Font-Names="Arial" Font-Size="8pt"
                                                            MaxLength="13" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                            TabIndex="1"></asp:TextBox>
                                                        <asp:Button ID="BtnFilt" runat="server" CausesValidation="False" Font-Bold="True"
                                                            Font-Names="Arial" Font-Size="8pt" OnClick="BtnFilt_Click" TabIndex="3" Text="Filtrar..." /></th>
                                                </tr>
                                                <tr>
                                                    <th align="right" style="background-color: black" valign="middle">
                                                        <asp:Label ID="LblNomb" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            ForeColor="Cyan" Text="Empleado :"></asp:Label></th>
                                                    <th align="left" valign="middle">
                                                        <asp:TextBox ID="Tint_inte" runat="server" Columns="40" Font-Names="Arial" Font-Size="8pt"
                                                            MaxLength="40" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                            TabIndex="2"></asp:TextBox>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="top">
                                                        <asp:Label ID="LblOrga" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Organigrama :"></asp:Label></th>
                                                    <th align="left" valign="middle">
                                                        <asp:Label ID="TxtOrga" runat="server" Font-Bold="False" Font-Names="Courier New"
                                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="top">
                                                        <asp:Label ID="LblOrar" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Horario :"></asp:Label></th>
                                                    <th align="left" valign="middle">
                                                        <asp:Label ID="TxtHora" runat="server" Font-Bold="False" Font-Names="Courier New"
                                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="top">
                                                        <asp:Label ID="LblEmTi" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Tipo :"></asp:Label></th>
                                                    <th align="left" valign="middle">
                                                        <asp:Label ID="TxtEmTi" runat="server" Font-Bold="False" Font-Names="Courier New"
                                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th align="right">
                                                        <asp:Label ID="LblRelo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Reloj :"></asp:Label></th>
                                                    <th align="left">
                                                        <asp:Label ID="TxtRelo" runat="server" Font-Bold="False" Font-Names="Courier New"
                                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="middle">
                                                        <asp:Label ID="LblFeIn" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Fecha de Ingreso :" Width="107px"></asp:Label></th>
                                                    <th align="left" valign="middle">
                                                        <table id="TabFeIn" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="width: 75px">
                                                                    <ig:WebDateTimeEditor ID="WdtFeIn" runat="server" EditModeFormat="dd/MM/yyyy" Font-Names="Courier New"
                                                                        Font-Size="9pt" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                                        TabIndex="5" Width="75px" ReadOnly="True">
                                                                    </ig:WebDateTimeEditor>
                                                                </td>
                                                                <td style="width: 10px">
                                                                    <asp:RequiredFieldValidator ID="RfvFeIn" runat="server" ControlToValidate="WdtFeIn"
                                                                        ErrorMessage="*" Width="10px"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="middle">
                                                        <asp:Label ID="LblFeSa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Fecha de Salida :" Width="107px"></asp:Label></th>
                                                    <th align="left" valign="middle">
                                                        <table id="TFeSa" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="width: 75px">
                                                                    <ig:WebDateTimeEditor ID="WdtFeSa" runat="server" EditModeFormat="dd/MM/yyyy" Font-Names="Courier New"
                                                                        Font-Size="9pt" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                                        TabIndex="5" Width="75px">
                                                                    </ig:WebDateTimeEditor>
                                                                </td>
                                                                <td style="width: 10px">
                                                                    <asp:RequiredFieldValidator ID="RfvFeSa" runat="server" ControlToValidate="WdtFeSa"
                                                                        ErrorMessage="*" Width="10px"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td align="center" style="width: 80px">
                                                                    <asp:Label ID="ForFeNa" runat="server" Font-Bold="True" Font-Names="Courier New"
                                                                        Font-Size="8pt" ForeColor="Navy" Text="DD/MM/AAAA"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="middle">
                                                        <asp:Label ID="LblMoti" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Motivo :"></asp:Label>
                                                    </th>
                                                    <th align="left" valign="middle">
                                                        <asp:DropDownList ID="DdlMoti" runat="server" Font-Names="Arial" Font-Size="8pt"
                                                            Width="156px">
                                                        </asp:DropDownList></th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="top">
                                                        <asp:Label ID="LblObse" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Observaciones :"></asp:Label></th>
                                                    <th align="left">
                                                        <asp:TextBox ID="TxtObse" runat="server" Columns="40" Font-Names="Arial" Font-Size="8pt"
                                                            Height="56px" MaxLength="100" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                            TabIndex="2" TextMode="MultiLine"></asp:TextBox></th>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td align="center" valign="top">
                                        <table cellpadding="0" cellspacing="0" width="80px" style="height: 220px">
                                            <tr>
                                                <td align="center" valign="middle">
                                                    <asp:ImageButton ID="BtnProc" runat="server" ImageUrl="iconos/save.png"
                                                        OnClick="BtnConf_Click" ToolTip=":: PROCESAR INFORMACION ::"
                                                        CausesValidation="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" valign="middle">
                                                    <asp:ImageButton ID="BtnVisu" runat="server" ImageUrl="iconos/search.png"
                                                        OnClick="BtnVisu_Click" ToolTip=":: VISUALIZAR PERSONAL INGRESADO ::" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" valign="middle" style="height: 72px">
                                                    <asp:ImageButton ID="BtnCerr" runat="server" ImageUrl="iconos/ocultar.png"
                                                        OnClick="BtnCerr_Click" ToolTip=":: CERRAR LA VENTANA ACTUAL ::"
                                                        CausesValidation="False" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="100%" align="center" valign="top">
                            <asp:GridView ID="GrdMisc" runat="server" CellPadding="4"
                                Font-Names="Arial" Font-Size="8pt" ForeColor="Black" GridLines="Vertical"
                                OnSelectedIndexChanged="GrdMisc_SelectedIndexChanged" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                                <RowStyle BackColor="#F7F7DE" />
                                <FooterStyle BackColor="#CCCC99" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                            <asp:GridView ID="GrdTemp" runat="server" CellPadding="4" Font-Names="Arial" Font-Size="8pt"
                                ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GrdMisc_SelectedIndexChanged"
                                Visible="False">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top"></td>
        </tr>
    </table>
</asp:Content>

