Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class _new
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

    Private Function fGetSearchStr() As String
        Dim nValue As String = ""
        If txtSearch.Text <> "" Then nValue &= " and (newHead like @searchTxt )"
        Return nValue
    End Function

    Private Sub fBindePaging()
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select count(*) from oss_new where 1=1 ")
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

    Private Sub fShowData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvData.DataSource = fReadData(pPage, pSortDirection)
        gvData.DataBind()
    End Sub

    Private Function fReadData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nUser As cUser = Session("cUser")
        Dim nPageSize As Integer = gvData.PageSize
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select * from ( ")
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDNew) AS row,*  ")
        nSb.Append("from oss_new where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDNew",
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

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        fBindePaging()
        fShowData(1)
    End Sub

    Private Function DateToDisplay(ByVal _dateTime As System.DateTime, ByVal _displayTime As Boolean) As String
        Dim _day As String
        Dim _month As String
        Dim _year As String

        Dim _ret As String

        _day = _dateTime.Day.ToString
        If _day.Length = 1 Then _day = "0" + _day
        _month = _dateTime.Month.ToString

        If _month.Length = 1 Then _month = "0" + _month
        '_year = (_dateTime.Year).ToString
        _year = (_dateTime.Year).ToString

        '+ " " + (_dateTime)
        If _displayTime Then
            '_ret = _day + "/" + _month + "/" + _year
            _ret = _year + "/" + _month + "/" + _day

        Else
            _ret = _year + "/" + _month + "/" + _day
            '_ret = _day + "/" + _month + "/" + _year
        End If

        Return _ret
    End Function

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand

        If mFunc.fCheckSession() Then
            If e.CommandName = "aEdit" Then

                'Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
                'hdfid.Value = ndutyID

                'fShowDetail(hdfid.Value)
                'fShowPic(hdfid.Value)

                'mutiview1.SetActiveView(viewdetail)

                Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value

                hdfid.Value = ndutyID

                Dim url As String = "Vnew.aspx?value1=" + hdfid.Value
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

        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_New ASC) AS row,* FROM oss_imgnew WHERE IDNew='" & id & "'"
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


    Private Sub gvData_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvData.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim pValue As String
            Dim datetoday As String = DateTime.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
            Dim dat As String = datetoday
            datetoday = DateToDisplay(dat, True)
            Dim id_new As Integer = Int32.Parse(gvData.DataKeys(e.Row.RowIndex).Values("IDNew").ToString())

            Dim intStatus As Integer
            intStatus = CType(DataBinder.Eval(e.Row.DataItem, "statusicon"), Integer)
            Dim enddate As String
            enddate = CType(DataBinder.Eval(e.Row.DataItem, "dateend"), String)
            enddate = DateToDisplay(enddate, True)
            Dim img As Image = DirectCast(e.Row.FindControl("image"), Image)

            If intStatus = 0 Then

                img.Visible = False
            ElseIf intStatus = 1 Then
                img.Visible = True
            ElseIf intStatus = 2 Then

                If enddate = datetoday Then

                    img.Visible = False
                    Dim sqlupdate As String = ""
                    sqlupdate = "UPDATE T01_New SET statusicon=@statusicon WHERE IDNew=@IDNew"
                    Dim cmd As New SqlCommand(sqlupdate)
                    cmd.Parameters.AddWithValue("@statusactionicon", 0)
                    cmd.Parameters.AddWithValue("@id_new", id_new)
                    mDB.fExecuteCommand(cmd, pValue)
                Else

                End If
            End If
        End If
    End Sub

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Private Sub gvpic_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvpic.RowCommand
        If mFunc.fCheckSession Then

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
        End If
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        fBindePaging()
        fShowData(1)
        mutiview1.SetActiveView(viewshow)
    End Sub

    Protected Sub gvData_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvData.SelectedIndexChanged

    End Sub
End Class