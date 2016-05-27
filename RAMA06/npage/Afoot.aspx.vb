Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Afoot
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

#Region "EVEN"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If mFunc.fCheckSession() Then
                fBindePaging()
                fShowData(1)
            End If
        End If
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        fBindePaging()
        fShowData(1)
        mutiview1.SetActiveView(viewshow)

    End Sub

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        fBindePaging()
        fShowData(1)
    End Sub

    Protected Sub chkStatus_CheckedChanged(sender As Object, e As EventArgs)
        If mFunc.fCheckSession() Then
            Dim chkreleased As CheckBox = DirectCast(sender, CheckBox)
            Dim row As GridViewRow = DirectCast(chkreleased.NamingContainer, GridViewRow)
            Dim dutyID As String = gvData.DataKeys(row.RowIndex).Value.ToString()

            Dim nUser As cUser = Session("cUser")
            Dim nChk As CheckBox = CType(sender, CheckBox)
            Dim nStatus As String
            nStatus = IIf(nChk.Checked, "1", "0")
            Dim nSb As New System.Text.StringBuilder
            nSb.Append("update oss_footer set show=@show ")
            nSb.Append("where IDfoot = @IDfoot")
            Dim nComd As New SqlCommand(nSb.ToString)
            With nComd
                .Parameters.AddWithValue("@show", nStatus)
                .Parameters.AddWithValue("@IDfoot", dutyID)
            End With
            Dim nValue As String = ""
            If mDB.fExecuteCommand(nComd, nValue) = False Then
                mTool.fShowMsgBox(Me, "ไม่สามารถปรับปรุงสถานะได้")
            End If
        End If
    End Sub

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If e.CommandName = "aEdit" Then

            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
            hdfid.Value = ndutyID
            hdfmode.Value = "EDIT"
            mutiview1.SetActiveView(viewadd)
            showdatafoot(hdfid.Value)

        End If
    End Sub

    Protected Sub btnEback_Click(sender As Object, e As EventArgs) Handles btnEback.Click
        mutiview1.SetActiveView(viewshow)
        fBindePaging()
        fShowData(1)
    End Sub

    Private Sub gvData_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvData.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = ((ddlPage.SelectedValue - 1) * gvData.PageSize) + e.Row.RowIndex + 1
            With CType(e.Row.FindControl("chkStatus"), CheckBox)
                .Checked = DataBinder.Eval(e.Row.DataItem, "show")
            End With
            'With CType(e.Row.FindControl("lblMenuName"), Label)
            '    .Text = DataBinder.Eval(e.Row.DataItem, "menu_name2")
            'End With
        End If
    End Sub

    Protected Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        mutiview1.SetActiveView(viewadd)
        hdfmode.Value = "NEW"
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        If mFunc.fCheckSession Then
            Dim nValue As String
            Select Case hdfmode.Value
                Case "NEW"
                    If fSaveData(nValue) Then
                        clstb()
                        hdfmode.Value = "NEW"
                        ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                    End If
                Case "EDIT"
                    If fUpdateData(nValue) Then
                        clstb()
                        hdfmode.Value = "NEW"
                        ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                    Else
                        ShowMessage("ไม่สามารถบันทึกข้อมูลได้", MessageType.Error)

                    End If
            End Select




        End If

    End Sub

    Protected Sub btnEsave_Click(sender As Object, e As EventArgs) Handles btnEsave.Click

    End Sub
    Protected Sub gvData_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvData.SelectedIndexChanged

    End Sub
#End Region

#Region "FUNCTION"
    Private Sub fShowData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvData.DataSource = fReadData(pPage, pSortDirection)
        gvData.DataBind()
    End Sub

    Private Function fReadData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nUser As cUser = Session("cUser")
        Dim nPageSize As Integer = gvData.PageSize
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select * from ( ")
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDfoot) AS row,*  ")
        nSb.Append("from oss_footer where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDfoot",
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

    Private Sub fBindePaging()
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select count(*) from oss_footer where 1=1 ")
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

    Private Function fGetSearchStr() As String
        Dim nValue As String = ""
        If txtSearch.Text <> "" Then nValue &= " and (namedept like @searchTxt )"
        Return nValue
    End Function

    Private Sub fSetCommandFilterValue(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@searchTxt", "%" & txtSearch.Text & "%")
        End With
    End Sub

    Private Sub showdatafoot(ByVal id As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_footer WHERE IDfoot='" & id & "'"
        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbheadfoot.Text = nDt.Rows(0).Item("headfoot")
                tbmidfoot.Text = nDt.Rows(0).Item("midfoot")
                tbfootfoot.Text = nDt.Rows(0).Item("footfoot")
                tbnamedept.Text = nDt.Rows(0).Item("namedept")
            End If
        End If
    End Sub

    Private Function fUpdateData(ByRef pValue As String) As Boolean
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_footer set ")
        nSb.Append("headfoot = @headfoot,midfoot = @midfoot,footfoot = @footfoot,namedept = @namedept ")
        nSb.Append("where IDfoot=@IDfoot")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)

        With pCommand.Parameters
            .AddWithValue("@headfoot", tbheadfoot.Text)
            .AddWithValue("@midfoot", tbmidfoot.Text)
            .AddWithValue("@footfoot", tbfootfoot.Text)
            .AddWithValue("@namedept", tbnamedept.Text)
            .AddWithValue("@IDfoot", hdfid.Value)
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
        tbheadfoot.Text = ""
        tbmidfoot.Text = ""
        tbfootfoot.Text = ""
        tbnamedept.Text = ""
        tbEheadfoot.Text = ""
        tbEmidfoot.Text = ""
        tbEfootfoot.Text = ""
        tbEnamedept.Text = ""
    End Sub

    Private Function fSaveData(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_footer(headfoot,midfoot,footfoot,show,namedept) ")
        nSb.Append("values(@headfoot,@midfoot,@footfoot,@show,@namedept)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValue(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters
            .AddWithValue("@headfoot", tbheadfoot.Text)
            .AddWithValue("@midfoot", tbmidfoot.Text)
            .AddWithValue("@footfoot", tbfootfoot.Text)
            .AddWithValue("@show", 0)
            .AddWithValue("@namedept", tbnamedept.Text)

        End With
    End Sub



#End Region

End Class