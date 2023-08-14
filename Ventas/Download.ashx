<%@ WebHandler Language="C#" Class="Download" %>

using System;
using System.IO;
using System.Web;

public class Download : IHttpHandler
{
    //private const string FilesDirectory = "\\\\10.10.3.26\\ece\AJE-YAMAHA\FA\";

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.QueryString == null || context.Request.QueryString["id"] == null)
        {
            return;
        }

        var id = int.Parse(context.Request.QueryString["id"]);
        var fullPath = context.Request.QueryString["ruta"];
        var file = context.Request.QueryString["file"];

        var filename = ConvertReportIdToFileName(id, file);

        //var fullPath = Path.Combine(HttpContext.Current.Server.MapPath(ruta), filename);

        var contentType = GetContentType(filename);

        using (var reader = new StreamReader(fullPath))
        {
            var result = reader.ReadToEnd();
            context.Response.Buffer = false;
            context.Response.Clear();
            context.Response.ClearContent();
            context.Response.ClearHeaders();
            context.Response.ContentType = contentType;
            context.Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}", filename));
            if(id==2)
                context.Response.TransmitFile(fullPath);
            context.Response.Write(result);
            context.Response.End();
        }
    }

    private string ConvertReportIdToFileName(int reportId, string file)
    {
        switch (reportId)
        {
            case 1:
                return file + ".xml";
            case 2:
                return file + ".pdf";
            default:
                throw new ArgumentException("Unknown ReportId");
        }
    }

    private string GetContentType(string file)
    {
        var fileExtension = file.Substring(file.Length - 4, 4).Replace(".", "");

        switch (fileExtension)
        {
            case "xlsx":
                return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            case "docx":
                return "application/vnd.openxmlformats-officedocument.wordprocessingml.document";

            case "pdf":
                return "Application/pdf";

            case "json":
                return "text/json";

            case "xml":
                return "text/xml";

            default:
                return "unknown";
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}