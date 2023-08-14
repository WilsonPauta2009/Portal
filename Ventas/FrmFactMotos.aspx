<%@ Page Title="" Language="C#" MasterPageFile="~/PlantillaVentas.master" AutoEventWireup="true" CodeFile="FrmFactMotos.aspx.cs" Inherits="Ventas_FrmFactMotos" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <asp:UpdatePanel ID="upnlMenu" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlMenu" runat="server" style="text-align:left" Width="100%">
                <table  style="text-align:left">
                    <tr>
                        <td style="width: 240px" >
                            <asp:Label ID="lblObse" runat="server" Text="OBSERVACIONES" CssClass="labeltitle" Width="200px"></asp:Label>
                            <br />
                            <asp:TextBox runat="server" ID="txtObse" Width="200"></asp:TextBox>
                        </td>
                        <td style="width: 240px; text-align:left">
                            
                            <asp:Label ID="lblTipo" runat="server" CssClass="labeltitle" Text="TIPO DOCUMENTO" Width="200px"></asp:Label>
                            <br />
                            <ig:WebDropDown ID="wdpTipo" runat="server" CssClass="igdd_ValueDisplay" Width="200px">
                                <Items>
                                    <ig:DropDownItem Selected="True" Text="FACTURA" Value="FA">
                                    </ig:DropDownItem>
                                    <ig:DropDownItem Selected="False" Text="NOTA DE CREDITO" Value="NC">
                                    </ig:DropDownItem>
                                </Items>
                            </ig:WebDropDown>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblFein" runat="server" Text="FECHA INICIAL" CssClass="labeltitle" Width="200px"></asp:Label>
                            <br />
                            <ig:WebDatePicker ID="WdtFeIn" runat="server" CssClass="igdd_ValueDisplay" Width="200px">
                            </ig:WebDatePicker>
                        </td>
                        <td>
                            <asp:Label ID="lblFefn" runat="server" Text="FECHA FINAL" CssClass="labeltitle" Width="200px"></asp:Label>
                            <br />
                            <ig:WebDatePicker ID="WdtFeFn" runat="server" CssClass="igdd_ValueDisplay" Width="200px">
                            </ig:WebDatePicker>
                        </td>
                        <td><asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" /></td>
                    </tr>
                </table>
                <div>
                    <asp:GridView ID="wdgFaturas" runat="server" Width="100%" EnableDataViewState="True" AutoGenerateColumns="False" EnableAjax="true" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" PageSize="50" OnRowCommand="wdgFaturas_RowCommand">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>                        
                            <asp:BoundField DataField="are_esqu" Visible="true" ItemStyle-Width="50px" >
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="are_nomb" ItemStyle-Width="200px" HeaderText="Agencia">
                            <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mov_cab_tipo" ItemStyle-Width="50px" HeaderText="Tipo">
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DOCU" ItemStyle-Width="160px" HeaderText="Factura">
                            <ItemStyle Width="160px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mov_cab_stat" ItemStyle-Width="55px" HeaderText="Estado">
                            <ItemStyle Width="55px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mov_cab_obse" HeaderText="Observaciones">
                            </asp:BoundField>
                            <asp:BoundField DataField="mov_cab_nume" HeaderText="FACT" Visible="true">
                            </asp:BoundField>
                            <asp:BoundField DataField="are_iden" Visible="true" HeaderText="AREA">
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="XML">
                                <ItemTemplate>
                                    <asp:ImageButton CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="XML" ID="btnXml" runat="server" OnClick="btnXml_Click" ImageUrl="~/Ventas/imgs/xml.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PDF">
                                <ItemTemplate>
                                    <asp:ImageButton CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="PDF" ID="btnPdf" runat="server" OnClick="btnPdf_Click" ImageUrl="~/Ventas/imgs/pdf.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </div>
            </asp:Panel>
            <asp:Button runat="server" ID="btnX" Text="Prueba" OnClick="btnX_Click" style="display:none" />
            <asp:Button runat="server" ID="btnP" Text="Prueba" OnClick="btnP_Click" style="display:none" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <script type="text/javascript" src="../Jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../Jquery/noty/packaged/jquery.noty.packaged.min.js"></script>
    <script type="text/javascript">
        function DescargaDocumento(tipo) {
            if (tipo == "xml") {
                var clickButton = document.getElementById("<%= btnX.ClientID %>");
                clickButton.click();
            } else {
                var clickButton = document.getElementById("<%= btnP.ClientID %>");
                clickButton.click();
            }
            return true;
        }

        function generate(type, msg) {
            var n = noty({
                text: msg,
                type: type,
                dismissQueue: true,
                maxVisible: 5
            });
            n.setTimeout(4000);
        }
    </script>

</asp:Content>