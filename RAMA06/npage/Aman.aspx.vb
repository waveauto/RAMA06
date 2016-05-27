Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Aman
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

    Protected Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        If mFunc.fCheckSession Then
            multiview1.SetActiveView(viewadd)
        End If

    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String
        If fSaveData(nValue) Then
            clstb()
            ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
        End If

    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        fBindePaging()
        fShowData(1)
        multiview1.SetActiveView(viewshow)

    End Sub

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If e.CommandName = "aEdit" Then
            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
            hdfIDmanual.Value = ndutyID

            Response.Redirect("~/nPage/Eman.aspx?value1=" + hdfIDmanual.Value)
        End If

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
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDmanual) AS row,*  ")
        nSb.Append("from oss_manual where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDmanual",
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
        nSb.Append("select count(*) from oss_manual where 1=1 ")
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

    Private Sub fSetCommandFilterValue(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@searchTxt", "%" & txtSearch.Text & "%")
        End With
    End Sub

    Private Function fGetSearchStr() As String
        Dim nValue As String = ""
        If txtSearch.Text <> "" Then nValue &= " and (Headmanual like @searchTxt )"
        Return nValue
    End Function

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
        tbHeadmanual.Text = ""
        tbdetailmanual.Text = ""
    End Sub

    Private Function fSaveData(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_manual(Headmanual,detailmanual,show,codestaff) ")
        nSb.Append("values(@Headmanual,@detailmanual,@show,@codestaff)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValue(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters
            .AddWithValue("@Headmanual", tbHeadmanual.Text)
            .AddWithValue("@detailmanual", tbdetailmanual.Text)

            .AddWithValue("@show", 0)
            .AddWithValue("@codestaff", nUser.tUserID)

        End With
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
            nSb.Append("update oss_manual set show=@show ")
            nSb.Append("where IDmanual = @IDmanual")
            Dim nComd As New SqlCommand(nSb.ToString)
            With nComd
                .Parameters.AddWithValue("@show", nStatus)
                .Parameters.AddWithValue("@IDmanual", dutyID)
            End With
            Dim nValue As String = ""
            If mDB.fExecuteCommand(nComd, nValue) = False Then
                mTool.fShowMsgBox(Me, "ไม่สามารถปรับปรุงสถานะได้")
            End If
        End If
    End Sub
#End Region

End Class