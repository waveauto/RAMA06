Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class popvdo
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim value1 As String = Request.QueryString("value1")
            'fBindePaging()
            'fShowData(1)
            BindGrid(value1)
        End If
    End Sub

    Private Sub BindGrid(ByVal id As Integer)


        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_popup WHERE PopID='" & id & "'"
        Dim cmd As New SqlCommand(Sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                DataList1.DataSource = nDt
                DataList1.DataBind()
            End If
        End If



    End Sub

End Class