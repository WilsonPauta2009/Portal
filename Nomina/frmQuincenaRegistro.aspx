<%@ Page Title="QUINCENA" Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="frmQuincenaRegistro.aspx.cs" Inherits="frmQuincenaRegistro" %>


<script runat="server">
    /*protected void WibCerr_Click(object sender, ButtonEventArgs e)
    {
        Server.Transfer ("First.aspx", false);
    }*/
</script>

<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="#99CCFF"
                    Text="QUINCENA"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" width="100%">
                <table>
                    <tr>
                        <td valign="top" align="center">
                            <asp:GridView ID="grdDias" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Names="Courier New" Font-Size="9pt" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" OnRowEditing="grdDias_RowEditing" OnRowCancelingEdit="grdDias_RowCancelingEdit" Height="179px" OnRowUpdating="grdDias_RowUpdating" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="ID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="IDEN" runat="server" Font-Names="Courier New" Font-Size="9pt" Text='<%# Bind("IDEN") %>' ReadOnly="True"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="IDEN_" runat="server" Text='<%# Eval("IDEN") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EMPLEADO(a)">
                                        <EditItemTemplate>
                                            <asp:Label ID="EMPL" runat="server" Text='<%# Bind("EMPL") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="EMPL_" runat="server" Text='<%# Eval("EMPL") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quincena ($)">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="QUIN" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="70px" Text='<%# Bind("QUIN") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="QUIN_" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="70px" Text='<%# Eval("QUIN") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="x Vencer Mes">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="CCME" runat="server" Font-Names="Courier New" Font-Size="9pt" ReadOnly="True" Text='<%# Bind("CCME") %>' Width="70px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="CCME_" runat="server" Font-Names="Courier New" Font-Size="9pt" Text='<%# Eval("CCME") %>' Width="70px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="x Vencer Total">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="CCTO" runat="server" Font-Names="Courier New" Font-Size="9pt" ReadOnly="True" Text='<%# Bind("CCTO") %>' Width="70px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="CCTO_" runat="server" Font-Names="Courier New" Font-Size="9pt" Text='<%# Eval("CCTO") %>' Width="70px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Diferencia">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="DIFE" runat="server" Font-Names="Courier New" Font-Size="9pt" ReadOnly="True" Text='<%# Bind("DIFE") %>' Width="70px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="DIFE_" runat="server" Font-Names="Courier New" Font-Size="9pt" Text='<%# Eval("DIFE") %>' Width="70px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Especificación">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="OBSE" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="130px" Text='<%# Bind("OBSE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="OBSE_" runat="server" Font-Names="Courier New" Font-Size="9pt" ReadOnly="True" Text='<%# Eval("OBSE") %>' Width="130px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="True" CausesValidation="False" InsertVisible="False" />
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
                        <td align="center" valign="top" width="280px">
                            <table cellpadding="4" id="TabHead" bgcolor="WhiteSmoke">
                                <tr>
                                    <td valign="top">
                                        <table id="TabDato" border="0" cellpadding="0" cellspacing="4">
                                            <tr>
                                                <th align="right" valign="top">
                                                    <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial"
                                                        Font-Size="8pt" Text="Identificación :"></asp:Label>
                                                </th>
                                                <th align="left" valign="middle">
                                                    <asp:Label ID="TxtIden" runat="server" Font-Bold="False"
                                                        Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right" valign="top">
                                                    <asp:Label ID="LblFeIn" runat="server" Font-Bold="True" Font-Names="Arial"
                                                        Font-Size="8pt" Text="Fecha Inicial :"></asp:Label>
                                                </th>
                                                <th align="left" style="height: 14px" valign="middle">
                                                    <asp:Label ID="TxtFeIn" runat="server" Font-Bold="False"
                                                        Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th align="right">
                                                    <asp:Label ID="LblFeFn" runat="server" Font-Bold="True" Font-Names="Arial"
                                                        Font-Size="8pt" Text="Fecha Final :"></asp:Label>
                                                </th>
                                                <th align="left">
                                                    <asp:Label ID="TxtFeFn" runat="server" Font-Bold="False"
                                                        Font-Names="Courier New" Font-Size="8pt" ForeColor="Navy"></asp:Label>
                                                </th>
                                            </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                        <table style="width: 100%" id="TabBtns" cellpadding="3">
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnProc" runat="server" Font-Bold="True" Font-Names="Arial"
                                                        Font-Size="8pt" Text="PROCESAR" OnClick="BtnProc_Click" Width="80px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnCerr" runat="server" Font-Bold="True" Font-Names="Arial"
                                                        Font-Size="8pt" Text="Cerrar" OnClick="BtnCerr_Click" Width="80px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="PnlEmpl" runat="server">
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" ForeColor="DarkRed">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top"></td>
        </tr>
    </table>
</asp:Content>
