<%@ Page Language="C#" %>

<%@ Register assembly="Telerik.ReportViewer.Html5.WebForms, Version=12.2.18.1017, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" namespace="Telerik.ReportViewer.Html5.WebForms" tagprefix="telerik" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<script runat="server">
    ClsInfo test = new ClsInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        //grd.DataSource = test.GetTest('%','%','%','%','%','%','%','%','%','%','%','%','%','%','%','%','1');
        //grd.DataBind();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server">
        </rsweb:ReportViewer>
    </form>
</body>
</html>
