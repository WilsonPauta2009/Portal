<%@ Page Title="" Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="FrmRolDePagos_Specifications.aspx.cs" Inherits="FrmRolDePagos_Specifications" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" frame="below"
        width="100%">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="11pt" ForeColor="#99CCFF" Text="Rol de Pagos: Empleados / Parámetros / Comisiones..."></asp:Label></td>
        </tr>
        <tr>
            <td align="center" width="100%">
                <table>
                    <tr>
                        <td align="center" valign="top">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Panel ID="PnlEmpl" runat="server" DefaultButton="BtnFilt">
                                            <table cellpadding="4" id="TabHead" width="400px" bgcolor="White">
                                                <tr>
                                                    <td>
                                                        <table id="TabDato" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <th align="right" style="background-color: black" valign="middle">
                                                                    <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" ForeColor="Cyan" Text="Identificación :"></asp:Label>
                                                                </th>
                                                                <th align="left" valign="middle">
                                                                    <asp:TextBox ID="TxtIden" runat="server" Columns="13" Font-Names="Arial"
                                                                        Font-Size="8pt" MaxLength="13" onblur="this.style.background='white'"
                                                                        onfocus="this.style.background='#ffffcc'" TabIndex="1" ReadOnly="True" Width="105px"></asp:TextBox>
                                                                    <asp:Button ID="BtnFilt" runat="server" CausesValidation="False"
                                                                        Font-Bold="True" Font-Names="Arial" Font-Size="8pt" OnClick="BtnFilt_Click"
                                                                        TabIndex="3" Text="Filtrar..." Visible="False" />
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right" style="background-color: black" valign="middle">
                                                                    <asp:Label ID="LblNomb" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" ForeColor="Cyan" Text="Empleado :"></asp:Label>
                                                                </th>
                                                                <th align="left" valign="middle">
                                                                    <asp:TextBox ID="Tint_inte" runat="server" Columns="40" Font-Names="Arial"
                                                                        Font-Size="8pt" MaxLength="40" onblur="this.style.background='white'"
                                                                        onfocus="this.style.background='#ffffcc'" TabIndex="2" ReadOnly="True"></asp:TextBox>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right" valign="top">
                                                                    <asp:Label ID="LblOrga" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" Text="Organigrama :"></asp:Label>
                                                                </th>
                                                                <th align="left" valign="middle">
                                                                    <asp:Label ID="TxtOrga" runat="server" Font-Bold="False"
                                                                        Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right" valign="top">
                                                                    <asp:Label ID="LblOrar" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" Text="Horario :"></asp:Label>
                                                                </th>
                                                                <th align="left" valign="middle">
                                                                    <asp:Label ID="TxtHora" runat="server" Font-Bold="False"
                                                                        Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right" valign="top">
                                                                    <asp:Label ID="LblEmTi" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" Text="Tipo :"></asp:Label>
                                                                </th>
                                                                <th align="left" style="height: 14px" valign="middle">
                                                                    <asp:Label ID="TxtEmTi" runat="server" Font-Bold="False"
                                                                        Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right">
                                                                    <asp:Label ID="LblRelo" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" Text="Reloj :"></asp:Label>
                                                                </th>
                                                                <th align="left">
                                                                    <asp:Label ID="TxtRelo" runat="server" Font-Bold="False"
                                                                        Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right">
                                                                    <asp:Label ID="LblBanc" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" Text="Financieras :"></asp:Label>
                                                                </th>
                                                                <th align="left">
                                                                    <asp:DropDownList ID="DdlBanc" runat="server" Font-Names="Arial"
                                                                        Font-Size="8pt" Width="199px">
                                                                    </asp:DropDownList>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right">
                                                                    <asp:Label ID="LblTipo" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" Text="Tipo de Cuenta :"></asp:Label>
                                                                </th>
                                                                <th align="left">
                                                                    <asp:DropDownList ID="DdlTipo" runat="server" Font-Names="Arial"
                                                                        Font-Size="8pt" Width="86px">
                                                                        <asp:ListItem Value="AHO">Ahorro</asp:ListItem>
                                                                        <asp:ListItem Value="CTE">Corriente</asp:ListItem>
                                                                        <asp:ListItem Value="VIR">Virtual</asp:ListItem>
                                                                    </asp:DropDownList>
                                                            </tr>
                                                            <tr>
                                                                <th align="right">
                                                                    <asp:Label ID="LblNuCu" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" Text="Nº de Cuenta :"></asp:Label>
                                                                </th>
                                                                <th align="left">
                                                                    <asp:TextBox ID="TxtNCta" runat="server" Columns="20" Font-Names="Arial"
                                                                        Font-Size="8pt" MaxLength="20" onblur="this.style.background='white'"
                                                                        onfocus="this.style.background='#ffffcc'" TabIndex="2" Width="122px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RfvNCta" runat="server"
                                                                        ControlToValidate="TxtNCta" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                    <asp:CompareValidator ID="CmvNCta" runat="server" ControlToValidate="TxtNCta"
                                                                        ErrorMessage="x" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right"></th>
                                                                <th align="right" valign="middle">
                                                                    <asp:CheckBox ID="chkFoRe" runat="server" Font-Names="Courier New" Font-Size="9pt" Text="¿Fondo de Reserva?" TextAlign="Left" />
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right"></th>
                                                                <th align="right" valign="middle">
                                                                    <asp:CheckBox ID="chkDeTe" runat="server" Font-Names="Courier New" Font-Size="9pt" Text="¿Décimo 3ro?" TextAlign="Left" />
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th align="right"></th>
                                                                <th align="right" valign="middle">
                                                                    <asp:CheckBox ID="chkDeCu" runat="server" Font-Names="Courier New" Font-Size="9pt" Text="¿Décimo 4to?" TextAlign="Left" />
                                                                </th>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td valign="top">
                                                        <table style="width: 100%" id="TabBtns" cellpadding="4">
                                                            <tr>
                                                                <td>
                                                                    <asp:ImageButton ID="BtnProc" runat="server" ImageUrl="./btns/database.png"
                                                                        OnClick="BtnProc_Click" ToolTip=":: procesar información ::" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:ImageButton ID="BtnCerr" runat="server" CausesValidation="False"
                                                                        ImageUrl="./btns/close.png" OnClick="BtnCerr_Click"
                                                                        ToolTip=":: cerrar interfaz ::" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial"
                                                                        Font-Size="8pt" ForeColor="DarkRed"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="middle">
                                        <asp:GridView ID="grdPara" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Names="Courier New" Font-Size="9pt" ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="SELE" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="CODI" HeaderText="ID" />
                                                <asp:BoundField DataField="NOMB" HeaderText="Parámetro" />
                                                <asp:TemplateField HeaderText="Especificación">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="ESPE" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="130px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="middle">
                                        <asp:GridView ID="grdComi" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Names="Courier New" Font-Size="9pt" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="SELE0" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="CODI" HeaderText="ID" />
                                                <asp:BoundField DataField="NOMB" HeaderText="Parámetro" />
                                                <asp:TemplateField HeaderText="Especificación">
                                                    <ItemTemplate>
                                                        <ig:WebNumericEditor ID="PORC" runat="server" MaxDecimalPlaces="2" Width="90px">
                                                        </ig:WebNumericEditor>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <FooterStyle BackColor="#CCCC99" />
                                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#F7F7DE" />
                                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                            <SortedAscendingHeaderStyle BackColor="#848384" />
                                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                            <SortedDescendingHeaderStyle BackColor="#575357" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="center" valign="top" width="100%">
                            <asp:GridView ID="GrdMisc" runat="server" AutoGenerateSelectButton="True" CellPadding="4"
                                Font-Names="Courier New" Font-Size="8pt"
                                GridLines="Vertical" OnSelectedIndexChanged="GrdMisc_SelectedIndexChanged"
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                                BorderWidth="1px" Width="100%" ForeColor="Black">
                                <AlternatingRowStyle BackColor="White" />
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" Font-Names="Courier New"
                                    Font-Size="8pt" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
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
            <td align="center" valign="top">
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" style="font-family: Arial; font-size: 8px; font-weight: bold"></td>
        </tr>
    </table>
</asp:Content>

