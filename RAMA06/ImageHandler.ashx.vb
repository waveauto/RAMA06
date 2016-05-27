Imports System.Web
Imports System.Data.SqlClient
Imports System.Web.Services

Public Class ImageHandler
    Implements System.Web.IHttpHandler

    Public Sub processrequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
      


        Dim imageid As String = context.Request.QueryString("IMID")
        Dim con As New SqlConnection("Data Source=SQL2008;Initial Catalog=TestKp;User ID=kp;Password=1234")
        con.Open()
        Dim cmd As New SqlCommand(Convert.ToString("select Image from oss_person where codestaff='" & imageid & "'"), con)
        'Dim cmd As New SqlCommand(Convert.ToString("select Image from temp_uploadfilebinary where ImageID='2'"), con)
        Dim dr As SqlDataReader = cmd.ExecuteReader()

        While dr.Read()
            'context.Response.ContentType = "image/jpg"
            context.Response.BinaryWrite(DirectCast(dr("Image"), Byte()))
        End While



        con.Close()
        context.Response.[End]()
    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class