<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reparaciones.aspx.cs" Inherits="KSystem_Reparaciones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>REPARACIONES: ERP SoftLution</title>
</head>
<body style="background-color:Black">
    <form id="FrmRepa" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="width: 100%" id="Tab01">
            <tr>
                <td align="center">
                    <asp:Image ID="ImgHead" runat="server" ImageUrl="../Imgs/MasterHead.jpg" /></td>
            </tr>
            <tr>
                <td align="center">
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="GrdRepa" runat="server" AllowPaging="True"
                        Caption="REPARACIONES" CellPadding="2" Font-Names="Courier New" Font-Size="8pt" GridLines="Horizontal" OnPageIndexChanging="GrdRepa_PageIndexChanging" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0px" PageSize="25">
                        <PagerSettings PageButtonCount="20" Position="TopAndBottom" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
