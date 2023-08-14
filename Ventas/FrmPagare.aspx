<%@ Page Title="" Language="C#" MasterPageFile="~/PlantillaVentas.master" AutoEventWireup="true" CodeFile="FrmPagare.aspx.cs" Inherits="Ventas_FrmPagare" %>





<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <asp:UpdatePanel ID="upnlFil" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlFil" runat="server" style="padding:5px; text-align:left">
                <table style="width:25%"><tr><%--<td>--%>
                <asp:Label ID="lblTipo" runat="server" Text="Tipo Movimiento:" CssClass="auto-style1;" style="display:none"></asp:Label><%--</td><td>--%>
                <asp:TextBox runat="server" ID="txtTipo" Text="" Width="50px"  style="display:none"></asp:TextBox><%--</td>--%><td>
                <asp:Label ID="lblNumFact" runat="server" Text="Número Factura:" CssClass="auto-style1" style="display:none"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="Fecha" CssClass="auto-style1"></asp:Label></td>
                        <td>
                        <asp:TextBox ID="txtNumFac" runat="server" Text="" Width="100px" style="display:none"></asp:TextBox>
                            <ig:WebDatePicker ID="wdpFecr" runat="server" Width="200px">
                            </ig:WebDatePicker>
                    </td><td>
                <asp:Button runat="server" Text="Buscar" CssClass="btn btn-primary btn-xs" OnClick="btnBusca_Click" ID="btnBusca" OnLoad="btnBusca_Click"/></td></tr></table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upnlFacturas" runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" ID="pnlFacturas">
                <ig:WebDataGrid ID="wdgFacturas" runat="server" Height="350px" Width="100%" CssClass="Changefont" AutoGenerateColumns="False" EnableDataViewState="True" Font-Names="Courier New" Font-Size="8pt">
                    <Columns>
                        <ig:TemplateDataField Key="Pagare" Width="190px">
                            <ItemTemplate>
                                <asp:Button ID="lnkPag" runat="server" OnClientClick="Pagare()" Text="PAGARÉ & CRONOGRAMA" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" ></asp:Button>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <%--<ig:TemplateDataField Key="Cronograma" Width="120px">
                            <ItemTemplate>
                                <asp:Button ID="lnkCron" runat="server" OnClientClick="Cronograma()" Text="CRONOGRAMA" ></asp:Button>
                            </ItemTemplate>
                        </ig:TemplateDataField>--%>
                        <ig:BoundDataField DataFieldName="ARE_NOMB" Key="ARE_NOMB"  Width="250px" Hidden="True">
                            <Header Text="BODEGA">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="DOCREF" Key="DOCREF" CssClass="AlignCenter">
                            <Header Text="DOCUMENTO">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="DOCFEC" Key="DOCFEC">
                            <Header Text="FECHA">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CLIRFI" Key="CLIRFI">
                            <Header Text="IDENTIFICACIÓN">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CLICVE" Key="CLICVE" Hidden="true">
                            <Header Text="COD. CLIENTE">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CLINOM" Key="CLINOM"  Width="300px">
                            <Header Text="CLIENTE">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="DOCTIF" Key="DOCTIF" CssClass="AlignRight">
                            <Header Text="VALOR">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CPACVE" Key="CPACVE" Hidden="true">
                            <Header Text="COD. FOR. PAGO">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CPADES" Key="CPADES">
                            <Header Text="FORMA DE PAGO">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ENTE" Key="ENTE" Hidden="true">
                            <Header Text="ENTE">
                            </Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="RESI" Key="RESI" Hidden="true">
                            <Header Text="RESI">
                            </Header>
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Selection CellClickAction="Row" RowSelectType="Single">
                        </ig:Selection>
                    </Behaviors>
                </ig:WebDataGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function wdg_RowSelectorClicked(sender, eventArgs) {
        }
        function Pagare() {
            var grid = $find('<%= wdgFacturas.ClientID %>');
            var gridRows = grid.get_rows();
            var rows = grid.get_behaviors().get_selection().get_selectedRows();
            var selectedRow = rows.getItem(0);
            var clicve = selectedRow.get_cellByColumnKey("CLICVE").get_value();
            var docref = selectedRow.get_cellByColumnKey("DOCREF").get_value();

            window.open("FrmDocumentos.aspx?c=" + clicve + "&f=" + docref + "&d=0" ,"_blank", "location=no, menubar=no, status=no, toolbar=no, fullscreen=true, scroollbars=true");
        }

        function Cronograma() {
            var grid = $find('<%= wdgFacturas.ClientID %>');
            var gridRows = grid.get_rows();
            var rows = grid.get_behaviors().get_selection().get_selectedRows();
            var selectedRow = rows.getItem(0);
            var clicve = selectedRow.get_cellByColumnKey("CLICVE").get_value();
            var docref = selectedRow.get_cellByColumnKey("DOCREF").get_value();
            window.open("FrmDocumentos.aspx?c=" + clicve + "&f=" + docref + "&d=1", "_blank", "location=no, menubar=no, status=no, toolbar=no, fullscreen=true, scrollbars=true");
        }
    </script>
</asp:Content>

