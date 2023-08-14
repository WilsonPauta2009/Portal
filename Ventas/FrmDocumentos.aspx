<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FrmDocumentos.aspx.cs" Inherits="Ventas_FrmDocumentos" %>



<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:right">
            <asp:Button ID="btn_close" runat="server" OnClientClick="CloseWindow()" Text="Cerrar" />
        </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="width: 100%; height: 100%">
    <asp:UpdatePanel runat="server" ID="upnlRep">
        <ContentTemplate>
            <asp:Panel runat="server" ID="pnlRep" style="text-align:justify" Height="100%" Width="100%">
                <ig:WebTab ID="wtDocs" runat="server" Height="100%" Width="100%" OnSelectedIndexChanged="wtDocs_SelectedIndexChanged">
                    <AutoPostBackFlags SelectedIndexChanged="On" />
                    <Tabs>
                        <ig:ContentTabItem runat="server" Text="PAGARÉ"><Template>
                            <rsweb:ReportViewer ID="rpvPagare" runat="server" Font-Names="Courier New" Font-Size="9pt" Height="600px"  WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" Font-Strikeout="False">
                                <LocalReport ReportPath="Ventas\InfPagare.rdlc">
                                </LocalReport>
                            </rsweb:ReportViewer></Template>
                        </ig:ContentTabItem>
                        <ig:ContentTabItem runat="server" Text="CRONOGRAMA DE PAGOS"><Template>
                            <rsweb:ReportViewer ID="rpvCronograma" runat="server" Font-Names="Courier New" Font-Size="9pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" Font-Strikeout="False">
                                <LocalReport ReportPath="Ventas\InfCronPagos.rdlc">
                                </LocalReport>
                            </rsweb:ReportViewer></Template>
                        </ig:ContentTabItem>
                    </Tabs>
                </ig:WebTab>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    </form>

    
    <script type="text/javascript">
        function CloseWindow() {
            window.close();
        }
    </script>
</body>
</html>
