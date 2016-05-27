Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class About
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

           

            Dim nDt As DataTable

            Dim sql As String
            sql = "SELECT * FROM oss_about"
            Dim cmd As New SqlCommand(sql)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then

                    Literal1.Text = nDt.Rows(0).Item("aboutdetail")

                Else

                End If


            End If
        End If
    End Sub

End Class