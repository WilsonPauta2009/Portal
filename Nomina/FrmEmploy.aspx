<%@ Page Language="C#" MasterPageFile="~/PlantillaNomina.master" AutoEventWireup="true" CodeFile="FrmEmploy.aspx.cs" Inherits="FrmEmploy" Title="Empleados..." %>



<asp:Content ID="Cont" ContentPlaceHolderID="ContPlaHol" Runat="Server">
    <table id="TabCont" cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td style="background-color: steelblue">
            <asp:Label ID="LblTitu" runat="server" Font-Bold="True" Font-Names="Arial Narrow"
                Font-Size="11pt" ForeColor="White" Text="Empledos: DATOS"></asp:Label></td>
    </tr>
    <tr>
        <td>
            <asp:Panel ID="PnlMain" runat="server" DefaultButton="BtnFind">
                <table id="Tab00" cellpadding="4" cellspacing="0" border="1">
                    <tr>
                        <td align="right" valign="top"><table id="Tab01" cellpadding="0" cellspacing="1" style="width: 500px">
                    <tr>
                        <td align="right" style="background-color: whitesmoke">
                            <asp:Label ID="Lbl00" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="Tipo de Identificación :"></asp:Label></td>
                        <td align="left" style="width: 350px">
                            <asp:DropDownList ID="DdlIden" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="159px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'">
                                <asp:ListItem Selected="True">CEDULA</asp:ListItem>
                                <asp:ListItem>RUC</asp:ListItem>
                                <asp:ListItem>PASAPORTE</asp:ListItem>
                                <asp:ListItem>[ no identificado ]</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="right" style="background-color: whitesmoke">
                            <asp:Label ID="Lbl02" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="IDENTIFICACION :"></asp:Label></td>
                        <td align="left" style="width: 350px">
                            <asp:TextBox ID="TxtIden" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="115px" CausesValidation="True" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="1" AutoCompleteType="Disabled" Columns="13" MaxLength="13"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RfvIden" runat="server" ControlToValidate="TxtIden"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:Button ID="BtnFind" runat="server" CausesValidation="False" OnClick="BtnFind_Click"
                                Text="..." Font-Bold="True" Font-Names="Arial" Font-Size="10pt" ToolTip="buscar identificación..." />
                    </tr>
                    <tr>
                        <td align="right" style="background-color: whitesmoke">
                            <asp:Label ID="Lbl03" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="APELLIDOS Y NOMBRES :"></asp:Label></td>
                        <td align="left" style="width: 350px">
                            <asp:TextBox ID="Tint_inte" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="320px" CausesValidation="True" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="2" AutoCompleteType="DisplayName" Columns="40" MaxLength="40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RfvApNo" runat="server" ControlToValidate="Tint_inte"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right" style="background-color: whitesmoke">
                            <asp:Label ID="Lbl04" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="PROVINCIA :"></asp:Label></td>
                        <td align="left" style="width: 350px">
                            <asp:DropDownList ID="DdlProv" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="247px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="3">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="background-color: whitesmoke">
                            <asp:Label ID="Lbl06" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="CIUDAD :"></asp:Label></td>
                        <td align="left" style="width: 350px">
                            <asp:TextBox ID="Tint_ciud" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="220px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="4" AutoCompleteType="HomeCity"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RfvCiud" runat="server" ControlToValidate="Tint_ciud"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right" style="background-color: whitesmoke; height: 23px;">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="Fecha de Nacimiento :"></asp:Label></td>
                        <td align="left" style="width: 350px;">
                            <table id="TFeNa" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 75px">
                                        <ig:WebDateTimeEditor ID="WdtFeNa" runat="server" EditModeFormat="MM/dd/yyyy" Font-Names="Courier New" Font-Size="9pt" Width="75px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="5">
                                        </ig:WebDateTimeEditor>
                                    </td>
                                    <td style="width: 10px">
                                        <asp:RequiredFieldValidator ID="RfvFeNa" runat="server" ControlToValidate="WdtFeNa"
                                        ErrorMessage="*" Width="10px"></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="width: 80px" align="center">
                                        <asp:Label ID="ForFeNa" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="8pt"
                                        ForeColor="Navy" Text="MM/DD/AAAA"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="background-color: whitesmoke; height: 23px;">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="Teléfono #1 :"></asp:Label></td>
                        <td align="left" style="width: 350px;">
                            <asp:TextBox ID="Tint_tel1" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="80px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="6" AutoCompleteType="HomePhone" Columns="20" MaxLength="20"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="height: 24px; background-color: whitesmoke">
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="Dirección #1 :"></asp:Label></td>
                        <td align="left" style="width: 350px;">
                            <asp:TextBox ID="Tint_dir1" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="320px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="7" AutoCompleteType="HomeStreetAddress" Columns="70" MaxLength="70"></asp:TextBox>
                    </tr>
                    <tr>
                        <td align="right" style="background-color: whitesmoke">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="Teléfono #2 :"></asp:Label></td>
                        <td align="left" style="width: 350px">
                            <asp:TextBox ID="Tint_tel2" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="80px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="8" AutoCompleteType="Cellular" Columns="20" MaxLength="20"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" style="height: 24px; background-color: whitesmoke">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="Dirección #2 :"></asp:Label></td>
                        <td align="left" style="width: 350px;">
                            <asp:TextBox ID="Tint_dir2" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="320px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="9" AutoCompleteType="Disabled" Columns="70" MaxLength="70"></asp:TextBox>
                    </tr>
                    <tr>
                        <td align="right" style="height: 24px; background-color: whitesmoke">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="Correo :"></asp:Label></td>
                        <td align="left" style="width: 350px;">
                            <asp:TextBox ID="Tint_mail" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Width="220px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="10" AutoCompleteType="Email" Columns="50" MaxLength="50"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RevMail" runat="server" ControlToValidate="Tint_mail"
                                ErrorMessage="x" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td align="right" style="background-color: whitesmoke" valign="top">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="9pt"
                                Text="Observaciones :"></asp:Label></td>
                        <td align="left" style="width: 350px">
                            <asp:TextBox ID="Tint_obse" runat="server" Font-Names="Courier New" Font-Size="9pt"
                                Height="55px" TextMode="MultiLine" Width="320px" onfocus="this.style.background='#ffffcc'" onblur="this.style.background='white'" TabIndex="11" AutoCompleteType="Disabled" MaxLength="100"></asp:TextBox></td>
                    </tr>
                </table>
                        </td>
                        <td align="center" valign="top" style="background-color: #000000">
                            <table id="Tab02" cellpadding="0" cellspacing="4" border="0">
                                <tr>
                                    <td align="center">
                                        <asp:ImageButton ID="BtnProc" runat="server" ImageUrl='btns/btn_proc_w.png' onmouseover="src='btns/btn_proc_b.png'" onmouseout="src='btns/btn_proc_w.png'" OnClick="BtnProc_Click" TabIndex="12" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="center"></td>
                                </tr>
                                <tr>
                                    <td align="center" style="height: 30px">
                                        <asp:ImageButton ID="BtnCanc" runat="server" ImageUrl='btns/btn_cerr_w.png' onmouseover="src='btns/btn_cerr_b.png'" onmouseout="src='btns/btn_cerr_w.png'" CausesValidation="False" TabIndex="13" OnClick="BtnCanc_Click" /></td>
                                </tr>
                            </table></td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="LblMens" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                ForeColor="Red"></asp:Label>
        </td>
    </tr>
    </table>
    
</asp:Content>

