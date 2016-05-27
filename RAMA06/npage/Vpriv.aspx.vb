Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Vpriv
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
            Dim sql As String = "SELECT rID FROM oos_foundpriv WHERE IDpriv = @IDpriv"
            Dim cmd As New SqlCommand(sql)
            cmd.Parameters.AddWithValue("@IDpriv", hdfid.Value)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    fShowPic(nDt.Rows(0).Item("rID"))
                End If
            End If

        End If
    End Sub

    Private Sub fShowDetail(ByVal pID As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oos_foundpriv WHERE IDpriv = '" & pID & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbprivHead.Text = nDt.Rows(0).Item("privHead")

                Literal1.Text = nDt.Rows(0).Item("privdetail")
                'tbnewdetail.Text = Literal1.Text


            End If
        End If
    End Sub

    Private Sub fShowPic(ByVal id As Integer)
        Dim nDt As DataTable

        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_foundpriv ASC) AS row,* FROM oss_imgfoundpriv WHERE rID='" & id & "'"
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
            sql = "SELECT renamefile FROM oss_imgfoundpriv WHERE id_imgoss_foundpriv = '" & nID & "'"
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