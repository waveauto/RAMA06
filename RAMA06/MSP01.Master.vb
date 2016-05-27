Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Public Class MSP01
    Inherits System.Web.UI.MasterPage

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If mFunc.fCheckSession Then
            Dim nUser As cUser = Session("cUser")
            Dim nDt As DataTable

            lblFullName.Text = nUser.tFullName
            Image1.ImageUrl = ("ImageHandler.ashx?IMID=" + nUser.tUserID)

            Dim sql As String = "SELECT * FROM oss_footer WHERE show='1'"
            Dim cmd As New SqlCommand(sql)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    Label1.Text = nDt.Rows(0).Item("headfoot")
                    Label2.Text = nDt.Rows(0).Item("midfoot")
                    Label3.Text = nDt.Rows(0).Item("footfoot")
                Else
                    Label1.Text = ""
                    Label2.Text = ""
                    Label3.Text = ""
                End If
            End If
        End If

    End Sub

End Class