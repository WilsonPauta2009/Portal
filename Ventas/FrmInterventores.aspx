<%@ Page Title="" Language="C#" MasterPageFile="~/PlantillaVentas.master" AutoEventWireup="true" CodeFile="FrmInterventores.aspx.cs" Inherits="Ventas_FrmInterventores" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContPlaHol" runat="Server">
    <asp:UpdatePanel ID="upnl_menu" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnl_menu" runat="server" CssClass="PanelMenu">
                <asp:Menu ID="wdMenu" Orientation="Horizontal" runat="server" Width="100%"  ValidationGroup="Datos" ClientEvents-ItemSelected="" OnMenuItemClick="wdMenu_MenuItemClick">
                    <%--<GroupSettings Orientation="Horizontal" />--%>
                    <StaticHoverStyle backcolor="LightGray" forecolor="Black"/>
                    <Items>
                        <asp:MenuItem Value="0" ImageUrl="~/Iconos/search.png" ToolTip="CONSULTA CLIENTE" Text="CONSULTA"></asp:MenuItem>
                        <%--<asp:MenuItem IsSeparator="True" Text="[Separator]"></asp:MenuItem>--%>
                        <asp:MenuItem Value="1" ImageUrl="~/Iconos/process.png" ToolTip="PROCESAR" Text="PROCESAR"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </asp:Panel>
            <asp:Panel ID="pnl_inte" runat="server" CssClass="Panel">
                <asp:Label ID="lbl_a" runat="server" Style="display: none"></asp:Label>
                <table style="margin-left: 10px">
                    <tr><td>
                        <table><tr>
                            <td style="text-align:left;" colspan="2">
                                <table width="55%">
                                    <tr>
                                        <td style="padding:2px">
                                            <ig:WebDropDown ID="wdpIden" runat="server" Width="200px" CssClass="igdd_ValueDisplay" Font-Names="Arial" Font-Size="10px" AutoPostBack="True" Style="color: #000000; background-color: #FFFFFF;position:static" >
                                                <Items>
                                                    <ig:DropDownItem Selected="True" Text="CEDULA" Value="1"></ig:DropDownItem>
                                                    <ig:DropDownItem Selected="False" Text="RUC" Value="2"></ig:DropDownItem>
                                                    <ig:DropDownItem Selected="False" Text="PASAPORTE" Value="3"></ig:DropDownItem>
                                                </Items>
                                            </ig:WebDropDown><br />
                                            <asp:TextBox ID="txtIden" runat="server" CssClass="textBoxForm" onKeyPress="return isNumberKey(event)" Width="200px" MaxLength="13" onblur="return validate()" ></asp:TextBox>
                                        </td>
                                        <td style="padding:2px">
                                            <asp:Label runat="server" ID="lblCodAdam" CssClass="labeltitle" Width="75px" >CÓDIGO</asp:Label><br />
                                            <asp:TextBox runat="server" ID="txtCodAdam" CssClass="textBoxForm" Width="75px" Enabled="false"></asp:TextBox>
                                            <ig:WebDropDown ID="wdoCodA" runat="server" Width="75px" Visible="false"></ig:WebDropDown>
                                        </td>
                                        <td style="padding:2px">
                                            <asp:Label runat="server" ID="lblInte" CssClass="labeltitle" Width="330px" >RAZÓN SOCIAL/APELLIDOS Y NOMBRES</asp:Label><br />
                                            <asp:Button ID="btn_valida" runat="server" Text="Button" Style="display: none" OnClick="btn_valida_Click" />
                                            <asp:TextBox runat="server" ID="txtInte" CssClass="textBoxForm" Width="330px" ></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                </td></tr><tr>
                            <td style="text-align:left" colspan="2">
                                <table style="width:55%">
                                    <tr>
                                        <td style="padding:2px">
                                            <asp:Label runat="server" ID="lblProv" CssClass="labeltitle1" Width="200px">PROVINCIA</asp:Label><br />
                                            <ig:WebDropDown runat="server" ID="wdpProv" CssClass="igdd_ValueDisplay" Width="200px" AutoPostBack="True" DropDownContainerHeight="100px"></ig:WebDropDown>
                                        </td>
                                        <td style="padding:2px">
                                            <asp:Label runat="server" ID="lblCiud" CssClass="labeltitle1" Width="150px">CIUDAD</asp:Label><br />
                                            <asp:TextBox runat="server" ID="txtCiud" CssClass="textBoxForm" Width="150px"></asp:TextBox>
                                        </td>
                                        <td style="padding:2px">
                                            <asp:Label ID="lblFnac" runat="server" CssClass="labeltitle1" Width="200px">FEC. / NACIM</asp:Label><br />
                                            <ig:WebDatePicker ID="wdtFecN" runat="server" Width="200px" Height="20px"></ig:WebDatePicker>
                                        </td>
                                    </tr>
                                </table>     
                            </td></tr><tr>
                            <td style="padding: 2.5px;">
                                <asp:Label ID="lblDire" runat="server" CssClass="labeltitle1" Width="275px">DIRECCIÓN #1</asp:Label><br />
                                <asp:TextBox ID="txtDire" runat="server" CssClass="textBoxForm" Height="40px" TextMode="MultiLine" Width="275px"></asp:TextBox></td>
                                <td style="padding: 2.5px;text-align:left" >
                                <asp:Label ID="lblDir1" runat="server" CssClass="labeltitle1" Width="275px">DIRECCIÓN #2</asp:Label><br />
                                <asp:TextBox ID="txtDir1" runat="server" CssClass="textBoxForm" Height="40px" TextMode="MultiLine" Width="275px"></asp:TextBox></td></tr><tr>
                            <td style="padding: 2.5px; text-align:left">
                                <asp:Label ID="lblTel1" runat="server" CssClass="labeltitle1" Width="200px">TELÉFONO</asp:Label><br />
                                <asp:TextBox ID="txtTel1" runat="server" onKeyPress="return isNumberKey(event)" CssClass="textBoxForm" Width="200px" MaxLength="10"></asp:TextBox></td>
                            <td style="padding: 2.5px;text-align:left"  >
                                <asp:Label ID="lblTel2" runat="server" CssClass="labeltitle1" Width="218px" >TELÉFONO</asp:Label><br />
                                <asp:TextBox ID="txtTel2" runat="server" onKeyPress="return isNumberKey(event)" CssClass="textBoxForm" Width="218px" MaxLength="10" ></asp:TextBox></td></tr><tr>
                            <td style="padding: 2.5px;">
                                <asp:Label ID="lblObsv" runat="server" CssClass="labeltitle1" Width="275px">OBSERVACIONES</asp:Label><br />
                                <asp:TextBox ID="txtObsv" runat="server" CssClass="textBoxForm" Height="60px" TextMode="MultiLine" Width="275px"></asp:TextBox></td>
                            <td style="padding:2.5px; text-align:left" >
                                <asp:Label ID="Label13" runat="server" CssClass="labeltitle1" Width="218px" >ESTATUS</asp:Label>
                                <ig:WebDropDown ID="wdpCust" runat="server" AutoPostBack="True" CssClass="igdd_ValueDisplay" Width="218px" ></ig:WebDropDown><br />
                                <asp:Label ID="Label1" runat="server" CssClass="labeltitle1" Width="218px" >REPRESENTANTE</asp:Label>
                                <asp:TextBox ID="txtRepr" runat="server" CssClass="textBoxForm" Width="218px" Enabled="False" ></asp:TextBox></td></tr><tr>
                            <td style="padding: 2.5px;">
                                <asp:Label ID="Label12" runat="server" CssClass="labeltitle1" Width="275px">E-MAIL</asp:Label><br />
                                <asp:TextBox ID="txtMail" runat="server" CssClass="textBoxForm" style="text-transform: lowercase;" Width="275px" ValidationGroup="Datos"></asp:TextBox></td>
                            <td style="padding: 2.5px;text-align:left"  >
                                <asp:Label ID="lbl_pgwb" runat="server" CssClass="labeltitle1" Width="275px">PÁGINA WEB</asp:Label><br />
                                <asp:TextBox ID="txtPweb" runat="server" CssClass="textBoxForm" ValidationGroup="Datos" Width="275px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revMail" runat="server" ControlToValidate="txtMail" Display="None" ErrorMessage="Correo electronico invalido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:ValidatorCalloutExtender ID="revMail_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="revMail"></asp:ValidatorCalloutExtender>
                                <asp:RegularExpressionValidator ID="revPweb" runat="server" ControlToValidate="txtPweb" Display="None" ErrorMessage="Pagina incorrecta." ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                <asp:ValidatorCalloutExtender ID="revPweb_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="revPweb">
                                </asp:ValidatorCalloutExtender></td></tr>
                            </table>
                        </td><td style="width: 50%; padding-left: 4px">
                            <ig:WebDataGrid ID="wdgInte" runat="server" Height="325px" Width="100%" AutoGenerateColumns="False" Font-Names="Arial" Font-Size="XX-Small" DataKeyFields="CODIGO" OnRowSelectionChanged="wdgInte_RowSelectionChanged" EnableAjax="False" EnableDataViewState="True" ItemCssClass="Changefont">
                                <Behaviors>
                                    <ig:Selection CellClickAction="Row" RowSelectType="Single">
                                        <AutoPostBackFlags RowSelectionChanged="true" CellSelectionChanged="true" ColumnSelectionChanged="true" />
                                    </ig:Selection>
                                </Behaviors>
                                <Columns>
                                    <ig:BoundDataField DataFieldName="CODIGO" Key="BoundColumn_0">
                                        <Header Text="CÓDIGO">
                                        </Header>
                                        <Footer Text="CÓDIGO">
                                        </Footer>
                                    </ig:BoundDataField>
                                    <ig:BoundDataField DataFieldName="APELLIDOS_Y_NOMBRES" Key="APELLIDOS_Y_NOMBRES" Width="300px">
                                        <Header Text="APELLIDOS Y NOMBRES">
                                        </Header>
                                    </ig:BoundDataField>
                                    <ig:BoundDataField DataFieldName="TIPO" Key="TIPO">
                                        <Header Text="TIPO">
                                        </Header>
                                    </ig:BoundDataField>
                                </Columns>
                            </ig:WebDataGrid>
                        </td></tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="wdMenu" />
        </Triggers>
    </asp:UpdatePanel>


    <asp:Button ID="btn_popup" runat="server" Text="Button" OnClick="btn_popup_Click" Style="display: none" />
    <asp:Panel ID="pnl_agrupacion" runat="server" Width="700px" Style="background-color: #FFFFFF">
        <asp:UpdatePanel ID="upnl_agrup" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnl_agrup" runat="server">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">Detalles</h4>
                    </div>
                    <div class="modal-body" style="height:450px">
                        <ig:WebTab ID="wtClientes" runat="server" Height="100%" Width="100%" SelectedIndex="3">
                            <Tabs>
                                <ig:ContentTabItem runat="server" Text="Variables"><Template>
                                    <fieldset style="margin:5px;">
                                        <legend>Referencias</legend>
                                            <table class="tableF"><tr><td>
                                                <asp:Label runat="server" ID="lblRef" CssClass="labeltitle" Width="200px">REFERENCIA 1</asp:Label>
                                                <asp:TextBox runat="server" ID="txtRef" CssClass="textBoxForm" Width="200px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvRef" runat="server" ControlToValidate="txtRef" Display="None" ErrorMessage="Dato necesario." ValidationGroup="Detalle"></asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="rfvRef_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="rfvRef"></asp:ValidatorCalloutExtender></td><td>
                                                <asp:Label runat="server" ID="Label3" CssClass="labeltitle" Width="200px">REFERENCIA 2</asp:Label>
                                                <asp:TextBox runat="server" ID="txtRef1" CssClass="textBoxForm" Width="200px"></asp:TextBox>
                                                </td><td>
                                                <asp:Label runat="server" ID="Label4" CssClass="labeltitle" Width="200px">REFERENCIA 3</asp:Label>
                                                <asp:TextBox runat="server" ID="txtRef2" CssClass="textBoxForm" Width="200px"></asp:TextBox>
                                                </td></tr>
                                            </table>
                                    </fieldset>
                                    <fieldset style="margin:5px;">
                                        <legend>Variables</legend>
                                            <table class="tableF">
                                                <tr><td align="center">
                                                    <asp:Label runat="server" ID="Label2" CssClass="labeltitle" Width="200px">VARIABLE 1</asp:Label><br />
                                                    <asp:TextBox runat="server" ID="txtVar" CssClass="textBoxForm" style="text-align:right" Width="200px"></asp:TextBox>
                                                </td><td>
                                                    <asp:Label runat="server" ID="Label5" CssClass="labeltitle" Width="200px">VARIABLE 2</asp:Label><br />
                                                    <asp:TextBox runat="server" ID="txtVar1" CssClass="textBoxForm" style="text-align:right" Width="200px"></asp:TextBox>
                                                </td><td>
                                                    <asp:Label runat="server" ID="Label6" CssClass="labeltitle" Width="200px">VARIABLE 3</asp:Label><br />
                                                    <asp:TextBox runat="server" ID="txtVar2" CssClass="textBoxForm" style="text-align:right" Width="200px"></asp:TextBox>
                                                </td></tr>
                                                <tr><td>
                                                    <asp:Label runat="server" ID="Label7" CssClass="labeltitle" Width="200px">VARIABLE 4</asp:Label><br />
                                                    <asp:TextBox runat="server" ID="txtVar3" CssClass="textBoxForm" style="text-align:right" Width="200px"></asp:TextBox>
                                                </td><td>
                                                    <asp:Label runat="server" ID="Label8" CssClass="labeltitle" Width="200px">VARIABLE 5</asp:Label><br />
                                                    <asp:TextBox runat="server" ID="txtVar4" CssClass="textBoxForm" style="text-align:right" Width="200px"></asp:TextBox>
                                                </td></tr>
                                            </table>
                                    </fieldset>
                                    <fieldset style="margin:5px;">
                                        <legend>Asignacion Agentes</legend>
                                            <table class="tableF"><tr><td>
                                                <asp:Label runat="server" ID="Label9" CssClass="labeltitle" Width="300px">AGENTE DE VENTAS</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
                                                <asp:TextBox runat="server" ID="txtAgen" Text="[   AGV-000] Agente por Omisiòn" CssClass="textBoxForm" Width="300px" Enabled="False"></asp:TextBox>
                                                <asp:ImageButton ID="imgAddAg1" runat="server" ImageUrl="~/Iconos/add16.png" OnClick="imgAddAg1_Click" CssClass="textBoxForm" /></td><td>
                                                <asp:Label runat="server" ID="Label10" CssClass="labeltitle" Width="300px">AGENTE DE COBRANZAS</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
                                                <asp:TextBox runat="server" ID="txtAgen1" Text="[   AGV-000] Agente por Omisiòn" CssClass="textBoxForm" Width="300px" Enabled="False"></asp:TextBox>

                                                    <asp:ImageButton ID="imgAddAg2" runat="server" ImageUrl="~/Iconos/add16.png" OnClick="imgAddAg2_Click" CssClass="textBoxForm" /></td></tr>
                                            </table>
                                    </fieldset>
                                </Template></ig:ContentTabItem>
                                <ig:ContentTabItem runat="server" Text="Datos de Cartera"><Template>
                                    <table class="tableF">
                                        <tr style="background-color:#808080; width:200px;"><td >
                                            <asp:RadioButton ID="rbRut" CssClass="radio-inline"  GroupName="rdb" runat="server" Text="RUTA 1" style="color: #FFFFFF" Checked="True" />
                                            <asp:RadioButton ID="rbRut1" CssClass="radio-inline" GroupName="rdb" runat="server" Text="RUTA 2" style="color: #FFFFFF" /></td><td >
                                            <asp:Label ID="Label11" runat="server" Text="L" CssClass="labeltitle"></asp:Label></td><td >
                                            <asp:Label ID="Label14" runat="server" Text="M" CssClass="labeltitle"></asp:Label></td><td >
                                            <asp:Label ID="Label15" runat="server" Text="M" CssClass="labeltitle"></asp:Label></td><td >
                                            <asp:Label ID="Label16" runat="server" Text="J" CssClass="labeltitle"></asp:Label></td><td >
                                            <asp:Label ID="Label17" runat="server" Text="V" CssClass="labeltitle"></asp:Label></td><td >
                                            <asp:Label ID="Label18" runat="server" Text="S" CssClass="labeltitle"></asp:Label></td><td >
                                            <asp:Label ID="Label19" runat="server" Text="D" CssClass="labeltitle"></asp:Label></td>
                                        </tr><tr><td style="background-color:#808080; padding:5px">
                                            <asp:Label ID="lblVist" runat="server" Text="DÍAS DE VISITA" CssClass="labeltitle"></asp:Label></td><td >
                                            <asp:CheckBox ID="chkLun" runat="server" CssClass="textBoxForm" Width="50px"></asp:CheckBox></td><td >
                                            <asp:CheckBox ID="chkMar" runat="server" CssClass="textBoxForm" Width="50px"></asp:CheckBox></td><td >
                                            <asp:CheckBox ID="chkMie" runat="server" CssClass="textBoxForm" Width="50px"></asp:CheckBox></td><td >
                                            <asp:CheckBox ID="chkJue" runat="server" CssClass="textBoxForm" Width="50px"></asp:CheckBox></td><td >
                                            <asp:CheckBox ID="chkVie" runat="server" CssClass="textBoxForm" Width="50px"></asp:CheckBox></td><td >
                                            <asp:CheckBox ID="chkSab" runat="server" CssClass="textBoxForm" Width="50px"></asp:CheckBox></td><td >
                                            <asp:CheckBox ID="chkDom" runat="server" CssClass="textBoxForm" Width="50px"></asp:CheckBox></td></tr>
                                    </table>
                                    <table class="tableF"><tr><td>
                                            <asp:Label ID="Label20" runat="server" CssClass="labeltitle" Text="PREESTABLECIDO 1" Width="200px"></asp:Label><br />
                                            <asp:TextBox ID="txtPreEs" runat="server" CssClass="textBoxForm" Width="200px">0</asp:TextBox></td><td>
                                            <asp:Label ID="Label21" runat="server" CssClass="labeltitle" Text="PREESTABLECIDO 2" Width="200px"></asp:Label><br />
                                            <asp:TextBox ID="txtPreEs1" runat="server" CssClass="textBoxForm" Width="200px">0</asp:TextBox></td><td>
                                            <asp:Label ID="Label22" runat="server" CssClass="labeltitle" Text="PREESTABLECIDO 3" Width="200px"></asp:Label><br />
                                            <asp:TextBox ID="txtPreEs2" runat="server" CssClass="textBoxForm" Width="200px">0</asp:TextBox></td></tr>
                                    </table>
                                    <table class="tableF"><tr><td>
                                            <asp:Label ID="Label23" runat="server" CssClass="labeltitle" Text="CONDICIÓN DE PAGO" Width="200px"></asp:Label><br />
                                            <ig:WebDropDown ID="wdpCondPag" runat="server" Width="200px" CssClass="igdd_ValueDisplay" EnableDropDownAsChild="False"></ig:WebDropDown></td><td>
                                            <asp:Label ID="Label24" runat="server" CssClass="labeltitle" Text="LÍMITE DE CRÉDITO" Width="200px"></asp:Label><br />
                                            <asp:TextBox ID="txtLimCre" runat="server" CssClass="textBoxForm" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLimCre" runat="server" ControlToValidate="txtLimCre" Display="None" ErrorMessage="Dato necesario." ValidationGroup="Detalle"></asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="rfvLimCre_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="rfvLimCre">
                                            </asp:ValidatorCalloutExtender></td><td>
                                            <asp:Label ID="Label25" runat="server" CssClass="labeltitle" Text="SITUACIÓN CREDITICIA" Width="200px"></asp:Label><br />
                                            <ig:WebDropDown ID="wdpSitCred" runat="server" Width="200px" CssClass="igdd_ValueDisplay" EnableDropDownAsChild="False"></ig:WebDropDown></td></tr>
                                    </table>
                                    <fieldset>
                                        <legend>Direcciones de Entrega</legend>
                                        <table class="tableF"><tr><td>
                                            <asp:Label ID="lblDirEnt" runat="server" CssClass="labeltitle" Text="DIRECCIÓN ENTREGA" Width="300px"></asp:Label><br />
                                            <asp:TextBox ID="txtDirEnt" runat="server" CssClass="textBoxForm" Width="300px"></asp:TextBox></td><td>
                                            <asp:Label ID="lblCiuEnt" runat="server" CssClass="labeltitle" Text="CIUDAD ENTREGA" Width="200px"></asp:Label><br />
                                            <ig:WebDropDown ID="wdpCiuEnt" runat="server" CssClass="igdd_ValueDisplay" EnableDropDownAsChild="False" Width="200px" AutoFilterQueryType="Contains"></ig:WebDropDown></td><td>
                                            <asp:ImageButton ID="btnAddDir" runat="server" ImageUrl="~/Iconos/add.png" OnClick="btnAddDir_Click" Text="AGREGAR" /></td></tr>
                                        </table>
                                            <ig:WebDataGrid ID="wdgDirEnt" runat="server" Height="160px" Width="100%" AutoGenerateColumns="False" DataKeyFields="CLDCEN" OnRowsDeleting="wdgDirEnt_RowsDeleting" EnableDataViewState="True" CssClass="Changefont" >
                                            <Columns>
                                                <ig:BoundDataField DataFieldName="CLDCEN" Key="CLDCEN" Hidden="True">
                                                    <Header Text="id">
                                                    </Header>
                                                </ig:BoundDataField>
                                                <ig:BoundDataField DataFieldName="CLDDIR" Key="CLDDIR">
                                                    <Header Text="DIRECCIÓN" />
                                                </ig:BoundDataField>
                                                <ig:BoundDataField DataFieldName="CLDCOL" Key="CLDCOL">
                                                    <Header Text="COLONIA" />
                                                </ig:BoundDataField>
                                                <ig:BoundDataField DataFieldName="CLDPOB" Key="CLDPOB">
                                                    <Header Text="POBLACIÓN" />
                                                </ig:BoundDataField>
                                                <ig:BoundDataField DataFieldName="CLDTE1" Key="CLDTE1">
                                                    <Header Text="TELÉFONO">
                                                    </Header>
                                                </ig:BoundDataField>
                                                <ig:TemplateDataField Key="DeleteItem" Width="60px">
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" ID="DeleteItem" AlternateText=""
                                                            ImageUrl="~/Iconos/delete.png"
                                                            OnClientClick="DeleteRowDir(); return false;"  />
                                                    </ItemTemplate>
                                                </ig:TemplateDataField>

                                            </Columns>
                                            <Behaviors>
                                                <ig:EditingCore AutoCRUD="false">
                                                    <Behaviors>
                                                        <ig:CellEditing>
                                                            <ColumnSettings>
                                                                <ig:EditingColumnSetting ColumnKey="CLDCOL" ReadOnly="true" />
                                                                <ig:EditingColumnSetting ColumnKey="CLDPOB" ReadOnly="true" />
                                                            </ColumnSettings>
                                                        </ig:CellEditing>
                                                    </Behaviors>
                                                </ig:EditingCore>
                                                <ig:Selection CellClickAction="Row" RowSelectType="Single">
                                                </ig:Selection>
                                            </Behaviors>
                                        </ig:WebDataGrid>
                                    </fieldset>
                                </Template></ig:ContentTabItem>
                                
                                <ig:ContentTabItem runat="server" Text="Agrupaciones"><Template>
                                    <ig:WebDataGrid ClientIDMode="Static" ID="wdgAgrupacion" runat="server" AutoGenerateBands="false" AutoGenerateColumns="False" DataKeyFields="ACLCVE" Height="345px" Width="100%" EnableDataViewState="True" EnableAjax="False" ItemCssClass="Changefont">
                                        <Columns>
                                            <ig:BoundDataField DataFieldName="ACLCVE" Hidden="True" Key="BoundColumn_0" Width="100px">
                                                <Header Text="CÓDIGO" />
                                            </ig:BoundDataField>
                                            <ig:BoundDataField DataFieldName="ACLDES" Key="BoundColumn_2">
                                                <Header Text="DESCRIPCIÓN">
                                                </Header>
                                            </ig:BoundDataField>
                                            <ig:BoundDataField DataFieldName="DACDES" Key="BoundColumn_1" Width="100px">
                                                <Header Text="CÓDIGO" />
                                            </ig:BoundDataField>
                                            <ig:BoundDataField DataFieldName="VALOR" Key="BoundColumn_3">
                                                <Header Text="VALOR" />
                                            </ig:BoundDataField>
                                        </Columns>
                                        <Behaviors>
                                            <ig:RowSelectors RowNumbering="True"></ig:RowSelectors>
                                            <ig:Selection CellClickAction="Row" RowSelectType="Single">
                                                <SelectionClientEvents RowSelectionChanged="whdg_RowSelectionChanged" />
                                            </ig:Selection>
                                            <ig:EditingCore>
                                                <Behaviors>
                                                    <ig:CellEditing>
                                                    </ig:CellEditing>
                                                </Behaviors>
                                            </ig:EditingCore>
                                        </Behaviors>
                                    </ig:WebDataGrid>
                                    <asp:HiddenField ID="hdfAgrupa" runat="server" />
                                    <asp:Label ID="lbl_agrupa0" runat="server" CssClass="labeltitle1" Text="SELECCIONAR AGRUPACIÓN" Width="400px"></asp:Label>
                                    <br />
                                    <ig:WebDropDown ID="wdpDAgrupa" runat="server" Width="400px" CssClass="igdd_ValueDisplay" 
                                        DropDownContainerHeight="100px" EnableDropDownAsChild="false">
                                        <ClientEvents ValueChanged="WebDropDown1_valueChanged" />
                                        <AutoPostBackFlags SelectionChanged="Async" />
                                    </ig:WebDropDown>
                                    <asp:Button ID="btn_Agrupaciones" runat="server" OnClick="btn_Agrupaciones_Click" Style="display: none" />
                                </Template></ig:ContentTabItem>
                                
                                <ig:ContentTabItem Text="Mantenimiento de Cliente">
                                    <Template>
                                        <table class="tableF"><tr><td>
                                                <asp:label ID="lbl_division" runat="server" Text="DIVISIÓN" Width="300px" CssClass="labeltitle"></asp:label><br />
                                                <ig:WebDropDown runat="server" ID="wdpDivision" Width="300px" CssClass="igdd_ValueDisplay" AutoPostBack="True" OnSelectionChanged="wdpDivision_SelectionChanged">
                                                    <Items>
                                                        <ig:DropDownItem Selected="True" Text="ELECTRODOMESTICOS" Value="E"></ig:DropDownItem>
                                                        <ig:DropDownItem Selected="False" Text="LICORES" Value="L"></ig:DropDownItem>
                                                        <ig:DropDownItem Selected="False" Text="FERRETERIA" Value="F"></ig:DropDownItem>
                                                        <ig:DropDownItem Selected="False" Text="PERFUMERIA" Value="P"></ig:DropDownItem>
                                                    </Items>
                                                </ig:WebDropDown></td><td>
                                                <asp:Label ID="Label29" runat="server" Text="RAZÓN SOCIAL" CssClass="labeltitle" Width="300px"></asp:Label><br />
                                                <asp:TextBox ID="txtRazSoc" runat="server" CssClass="textBoxForm" Width="300px"></asp:TextBox></td></tr><tr><td>
                                                <asp:Label ID="Label33" runat="server" CssClass="labeltitle" Text="LOCALIZACIÓN" Width="300px"></asp:Label><br />
                                                <asp:TextBox ID="txtLoc" runat="server" CssClass="textBoxForm" Width="300px"></asp:TextBox></td><td>
                                                <asp:Label ID="Label30" runat="server" Text="ESTADO" CssClass="labeltitle" Width="300px"></asp:Label><br />
                                                <ig:WebDropDown ID="wdpEstado" runat="server" CssClass="igdd_ValueDisplay" Width="300px">
                                                    <Items>
                                                        <ig:DropDownItem Selected="False" Text="[ A ]  ACTIVO" Value="A"></ig:DropDownItem>
                                                        <ig:DropDownItem Selected="True" Text="[ B ]  INACTIVO" Value="B"></ig:DropDownItem>
                                                    </Items>
                                                    </ig:WebDropDown></td></tr><tr><td>
                                                <asp:Label ID="Label34" runat="server" CssClass="labeltitle" Text="COMERCIAL 1" Width="300px"></asp:Label><br />
                                                <asp:TextBox ID="txtComer1" runat="server" CssClass="textBoxForm" Width="300px"></asp:TextBox></td><td>
                                                <asp:Label ID="Label31" runat="server" Text="COMERCIAL 2" CssClass="labeltitle" Width="300px"></asp:Label><br />
                                                <asp:TextBox ID="txtComer2" runat="server" CssClass="textBoxForm" Width="300px"></asp:TextBox></td></tr><tr><td>
                                                <asp:Label ID="Label35" runat="server" CssClass="labeltitle" Text="REFERENCIA 1" Width="300px"></asp:Label><br />
                                                <asp:TextBox ID="txtRefer1" runat="server" CssClass="textBoxForm" Width="300px">0</asp:TextBox></td><td>
                                                <asp:Label ID="Label32" runat="server" Text="REFERENCIA 2" CssClass="labeltitle" Width="300px"></asp:Label><br />
                                                <asp:TextBox ID="txtRefer2" runat="server" CssClass="textBoxForm" Width="300px">0</asp:TextBox></td>
                                            </tr><tr><td colspan="2">
                                                <table style="width:100%"><tr><td>
                                                    <asp:Label ID="lblrv1" runat="server" CssClass="labeltitle" Width="200px">RUTA DE VISITA 1</asp:Label><br />
                                                    <ig:WebDropDown runat="server" ID="wdpRutV1" CssClass="igdd_ValueDisplay" Width="200px" EnableDropDownAsChild="False" ></ig:WebDropDown></td><td>
                                                    <asp:Label ID="lblrv11" runat="server" CssClass="labeltitle" Width="200px">ESTADO DE VISITA 1</asp:Label><br />
                                                    <ig:WebDropDown ID="wdpEstV1" runat="server" CssClass="igdd_ValueDisplay" Width="200px" EnableDropDownAsChild="False">
                                                        <Items>
                                                            <ig:DropDownItem Selected="False" Text="[ A ]  ACTIVO" Value="A"></ig:DropDownItem>
                                                            <ig:DropDownItem Selected="True" Text="[ B ]  INACTIVO" Value="B"></ig:DropDownItem>
                                                        </Items>
                                                    </ig:WebDropDown></td><td>                                                                                                       
                                                    <asp:Label ID="lblrv13" runat="server" CssClass="labeltitle" Width="200px">SEC. DE VISITA 1</asp:Label><br />
                                                    <asp:TextBox ID="txtSevi" runat="server" CssClass="textBoxForm" Width="200px">0</asp:TextBox></td></tr>
                                                </table></td>
                                            </tr><tr><td colspan="2">
                                                <table style="width:100%"><tr><td>
                                                    <asp:Label ID="Label26" runat="server" CssClass="labeltitle" Width="200px">RUTA DE VISITA 2</asp:Label><br />
                                                    <ig:WebDropDown runat="server" ID="wdpRutV2" CssClass="igdd_ValueDisplay" Width="200px" EnableDropDownAsChild="False" ></ig:WebDropDown></td><td>
                                                    <asp:Label ID="Label28" runat="server" CssClass="labeltitle" Width="200px">ESTADO DE VISITA 2</asp:Label><br />
                                                    <ig:WebDropDown ID="wdpEstV2" runat="server" CssClass="igdd_ValueDisplay" Width="200px" EnableDropDownAsChild="False">
                                                        <Items>
                                                            <ig:DropDownItem Selected="False" Text="[ A ]  ACTIVO" Value="A"></ig:DropDownItem>
                                                            <ig:DropDownItem Selected="True" Text="[ B ]  INACTIVO" Value="B"></ig:DropDownItem>
                                                        </Items>
                                                    </ig:WebDropDown></td><td>                                                                                                       
                                                    <asp:Label ID="lblrv14" runat="server" CssClass="labeltitle" Width="200px">SEC. DE VISITA 1</asp:Label><br />
                                                    <asp:TextBox ID="txtSevi1" runat="server" CssClass="textBoxForm" Width="200px">0</asp:TextBox></td></tr>
                                                </table>
                                            </tr><tr><td colspan="2">
                                                <table style="width:100%"><tr><td>
                                                    <asp:Label ID="Label36" runat="server" CssClass="labeltitle" Width="200px">RUTA DE VISITA 3</asp:Label><br />
                                                    <ig:WebDropDown runat="server" ID="wdpRutV3" CssClass="igdd_ValueDisplay" Width="200px" EnableDropDownAsChild="False" ></ig:WebDropDown></td><td>
                                                    <asp:Label ID="Label37" runat="server" CssClass="labeltitle" Width="200px">ESTADO DE VISITA 3</asp:Label><br />
                                                    <ig:WebDropDown ID="wdpEstV3" runat="server" CssClass="igdd_ValueDisplay" Width="200px" EnableDropDownAsChild="False">
                                                        <Items>
                                                            <ig:DropDownItem Selected="False" Text="[ A ]  ACTIVO" Value="A"></ig:DropDownItem>
                                                            <ig:DropDownItem Selected="True" Text="[ B ]  INACTIVO" Value="B"></ig:DropDownItem>
                                                        </Items>
                                                    </ig:WebDropDown></td><td>                                                                                                       
                                                    <asp:Label ID="lblrv15" runat="server" CssClass="labeltitle" Width="200px">SEC. DE VISITA 1</asp:Label><br />
                                                    <asp:TextBox ID="txtSevi2" runat="server" CssClass="textBoxForm" Width="200px">0</asp:TextBox><br /></td></tr>
                                                </table></tr><tr><td colspan ="2">
                                                <table style="width:100%"><tr><td>
                                                    <asp:Label ID="lblrv5" runat="server" CssClass="labeltitle" Width="200px">DÍAS VISITA RUTA 1</asp:Label><br />
                                                    <asp:CheckBox ID="chkVisRut11" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut12" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut13" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut14" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut15" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut16" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut17" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox></td><td >
                                                    <asp:Label ID="lblrv6" runat="server" CssClass="labeltitle" Width="200px">DÍAS VISITA RUTA 2</asp:Label><br />
                                                    <asp:CheckBox ID="chkVisRut21" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut22" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut23" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut24" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut25" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut26" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut27" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox></td><td >
                                                    <asp:Label ID="lblrv7" runat="server" CssClass="labeltitle" Width="200px">DÍAS VISITA RUTA 3</asp:Label><br />
                                                    <asp:CheckBox ID="chkVisRut31" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut32" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut33" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut34" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut35" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut36" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkVisRut37" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox></td></tr>
                                                </table></td></tr><tr><td>
                                                    <asp:Label ID="lblrv8" runat="server" CssClass="labeltitle" Width="200px">DÍAS ENTREGA 1</asp:Label><br />
                                                    <asp:CheckBox ID="chkRutEnt1" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkRutEnt2" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkRutEnt3" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkRutEnt4" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkRutEnt5" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkRutEnt6" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox>
                                                    <asp:CheckBox ID="chkRutEnt7" runat="server" CssClass="textBoxForm" Width="28"></asp:CheckBox></td><td>
                                                    <asp:Label ID="lblrv12" runat="server" CssClass="labeltitle" Width="200px">RUTA DE ENTREGA</asp:Label><br />
                                                    <ig:WebDropDown ID="wdpRutEntr" runat="server" CssClass="igdd_ValueDisplay" Width="200px" EnableDropDownAsChild="False" DropDownContainerHeight="140px"></ig:WebDropDown></td></tr>
                                        </table>
                                    </Template>
                                </ig:ContentTabItem>
                                
                                <ig:ContentTabItem runat="server" Text="-&gt; Contactos"><Template>
                                    <table style="margin:5px"><tr><td>
                                        <asp:Label ID="lblConNombre" runat="server" CssClass="labeltitle" Width="300px">APELLIDOS Y NOMBRES</asp:Label>
                                        <asp:TextBox ID="txtConNom" runat="server" CssClass="textBoxForm" Width="300px"></asp:TextBox></td><td>
                                        <asp:Label ID="lblConTel" runat="server" CssClass="labeltitle" Width="100px">TELÉFONO</asp:Label>
                                        <asp:TextBox ID="txtTelCon" runat="server" CssClass="textBoxForm" Width="100px"></asp:TextBox></td><td>
                                        <asp:Label ID="Label27" runat="server" CssClass="labeltitle" Width="150px">PUESTO</asp:Label>
                                        <asp:TextBox ID="txtPueCon" runat="server" CssClass="textBoxForm" Width="150px"></asp:TextBox></td><td>
                                        <%--<input type="button" id="btnAddCon" onclick="AddRow()" class="btn btn-success" />--%>
                                        <asp:ImageButton ID="btnAddCon" runat="server" Text="Agregar" ImageUrl="~/Iconos/add.png" OnClick="btnAddCon_Click"/></td></tr>
                                    </table>
                                    <ig:WebDataGrid ID="wdgContactos" runat="server" Height="125px" Width="100%" AutoGenerateColumns="False" DataKeyFields="id" OnRowsDeleting="wdgContactos_RowsDeleting" EnableDataViewState="True" CssClass="Changefont" >
                                        <Columns>
                                            <ig:BoundDataField DataFieldName="id" Key="id" Hidden="True">
                                                <Header Text="id">
                                                </Header>
                                            </ig:BoundDataField>
                                            <ig:BoundDataField DataFieldName="NOMCON" Key="NOMCON">
                                                <Header Text="NOMBRES Y APELLIDOS" />
                                            </ig:BoundDataField>
                                            <ig:BoundDataField DataFieldName="TELCON" Key="TELCON">
                                                <Header Text="TELÉFONO" />
                                            </ig:BoundDataField>
                                            <ig:BoundDataField DataFieldName="PUECON" Key="PUECON">
                                                <Header Text="PUESTO">
                                                </Header>
                                            </ig:BoundDataField>
                                            <ig:TemplateDataField Key="DeleteItem" Width="60px">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" ID="DeleteItem" AlternateText="" ImageUrl="~/Iconos/delete.png" OnClientClick="DeleteRow(); return false;"  />
                                                </ItemTemplate>
                                            </ig:TemplateDataField>

                                        </Columns>
                                        <Behaviors>
                                            <ig:EditingCore AutoCRUD="false">
                                                <Behaviors>
                                                    <ig:CellEditing>
                                                    </ig:CellEditing>
                                                </Behaviors>
                                            </ig:EditingCore>
                                            <ig:Selection CellClickAction="Row" RowSelectType="Single">
                                            </ig:Selection>
                                        </Behaviors>
                                    </ig:WebDataGrid>

                                    <fieldset style="margin-top:5px">
                                        <legend>GARANTE</legend>
                                    <table width="100%">
                                        <tr>
                                            <td style="padding:2px">
                                                <asp:Label runat="server" ID="lblCedGar" Text="CÉDULA GARANTE" CssClass="labeltitle" Width="120px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtCedGar" CssClass="textBoxForm" Width="120px"></asp:TextBox>
                                            </td>
                                            <td style="padding:2px">
                                                <asp:Label runat="server" ID="lblCedCon" Text="CÉDULA CONYUGUE" CssClass="labeltitle" Width="120px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtCedCon" CssClass="textBoxForm" Width="120px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding:2px">
                                                <asp:Label runat="server" ID="lblNomGar" Text="APELLIDOS Y NOMBRES GARANTE" CssClass="labeltitle" Width="300px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtNomGar" CssClass="textBoxForm" Width="300px"></asp:TextBox>
                                            </td>
                                            <td style="padding:2px">
                                                <asp:Label runat="server" ID="lblNomCon" Text="APELLIDOS Y NOMBRES CONYUGUE" CssClass="labeltitle" Width="300px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtNomCon" CssClass="textBoxForm" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding:2px; height: 44px;">
                                                <asp:Label runat="server" ID="lblTelGar" Text="TELÉFONO GARANTE" CssClass="labeltitle" Width="300px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtTelGar" CssClass="textBoxForm" Width="300px"></asp:TextBox>
                                            </td>
                                            <td style="padding:2px; height: 44px;">
                                                <asp:Label runat="server" ID="lblTelCon" Text="TELÉFONO CONYUGUE" CssClass="labeltitle" Width="300px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtTlfCon" CssClass="textBoxForm" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding:2px">
                                                <asp:Label runat="server" ID="Label40" Text="DIRECCIÓN" CssClass="labeltitle" Width="300px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtDirGar" CssClass="textBoxForm" Width="300px"></asp:TextBox>
                                            </td>
                                            <td style="padding:2px">
                                                <asp:Label runat="server" ID="lblProvGar" Text="PROVINCIA & CIUDAD" CssClass="labeltitle" Width="300px"></asp:Label>
                                                <br />
                                                <ig:WebDropDown runat="server" ID="wdpProvGar" CssClass="igdd_ValueDisplay" Width="300px" EnableDropDownAsChild="False" DropDownContainerHeight="100px" AutoFilterQueryType="Contains"></ig:WebDropDown>
                                            </td>
                                        </tr>
                                    </table>
                                    </fieldset>
                                </Template></ig:ContentTabItem>
                            </Tabs>
                        </ig:WebTab>
                    </div>
                    <div class="modal-footer">
                        <asp:HiddenField id="Agen" runat="server" />
                        <asp:Button ID="btn_close" class="btn btn-default" runat="server" Text="Cerrar" OnClick="btn_close_Click" />
                        <asp:Button ID="btn_guardar" class="btn btn-primary" runat="server" Text="Procesar" OnClick="btn_guardar_Click" ValidationGroup="Detalle" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:ModalPopupExtender ID="pnl_agrupacion_ModalPopupExtender" runat="server" Enabled="True" BackgroundCssClass="ModalPopUp" PopupControlID="pnl_agrupacion" TargetControlID="btn_popup" >
    </asp:ModalPopupExtender>


    <asp:Panel id="pnlAgen" runat="server" style="background-color:white">
           <asp:UpdatePanel runat="server" ID="upnlAgen" >
               <ContentTemplate>
                   <asp:Panel ID="pnlAdd" runat="server" style="background-color:white" Width="400px" Height="400px">
                   <div class="modal-header">
                       <h4>Agregar Agente</h4>
                   </div>
                       <div class="modal-body">
                           <asp:TextBox ID="txtCodAg" runat="server" CssClass="textBoxForm" Width="75px"></asp:TextBox>
                           <asp:TextBox ID="txtAge" runat="server" CssClass="textBoxForm" Width="150px"></asp:TextBox>
                           <asp:Button ID="btnBusAg" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBusAg_Click" OnClientClick="script2()" />
                           <ig:WebDataGrid runat="server" ID="wdgAgen" AutoGenerateColumns="False" EnableAjax="False" EnableDataViewState="True" Height="200px" Width="100%" OnColumnSelectionChanged="wdgAgen_ColumnSelectionChanged" DataKeyFields="AGECVE" >
                               <Columns>
                                   <ig:BoundDataField DataFieldName="AGECVE" Hidden="True" Key="AGECVE">
                                       <Header Text="AGECVE">
                                       </Header>
                                   </ig:BoundDataField>
                                   <ig:BoundDataField DataFieldName="AGENOM" Key="AGENOM">
                                       <Header Text="AGENTE">
                                       </Header>
                                   </ig:BoundDataField>
                               </Columns>
                               <Behaviors>
                                   <ig:Selection RowSelectType="Single" CellClickAction="Row">
                                       <SelectionClientEvents RowSelectionChanged="whdgAgen_RowSelectionChanged" />
                                   </ig:Selection>
                                </Behaviors>
                           </ig:WebDataGrid>
                       </div>
                       <div class="modal-footer">
                           <asp:Button ID="btnCerrarAgg" runat="server" CssClass="btn btn-default" OnClick="btnCerrarAgg_Click" Text="Cerrar" />
                       </div>
                   </asp:Panel>
               </ContentTemplate>
           </asp:UpdatePanel>
    </asp:Panel>
    <asp:ModalPopupExtender ID="pnlAgen_ModalPopupExtender" runat="server" DynamicServicePath="" Enabled="True" TargetControlID="addAg" PopupControlID="pnlAgen" BackgroundCssClass="ModalPopUp">
    </asp:ModalPopupExtender>
    <asp:Button ID="addAg" runat="server" style="display:none" />



    <asp:UpdateProgress ID="upbarUP1" runat="server" AssociatedUpdatePanelID="upnl_menu">
        <ProgressTemplate>
            <asp:Panel ID="Panel1" CssClass="overlay" runat="server">
                <asp:Panel ID="Panel2" CssClass="loader" runat="server">
                    <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Iconos/loading.gif" /><br />
                    <asp:Label ID="lblProgress" runat="server" Text="Espere Por Favor..." Font-Bold="True" Font-Size="Medium"></asp:Label>
                </asp:Panel>
            </asp:Panel>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:Panel ID="panelPopup" runat="server" >
        <asp:UpdateProgress ID="upbUPD" runat="server" AssociatedUpdatePanelID="upnl_agrup">
            <ProgressTemplate>
            <asp:Panel ID="pnl_over" CssClass="overlay" runat="server">
                <asp:Panel ID="pnl_Load" CssClass="loader" runat="server">
                    <asp:Image runat="server" ID="imgLoading1" ImageUrl="~/Iconos/loading.gif" /><br />
                    <asp:Label ID="lblProgress1" runat="server" Text="Espere Por Favor..." Font-Bold="True" Font-Size="Medium"></asp:Label>
                </asp:Panel>
            </asp:Panel>
        </ProgressTemplate>       
        </asp:UpdateProgress>
        <asp:ModalPopupExtender ID="modalExtender" runat="server" Enabled="True" TargetControlID="panelPopup" PopupControlID="panelPopup" BackgroundCssClass="modalBackground">
        </asp:ModalPopupExtender>
    </asp:Panel>

    <script type="text/javascript" src="../Jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../Jquery/noty/packaged/jquery.noty.packaged.min.js"></script>

    <script type="text/javascript">

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(showPopup);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(hidePopup);
        function showPopup(sender, args) {
          var ModalControl = '<%= modalExtender.ClientID %>';
            $find(ModalControl).show();
        }

         function hidePopup(sender, args) {
           var ModalControl = '<%= modalExtender.ClientID %>';
         $find(ModalControl).hide();
         }

        function script2(){
            var clickButton = document.getElementById("<%= btnBusAg.ClientID %>");
            clickButton.click();
        }
        
        function validate() {
            var wdMenu = $find("wdMenu");
            $("[id$='wdMenu'] a").each(function () {
                a = $(this).text();
                if (a == "CONSULTA") {
                    var txtCed = document.getElementById("<%= txtIden.ClientID %>");
                    if (txtCed.value.length > 0) {
                        var clickButton = document.getElementById("<%= btn_valida.ClientID %>");
                        clickButton.click();
                    }
                }
            });
            //var a = wdMenu.getItems().getItem(0).get_text();
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

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
        
        function whdgAgen_RowSelectionChanged(sender, eventArgs) {
            var rows = eventArgs.getSelectedRows();
            var selectedRow = rows.getItem(0);
            var Submission = selectedRow.get_dataKey();
            var Agen = document.getElementById('<%= Agen.ClientID %>');
            if (Agen.value == 1) {
                var txt = document.getElementById('<%= txtAgen.ClientID %>');
                txt.value = '';
                //alert(selectedRow.get_cellByColumnKey("AGENOM").get_text().split(']')[0]);
                txt.value = '[' + Submission + '] - ' + selectedRow.get_cellByColumnKey("AGENOM").get_text().split(']')[1];
            } else {
                var txt = document.getElementById('<%= txtAgen1.ClientID %>');
                txt.value = '';
                //alert(selectedRow.get_cellByColumnKey("AGENOM").get_text().split(']')[0]);
                txt.value = '[' + Submission + '] - ' + selectedRow.get_cellByColumnKey("AGENOM").get_text().split(']')[1];
            }
            generate('alert', 'Agente agregado correctamente.');
        }

        function whdg_RowSelectionChanged(sender, eventArgs) {
            var rows = eventArgs.getSelectedRows();
            var selectedRow = rows.getItem(0);
            var Submission = selectedRow.get_dataKey();
            document.getElementById("<%= hdfAgrupa.ClientID %>").value = Submission;
            var clickButton = document.getElementById("<%= btn_Agrupaciones.ClientID %>");
            clickButton.click();
        }

        function changeText(value, text) {
            var grid = $find("wdgAgrupacion");
            grid.get_behaviors().get_selection().get_selectedRows(0).getItem(0).get_cellByColumnKey("BoundColumn_3").set_value(text);
            grid.get_behaviors().get_selection().get_selectedRows(0).getItem(0).get_cellByColumnKey("BoundColumn_1").set_value(value);
        }

        function WebDropDown1_valueChanged(sender, evntArgs) {
            var value = $find("<%= wdpDAgrupa.ClientID %>").get_selectedItem().get_value();
            var text = $find("<%= wdpDAgrupa.ClientID %>").get_selectedItem().get_text();
            var splitText = text.split("]");
            var splitValue = value.split("-");
            changeText(splitValue[1], splitText[1]);
        }
            
        function DeleteRow() {
            var grid = $find('<%= wdgContactos.ClientID %>');
            var gridRows = grid.get_rows()

            var selectedRows = grid.get_behaviors().get_selection().get_selectedRows();
            for (var i = selectedRows.get_length() - 1; i >= 0; i--) {
                var row = selectedRows.getItem(i);
                gridRows.remove(row);
            }
        }

        function DeleteRowDir() {
            var grid = $find('<%= wdgDirEnt.ClientID %>');
            var gridRows = grid.get_rows()

            var selectedRows = grid.get_behaviors().get_selection().get_selectedRows();
            for (var i = selectedRows.get_length() - 1; i >= 0; i--) {
                var row = selectedRows.getItem(i);
                gridRows.remove(row);
            }
        }
    </script>
</asp:Content>
