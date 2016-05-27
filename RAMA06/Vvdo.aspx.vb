Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Vvdo
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

#Region "EVEN"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            'fBindePaging()
            'fShowData(1)
            BindGrid()
        End If
    End Sub

    

    'Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
    '    If e.CommandName = "aname" Then
    '        'Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
    '        'hdfIDmanual.Value = ndutyID
    '        'showvideo(hdfIDmanual.Value)
    '        'mutiview1.SetActiveView(viewdisplay)

    '    End If
    'End Sub

    'Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
    '    fBindePaging()
    '    fShowData(1)

    '    mutiview1.SetActiveView(viewshow)

    'End Sub

    'Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
    '    fShowData(ddlPage.SelectedValue)
    'End Sub

    'Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
    '    fBindePaging()
    '    fShowData(1)
    'End Sub
#End Region

#Region "FUNCTION"
    'Private Sub fShowData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
    '    gvData.DataSource = fReadData(pPage, pSortDirection)
    '    gvData.DataBind()
    'End Sub

    'Private Function fReadData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
    '    Dim nUser As cUser = Session("cUser")
    '    Dim nPageSize As Integer = gvData.PageSize
    '    Dim nSb As New System.Text.StringBuilder
    '    nSb.Append("select * from ( ")
    '    nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDvideo ) AS row,*  ")
    '    nSb.Append("from oss_video where 1=1")
    '    nSb.Append(fGetSearchStr())
    '    nSb.Append(") AS a ")
    '    nSb.Append(String.Format(" where row between {0} and {1} order by IDvideo",
    '                             ((pPage - 1) * nPageSize) + 1,
    '                             ((pPage - 1) * nPageSize) + nPageSize))
    '    Dim nComd As New SqlCommand(nSb.ToString)
    '    fSetCommandFilterValue(nComd)
    '    Dim nDt As DataTable

    '    If mDB.fReadDataTable(nComd, nDt) Then
    '        If pSortDirection <> "" Then
    '            nDt = nDt.Select("", pSortDirection).CopyToDataTable
    '        End If
    '    End If
    '    Return nDt
    'End Function

    'Private Sub fBindePaging()
    '    Dim nSb As New System.Text.StringBuilder
    '    nSb.Append("select count(*) from oss_video where 1=1 ")
    '    nSb.Append(fGetSearchStr())
    '    Dim nVal As Integer
    '    Dim nComd As New SqlCommand(nSb.ToString)
    '    fSetCommandFilterValue(nComd)
    '    mDB.fReadTopData(nComd, nVal)
    '    If nVal > 0 Then
    '        Dim nPage As Integer = Math.Ceiling(nVal / gvData.PageSize)
    '        lblAllPage.Text = nPage
    '        ddlPage.Items.Clear()
    '        For i = 1 To nPage
    '            ddlPage.Items.Insert(i - 1, New ListItem(i, i))
    '        Next
    '    End If
    'End Sub

    'Private Sub fSetCommandFilterValue(ByRef pCommand As SqlCommand)
    '    With pCommand.Parameters
    '        .AddWithValue("@searchTxt", "%" & txtSearch.Text & "%")
    '    End With
    'End Sub

    'Private Function fGetSearchStr() As String
    '    Dim nValue As String = ""
    '    If txtSearch.Text <> "" Then nValue &= " and (Headvideo like @searchTxt )"
    '    Return nValue
    'End Function

    Private Sub showvideo(ByVal id As String)
        'ifrem.Src = ("npage/VideoHandler.ashx?IDvideo=" + id)
        'Me.ifrem.Attributes("src") = ("npage/VideoHandler.ashx?IDvideo=" + id)
    End Sub

#End Region


    Private Function GetSpecificVideo(i As Object) As DataTable
        'pass the id of the video
        Dim con As New SqlConnection("Data Source=SQL2008;Initial Catalog=TestKp;User ID=kp;Password=1234")
        con.Open()
        Dim adapter As New SqlDataAdapter("SELECT Video, IDvideo " + "FROM oss_video WHERE IDvideo = @IDvideo", con)
        adapter.SelectCommand.Parameters.Add("@IDvideo", SqlDbType.Int).Value = CInt(i)
        Dim table As New DataTable()
        adapter.Fill(table)
        Return table
    End Function

    Private Sub BindGrid()
     

        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_video order by IDvideo asc"
        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                DataList1.DataSource = nDt
                DataList1.DataBind()
            End If
        End If



    End Sub

    
End Class