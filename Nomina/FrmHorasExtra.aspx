<%@ Page Title="HORAS EXTRA" Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="FrmHorasExtra.aspx.cs" Inherits="FrmHorasExtra" %>


<script runat="server">
    ClsRolDePagos RoPa = new ClsRolDePagos();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RoPa.ObtenerRolMainActive(TxtIden, TxtFeIn, TxtFeFn, Session["esqu"].ToString());
            Session["hoex"] = RoPa.RecoveryHorasExtra(Session["esqu"].ToString(), long.Parse(TxtIden.Text));
            grdHoEx.DataSource = (System.Data.DataTable)Session["hoex"];
            grdHoEx.DataBind();
            /*
            for (int f = 0; f < grdHoEx.Rows.Count; f++)
            {
                ((WebNumericEditor)grdHoEx.Rows[f].Cells[2].FindControl("VAHS")).Value = double.Parse(Tapa.Rows[f]["VAHS"].ToString());
                ((WebNumericEditor)grdHoEx.Rows[f].Cells[3].FindControl("VAHE")).Value = double.Parse(Tapa.Rows[f]["VAHE"].ToString());
                ((WebNumericEditor)grdHoEx.Rows[f].Cells[4].FindControl("VAHN")).Value = double.Parse(Tapa.Rows[f]["VAHN"].ToString());
            }
            */
        }
    }
</script>

<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="#99CCFF" Text="Registro de HORAS EXTRA"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table>
                    <tr>
                        <td align="center" valign="top">
                            <asp:GridView ID="grdHoEx" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Names="Courier New" Font-Size="9pt" ForeColor="Black" GridLines="Vertical" OnRowCancelingEdit="grdHoEx_RowCancelingEdit" OnRowEditing="grdHoEx_RowEditing" OnRowUpdating="grdHoEx_RowUpdating">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="ID">
                                        <EditItemTemplate>
                                            <asp:Label ID="IDEN" runat="server" Text='<%# Bind("IDEN") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="IDEN_" runat="server" Text='<%# Eval("IDEN") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EMPLEADO(a)">
                                        <EditItemTemplate>
                                            <asp:Label ID="EMPL" runat="server" Text='<%# Eval("EMPL") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="EMPL_" runat="server" Text='<%# Eval("EMPL") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="H. Suplementaria">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="VAHS" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="35px" Text='<%# Bind("VAHS") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="VAHS_" runat="server" Font-Names="Courier New" Font-Size="9pt" ReadOnly="True" Width="35px" Text='<%# Eval("VAHS") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="H. Extraordinaria">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="VAHE" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="35px" Text='<%# Bind("VAHE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="VAHE_" runat="server" Font-Names="Courier New" Font-Size="9pt" ReadOnly="True" Width="35px" Text='<%# Eval("VAHE") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="H. Nocturna">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="VAHN" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="35px" Text='<%# Bind("VAHN") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="VAHN_" runat="server" Font-Names="Courier New" Font-Size="9pt" ReadOnly="True" Width="35px" Text='<%# Eval("VAHN") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Básico">
                                        <ItemTemplate>
                                            <ig:WebNumericEditor ID="BASI" runat="server" Font-Names="Courier New" Font-Size="9pt" ReadOnly="True" Width="50px" Value='<%# Bind("BASI") %>'>
                                            </ig:WebNumericEditor>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cálculo">
                                        <ItemTemplate>
                                            <ig:WebNumericEditor ID="CALC" runat="server" Font-Names="Courier New" Font-Size="9pt" ReadOnly="True" Width="50px" Value='<%# Bind("CALC") %>'>
                                            </ig:WebNumericEditor>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="True" />
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
                        <td align="center" valign="top">
                            <asp:Panel ID="PnlEmpl" runat="server">
                                <table cellpadding="5" id="TabHead" bgcolor="White" width="270px">
                                    <tr>
                                        <td valign="top">
                                            <table id="TabDato" border="0" cellpadding="0" cellspacing="2">
                                                <tr>
                                                    <th align="right" valign="top">
                                                        <asp:Label ID="LblIden" runat="server" Font-Bold="True" Font-Names="Arial"
                                                            Font-Size="8pt" Text="Identificacion :"></asp:Label>
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
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="LblMens" runat="server"
                    Font-Bold="True" Font-Names="Arial"
                    Font-Size="8pt"
                    ForeColor="DarkRed"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top"></td>
        </tr>
    </table>
</asp:Content>
