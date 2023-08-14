<%@ Page Title="DIAS TRABAJADOS" Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="FrmDiasWorking.aspx.cs" Inherits="FrmDiasWorking" %>


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
                    Text="REGISTRO de Días Trabajados"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" width="100%">
                <table>
                    <tr>
                        <td valign="top" align="center">
                            <asp:GridView ID="grdDias" runat="server" AutoGenerateColumns="False" CellPadding="3" Font-Names="Courier New" Font-Size="9pt" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowEditing="grdDias_RowEditing" OnRowCancelingEdit="grdDias_RowCancelingEdit" Height="179px" OnRowUpdating="grdDias_RowUpdating">
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
                                    <asp:TemplateField HeaderText="Días Trabajados">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="DITR" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="30px" Text='<%# Bind("DITR") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="DITR_" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="30px" Text='<%# Eval("DITR") %>'></asp:TextBox>
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
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
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
