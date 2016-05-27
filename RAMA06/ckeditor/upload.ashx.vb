Imports System.Web
Imports System.Web.Services

Public Class upload
    Implements System.Web.IHttpHandler

    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim uploads As HttpPostedFile = context.Request.Files("upload")
        Dim CKEditorFuncNum As String = context.Request("CKEditorFuncNum")
        Dim file As String = System.IO.Path.GetFileName(uploads.FileName)

        Dim prefig As String = Now.ToString("yyMMddHHmmss")
        uploads.SaveAs(context.Server.MapPath("~\") + "\\imgAdvice\\" & prefig & file)
        Dim url As String = "../imgAdvice/" & prefig & file
        context.Response.Write("<script>window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ", """ + url + """);</script>")
        context.Response.End()
    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class