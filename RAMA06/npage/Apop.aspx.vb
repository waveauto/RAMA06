Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Apop
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim value1 As String = Request.QueryString("value1")


            Dim nDt As DataTable
            Dim sql As String = "SELECT * FROM oss_person WHERE codestaff='" & value1 & "'"
            Dim cmd As New SqlCommand(sql)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    tbcodestaff.Text = nDt.Rows(0).Item("codestaff")
                    tbposition.Text = nDt.Rows(0).Item("position")
                    tbrank.Text = nDt.Rows(0).Item("rank")
                    tbeducation.Text = nDt.Rows(0).Item("education")
                    tbprofession.Text = nDt.Rows(0).Item("profession")
                    tbdignity.Text = nDt.Rows(0).Item("dignity")
                    tbfname.Text = nDt.Rows(0).Item("fname")
                    tbname.Text = nDt.Rows(0).Item("name")
                    tbtel.Text = nDt.Rows(0).Item("tel")
                    tbmobile.Text = nDt.Rows(0).Item("mobile")
                    tbemail.Text = nDt.Rows(0).Item("email")
                    Image1.ImageUrl = "~/IMGT.ashx?IMID=" + nDt.Rows(0).Item("codestaff")




                End If
            End If

        End If
    End Sub

End Class