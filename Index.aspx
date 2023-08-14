<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellspacing="1" class="auto-style1">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" class="auto-style1">
                            <tr>
                                <td>
                                    <ig:WebDatePicker ID="wdpFeIn" runat="server">
                                    </ig:WebDatePicker>
                                </td>
                                <td>
                                    <ig:WebDatePicker ID="wdpFeFn" runat="server">
                                    </ig:WebDatePicker>
                                </td>
                                <td></td>
                                <td></td>
                                <td style="width: 30%; text-align: right;">
                                    <asp:Button ID="btnFilt" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" Text="FILTRAR" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ig:WebDataGrid ID="wdgData" runat="server" Font-Names="Courier New" Font-Size="8pt" Height="100%" StyleSetName="RedPlanet" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
