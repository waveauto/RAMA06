﻿
Imports System.Web
Imports System.Data.SqlClient
Imports System.Web.Services

Public Class VideoHandler
    Implements System.Web.IHttpHandler

    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest


        Dim id As Integer = Integer.Parse(context.Request.QueryString("id"))
        Dim bytes As Byte()
        Dim contentType As String
        Dim con As New SqlConnection("Data Source=SQL2008;Initial Catalog=TestKp;User ID=kp;Password=1234")
        Dim name As String

        Using cmd As New SqlCommand()
            cmd.CommandText = "select * from oss_video where IDvideo=@IDvideo"
            cmd.Parameters.AddWithValue("@IDvideo", id)
            cmd.Connection = con
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader()
            sdr.Read()
            bytes = DirectCast(sdr("video"), Byte())
            name = sdr("video_name").ToString()
            con.Close()
        End Using

        context.Response.Clear()
        context.Response.Buffer = True
        context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + name)
        context.Response.ContentType = contentType
        context.Response.BinaryWrite(bytes)
        context.Response.[End]()


    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class