<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="Horarios.aspx.cs" Inherits="Horarios" Title="Horarios..." %>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="#99CCFF" Text="HORARIOS"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" width="100%">
                <table cellpadding="5" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="center" valign="top">
                            <asp:GridView ID="GrdHora" runat="server" AutoGenerateSelectButton="True"
                                CellPadding="4" Font-Names="Arial" Font-Size="8pt" ForeColor="Black" GridLines="Vertical"
                                OnSelectedIndexChanged="GrdHora_SelectedIndexChanged" Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
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
                        </td>
                        <td align="center" valign="top">
                            <table id="TabMain" cellpadding="0" cellspacing="0" style="border-right: thin ridge">
                                <tr>
                                    <td valign="top" bgcolor="WhiteSmoke">
                                        <table id="TabDato" border="0" cellpadding="0" cellspacing="2">
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Código :"></asp:Label></th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtIden" runat="server" Columns="2" Font-Names="Arial" Font-Size="8pt"
                                                        MaxLength="2" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="1" BorderStyle="Inset" BorderWidth="1px" Width="30px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RfvCodi" runat="server" ControlToValidate="TxtIden"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CmvCodi" runat="server" ControlToValidate="TxtIden" ErrorMessage="x"
                                                        Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator></th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblNomb" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Horario :"></asp:Label></th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtNomb" runat="server" Columns="30" Font-Names="Arial" Font-Size="8pt"
                                                        MaxLength="30" TabIndex="2" onfocus="this.style.background='#ffffcc'"
                                                        onblur="this.style.background='white'" BorderStyle="Inset" BorderWidth="1px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RfvNomb" runat="server" ControlToValidate="TxtNomb"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator></th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblEnMa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Entrada #1 :"></asp:Label></th>
                                                <th align="left" valign="middle">
                                                    <ig:WebDateTimeEditor ID="WdtEnMa" runat="server" EditModeFormat="t" Font-Names="Arial"
                                                        Font-Size="8pt" Width="40px" TabIndex="3" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" Nullable="False" Fields="2018-8-7-0-0-0-0">
                                                    </ig:WebDateTimeEditor>
                                                    <asp:RequiredFieldValidator ID="RfvEnMa" runat="server" ControlToValidate="WdtEnMa"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator></th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblSaMa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Salida #1 :"></asp:Label></th>
                                                <th align="left" valign="middle">
                                                    <ig:WebDateTimeEditor ID="WdtSaMa" runat="server" EditModeFormat="t" Font-Names="Arial"
                                                        Font-Size="8pt" Width="40px" TabIndex="4" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" Nullable="False">
                                                    </ig:WebDateTimeEditor>
                                                    <asp:RequiredFieldValidator ID="RfvEnTa" runat="server" ControlToValidate="WdtSaMa"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator></th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle" style="height: 22px">
                                                    <asp:Label ID="LblEnTa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Entrada #2 :"></asp:Label></th>
                                                <th align="left" valign="middle" style="height: 22px">
                                                    <ig:WebDateTimeEditor ID="WdtEnTa" runat="server" EditModeFormat="t" Font-Names="Arial"
                                                        Font-Size="8pt" Width="40px" TabIndex="5" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" Fields="2009-11-29-0-0-0-0" NullText="00:00">
                                                    </ig:WebDateTimeEditor>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle" style="height: 22px">
                                                    <asp:Label ID="LblSaTa" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Salida #2 :"></asp:Label></th>
                                                <th align="left" valign="middle" style="height: 22px">
                                                    <ig:WebDateTimeEditor ID="WdtSaTa" runat="server" EditModeFormat="t" Font-Names="Arial"
                                                        Font-Size="8pt" Width="40px" TabIndex="6" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" Fields="2009-11-29-0-0-0-0" NullText="00:00">
                                                    </ig:WebDateTimeEditor>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblAtra" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Atraso (min) :"></asp:Label></th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtAtra" runat="server" Columns="3" Font-Names="Arial" Font-Size="8pt"
                                                        MaxLength="3" TabIndex="7" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" BorderStyle="Ridge" BorderWidth="1px" Width="25px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RfvAtra" runat="server" ControlToValidate="TxtAtra"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CmvAtra" runat="server" ControlToValidate="TxtAtra" ErrorMessage="x"
                                                        Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator></th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="middle">
                                                    <asp:Label ID="LblFalt" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        Text="Falta (min) :"></asp:Label></th>
                                                <th align="left" valign="middle">
                                                    <asp:TextBox ID="TxtFalt" runat="server" Columns="3" Font-Names="Arial" Font-Size="8pt"
                                                        MaxLength="3" TabIndex="8" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" BorderStyle="Ridge" BorderWidth="1px" Width="25px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RfvFalt" runat="server" ControlToValidate="TxtFalt"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CmvFalt" runat="server" ControlToValidate="TxtFalt" ErrorMessage="x"
                                                        Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator></th>
                                            </tr>
                                        </table>
                                    </td>
                                    <td valign="top" bgcolor="#3C3C3C">
                                        <table id="TabBoto" border="0" cellpadding="0" cellspacing="10">
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnProc" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                                        OnClick="BtnProc_Click" Text="PROCESAR" TabIndex="9" Width="90px" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnList" runat="server" CausesValidation="False" Font-Bold="True"
                                                        Font-Names="Arial" Font-Size="8pt" OnClick="BtnList_Click" Text="Visualizar" TabIndex="10" Width="90px" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnCerr" runat="server" CausesValidation="False" Font-Bold="True"
                                                        Font-Names="Arial" Font-Size="8pt" OnClick="BtnCerr_Click" Text="Cerrar" TabIndex="11" Width="90px" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center"
                style="border-top-style: ridge; border-bottom-style: none; border-top-width: 1px; border-bottom-width: 1px">
                <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                    ForeColor="DarkRed"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" valign="top"></td>
        </tr>
    </table>
</asp:Content>

