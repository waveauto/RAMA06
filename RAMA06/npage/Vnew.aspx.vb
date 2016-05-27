Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Vnew
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim value1 As String = Request.QueryString("value1")

            hdfid.Value = value1

            fShowDetail(hdfid.Value)

            Dim nDt As DataTable
            Dim sql As String = "SELECT rID FROM oss_new WHERE IDNew = @IDNew"
            Dim cmd As New SqlCommand(sql)
            cmd.Parameters.AddWithValue("@IDNew", hdfid.Value)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    fShowPic(nDt.Rows(0).Item("rID"))
                End If
            End If






        End If
    End Sub

    Private Sub fShowDetail(ByVal pID As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_new WHERE IDNew = '" & pID & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbnewHead.Text = nDt.Rows(0).Item("newHead")

                Literal1.Text = nDt.Rows(0).Item("newdetail")
                'tbnewdetail.Text = Literal1.Text


            End If
        End If
    End Sub

    Private Sub fShowPic(ByVal id As Integer)
        Dim nDt As DataTable

        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_New ASC) AS row,* FROM oss_imgnew WHERE rID='" & id & "'"
        Dim cmd As New SqlCommand(strsql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                gvpic.Visible = True
                gvpic.DataSource = nDt
                gvpic.DataBind()
            Else
                gvpic.Visible = False
            End If
        End If
    End Sub

    Private Sub gvpic_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvpic.RowCommand
        If e.CommandName = "aviewfile" Then
            Dim nDt As DataTable
            Dim nID As Integer = gvpic.DataKeys(e.CommandArgument).Value
            Dim sql As String
            sql = "SELECT renamefile FROM oss_imgnew WHERE id_imgoss_New = '" & nID & "'"
            Dim cmd As New SqlCommand(sql)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    Dim renamefile As String
                    renamefile = nDt.Rows(0).Item("renamefile")

                    Response.ContentType = ContentType
                    Response.AppendHeader("Content-Disposition", ("attachment; filename=" + renamefile))
                    Response.TransmitFile(Server.MapPath("~/files-uploads/" + renamefile))

                    Response.End()

                End If
            End If



        End If
    End Sub
End Class