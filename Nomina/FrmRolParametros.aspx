<%@ Page Title="Rol de Pagos: PARAMETROS" Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="FrmRolParametros.aspx.cs" Inherits="FrmRolParametros" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" frame="below" width="100%">
        <tr>
            <td align="center" style="background-color: #3c3c3c">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="#99CCFF" Text="Rol de Pagos: PARAMETROS"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <table width="100%" cellpadding="5">
                    <tr>
                        <td valign="top" align="center">
                            <table id="TabMain" border="0" cellpadding="0" cellspacing="0"
                                style="border-right: thin ridge">
                                <tr>
                                    <td valign="top">
                                        <table id="TabDato" border="0" cellpadding="0" cellspacing="2" bgcolor="White">
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Código :"></asp:Label>
                                                </th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtIden" runat="server" Columns="3" Font-Names="Courier New" Font-Size="8pt"
                                                        MaxLength="3" onfocus="this.style.background='#ffffcc'"
                                                        onblur="this.style.background='white'" TabIndex="1" BorderStyle="Inset" BorderWidth="1px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RfvCodi" runat="server" ControlToValidate="TxtIden"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CmvCodi" runat="server" ControlToValidate="TxtIden" ErrorMessage="x"
                                                        Operator="DataTypeCheck" Type="Integer" ValueToCompare="0"
                                                        Font-Names="Arial" Font-Size="8pt"></asp:CompareValidator>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblNomb" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Parametro :"></asp:Label>
                                                </th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtNomb" runat="server" Columns="30" Font-Names="Courier New" Font-Size="8pt"
                                                        MaxLength="30" TabIndex="2" onfocus="this.style.background='#ffffcc'"
                                                        onblur="this.style.background='white'" BorderStyle="Inset" BorderWidth="1px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RfvNomb" runat="server" ControlToValidate="TxtNomb"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblEnMa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Valor ($) :"></asp:Label>
                                                </th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtValo" runat="server" Columns="8" Font-Names="Courier New" Font-Size="8pt"
                                                        MaxLength="8" TabIndex="3" onfocus="this.style.background='#ffffcc'"
                                                        onblur="this.style.background='white'" Width="62px" BorderStyle="Inset" BorderWidth="1px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RfvValo" runat="server" ControlToValidate="TxtValo"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CmvValo" runat="server"
                                                        ErrorMessage="x" Font-Names="Arial" Operator="DataTypeCheck"
                                                        SetFocusOnError="True" Type="Double" Font-Size="8pt"
                                                        ControlToValidate="TxtValo"></asp:CompareValidator>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblSaMa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Calcular por :"></asp:Label>
                                                </th>
                                                <th align="left" valign="middle">
                                                    <asp:DropDownList ID="DdlTipo" runat="server" Font-Names="Courier New"
                                                        Font-Size="8pt" TabIndex="9" BackColor="WhiteSmoke">
                                                        <asp:ListItem Value="$">Valor</asp:ListItem>
                                                        <asp:ListItem Value="%">Porcentaje</asp:ListItem>
                                                    </asp:DropDownList>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblEnTa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Registro :"></asp:Label>
                                                </th>
                                                <th align="left" valign="middle">
                                                    <asp:DropDownList ID="DdlKind" runat="server" Font-Names="Courier New"
                                                        Font-Size="8pt" BackColor="WhiteSmoke">
                                                        <asp:ListItem Value="M">Manual</asp:ListItem>
                                                        <asp:ListItem Value="F">Fijo</asp:ListItem>
                                                        <asp:ListItem Value="C">Calculado</asp:ListItem>
                                                    </asp:DropDownList>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblMovi" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Movimiento :"></asp:Label>
                                                </th>
                                                <th align="left" valign="middle">
                                                    <asp:DropDownList ID="DdlMovi" runat="server" Font-Names="Courier New"
                                                        Font-Size="8pt" BackColor="WhiteSmoke">
                                                        <asp:ListItem Value="I">Ingreso</asp:ListItem>
                                                        <asp:ListItem Value="O">Egreso</asp:ListItem>
                                                    </asp:DropDownList>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblCtas" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Cuenta Contable :"></asp:Label>
                                                </th>
                                                <th align="left" valign="middle">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td valign="middle" align="left">
                                                                <asp:TextBox ID="TxtCtId" runat="server" Columns="30" Font-Names="Courier New" Font-Size="8pt" TabIndex="2" onfocus="this.style.background='#ffffcc'"
                                                                    onblur="this.style.background='white'" BorderStyle="Inset" BorderWidth="1px" Width="100px" ReadOnly="True"></asp:TextBox>
                                                    <asp:Button ID="BtnCtas" runat="server" CausesValidation="False" Font-Bold="True"
                                                        Font-Names="Arial" Font-Size="8pt" OnClick="BtnCtas_Click" Text="..." TabIndex="11" Width="22px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top">
                                                                <asp:Label ID="LblCtNo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" Width="100%" ForeColor="#003366"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </th>
                                            </tr>
                                        </table>
                                    </td>
                                    <td valign="top" bgcolor="#3C3C3C">
                                        <table id="TabBoto" border="0" cellpadding="5" cellspacing="2">
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnProc" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        OnClick="BtnProc_Click" Text="PROCESAR" TabIndex="9" Width="105px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnList" runat="server" CausesValidation="False" Font-Bold="True"
                                                        Font-Names="Arial" Font-Size="8pt" OnClick="BtnList_Click" Text="Visualizar" TabIndex="10" Width="105px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnCerr" runat="server" CausesValidation="False" Font-Bold="True"
                                                        Font-Names="Arial" Font-Size="8pt" OnClick="BtnCerr_Click" Text="Cerrar" TabIndex="11" Width="105px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="center" valign="middle">
                            <asp:GridView ID="GrdRoPa" runat="server" AutoGenerateSelectButton="True"
                                CellPadding="4" Font-Names="Arial" Font-Size="8pt" ForeColor="Black" GridLines="Horizontal"
                                OnSelectedIndexChanged="GrdRoPa_SelectedIndexChanged" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td align="center"
                style="border-top-style: ridge; border-bottom-style: none; border-top-width: 1px; border-bottom-width: 0px">
                <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                    ForeColor="DarkRed"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top"></td>
        </tr>
    </table>
</asp:Content>

