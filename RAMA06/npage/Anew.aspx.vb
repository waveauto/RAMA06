Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Public Class Anew
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Dim objRandom As New System.Random( _
CType(System.DateTime.Now.Ticks Mod System.Int32.MaxValue, Integer))

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
        mutiview.SetActiveView(viewadd)

        runidimg()
        BindGrid()
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click

        If mFunc.fCheckSession Then
            Dim nValue As String
            If fSaveData(nValue) Then
                clstb()
                runidimg()
                BindGrid()
                ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
            End If
        End If

    End Sub

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If e.CommandName = "aEdit" Then

            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
            hdfid.Value = ndutyID

            Response.Redirect("~/nPage/Enew.aspx?value1=" + hdfid.Value)

        ElseIf e.CommandName = "atopic" Then
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

        ElseIf e.CommandName = "aDel" Then
            Dim pValue As String
            Dim nDt As DataTable

            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
            hdfid.Value = ndutyID


            Dim Ssql As String = "SELECT rID FROM oss_new WHERE IDNew='" & hdfid.Value & "'"
            Dim cmds As New SqlCommand(Ssql)
            If mDB.fReadDataTable(cmds, nDt) Then
                If nDt.Rows.Count > 0 Then

                    Dim strsql As String = "SELECT * FROM oss_imgnew WHERE rID = '" & nDt.Rows(0).Item("rID") & "'"
                    Dim cmdd As New SqlCommand(strsql)
                    Dim i As Integer
                    If mDB.fReadDataTable(cmdd, nDt) Then
                        If nDt.Rows.Count > 0 Then
                            For i = 0 To nDt.Rows.Count - 1
                                delpic(nDt.Rows(i).Item("id_imgoss_New"))
                            Next
                        End If
                    End If

                End If
            End If

            Dim sql As String = "DELETE FROM oss_new WHERE IDNew='" & hdfid.Value & "'"
            Dim cmd As New SqlCommand(sql)
            mDB.fExecuteCommand(cmd, pValue)


            fBindePaging()
            fShowData(1)
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
                    sqlupdate = "UPDATE oss_new SET statusicon=@statusicon WHERE IDNew=@IDNew"
                    Dim cmd As New SqlCommand(sqlupdate)
                    cmd.Parameters.AddWithValue("@statusactionicon", 0)
                    cmd.Parameters.AddWithValue("@id_new", id_new)
                    mDB.fExecuteCommand(cmd, pValue)
                Else

                End If
            End If
        End If
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        fBindePaging()
        fShowData(1)
    End Sub

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Protected Sub gvpic_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvpic.SelectedIndexChanged

    End Sub

    Protected Sub btnupload_Click(sender As Object, e As EventArgs) Handles btnupload.Click
        If mFunc.fCheckSession() Then
            Dim nUser As cUser = Session("cUser")



            If FileUpload4.FileName = "" Then

                ShowMessage("กรุณาเลือกไฟล์ก่อนอัพโหลดค่ะ", MessageType.Error)
                Exit Sub
            End If
            If FileUpload4.PostedFile.ContentLength > 2147483647 Then

                ShowMessage("ไฟล์มีขนาดเกิน 2GB.ค่ะ", MessageType.Error)
                Exit Sub
            End If

            If True Then
                If FileUpload4.HasFile Then
                    Try

                        Dim intDiceRoll As Long
                        intDiceRoll = GetRandomNumber(1, 999999999)

                        Dim datesand As String = DateTime.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
                        Dim dat As String = datesand
                        datesand = DateToDisplay(dat, True)
                        Dim tim As String
                        tim = datesand & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)
                        'check

                        Dim ext As String = Path.GetExtension(FileUpload4.FileName)
                        Dim filesize As Integer
                        filesize = FileUpload4.PostedFile.ContentLength


                        Dim rename As String = checkrenamefile(intDiceRoll, ext)


                        Dim sqlinsert As String = ""
                        sqlinsert = "INSERT INTO oss_imgnew(rID,namefile,renamefile,datesand,sizefile,typefile,codestaff)" & _
                        "VALUES" & _
                        "(@rID,@namefile,@renamefile,@datesand,@sizefile,@typefile,@codestaff)"

                        Dim cmd As New SqlCommand(sqlinsert)
                        cmd.Parameters.AddWithValue("@rID", hdfIDNew.Value)
                        cmd.Parameters.AddWithValue("@namefile", FileUpload4.FileName)
                        cmd.Parameters.AddWithValue("@renamefile", rename)
                        cmd.Parameters.AddWithValue("@datesand", datesand)
                        cmd.Parameters.AddWithValue("@sizefile", filesize)
                        cmd.Parameters.AddWithValue("@typefile", ext)
                        cmd.Parameters.AddWithValue("@codestaff", nUser.tUserID)

                        Try
                            mDB.fExecuteCommand(cmd, 0)

                            BindGrid()

                        Catch ex As Exception
                            ShowMessage("ไม่สามารถบันทึกข้อมูลได้", MessageType.Error)
                        Finally

                        End Try


                        FileUpload4.SaveAs(Server.MapPath("~/files-uploads/") & intDiceRoll & ext)

                    Catch ex As Exception

                        ShowMessage(" The file could not be uploaded. The following error occured", MessageType.Error)
                    End Try
                End If
            End If
        End If
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        mutiview.SetActiveView(viewshow)
        fBindePaging()
        fShowData(1)
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

            ElseIf e.CommandName = "aDel" Then

                Dim nValue As String
                Dim nID As Integer = gvpic.DataKeys(e.CommandArgument).Value
                Dim nDt As DataTable

                Dim sqldelimg As String
                Dim namefile As String
                sqldelimg = "SELECT renamefile FROM oss_imgnew WHERE id_imgoss_New ='" & nID & "'"

                Dim cmd As New SqlCommand(sqldelimg)

                If mDB.fReadDataTable(cmd, nDt) Then
                    If nDt.Rows.Count > 0 Then
                        namefile = nDt.Rows(0).Item("renamefile")

                        Dim FileToDelete As String
                        ' Set full path to file
                        FileToDelete = Server.MapPath("~/files-uploads/") & namefile
                        ' Delete a file
                        File.Delete(FileToDelete)

                    End If
                End If

                Dim sqldelete As String = "DELETE FROM oss_imgnew WHERE id_imgoss_New='" & nID & "'"
                Dim cmddel As New SqlCommand(sqldelete)

                If mDB.fExecuteCommand(cmddel, nValue) Then
                    BindGrid()
                End If

            End If
        End If
    End Sub

    Protected Sub gvData_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvData.SelectedIndexChanged

    End Sub



