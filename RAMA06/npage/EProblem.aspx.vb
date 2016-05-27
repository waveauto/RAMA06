Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class EProblem
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If mFunc.fCheckSession() Then
                Dim value1 As String = Request.QueryString("value1")
                hdfid.Value = value1
                fShowDetail(hdfid.Value)

                Dim nDt As DataTable
                Dim sql As String = "SELECT rID FROM oss_Problems WHERE IDProblems = @IDProblems"
                Dim cmd As New SqlCommand(sql)
                cmd.Parameters.AddWithValue("@IDProblems", hdfid.Value)
                If mDB.fReadDataTable(cmd, nDt) Then
                    If nDt.Rows.Count > 0 Then
                        hdfrid.Value = nDt.Rows(0).Item("rID")
                        fShowPic(nDt.Rows(0).Item("rID"))
                    End If
                End If



            End If
        End If
    End Sub

    Private Sub fShowPic(ByVal id As Integer)
        Dim nDt As DataTable

        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_Problems ASC) AS row,* FROM oss_imgproblem WHERE rID='" & id & "'"
        Dim cmd As New SqlCommand(strsql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                gvpic.DataSource = nDt
                gvpic.DataBind()
            End If
        End If
    End Sub

    Private Sub fShowDetail(ByVal pID As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_Problems WHERE IDProblems = '" & pID & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbEProblemshead.Text = nDt.Rows(0).Item("Problemshead")

                ltrEProblems.Text = nDt.Rows(0).Item("Problemsdetial")
                tbEProblemsdetial.Text = ltrEProblems.Text

                tbEdatesend.Text = nDt.Rows(0).Item("datesend")
            End If
        End If
    End Sub


    Protected Sub btnEback_Click(sender As Object, e As EventArgs) Handles btnEback.Click
        Response.Redirect("~/npage/ProblemsandSuggestions.aspx")
    End Sub

    Protected Sub btnEsave_Click(sender As Object, e As EventArgs) Handles btnEsave.Click
        Dim nValue As String
        If mFunc.fCheckSession Then
            If fUpdateData(nValue) Then
                ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
            End If
        End If

    End Sub

    Private Function fUpdateData(ByRef pValue As String) As Boolean
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_Problems set ")
        nSb.Append("Problemshead = @Problemshead,Problemsdetial = @Problemsdetial ")
        nSb.Append("where IDProblems = @IDProblems")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters
            .AddWithValue("@Problemshead", tbEProblemshead.Text)
            .AddWithValue("@Problemsdetial", tbEProblemsdetial.Text)


            .AddWithValue("@IDProblems", hdfid.Value)
        End With
    End Sub

    Public Enum MessageType
        Success
        [Error]
        Info
        Warning
    End Enum

    Protected Sub ShowMessage(Message As String, type As MessageType)
        ScriptManager.RegisterStartupScript(Me, Me.[GetType](), System.Guid.NewGuid().ToString(), "ShowMessage('" & Message & "','" & type.ToString() & "');", True)
    End Sub

    Private Sub clstb()
        tbEProblemshead.Text = ""
        tbEProblemsdetial.Text = ""
        tbEdatesend.Text = ""
    End Sub

    Private Sub gvpic_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvpic.RowCommand
        If mFunc.fCheckSession Then

            If e.CommandName = "aviewfile" Then
                Dim nDt As DataTable
                Dim nID As Integer = gvpic.DataKeys(e.CommandArgument).Value
                Dim sql As String
                sql = "SELECT renamefile FROM oss_imgproblem WHERE id_imgoss_Problems = '" & nID & "'"
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

                'ElseIf e.CommandName = "aDel" Then

                'Dim nValue As String
                'Dim nID As Integer = gvpic.DataKeys(e.CommandArgument).Value
                'Dim nDt As DataTable

                'Dim sqldelimg As String
                'Dim namefile As String
                'sqldelimg = "SELECT renamefile FROM oss_imgproblem WHERE id_imgoss_Problems ='" & nID & "'"

                'Dim cmd As New SqlCommand(sqldelimg)

                'If mDB.fReadDataTable(cmd, nDt) Then
                '    If nDt.Rows.Count > 0 Then
                '        namefile = nDt.Rows(0).Item("renamefile")

                '        Dim FileToDelete As String
                '        ' Set full path to file
                '        FileToDelete = Server.MapPath("~/files-uploads/") & namefile
                '        ' Delete a file
                '        File.Delete(FileToDelete)

                '    End If
                'End If

                'Dim sqldelete As String = "DELETE FROM oss_imgproblem WHERE id_imgoss_Problems='" & nID & "'"
                'Dim cmddel As New SqlCommand(sqldelete)

                'If mDB.fExecuteCommand(cmddel, nValue) Then
                '    BindGrid()
                'End If

            End If
        End If
    End Sub
End Class