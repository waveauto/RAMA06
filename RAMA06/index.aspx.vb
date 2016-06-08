Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class testindex
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc
    Private mPath As String = "/files-uploads/"

#Region "GOV"
#Region "EVEN"
    Protected Sub btnshowgov_Click(sender As Object, e As EventArgs) Handles btnshowgov.Click
        fBindePaginggov()
        fShowDatagov(1)

        multiview1.SetActiveView(viewshowgov)

    End Sub

    Private Sub ddlPaget1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPaget1.SelectedIndexChanged
        fShowDatagov(ddlPaget1.SelectedValue)
    End Sub

    Private Sub gvdatat1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvdatat1.RowCommand
        If e.CommandName = "aname" Then

            Dim ndutyID As Integer = gvdatat1.DataKeys(e.CommandArgument).Value
            Dim nValue As String
            hdfid.Value = ndutyID

            Dim nDt As DataTable
            Dim sql As String
            sql = " SELECT MAX(frequency) AS frequency "
            sql &= " FROM oss_foundgovernment "
            sql &= " WHERE IDfound = '" & hdfid.Value & "'"

            Dim cmd As New SqlCommand(sql)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    If IsDBNull(nDt.Rows(0).Item("frequency")) Then
                        hdffrequency.Value = 1
                    Else
                        hdffrequency.Value = (CInt(nDt.Rows(0).Item("frequency")))
                        hdffrequency.Value += 1
                    End If
                End If
            End If

            Dim sqlup As String = "UPDATE oss_foundgovernment SET frequency = @frequency WHERE IDfound = @IDfound"
            Dim cmdup As New SqlCommand(sqlup)
            With cmdup.Parameters
                .AddWithValue("@frequency", hdffrequency.Value)
                .AddWithValue("@IDfound", hdfid.Value)
            End With

            If mDB.fExecuteCommand(cmdup, nValue) Then

            End If

            Dim url As String = "npage/VFgov.aspx?value1=" + hdfid.Value
            Dim sb As New StringBuilder()
            sb.Append("<script type = 'text/javascript'>")
            sb.Append("window.open('")
            sb.Append(url)
            sb.Append("');")
            sb.Append("</script>")
            ClientScript.RegisterStartupScript(Me.GetType(), _
                        "script", sb.ToString())
        End If



    End Sub

    Protected Sub btnsearcht1_Click(sender As Object, e As EventArgs) Handles btnsearcht1.Click
        fBindePaginggov()
        fShowDatagov(1)
    End Sub

#End Region

