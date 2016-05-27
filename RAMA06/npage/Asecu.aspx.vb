Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Asecu
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

#Region "EVEN"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If mFunc.fCheckSession() Then
                showlevel()
                fBindePaging()
                fShowData(1)
            End If
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        fBindePaging()
        fShowData(1)
    End Sub

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If e.CommandName = "aDit" Then

            Dim ndutyID As String = gvData.DataKeys(e.CommandArgument).Value
            hdfid.Value = ndutyID

            showdataperson(hdfid.Value)
            mutiview1.SetActiveView(viewedit)
        End If
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String
        If fUpdateData(nValue) Then
            ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)

        End If
        showdataperson(hdfid.Value)
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        fBindePaging()
        fShowData(1)
        mutiview1.SetActiveView(viewshow)

    End Sub

#End Region


#Region "FUNCTION"
    Private Sub fBindePaging()
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select count(*) from view_user_info where 1=1 ")
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
        If txtSearch.Text <> "" Then nValue &= " and (name like @searchTxt )"
        Return nValue
    End Function

    Private Sub fSetCommandFilterValue(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@searchTxt", "%" & txtSearch.Text & "%")
        End With
    End Sub

    Private Sub fShowData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvData.DataSource = fReadData(pPage, pSortDirection)
        gvData.DataBind()
    End Sub

    Private Function fReadData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nUser As cUser = Session("cUser")
        Dim nPageSize As Integer = gvData.PageSize
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select * from ( ")
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY codestaff) AS row,*  ")
        nSb.Append("from view_user_info where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by codestaff",
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

    Private Sub showdataperson(ByVal codestaff As String)
        Dim nDt As DataTable

        Dim sql As String = "SELECT * FROM view_user_info WHERE codestaff='" & codestaff & "'"
        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then

            'Image1.ImageUrl = ("IMGT.ashx?IMID=" + nUser.tUserID)


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
            tblevel.Text = nDt.Rows(0).Item("namelevel")
            Image1.ImageUrl = "~/IMGT.ashx?IMID=" + nDt.Rows(0).Item("codestaff")
        End If
    End Sub

    Private Sub showlevel()
        Dim strSQL As String
        Dim nDt As DataTable

        strSQL = " SELECT * "
        strSQL &= " FROM oss_level "
        strSQL &= " ORDER BY IDlevel desc"

        Dim cmd As New SqlCommand(strSQL)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                With Me.ddllevel
                    .DataSource = nDt
                    .DataTextField = "namelevel"
                    .DataValueField = "IDlevel"
                    .DataBind()

                End With
            End If
        End If


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
        nSb.Append("update oss_authen set ")
        nSb.Append("IDlevel = @IDlevel ")
        nSb.Append("where codestaff=@codestaff")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        'Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters
            .AddWithValue("@IDlevel", ddllevel.SelectedValue)
            .AddWithValue("@codestaff", hdfid.Value)
        End With
    End Sub
#End Region

End Class