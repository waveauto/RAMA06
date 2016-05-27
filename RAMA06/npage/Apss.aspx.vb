Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Apss
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
        runrID()
        hdfmode.Value = "NEW"
        multiview1.SetActiveView(viewadd)
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        If mFunc.fCheckSession Then
            Dim nValue As String
            Select Case hdfmode.Value
                Case "NEW"

                    If fSaveData(nValue) Then
                        clstb()
                        runrID()
                        ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                    Else
                        ShowMessage("ไม่สามารถบันทึกข้อมูลได้", MessageType.Error)
                    End If
                Case "EDIT"
                    If fUpdateData(nValue) Then
                        runrID()
                        hdfmode.Value = "NEW"
                        ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                    End If
            End Select
        End If

    End Sub

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If mFunc.fCheckSession Then
            fBindePaging()
            fShowData(1)
        End If
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        fBindePaging()
        fShowData(1)
        multiview1.SetActiveView(viewshow)
    End Sub

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If mFunc.fCheckSession Then
            If e.CommandName = "aname" Then



            ElseIf e.CommandName = "aEdit" Then
                Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
                hdfIDpss.Value = ndutyID
                hdfmode.Value = "EDIT"
                showdatapss(hdfIDpss.Value)

                multiview1.SetActiveView(viewadd)


            ElseIf e.CommandName = "aDel" Then
                Dim pValue As String
                Dim nDt As DataTable

                Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
                hdfIDpss.Value = ndutyID

                Dim sql As String = "DELETE FROM oss_pss WHERE IDpss='" & hdfIDpss.Value & "'"
                Dim cmd As New SqlCommand(sql)
                mDB.fExecuteCommand(cmd, pValue)


                fBindePaging()
                fShowData(1)
            End If
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
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDpss ) AS row,*  ")
        nSb.Append("from oss_pss where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDpss",
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
        nSb.Append("select count(*) from oss_pss where 1=1 ")
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
        If txtSearch.Text <> "" Then nValue &= " and (namepss like @searchTxt )"
        Return nValue
    End Function

    Private Sub runrID()
        Dim nDt As DataTable
        Dim sql As String
        sql = " SELECT MAX(RID) AS RID "
        sql &= " FROM oss_pss "


        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                If IsDBNull(nDt.Rows(0).Item("RID")) Then
                    hdfrID.Value = 1
                Else
                    hdfrID.Value = (CInt(nDt.Rows(0).Item("RID")))
                    hdfrID.Value += 1
                End If
            End If
        End If
    End Sub

    Private Sub clstb()
        tbnamepss.Text = ""
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

    Private Function fUpdateData(ByRef pValue As String) As Boolean

        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_pss set ")
        nSb.Append("pss = @pss,codestaff = @codestaff ")
        nSb.Append("where IDpss = @IDpss")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")


        With pCommand.Parameters
            .AddWithValue("@pss", tbnamepss.Text)
            .AddWithValue("@codestaff", nUser.tUserID)
            .AddWithValue("@IDpss", hdfIDpss.Value)

        End With



    End Sub

    Private Function fSaveData(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_pss(RID,namepss,pss,codestaff) ")
        nSb.Append("values(@RID,@namepss,@pss,@codestaff)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValue(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")

        With pCommand.Parameters

            .AddWithValue("@RID", hdfrID.Value)
            .AddWithValue("@namepss", "รหัสผ่านลำดับที่" & " " & hdfrID.Value)
            .AddWithValue("@pss", tbnamepss.Text)
            .AddWithValue("@codestaff", nUser.tUserID)

        End With
    End Sub

    Private Sub showdatapss(ByVal id As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_pss WHERE IDpss='" & id & "'"
        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbnamepss.Text = nDt.Rows(0).Item("pss")
            End If
        End If
    End Sub

#End Region
End Class