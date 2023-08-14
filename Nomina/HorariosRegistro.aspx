<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="HorariosRegistro.aspx.cs" Inherits="HorariosRegistro" Title="REGISTRO: Entrada/Salida..." %>


    
<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <table id="TabCont" border="1" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" bgcolor="WhiteSmoke">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="MidnightBlue" Text="PERSONAL: Registro de Entrada/Salida"></asp:Label></td>
        </tr>
        <tr>
            <td align="center">
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
                                    Text="Fecha y Hora #1 :" Width="107px"></asp:Label></th>
                            <th align="left" valign="middle">
                                <table id="TFeIn" border="0" cellpadding="0" cellspacing="0" width="250">
                                    <tr>
                                        <td style="width: 75px;">
                                            <ig:WebDateTimeEditor id="WdtFeIn" runat="server" editmodeformat="MM/dd/yyyy H:mm" font-names="Courier New"
                                                font-size="9pt" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'" tabindex="5" width="115px">
                                            </ig:WebDateTimeEditor>
                                        </td>
                                        <td style="width: 10px;">
                                            <asp:RequiredFieldValidator ID="RfvFeIn" runat="server" ControlToValidate="WdtFeIn"
                                                ErrorMessage="*" Width="10px"></asp:RequiredFieldValidator>
                                        </td>
                                        <td align="center">
                                            <asp:Label ID="ForFeIn" runat="server" Font-Bold="True" Font-Names="Courier New"
                                                Font-Size="8pt" ForeColor="Navy" Text="MM/DD/AAAA hh:mm"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </th>
                        </tr>
                        <tr>
                            <th align="right" valign="middle">
                                <asp:Label ID="LblFeSa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                    Text="Fecha y Hora #2 :" Width="107px"></asp:Label></th>
                            <th align="left" valign="middle">
                                <table id="TFeSa" border="0" cellpadding="0" cellspacing="0" width="250">
                                    <tr>
                                        <td style="width: 75px;">
                                            <ig:WebDateTimeEditor id="WdtFeSa" runat="server" editmodeformat="MM/dd/yyyy H:mm" font-names="Courier New"
                                                font-size="9pt" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                tabindex="5" width="115px">
                                                        </ig:WebDateTimeEditor>
                                        </td>
                                        <td style="width: 10px;">
                                            <asp:RequiredFieldValidator ID="RfvFeSa" runat="server" ControlToValidate="WdtFeSa"
                                                ErrorMessage="*" Width="10px"></asp:RequiredFieldValidator>
                                        </td>
                                        <td align="center">
                                            <asp:Label ID="ForFeSa" runat="server" Font-Bold="True" Font-Names="Courier New"
                                                Font-Size="8pt" ForeColor="Navy" Text="MM/DD/AAAA hh:mm"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </th>
                        </tr>
                        <tr>
                            <th align="right" valign="middle">
                                <asp:Label ID="LblMoti" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                    Text="Tipo :"></asp:Label>
                            </th>
                            <th align="left" valign="middle">
                                <asp:DropDownList ID="DdlHoTi" runat="server" Font-Names="Arial" Font-Size="8pt"
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
        </tr>
        <tr>
            <td align="center" 
                style="border-top-style: ridge; border-bottom-style: ridge; border-top-width: 1px; border-bottom-width: 1px">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="center">
                            <asp:Button ID="BtnProc" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                OnClick="BtnProc_Click" TabIndex="4" Text="PROCESAR" />
                        </td>
                        <td align="center">
                            <asp:Button ID="BtnList" runat="server" CausesValidation="False" Font-Bold="True"
                                Font-Names="Arial" Font-Size="8pt" OnClick="BtnList_Click" TabIndex="6" Text="VISUALIZAR" />
                        </td>
                        <td align="center">
                            <asp:Button ID="BtnCerr" runat="server" CausesValidation="False" Font-Bold="True"
                                Font-Names="Arial" Font-Size="8pt" OnClick="BtnCerr_Click" TabIndex="7" Text="CERRAR" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="border-bottom-style: ridge; border-bottom-width: 1px">
                <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                    ForeColor="DarkRed"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <asp:GridView ID="GrdMisc" runat="server" CellPadding="4" Font-Names="Arial" Font-Size="8pt"
                    ForeColor="#333333" GridLines="None" 
                    OnSelectedIndexChanged="GrdMisc_SelectedIndexChanged" Width="100%">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
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
</asp:Content>