#Region "FUNCTION"
    Private Sub fBindePaginggov()
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select count(*) from oss_foundgovernment where 1=1 ")
        nSb.Append(fGetSearchStrgov())
        Dim nVal As Integer
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCommandFilterValuegov(nComd)
        mDB.fReadTopData(nComd, nVal)
        If nVal > 0 Then
            Dim nPage As Integer = Math.Ceiling(nVal / gvdatat1.PageSize)
            lblAllPaget1.Text = nPage
            ddlPaget1.Items.Clear()
            For i = 1 To nPage
                ddlPaget1.Items.Insert(i - 1, New ListItem(i, i))
            Next
        End If
    End Sub

    Private Function fGetSearchStrgov() As String
        Dim nValue As String = ""
        If tbsearcht1.Text <> "" Then nValue &= " and (namefound like @searchTxt )"
        Return nValue
    End Function

    Private Sub fSetCommandFilterValuegov(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@searchTxt", "%" & tbsearcht1.Text & "%")
        End With
    End Sub

    Private Sub fShowDatagov(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvdatat1.DataSource = fReadDatagov(pPage, pSortDirection)
        gvdatat1.DataBind()
    End Sub

    Private Function fReadDatagov(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nUser As cUser = Session("cUser")
        Dim nPageSize As Integer = gvdatat1.PageSize
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select * from ( ")
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDfound desc) AS row,*  ")
        nSb.Append("from oss_foundgovernment where 1=1")
        nSb.Append(fGetSearchStrgov())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDfound desc",
                                 ((pPage - 1) * nPageSize) + 1,
                                 ((pPage - 1) * nPageSize) + nPageSize))
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCommandFilterValuegov(nComd)
        Dim nDt As DataTable

        If mDB.fReadDataTable(nComd, nDt) Then
            If pSortDirection <> "" Then
                nDt = nDt.Select("", pSortDirection).CopyToDataTable
            End If
        End If
        Return nDt
    End Function



#End Region
#End Region


#Region "OTHER"

#Region "EVEN"
    Protected Sub bttnsearch_Click(sender As Object, e As EventArgs) Handles bttnsearch.Click

        fBindePaging()
        fShowData(1)
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

    Protected Sub btnshowother_Click(sender As Object, e As EventArgs) Handles btnshowother.Click
        fBindePaging()
        fShowData(1)
        multiview1.SetActiveView(vother)
    End Sub
#End Region

#Region "FUNCTION"
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
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDNew desc) AS row,*  ")
        nSb.Append("from oss_new where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDNew desc",
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

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If e.CommandName = "aEdit" Then

            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
            Dim nValue As String
            hdfid.Value = ndutyID


            Dim nDt As DataTable
            Dim sql As String
            sql = " SELECT MAX(frequency) AS frequency "
            sql &= " FROM oss_new "
            sql &= " WHERE IDNew = '" & hdfid.Value & "'"

            Dim cmd As New SqlCommand(sql)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    If IsDBNull(nDt.Rows(0).Item("frequency")) Then
                        hdffrequency.Value = 1
                    Else
                        hdffrequency.Value = (CInt(nDt.Rows(0).Item("frequency")))
                        hdffrequency.Value += 1
                    End If
                End If
            End If

            Dim sqlup As String = "UPDATE oss_new SET frequency = @frequency WHERE IDNew = @IDNew"
            Dim cmdup As New SqlCommand(sqlup)
            With cmdup.Parameters
                .AddWithValue("@frequency", hdffrequency.Value)
                .AddWithValue("@IDNew", hdfid.Value)
            End With

            If mDB.fExecuteCommand(cmdup, nValue) Then

            End If
           
            Dim url As String = "npage/Vnew.aspx?value1=" + hdfid.Value
            Dim sb As New StringBuilder()
            sb.Append("<script type = 'text/javascript'>")
            sb.Append("window.open('")
            sb.Append(url)
            sb.Append("');")
            sb.Append("</script>")
            ClientScript.RegisterStartupScript(Me.GetType(), _
                        "script", sb.ToString())

        End If
    End Sub



#End Region

#End Region


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            fBindePaginggov()
            fShowDatagov(1)



            Dim typefile As String
            Dim nDt As DataTable
            Dim sql As String = "SELECT * FROM oss_popup WHERE show='1'"
            Dim cmd As New SqlCommand(sql)
            Dim PopID As String
            Dim rID As Integer
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    typefile = nDt.Rows(0).Item("typefile")
                    PopID = nDt.Rows(0).Item("PopID")
                    Select Case typefile
                        Case "text"

                            rID = nDt.Rows(0).Item("rID")
                            tbheadname.Text = nDt.Rows(0).Item("headname")
                            Literal1.Text = nDt.Rows(0).Item("detailname")
                            showpicture(rID)

                            ScriptManager.RegisterStartupScript(Me, [GetType](), "showmodal", "$('#myModal').modal('show');", True)


                        Case "vdo"
                            PopID = nDt.Rows(0).Item("PopID")
                            tbheadnamevideo.Text = nDt.Rows(0).Item("headname")
                            ltr2.Text = PopID
                            vdo.Src = ("popupVideoHandler.ashx?id=" + ltr2.Text)


                            ScriptManager.RegisterStartupScript(Me, [GetType](), "showmodal", "$('#myModal1').modal('show');", True)


                        Case "slid"
                            rID = nDt.Rows(0).Item("rID")
                            Dim strsql As String = "SELECT * FROM oss_picpopup WHERE rID='" & rID & "' ORDER BY id_imgoss_popup"
                            Dim cmdpic As New SqlCommand(strsql)
                            If mDB.fReadDataTable(cmdpic, nDt) Then
                                If nDt.Rows.Count > 0 Then
                                    images.DataSource = nDt
                                    images.DataBind()
                                End If
                            End If

                            ScriptManager.RegisterStartupScript(Me, [GetType](), "showmodal", "$('#myModalslid').modal('show');", True)

                    End Select
                End If
            End If

        End If
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

    Private Sub fBindePagingpriv()
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select count(*) from oos_foundpriv where 1=1 ")
        nSb.Append(fGetSearchStrpriv())
        Dim nVal As Integer
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCommandFilterValuepriv(nComd)
        mDB.fReadTopData(nComd, nVal)
        If nVal > 0 Then
            Dim nPage As Integer = Math.Ceiling(nVal / gvdatat1.PageSize)
            lblAllPaget2.Text = nPage
            ddlPaget2.Items.Clear()
            For i = 1 To nPage
                ddlPaget2.Items.Insert(i - 1, New ListItem(i, i))
            Next
        End If
    End Sub

    Private Function fGetSearchStrpriv() As String
        Dim nValue As String = ""
        If tbsearcht2.Text <> "" Then nValue &= " and (privHead like @searchTxt )"
        Return nValue
    End Function

    Private Sub fSetCommandFilterValuepriv(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@searchTxt", "%" & tbsearcht2.Text & "%")
        End With
    End Sub

    Private Sub fShowDatapriv(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvdatat2.DataSource = fReadDatapriv(pPage, pSortDirection)
        gvdatat2.DataBind()
    End Sub

    Private Function fReadDatapriv(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nUser As cUser = Session("cUser")
        Dim nPageSize As Integer = gvdatat1.PageSize
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select * from ( ")
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDpriv desc) AS row,*  ")
        nSb.Append("from oos_foundpriv where 1=1")
        nSb.Append(fGetSearchStrpriv())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDpriv desc",
                                 ((pPage - 1) * nPageSize) + 1,
                                 ((pPage - 1) * nPageSize) + nPageSize))
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCommandFilterValuepriv(nComd)
        Dim nDt As DataTable

        If mDB.fReadDataTable(nComd, nDt) Then
            If pSortDirection <> "" Then
                nDt = nDt.Select("", pSortDirection).CopyToDataTable
            End If
        End If
        Return nDt
    End Function


    Protected Sub btnshowout_Click(sender As Object, e As EventArgs) Handles btnshowout.Click
        fBindePagingpriv()
        fShowDatapriv(1)


        multiview1.SetActiveView(viewshowout)
    End Sub

    Private Sub gvdatat2_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvdatat2.RowCommand
        If e.CommandName = "aEdit" Then

            Dim ndutyID As Integer = gvdatat2.DataKeys(e.CommandArgument).Value
            Dim nValue As String
            hdfid.Value = ndutyID


            Dim nDt As DataTable
            Dim sql As String
            sql = " SELECT MAX(frequency) AS frequency "
            sql &= " FROM oos_foundpriv "
            sql &= " WHERE IDpriv = '" & hdfid.Value & "'"

            Dim cmd As New SqlCommand(sql)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    If IsDBNull(nDt.Rows(0).Item("frequency")) Then
                        hdffrequency.Value = 1
                    Else
                        hdffrequency.Value = (CInt(nDt.Rows(0).Item("frequency")))
                        hdffrequency.Value += 1
                    End If
                End If
            End If

            Dim sqlup As String = "UPDATE oos_foundpriv SET frequency = @frequency WHERE IDpriv = @IDpriv"
            Dim cmdup As New SqlCommand(sqlup)
            With cmdup.Parameters
                .AddWithValue("@frequency", hdffrequency.Value)
                .AddWithValue("@IDpriv", hdfid.Value)
            End With

            If mDB.fExecuteCommand(cmdup, nValue) Then

            End If

            Dim url As String = "npage/Vpriv.aspx?value1=" + hdfid.Value
            Dim sb As New StringBuilder()
            sb.Append("<script type = 'text/javascript'>")
            sb.Append("window.open('")
            sb.Append(url)
            sb.Append("');")
            sb.Append("</script>")
            ClientScript.RegisterStartupScript(Me.GetType(), _
                        "script", sb.ToString())

        End If
    End Sub

    Protected Sub btnsearcht2_Click(sender As Object, e As EventArgs) Handles btnsearcht2.Click
        fBindePagingpriv()
        fShowDatapriv(1)
    End Sub

    Private Sub gvdatat2_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvdatat2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim pValue As String
            Dim datetoday As String = DateTime.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
            Dim dat As String = datetoday
            datetoday = DateToDisplay(dat, True)
            Dim id_new As Integer = Int32.Parse(gvdatat2.DataKeys(e.Row.RowIndex).Values("IDpriv").ToString())

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
                    sqlupdate = "UPDATE oos_foundpriv SET statusicon=@statusicon WHERE IDpriv=@IDpriv"
                    Dim cmd As New SqlCommand(sqlupdate)
                    cmd.Parameters.AddWithValue("@statusactionicon", 0)
                    cmd.Parameters.AddWithValue("@IDpriv", id_new)
                    mDB.fExecuteCommand(cmd, pValue)
                Else

                End If
            End If
        End If
    End Sub

    Private Sub ddlPaget2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPaget2.SelectedIndexChanged
        fShowDatapriv(ddlPaget2.SelectedValue)
    End Sub



    Private Sub showpicture(ByVal rid As Integer)
        Dim nUser As cUser = Session("cUser")
        Dim nDt As DataTable
        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_popup ASC) AS row,* FROM oss_picpopup WHERE rID='" & rid & "'"

        Dim cmd As New SqlCommand(strsql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                gvpicmodal.Visible = True
                gvpicmodal.DataSource = nDt
                gvpicmodal.DataBind()
            Else
                gvpicmodal.Visible = False
            End If
        End If
    End Sub

    Private Sub gvpicmodal_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvpicmodal.RowCommand
        If e.CommandName = "aviewfile" Then
            Dim nDt As DataTable
            Dim nID As Integer = gvpicmodal.DataKeys(e.CommandArgument).Value
            Dim sql As String
            sql = "SELECT renamefile FROM oss_picpopup WHERE id_imgoss_popup = '" & nID & "'"
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

    Private Sub gvpicmodal_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvpicmodal.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            With CType(e.Row.FindControl("ltr1"), Literal)
                .Text = "<a href='" & mPath & DataBinder.Eval(e.Row.DataItem, "renamefile") & "'>รูป</a>"
                '.Text = String.Format("<a href='{0}' traget='_blank'>รูป</a>", Page.ResolveClientUrl("~" & mPath & DataBinder.Eval(e.Row.DataItem, "renamefile")))

            End With



        End If
    End Sub


End Class