#End Region

#Region "FUNCTION"
    Private Sub fShowData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvData.DataSource = fReadData(pPage, pSortDirection)
        gvData.DataBind()
    End Sub

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

    Private Sub fSetCommandFilterValue(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@searchTxt", "%" & txtSearch.Text & "%")
        End With
    End Sub

    Private Function fGetSearchStr() As String
        Dim nValue As String = ""
        If txtSearch.Text <> "" Then nValue &= " and (newHead like @searchTxt )"
        Return nValue
    End Function

    Private Sub runidimg()

        Dim nDt As DataTable
        Dim sql As String
        sql = " SELECT MAX(rID) AS rID "
        sql &= " FROM oss_new "
        'sql &= " WHERE codestaff = '" & cid & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                If IsDBNull(nDt.Rows(0).Item("rID")) Then
                    hdfIDNew.Value = 1
                Else
                    hdfIDNew.Value = (CInt(nDt.Rows(0).Item("rID")))
                    hdfIDNew.Value += 1
                End If
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

    Private Sub clstb()
        tbnewHead.Text = ""
        tbnewdetail.Text = ""

        ddlstatusdate.SelectedIndex = 0
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

    Private Function fSaveData(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_new(rID,newHead,newdetail,datesend,statusdate,datestart,dateend,statusicon,frequency,codestaff) ")
        nSb.Append("values(@rID,@newHead,@newdetail,@datesend,@statusdate,@datestart,@dateend,@statusicon,@frequency,@codestaff)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValue(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters

            Dim datesand As String = DateTime.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
            Dim dat As String = datesand
            datesand = DateToDisplay(dat, True)

            If ddlstatusdate.SelectedIndex = 0 Then
                '1วัน
                Dim datestart As String = Date.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
                Dim dstart As String = datestart
                datestart = DateToDisplay(dstart, True)

                Dim dateend As String = Date.Parse(Date.Now.AddDays(1), System.Globalization.CultureInfo.CurrentCulture)
                Dim dennd As String = dateend
                dateend = DateToDisplay(dennd, True)

                .AddWithValue("@rID", hdfIDNew.Value)
                .AddWithValue("@newHead", tbnewHead.Text)
                .AddWithValue("@newdetail", tbnewdetail.Text)
                .AddWithValue("@datesend", datesand)
                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", datestart)
                .AddWithValue("@dateend", dateend)
                .AddWithValue("@statusicon", "2")
                .AddWithValue("@frequency", 0)
                .AddWithValue("@codestaff", nUser.tUserID)

            ElseIf ddlstatusdate.SelectedIndex = 1 Then
                '2วัน
                Dim datestart As String = Date.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
                Dim dstart As String = datestart
                datestart = DateToDisplay(dstart, True)

                Dim dateend As String = Date.Parse(Date.Now.AddDays(2), System.Globalization.CultureInfo.CurrentCulture)
                Dim dennd As String = dateend
                dateend = DateToDisplay(dennd, True)

                .AddWithValue("@rID", hdfIDNew.Value)
                .AddWithValue("@newHead", tbnewHead.Text)
                .AddWithValue("@newdetail", tbnewdetail.Text)
                .AddWithValue("@datesend", datesand)
                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", datestart)
                .AddWithValue("@dateend", dateend)
                .AddWithValue("@statusicon", "2")
                .AddWithValue("@frequency", 0)
                .AddWithValue("@codestaff", nUser.tUserID)
            ElseIf ddlstatusdate.SelectedIndex = 2 Then
                '3วัน
                Dim datestart As String = Date.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
                Dim dstart As String = datestart
                datestart = DateToDisplay(dstart, True)

                Dim dateend As String = Date.Parse(Date.Now.AddDays(3), System.Globalization.CultureInfo.CurrentCulture)
                Dim dennd As String = dateend
                dateend = DateToDisplay(dennd, True)
                .AddWithValue("@rID", hdfIDNew.Value)
                .AddWithValue("@newHead", tbnewHead.Text)
                .AddWithValue("@newdetail", tbnewdetail.Text)
                .AddWithValue("@datesend", datesand)
                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", datestart)
                .AddWithValue("@dateend", dateend)
                .AddWithValue("@statusicon", "2")
                .AddWithValue("@frequency", 0)
                .AddWithValue("@codestaff", nUser.tUserID)
            ElseIf ddlstatusdate.SelectedIndex = 3 Then
                'แสดงตลอด
                .AddWithValue("@rID", hdfIDNew.Value)
                .AddWithValue("@newHead", tbnewHead.Text)
                .AddWithValue("@newdetail", tbnewdetail.Text)
                .AddWithValue("@datesend", datesand)
                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", "")
                .AddWithValue("@dateend", "")
                .AddWithValue("@statusicon", "1")
                .AddWithValue("@frequency", 0)
                .AddWithValue("@codestaff", nUser.tUserID)
            ElseIf ddlstatusdate.SelectedIndex = 4 Then
                'ไม่แสดง
                .AddWithValue("@rID", hdfIDNew.Value)
                .AddWithValue("@newHead", tbnewHead.Text)
                .AddWithValue("@newdetail", tbnewdetail.Text)
                .AddWithValue("@datesend", datesand)
                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", "")
                .AddWithValue("@dateend", "")
                .AddWithValue("@statusicon", "0")
                .AddWithValue("@frequency", 0)
                .AddWithValue("@codestaff", nUser.tUserID)
            End If
        End With

    End Sub

    Private Sub delpic(ByVal id As Integer)
        Dim nValue As String

        Dim nDt As DataTable

        Dim sqldelimg As String
        Dim namefile As String
        sqldelimg = "SELECT renamefile FROM oss_imgnew WHERE id_imgoss_New ='" & id & "'"

        Dim cmd As New SqlCommand(sqldelimg)

        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                namefile = nDt.Rows(0).Item("renamefile")

                Dim FileToDelete As String
                ' Set full path to file
                FileToDelete = Server.MapPath("~/files-uploads/") & namefile
                ' Delete a file
                File.Delete(FileToDelete)

            End If
        End If

        Dim sqldelete As String = "DELETE FROM oss_imgnew WHERE id_imgoss_New='" & id & "'"
        Dim cmddel As New SqlCommand(sqldelete)

        If mDB.fExecuteCommand(cmddel, nValue) Then

        End If

    End Sub

    Private Sub BindGrid()

        Dim nDt As DataTable
        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_New ASC) AS row,* FROM oss_imgnew  WHERE rID='" & hdfIDNew.Value & "'"

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

    Private Function checkrenamefile(ByVal id As Long, ByVal ext As String)
        Dim nDt As DataTable
        Dim nVal As String

        Dim sql As String = "SELECT * FROM oss_imgnew WHERE renamefile='" & id & ext & "'"
        Dim cmdc As New SqlCommand(sql)
        If mDB.fReadDataTable(cmdc, nDt) Then
            If nDt.Rows.Count > 0 Then
                Dim intDiceRoll As Long
                intDiceRoll = GetRandomNumber(1, 999999999)
                checkrenamefile(intDiceRoll, ext)

                nVal = intDiceRoll & ext
            Else
                nVal = id & ext
            End If
        End If
        Return nVal
    End Function

    Public Function GetRandomNumber( _
        Optional ByVal Low As Integer = 1, _
        Optional ByVal High As Integer = 100) As Integer
        ' Returns a random number,
        ' between the optional Low and High parameters
        Return objRandom.Next(Low, High + 1)
    End Function
#End Region

End Class