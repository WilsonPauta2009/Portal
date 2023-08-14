<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="PersonalIngreso.aspx.cs" Inherits="PersonalIngreso" Title="Personal: INGRESO..." %>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="#99CCFF" Text="PERSONAL: Ingreso"></asp:Label></td>
        </tr>
        <tr>
            <td align="center">
                <table width="100%">
                    <tr>
                        <td align="center" valign="top">
                            <table cellpadding="0" cellspacing="0" bgcolor="White" width="400px">
                                <tr>
                                    <td align="center">
                                        <asp:Panel ID="PnlEmpl" runat="server" DefaultButton="BtnFilt">
                                            <table id="TabDato" border="0" cellpadding="0" cellspacing="2" bgcolor="WhiteSmoke">
                                                <tr>
                                                    <th align="right" style="background-color: black" valign="middle">
                                                        <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            ForeColor="Cyan" Text="Identificación :"></asp:Label></th>
                                                    <th align="left" valign="middle" style="width: 219px">
                                                        <asp:TextBox ID="TxtIden" runat="server" Columns="13" Font-Names="Arial" Font-Size="8pt"
                                                            MaxLength="13" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                            TabIndex="1" BorderStyle="Inset" BorderWidth="1px" Width="105px"></asp:TextBox>
                                                        <asp:Button ID="BtnFilt" runat="server" CausesValidation="False" Font-Bold="True"
                                                            Font-Names="Arial" Font-Size="8pt" OnClick="BtnFilt_Click" TabIndex="3" Text="Filtrar..." /></th>
                                                </tr>
                                                <tr>
                                                    <th align="right" style="background-color: black" valign="middle">
                                                        <asp:Label ID="LblNomb" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            ForeColor="Cyan" Text="Empleado(a) :"></asp:Label></th>
                                                    <th align="left" valign="middle" style="width: 219px">
                                                        <asp:TextBox ID="Tint_inte" runat="server" Columns="40" Font-Names="Arial" Font-Size="8pt"
                                                            MaxLength="40" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                            TabIndex="2" BorderStyle="Inset" BorderWidth="1px"></asp:TextBox>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="top">
                                                        <asp:Label ID="LblOrga" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Organigrama :"></asp:Label></th>
                                                    <th align="left" valign="middle" style="width: 219px">
                                                        <asp:Label ID="TxtOrga" runat="server" Font-Bold="False" Font-Names="Courier New"
                                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="top">
                                                        <asp:Label ID="LblOrar" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Horario :"></asp:Label></th>
                                                    <th align="left" valign="middle" style="width: 219px">
                                                        <asp:Label ID="TxtHora" runat="server" Font-Bold="False" Font-Names="Courier New"
                                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="top">
                                                        <asp:Label ID="LblEmTi" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Tipo :"></asp:Label></th>
                                                    <th align="left" valign="middle" style="height: 14px; width: 219px;">
                                                        <asp:Label ID="TxtEmTi" runat="server" Font-Bold="False" Font-Names="Courier New"
                                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th align="right">
                                                        <asp:Label ID="LblRelo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Reloj :"></asp:Label></th>
                                                    <th align="left" style="width: 219px">
                                                        <asp:Label ID="TxtRelo" runat="server" Font-Bold="False" Font-Names="Courier New"
                                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="middle">
                                                        <asp:Label ID="LblFeIn" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Fecha de Ingreso :" Width="107px"></asp:Label></th>
                                                    <th align="left" valign="middle" style="width: 219px">
                                                        <table id="TFeNa" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="width: 75px">
                                                                    <ig:WebDateTimeEditor ID="WdtFeIn" runat="server" EditModeFormat="dd/MM/yyyy" Font-Names="Courier New"
                                                                        Font-Size="9pt" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                                        TabIndex="3" Width="75px" Height="21px">
                                                                    </ig:WebDateTimeEditor>
                                                                </td>
                                                                <td style="width: 10px">
                                                                    <asp:RequiredFieldValidator ID="RfvFeNa" runat="server" ControlToValidate="WdtFeIn"
                                                                        ErrorMessage="*" Width="10px" ForeColor="Red"></asp:RequiredFieldValidator>
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
                                                        <asp:Label ID="LblBasi" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Básico :"></asp:Label></th>
                                                    <th align="left" valign="middle" style="width: 219px">
                                                        <ig:WebNumericEditor ID="TxtBasi" runat="server" Culture="en-US"
                                                            Font-Names="Courier New" Font-Size="9pt" MaxDecimalPlaces="2"
                                                            ValueText="0.00" Height="20px" Width="75px" CausesValidation="True" MinDecimalPlaces="2">
                                                        </ig:WebNumericEditor>
                                                        <asp:RequiredFieldValidator ID="RfvBasi" runat="server"
                                                            ControlToValidate="TxtBasi" ErrorMessage="*" Width="10px" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="middle">
                                                        <asp:Label ID="lblMOvi" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Movilización :"></asp:Label></th>
                                                    <th align="left" valign="middle" style="width: 219px">
                                                        <ig:WebNumericEditor ID="txtMovi" runat="server" Culture="en-US"
                                                            Font-Names="Courier New" Font-Size="9pt" MaxDecimalPlaces="2"
                                                            ValueText="0.00" Height="20px" Width="75px" CausesValidation="True" MinDecimalPlaces="2">
                                                        </ig:WebNumericEditor>
                                                        <asp:RequiredFieldValidator ID="rfvMovi" runat="server"
                                                            ControlToValidate="txtMovi" ErrorMessage="*" Width="10px" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="middle">
                                                        <asp:Label ID="lbBoEm" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Bono Fijo :"></asp:Label></th>
                                                    <th align="left" valign="middle" style="width: 219px">
                                                        <ig:WebNumericEditor ID="txtBoEm" runat="server" Culture="en-US"
                                                            Font-Names="Courier New" Font-Size="9pt" MaxDecimalPlaces="2"
                                                            ValueText="0.00" Height="20px" Width="75px" CausesValidation="True" MinDecimalPlaces="2">
                                                        </ig:WebNumericEditor>
                                                        <asp:RequiredFieldValidator ID="rfvBoEm" runat="server"
                                                            ControlToValidate="txtBoEm" ErrorMessage="*" Width="10px" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="middle">
                                                        <asp:Label ID="LblCeCo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Centro de Costos :"></asp:Label></th>
                                                    <th align="left" valign="middle">
                                                        
                                                        <asp:DropDownList ID="DdlCeCo" runat="server" BackColor="WhiteSmoke" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" TabIndex="5" Width="180px">
                                                        </asp:DropDownList>
                                                        
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="middle">
                                                        <asp:Label ID="lblQuPo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Quincena(%) :"></asp:Label></th>
                                                    <th align="left" valign="middle" style="width: 219px">
                                                        <ig:WebNumericEditor ID="txtQuPo" runat="server" Culture="en-US"
                                                            Font-Names="Courier New" Font-Size="9pt" MaxDecimalPlaces="2"
                                                            ValueText="0.00" Height="20px" Width="75px" CausesValidation="True" MinDecimalPlaces="2">
                                                        </ig:WebNumericEditor>
                                                        <asp:RequiredFieldValidator ID="rfvQuPo" runat="server"
                                                            ControlToValidate="txtQuPo" ErrorMessage="*" Width="10px" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RangeValidator ID="rgvQuPo" runat="server" ControlToValidate="txtQuPo" ErrorMessage="*" ForeColor="Red" MaximumValue="40" MinimumValue="0" Type="Double" SetFocusOnError="True"></asp:RangeValidator>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th align="right" valign="top">
                                                        <asp:Label ID="LblObse" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                            Text="Observaciones :"></asp:Label></th>
                                                    <th align="left" style="width: 219px">
                                                        <asp:TextBox ID="TxtObse" runat="server" Columns="40" Font-Names="Arial"
                                                            Font-Size="8pt" Height="56px" MaxLength="100"
                                                            onblur="this.style.background='white'"
                                                            onfocus="this.style.background='#ffffcc'" TabIndex="5" TextMode="MultiLine" BorderStyle="Inset" BorderWidth="1px"></asp:TextBox>
                                                    </th>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td align="center" bgcolor="#3C3C3C" width="100%">
                                        <table cellpadding="0" cellspacing="0" style="height: 220px;">
                                            <tr>
                                                <td align="center" valign="middle">
                                                    <asp:ImageButton ID="BtnProc" runat="server" ImageUrl="iconos/save.png"
                                                        OnClick="BtnConf_Click" ToolTip=":: PROCESAR INFORMACION ::"
                                                        CausesValidation="False" Width="40px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" valign="middle">
                                                    <asp:ImageButton ID="BtnVisu" runat="server" ImageUrl="iconos/search.png"
                                                        OnClick="BtnVisu_Click" ToolTip=":: VISUALIZAR PERSONAL INGRESADO ::" Width="40px" CausesValidation="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" valign="middle" style="height: 72px">
                                                    <asp:ImageButton ID="BtnCerr" runat="server" ImageUrl="iconos/ocultar.png"
                                                        OnClick="BtnCerr_Click" ToolTip=":: CERRAR LA VENTANA ACTUAL ::"
                                                        CausesValidation="False" Width="40px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="center" valign="middle">
                            <asp:GridView ID="GrdMisc" runat="server" AutoGenerateSelectButton="True" CellPadding="4"
                                Font-Names="Courier New" Font-Size="8pt" GridLines="Horizontal"
                                OnSelectedIndexChanged="GrdMisc_SelectedIndexChanged" Width="100%"
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black">
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
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
            <td align="center"
                style="border-bottom-style: outset; border-bottom-width: 0px">
                <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                    ForeColor="DarkRed"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top"></td>
        </tr>
    </table>
</asp:Content>
