<%@ Page Title="PARAMETROS SELECCIONADOS" Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="FrmParameterSelected.aspx.cs" Inherits="FrmParameterSelected" %>


<script runat="server">
    ClsRolDePagos RoPa = new ClsRolDePagos();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RoPa.ObtenerRolMainActive(TxtIden, TxtFeIn, TxtFeFn, Session["esqu"].ToString());
            RoPa.ObtenerParametrosSeleccionados(DdlPara, Session["esqu"].ToString());
            DdlPara_SelectedIndexChanged(null, null);
        }
    }

    protected void DdlPara_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Page.IsPostBack) ((System.Data.DataTable)Session["rgpa"]).Clear();
        Session["rgpa"] = RoPa.MostrarParametrosEmpleados(Session["esqu"].ToString(), long.Parse(TxtIden.Text), int.Parse(DdlPara.SelectedValue));
        grdData.DataSource = (System.Data.DataTable)Session["rgpa"];
        grdData.DataBind();
        BtnSuma_Click(null, null);
    }

    public void BtnSuma_Click(object sender, ImageClickEventArgs e)
    {
        double dSuma = 0;
        for (int r = 0; r < grdData.Rows.Count; r++) dSuma += double.Parse(((TextBox)grdData.Rows[r].Cells[2].FindControl("VALO_")).Text);

        LblSuma.Text = string.Format("{0:#,#0.00}", dSuma);
    }

    protected void BtnProc_Click(object sender, ImageClickEventArgs e)
    {
        RoPa.jsAlert(this, "Registro de VALORES a PARAMETROS", RoPa.ProcesarParametrosEmpleados(grdData, Session["esqu"].ToString(), Session["iden"].ToString(), long.Parse(TxtIden.Text), 0.00, "", Session["iden"].ToString(), int.Parse(DdlPara.SelectedValue)));
    }

    protected void BtnCerr_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("First.aspx", false);
    }

    protected void grdData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdData.EditIndex = -1;
        grdData.DataSource = (System.Data.DataTable)Session["rgpa"];
        grdData.DataBind();
    }

    protected void grdData_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdData.EditIndex = e.NewEditIndex;
        grdData.DataSource = (System.Data.DataTable)Session["rgpa"];
        grdData.DataBind();
    }

    protected void grdData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ((System.Data.DataTable)Session["rgpa"]).Rows[e.RowIndex][2] = double.Parse(((TextBox)grdData.Rows[e.RowIndex].Cells[2].FindControl("VALO")).Text);
        ((System.Data.DataTable)Session["rgpa"]).Rows[e.RowIndex][3] = ((TextBox)grdData.Rows[e.RowIndex].Cells[3].FindControl("ESPE")).Text;

        grdData.DataSource = (System.Data.DataTable)Session["rgpa"];
        grdData.EditIndex = -1;
        grdData.DataBind();
        BtnSuma_Click(null, null);
    }
</script>

<asp:Content ID="Content" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <table id="TabCont" border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="White">
        <tr>
            <td align="center" bgcolor="#3C3C3C">
                <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                    Font-Size="11pt" ForeColor="#99CCFF"
                    Text="Rol de Pagos: REGISTRO DE PARAMETROS"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle" height="7px"></td>
        </tr>
        <tr>
            <td align="center" width="100%">
                <asp:Panel ID="PnlEmpl" runat="server">
                    <table cellpadding="5" id="TabHead">
                        <tr>
                            <td valign="top" align="center" width="40%">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <table style="border: 1px inset #C0C0C0" id="TabSuVa" cellpadding="5" cellspacing="0">
                                                <tr>
                                                    <td align="right" width="30%" valign="middle">
                                                        <asp:ImageButton ID="BtnSuma" runat="server" ImageUrl="./btns/sum.png" OnClick="BtnSuma_Click" ToolTip=":: sumar valores ::" Enabled="False" />
                                                    </td>
                                                    <td align="left" valign="middle">
                                                        <asp:Label ID="LblSuma" runat="server" Text="0.00" Font-Bold="True" Font-Names="Courier New" Font-Size="10pt" Width="90px"></asp:Label>
                                                    </td>
                                                    <td align="center" width="30%">
                                                        <asp:ImageButton ID="BtnProc" runat="server" ImageUrl="./btns/database.png" OnClick="BtnProc_Click" ToolTip=":: procesar información ::" />
                                                    </td>
                                                    <td align="center">
                                                        <asp:ImageButton ID="BtnCerr" runat="server" ImageUrl="./btns/close.png" OnClick="BtnCerr_Click" ToolTip=":: cerrar interfaz ::" CausesValidation="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table id="TabDato" border="0" cellpadding="0" cellspacing="2" bgcolor="WhiteSmoke">
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
                                                <tr>
                                                    <th align="right">
                                                        <asp:Label ID="LblPara" runat="server" Font-Bold="True" Font-Names="Arial"
                                                            Font-Size="8pt" Text="Parametros :"></asp:Label>
                                                    </th>
                                                    <th align="left">
                                                        <asp:DropDownList ID="DdlPara" runat="server" Font-Names="Arial"
                                                            Font-Size="8pt" Width="199px" AutoPostBack="True"
                                                            OnSelectedIndexChanged="DdlPara_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </th>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                            <td valign="top" align="center" width="100%">
                                <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Names="Courier New" Font-Size="9pt" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCancelingEdit="grdData_RowCancelingEdit" OnRowEditing="grdData_RowEditing" OnRowUpdating="grdData_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID">
                                            <EditItemTemplate>
                                                <asp:Label ID="IDEN" runat="server" Text='<%# Eval("IDEN") %>'></asp:Label>
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
                                        <asp:TemplateField HeaderText="Valor">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="VALO" runat="server" Font-Names="Courier New" Font-Size="9pt" MaxLength="7" Text='<%# Bind("VALO") %>' Width="55px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="VALO_" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="55px" Text='<%# Eval("VALO") %>' ReadOnly="True"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Especificación">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="ESPE" runat="server" Font-Names="Courier New" Font-Size="9pt" MaxLength="50" Text='<%# Bind("ESPE") %>' Width="160px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="ESPE_" runat="server" Font-Names="Courier New" Font-Size="9pt" Width="160px" Text='<%# Eval("ESPE") %>' ReadOnly="True"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowEditButton="True" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="LblMens" runat="server"
                    Font-Bold="True" Font-Names="Arial" Font-Size="8pt" ForeColor="DarkRed">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top"></td>
        </tr>
    </table>
</asp:Content>

