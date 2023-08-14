<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Item.aspx.cs" Inherits="Item" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SOFTLUTION</title>
    </head>
<body bgcolor="#323232">
    <form id="FrmItem" runat="server">
    <div align="center" style="position: absolute; height: 100%; top: 0px; left: 0px; width: 100%">    
        <table style="width: 100%; height: 100%">
            <tr>
                <td align="center" valign="top" width="100%" height="100%">                    
                    <table cellpadding="0" cellspacing="0" ID="TabImag" width="100%">
                        <tr>
                            <td align="center" style="background-color: #000000" bgcolor="Black">
                                <asp:Label ID="LblArti" runat="server" Font-Bold="False" Font-Names="Tahoma" 
                                    Font-Size="9pt" ForeColor="White" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" 
                                style="border-style: solid none solid none; border-width: 1px; border-color: #FFFFFF" 
                                bgcolor="#3C3C3C" valign="top">
                                <asp:Label ID="LblNomb" runat="server" Font-Names="Arial" Font-Size="8pt" ForeColor="White" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" 
                                style="border-style: none none solid none; border-width: 1px; border-color: #FFFFFF" 
                                bgcolor="Black" valign="top">
                                <asp:Label ID="LblPric" runat="server" Font-Names="Courier New" Font-Size="9pt" 
                                    ForeColor="White" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:GridView ID="GrdDato" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="3" Font-Bold="False" 
                                    Font-Names="Courier New" Font-Size="8pt" GridLines="Horizontal" BackColor="White" 
                                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Width="100%">
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                    <Columns>
                                        <asp:BoundField DataField="area" HeaderText="AREA">
                                            <ControlStyle Font-Bold="True" Font-Names="Arial" Font-Size="8pt" />
                                        <HeaderStyle Font-Bold="True" Font-Names="Arial" Font-Size="8pt" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="exis" HeaderText="STOCK">
                                            <ControlStyle Font-Bold="True" Font-Names="Arial" Font-Size="8pt" />
                                        <HeaderStyle Font-Bold="True" Font-Names="Arial" Font-Size="8pt" />
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="etec" HeaderText="ETEC" Visible="False" />
                                    </Columns>
                                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" 
                                        Font-Names="Arial" Font-Size="8pt" />
                                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td height="5px" bgcolor="#3C3C3C">
                            </td>
                        </tr>
                        <tr>
                            <td height="100%" valign="middle" align="left">
                                <asp:Label ID="TxtEtec" runat="server" Font-Names="Courier New" Font-Size="9pt" 
                                    ForeColor="#003366" Width="100%" BackColor="White" BorderStyle="None"></asp:Label>
                            </td>
                        </tr>                        
                    </table>                    
                 </td>
                <td align="center" valign="middle">
                    <asp:Image ID="Imag" runat="server" Height="400px" Width="400px" />                    
                </td>
            </tr>
        </table>    
    </div>
    </form>
</body>
</html>
