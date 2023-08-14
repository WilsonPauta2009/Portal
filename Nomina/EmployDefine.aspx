<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="EmployDefine.aspx.cs" Inherits="EmployDefine" Title="EMPLEADOS: Definir..." %>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" width="100%" frame="void">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="11pt" ForeColor="#99CCFF" Text="Empleados: DEFINIR"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table id="TabAbar" border="0" cellpadding="0" cellspacing="10" width="100%" frame="border">
                    <tr>
                        <td style="background-color: #3C3C3C">
                            <asp:Label ID="LblTit1" runat="server" Font-Bold="True" Font-Names="Tahoma"
                                Font-Size="10pt" ForeColor="White" Text="Seleccionar Empleado :"></asp:Label></td>
                        <td style="background-color: #3C3C3C">
                            <asp:Label ID="LblTit2" runat="server" Font-Bold="True" Font-Names="Tahoma"
                                Font-Size="10pt" ForeColor="White" Text="Ubicación en el Organigrama :"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <asp:Panel ID="PnlEmpl" runat="server" DefaultButton="BtnFilt">
                                <table id="TabDato" border="0" cellpadding="0" cellspacing="2" bgcolor="White">
                                    <tr>
                                        <th align="right" valign="middle" style="background-color: black">
                                            <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                Text="Identificación :" ForeColor="Cyan"></asp:Label></th>
                                        <th align="left" valign="middle">
                                            <asp:TextBox ID="TxtIden" runat="server" Columns="13" Font-Names="Arial" Font-Size="8pt"
                                                MaxLength="13" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                TabIndex="1" BorderStyle="Inset" BorderWidth="1px" Width="105px"></asp:TextBox>
                                            <asp:Button ID="BtnFilt" runat="server" CausesValidation="False" Font-Bold="True"
                                                Font-Names="Arial" Font-Size="8pt" TabIndex="3" Text="Filtrar..." OnClick="BtnFilt_Click" /></th>
                                    </tr>
                                    <tr>
                                        <th align="right" valign="middle" style="background-color: black">
                                            <asp:Label ID="LblNomb" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                Text="Empleado :" ForeColor="Cyan"></asp:Label></th>
                                        <th align="left" valign="middle">
                                            <asp:TextBox ID="Tint_inte" runat="server" Columns="40" Font-Names="Arial" Font-Size="8pt"
                                                MaxLength="70" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                TabIndex="2" BorderStyle="Inset" BorderWidth="1px" ReadOnly="True"></asp:TextBox>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th align="right" valign="top" style="height: 16px">
                                            <asp:Label ID="LblOrga" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                Text="Organigrama :"></asp:Label></th>
                                        <th align="left" valign="middle" style="height: 16px">
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
                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                Text="Reloj :"></asp:Label></th>
                                        <th align="left">
                                            <asp:TextBox ID="TxtRelo" runat="server" Columns="5" Font-Names="Arial" Font-Size="8pt"
                                                MaxLength="5" onblur="this.style.background='white'" onfocus="this.style.background='#ffffcc'"
                                                TabIndex="4" BorderStyle="Inset" BorderWidth="1px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RfvRelo" runat="server" ControlToValidate="TxtRelo"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CmpRelo" runat="server" ControlToValidate="TxtRelo" ErrorMessage="x"
                                                Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator></th>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                        <td align="left" valign="top">
                            <ig:WebDataTree ID="UwtOrga" runat="server" defaultimage="ig_treeFolder.gif"
                                defaultselectedimage="ig_treeFolderOpen.gif" fileurl="" Font-Bold="True" Font-Names="Arial Narrow"
                                Font-Size="8pt" hoverclass="" indentation="20" onnodeclicked="UwtOrga_NodeClicked"
                                targetframe="" targeturl="" Width="100%" TabIndex="4"
                                OnNodeClick="UwtOrga_NodeClick" SelectionType="Single"
                                StyleSetName="RedPlanet">
                                <AutoPostBackFlags NodeClick="On" />
                            </ig:WebDataTree>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="background-color: #3C3C3C">
                            <asp:Label ID="LblTit3" runat="server" Font-Bold="True" Font-Names="Tahoma"
                                Font-Size="10pt" ForeColor="#99CCFF" Text="Asignar Horario :"></asp:Label>
                        </td>
                        <td align="center" style="background-color: #3C3C3C">
                            <asp:Label ID="LblTit4" runat="server" Font-Bold="True" Font-Names="Tahoma"
                                Font-Size="10pt" ForeColor="#99CCFF" Text="Tipo de Empleado :"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table id="TabHora" border="0" cellpadding="0" cellspacing="2" bgcolor="White">
                                <tr>
                                    <th align="right" valign="middle">
                                        <asp:Label ID="LblHora" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                            Text="Horario :"></asp:Label></th>
                                    <th align="left" valign="middle">
                                        <asp:DropDownList ID="DdlHora" runat="server" Font-Bold="True" Font-Names="Arial"
                                            Font-Size="8pt" Width="160px" AutoPostBack="True" OnSelectedIndexChanged="DdlHora_SelectedIndexChanged" TabIndex="5" BackColor="WhiteSmoke">
                                        </asp:DropDownList></th>
                                </tr>
                                <tr>
                                    <th align="right" valign="middle">
                                        <asp:Label ID="LblEnMa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                            Text="Entrada #1 :"></asp:Label></th>
                                    <th align="left" valign="middle">
                                        <asp:Label ID="Lhor_enma" runat="server" Font-Bold="False" Font-Names="Courier New"
                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                </tr>
                                <tr>
                                    <th align="right" valign="top">
                                        <asp:Label ID="LblSaMa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                            Text="Salida #1 :"></asp:Label></th>
                                    <th align="left" valign="middle">
                                        <asp:Label ID="Lhor_sama" runat="server" Font-Bold="False" Font-Names="Courier New"
                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                </tr>
                                <tr>
                                    <th align="right" valign="middle">
                                        <asp:Label ID="LblEnTa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                            Text="Entrada #2 :"></asp:Label></th>
                                    <th align="left" valign="middle">
                                        <asp:Label ID="Lhor_enta" runat="server" Font-Bold="False" Font-Names="Courier New"
                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                </tr>
                                <tr>
                                    <th align="right" valign="top">
                                        <asp:Label ID="LblSaTa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                            Text="Salida #2 :"></asp:Label></th>
                                    <th align="left" valign="middle">
                                        <asp:Label ID="Lhor_sata" runat="server" Font-Bold="False" Font-Names="Courier New"
                                            Font-Size="8pt" ForeColor="Navy"></asp:Label></th>
                                </tr>
                            </table>
                        </td>
                        <td align="center" valign="top">
                            <table id="TabTipoEmpl" border="0" cellpadding="0" cellspacing="2" bgcolor="White">
                                <tr>
                                    <th align="right" valign="middle" style="height: 21px">
                                        <asp:Label ID="LblTipo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                            Text="Tipo :"></asp:Label></th>
                                    <th align="left" valign="middle" style="height: 21px">
                                        <asp:DropDownList ID="DdlTipo" runat="server" Font-Bold="True" Font-Names="Arial"
                                            Font-Size="8pt" Width="160px" AutoPostBack="True" OnSelectedIndexChanged="DdlTipo_SelectedIndexChanged" TabIndex="6" BackColor="WhiteSmoke">
                                        </asp:DropDownList></th>
                                </tr>
                                <tr>
                                    <th align="right" valign="top">
                                        <asp:Label ID="LblObse" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                            Text="Observaciones :"></asp:Label>
                                    </th>
                                    <th align="left" valign="middle">
                                        <asp:Label ID="Lemp_tip_obse" runat="server" Font-Bold="False" Font-Names="Courier New"
                                            Font-Size="8pt" Width="169px" Height="52px"></asp:Label>
                                    </th>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="White">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; border-top-style: ridge; border-bottom-style: ridge; border-bottom-width: 1px; border-top-width: 1px;">
                    <tr>
                        <td align="center">
                            <asp:Button ID="BtnProc" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                OnClick="BtnProc_Click" TabIndex="4" Text="REGISTRAR" Enabled="False" />
                        </td>
                        <td align="center">
                            <asp:Button ID="BtnActu" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                TabIndex="5" Text="ACTUALIZAR" OnClick="BtnActu_Click" Enabled="False" />
                        </td>
                        <td align="center">
                            <asp:Button ID="BtnList" runat="server" CausesValidation="False" Font-Bold="True"
                                Font-Names="Arial" Font-Size="8pt" OnClick="BtnList_Click" TabIndex="6" Text="Visualizar" />
                        </td>
                        <td align="center">
                            <asp:Button ID="BtnCerr" runat="server" CausesValidation="False" Font-Bold="True"
                                Font-Names="Arial" Font-Size="8pt" OnClick="BtnCerr_Click" TabIndex="7" Text="Cerrar" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                    ForeColor="DarkRed"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <asp:GridView ID="GrdMisc" runat="server" AutoGenerateSelectButton="True" CellPadding="4"
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
                <asp:GridView ID="GrdTemp" runat="server" CellPadding="4"
                    Font-Names="Arial" Font-Size="8pt" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GrdMisc_SelectedIndexChanged" Visible="False">
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

