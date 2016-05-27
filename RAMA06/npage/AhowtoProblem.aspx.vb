Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class AhowtoProblem
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If mFunc.fCheckSession() Then
                fBindePaging()
                fShowData(1)
            End If
        End If
    End Sub

    Private Sub fBindePaging()
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select count(*) from oss_Problems where 1=1 ")
        nSb.Append(fGetSearchStr())
        Dim nVal As Integer
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCommandFilterValue(nComd)
        mDB.fReadTopData(nComd, nVal)
        If nVal > 0 Then
            Dim nPage As Integer = Math.Ceiling(nVal / gvData.PageSize)
            lblAllPage.Text = nPage
            ddlPage.Items.Clear()
            For i = 1 To nPage
                ddlPage.Items.Insert(i - 1, New ListItem(i, i))
            Next
        End If
    End Sub

    Private Function fReadData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nUser As cUser = Session("cUser")
        Dim nPageSize As Integer = gvData.PageSize
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select * from ( ")
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDProblems) AS row,*  ")
        nSb.Append("from oss_Problems where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDProblems",
                                 ((pPage - 1) * nPageSize) + 1,
                                 ((pPage - 1) * nPageSize) + nPageSize))
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCommandFilterValue(nComd)
        Dim nDt As DataTable

        If mDB.fReadDataTable(nComd, nDt) Then
            If pSortDirection <> "" Then
                nDt = nDt.Select("", pSortDirection).CopyToDataTable
            End If
        End If
        Return nDt
    End Function

    Private Sub fShowData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvData.DataSource = fReadData(pPage, pSortDirection)
        gvData.DataBind()
    End Sub

    Private Function fGetSearchStr() As String
        Dim nValue As String = ""
        If txtSearch.Text <> "" Then nValue &= " and (Problemshead like @searchTxt ) or (name like @searchTxt )"
        Return nValue
    End Function

    Private Sub fSetCommandFilterValue(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@searchTxt", "%" & txtSearch.Text & "%")
        End With
    End Sub

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Private Sub showdetailpic(ByVal ID As Integer)
   

        Dim nDt As DataTable
        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_Problems ASC) AS row,* FROM oss_imgproblem WHERE rID='" & ID & "'"

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

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand

        If mFunc.fCheckSession Then
            If e.CommandName = "aEdit" Then

                Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
                hdfid.Value = ndutyID


                fShowDetail(hdfid.Value)

                Dim nDt As DataTable
                Dim sql As String = "SELECT rID FROM oss_Problems WHERE IDProblems = @IDProblems"
                Dim cmd As New SqlCommand(sql)
                cmd.Parameters.AddWithValue("@IDProblems", hdfid.Value)
                If mDB.fReadDataTable(cmd, nDt) Then
                    If nDt.Rows.Count > 0 Then
                        hdfrid.Value = nDt.Rows(0).Item("rID")
                        showdetailpic(nDt.Rows(0).Item("rID"))
                    End If
                End If






                multiview.SetActiveView(viewhowto)
            ElseIf e.CommandName = "aname" Then
                Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
                Dim nDt As DataTable
                Dim sql As String = "SELECT codestaff FROM oss_Problems WHERE IDProblems='" & ndutyID & "'"
                Dim codestaff As String
                Dim cmd As New SqlCommand(sql)
                If mDB.fReadDataTable(cmd, nDt) Then
                    If nDt.Rows.Count > 0 Then
                        codestaff = nDt.Rows(0).Item("codestaff")
                        Dim url As String = "Apop.aspx?value1=" + codestaff
                        Dim sb As New StringBuilder()
                        sb.Append("<script type = 'text/javascript'>")
                        sb.Append("window.open('")
                        sb.Append(url)
                        sb.Append("');")
                        sb.Append("</script>")
                        ClientScript.RegisterStartupScript(Me.GetType(), _
                                  "script", sb.ToString())
                    End If
                End If

            End If

        End If

    End Sub

    Private Sub fShowDetail(ByVal ID As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_Problems WHERE IDProblems = '" & ID & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then

                tbProblemshead.Text = nDt.Rows(0).Item("Problemshead")
                ltrdetail.Text = nDt.Rows(0).Item("Problemsdetial")

            End If
        End If
    End Sub


    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        fBindePaging()
        fShowData(1)
        multiview.SetActiveView(viewshow)
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

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String

        If mFunc.fCheckSession Then
            If fUpdateData(nValue) Then

                hdfmode.Value = "NEW"
                ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
            End If
        End If

    End Sub

    Private Function fUpdateData(ByRef pValue As String) As Boolean
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_Problems set ")
        nSb.Append("statusProblems = @statusProblems,howto = @howto,howtodetail = @howtodetail,Acodestaff = @Acodestaff ")
        nSb.Append("where IDProblems = @IDProblems")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")

        If rdreligious1.Checked = True Then
            With pCommand.Parameters
                .AddWithValue("@statusProblems", rdreligious1.Text)
                .AddWithValue("@howto", "")
                .AddWithValue("@howtodetail", "")
                .AddWithValue("@Acodestaff", nUser.tUserID)
                .AddWithValue("@IDProblems", hdfid.Value)
            End With
        ElseIf rdreligious2.Checked = True Then
            With pCommand.Parameters
                .AddWithValue("@statusProblems", rdreligious2.Text)
                .AddWithValue("@howto", "")
                .AddWithValue("@howtodetail", "")
                .AddWithValue("@Acodestaff", nUser.tUserID)
                .AddWithValue("@IDProblems", hdfid.Value)
            End With
        ElseIf rdreligious3.Checked = True Then
            With pCommand.Parameters
                .AddWithValue("@statusProblems", rdreligious3.Text)
                .AddWithValue("@howto", "วิธีแก้ปัญหา")
                .AddWithValue("@howtodetail", tbProblemsdetial.Text)
                .AddWithValue("@Acodestaff", nUser.tUserID)
                .AddWithValue("@IDProblems", hdfid.Value)
            End With
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        fBindePaging()
        fShowData(1)
    End Sub

    Private Sub gvpic_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvpic.RowCommand
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
    End Sub
End Class