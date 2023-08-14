<%@ Page Title="Registro de Quejas" Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="QuejasRegistro.aspx.cs" Inherits="Nomina_QuejasRegistro" %>

<asp:Content ID="Content_MAIN" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <table id="TabMAIN" cellpadding="1" class="style1" cellspacing="1">
        <tr>
            <td>
                <table cellpadding="1" cellspacing="1" class="style1">
                    <tr>
                        <td align="center" bgcolor="#99CCFF">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                                Font-Names="Arial Narrow" Font-Size="14pt" 
                                Text="TRATAMIENTO DE QUEJAS Y SUGERENCIAS"></asp:Label>
                        </td>
                        <td align="center" bgcolor="#99CCFF">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                                Font-Names="Arial Narrow" Font-Size="12pt" Text="RG-VEN-00003"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="2" cellspacing="2" class="style1">
                    <tr>
                        <td width="50%">
                            <table cellpadding="0" cellspacing="0" class="style1">
                                <tr>
                                    <td align="left" bgcolor="#E4E4E4">
                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" 
                                            Font-Size="10pt" ForeColor="#000099" 
                                            Text="DATOS :"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <table cellspacing="1" class="style1">
                                            <tr>
                                                <td align="right" bgcolor="#E4E4E4">
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" 
                                                        Font-Size="8pt" Text="FECHA :"></asp:Label>
                                                </td>
                                                <td bgcolor="White" width="70%">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#E4E4E4">
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" 
                                                        Font-Size="8pt" Text="SUCURSAL :"></asp:Label>
                                                </td>
                                                <td bgcolor="White">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#E4E4E4">
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" 
                                                        Font-Size="8pt" Text="CLIENTE :"></asp:Label>
                                                </td>
                                                <td bgcolor="White">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#E4E4E4">
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" 
                                                        Font-Size="8pt" Text="TELEFONO :"></asp:Label>
                                                </td>
                                                <td bgcolor="White">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="center" valign="top">
                            <table cellspacing="1" class="style1" border="0" cellpadding="1">
                                <tr>
                                    <td align="right" bgcolor="#E9E9FC">
                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" 
                                            Font-Size="8pt" Text="ASOCIADO A:"></asp:Label>
                                    </td>
                                    <td align="right" bgcolor="#E9E9FC">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="Producto" TextAlign="Left" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="right" bgcolor="#E9E9FC">
                                        <asp:CheckBox ID="CheckBox2" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="Servicio" TextAlign="Left" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="right" bgcolor="#E9E9FC">
                                        <asp:CheckBox ID="CheckBox3" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="Otro" TextAlign="Left" />
                                    </td>
                                    <td align="left" bgcolor="#E9E9FC">
                                        <asp:TextBox ID="TextBox1" runat="server" Font-Names="Arial" Font-Size="8pt" 
                                            Width="158px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="2" class="style1">
                    <tr>
                        <td align="left" bgcolor="#006699">
                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Arial" 
                                            Font-Size="10pt" ForeColor="#66FFFF" 
                                            Text="DESCRIPCION DE LA QUEJA O RECLAMO :"></asp:Label>
                                    </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Font-Names="Arial" Font-Size="8pt" 
                                Height="41px" TextMode="MultiLine" Width="780px" BackColor="#E9E9E9"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#0099CC">
                            <table cellspacing="1" width="50%" border="0">
                                <tr>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Arial" 
                                            Font-Size="8pt" Text="Gerencia Responsable a gestionar :"></asp:Label>
                                    </td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:CheckBox ID="CheckBox4" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="General" TextAlign="Left" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:CheckBox ID="CheckBox5" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="Administrativa / Financiera" 
                                            TextAlign="Left" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:CheckBox ID="CheckBox6" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="Puntos de Venta" 
                                            TextAlign="Left" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:CheckBox ID="CheckBox7" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="Relojes x Mayor" 
                                            TextAlign="Left" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:CheckBox ID="CheckBox8" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="Joyas x Mayor" 
                                            TextAlign="Left" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:CheckBox ID="CheckBox9" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="Producción" 
                                            TextAlign="Left" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="right" bgcolor="#CCCCCC">
                                        <asp:CheckBox ID="CheckBox10" runat="server" Font-Bold="True" 
                                            Font-Names="Tahoma" Font-Size="8pt" Text="Marketing" 
                                            TextAlign="Left" />
                                    </td>
                                </tr>
                            </table>
                        </td>
        </tr>
        <tr>
            <td align="right">
                <table cellspacing="1" width="50%">
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" BackColor="#66CCFF" Font-Bold="True" 
                                Font-Names="Arial" Font-Size="8pt" ForeColor="Black" Text="REGISTRAR" />
                        </td>
                        <td>
                            <asp:Button ID="Button2" runat="server" BackColor="#66CCFF" Font-Bold="True" 
                                Font-Names="Arial" Font-Size="8pt" ForeColor="Black" Text="CERRAR" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

