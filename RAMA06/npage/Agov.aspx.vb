Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Agov
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Dim objRandom As New System.Random( _
CType(System.DateTime.Now.Ticks Mod System.Int32.MaxValue, Integer))

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If mFunc.fCheckSession() Then
                fBindePaging()
                fShowData(1)
            End If
        End If
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
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDfound desc) AS row,*  ")
        nSb.Append("from oss_foundgovernment where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDfound desc",
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
        nSb.Append("select count(*) from oss_foundgovernment where 1=1 ")
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

    Protected Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        If mFunc.fCheckSession Then
            multiview1.SetActiveView(viewadd)
            runIDfound()
        End If


    End Sub

    Private Sub runIDfound()
        Dim nDt As DataTable
        Dim sql As String
        sql = " SELECT MAX(rID) AS rID "
        sql &= " FROM oss_foundgovernment "
        'sql &= " WHERE codestaff = '" & cid & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                If IsDBNull(nDt.Rows(0).Item("rID")) Then
                    hdfIDfound.Value = 1
                Else
                    hdfIDfound.Value = (CInt(nDt.Rows(0).Item("rID")))
                    hdfIDfound.Value += 1

                End If
            End If
        End If
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        If mFunc.fCheckSession Then
            fBindePaging()
            fShowData(1)
            multiview1.SetActiveView(viewshow)

        End If

    End Sub

    Private Function fGetSearchStr() As String
        Dim nValue As String = ""
        If txtSearch.Text <> "" Then nValue &= " and (namefound like @searchTxt )"
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

    Private Sub BindGrid()

        Dim nUser As cUser = Session("cUser")
        Dim nDt As DataTable
        Dim strsql As String = "SELECT row_number() OVER (ORDER BY ID_imgfound ASC) AS row,* FROM oss_imgfoundgovernment WHERE rID='" & hdfIDfound.Value & "'"

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

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        If mFunc.fCheckSession Then
            Dim nValue As String
            If fSaveData(nValue) Then
                clstb()
                runIDfound()
                BindGrid()

                ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
            End If
        End If

    End Sub

    Private Sub clstb()
        tbnamefound.Text = ""
        tbdetailfound.Text = ""
        tbnumfound.Text = ""
        tbnummoneyfound.Text = ""
        tbdatefound.Text = ""
        tbendfound.Text = ""
        tbtypefound.Text = ""
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
        nSb.Append("insert into oss_foundgovernment(rID,datesend,namefound,detailfound,numfound,nummoneyfound,datefound,endfound,typefound,frequency) ")
        nSb.Append("values(@rID,@datesend,@namefound,@detailfound,@numfound,@nummoneyfound,@datefound,@endfound,@typefound,@frequency)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValue(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters
            Dim datestart As String = Date.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
            Dim dstart As String = datestart
            datestart = DateToDisplay(dstart, True)
            .AddWithValue("@rID", hdfIDfound.Value)
            .AddWithValue("@datesend", datestart)
            .AddWithValue("@namefound", tbnamefound.Text)
            .AddWithValue("@detailfound", tbdetailfound.Text)
            .AddWithValue("@numfound", tbnumfound.Text)
            .AddWithValue("@nummoneyfound", tbnummoneyfound.Text)
            .AddWithValue("@datefound", tbdatefound.Text)
            .AddWithValue("@endfound", tbendfound.Text)
            .AddWithValue("@typefound", tbtypefound.Text)
            .AddWithValue("@frequency", 0)


        End With
    End Sub

    Public Function GetRandomNumber( _
   Optional ByVal Low As Integer = 1, _
   Optional ByVal High As Integer = 100) As Integer
        ' Returns a random number,
        ' between the optional Low and High parameters
        Return objRandom.Next(Low, High + 1)
    End Function

    Protected Sub btnupload_Click(sender As Object, e As EventArgs) Handles btnupload.Click
        If mFunc.fCheckSession() Then

            Dim nUser As cUser = Session("cUser")

            If FileUpload4.FileName = "" Then

                ShowMessage("กรุณาเลือกไฟล์ก่อนอัพโหลดค่ะ", MessageType.Error)
                Exit Sub
            End If
            If FileUpload4.PostedFile.ContentLength > 2147483647 Then

                ShowMessage("ไฟล์มีขนาดเกิน 2MB.ค่ะ", MessageType.Error)
                Exit Sub
            End If

            If True Then
                If FileUpload4.HasFile Then
                    Try

                        Dim intDiceRoll As Long
                        intDiceRoll = GetRandomNumber(1, 999999999)



                        Dim ext As String = Path.GetExtension(FileUpload4.FileName)
                        Dim filesize As Integer
                        filesize = FileUpload4.PostedFile.ContentLength
                        'InsertT01_IMG

                        Dim sqlinsert As String = ""
                        sqlinsert = "INSERT INTO oss_imgfoundgovernment(rID,namefile,renamefile,sizefile,typefile)" & _
                        "VALUES" & _
                        "(@rID,@namefile,@renamefile,@sizefile,@typefile)"

                        Dim cmd As New SqlCommand(sqlinsert)
                        cmd.Parameters.AddWithValue("@rID", hdfIDfound.Value)
                        cmd.Parameters.AddWithValue("@namefile", FileUpload4.FileName)
                        cmd.Parameters.AddWithValue("@renamefile", intDiceRoll & ext)
                        cmd.Parameters.AddWithValue("@sizefile", filesize)
                        cmd.Parameters.AddWithValue("@typefile", ext)

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

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If mFunc.fCheckSession Then
            fBindePaging()
            fShowData(1)
        End If

    End Sub

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        'If mFunc.fCheckSession() Then
        If e.CommandName = "aname" Then

            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value

            hdfid.Value = ndutyID

            Dim url As String = "VFgov.aspx?value1=" + hdfid.Value
            Dim sb As New StringBuilder()
            sb.Append("<script type = 'text/javascript'>")
            sb.Append("window.open('")
            sb.Append(url)
            sb.Append("');")
            sb.Append("</script>")
            ClientScript.RegisterStartupScript(Me.GetType(), _
                        "script", sb.ToString())

        ElseIf e.CommandName = "aEdit" Then
            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
            hdfid.Value = ndutyID

            Response.Redirect("~/nPage/Egov.aspx?value1=" + hdfid.Value)


        ElseIf e.CommandName = "aDel" Then
            Dim pValue As String
            Dim nDt As DataTable

            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
            hdfid.Value = ndutyID

            Dim Ssql As String = "SELECT rID FROM oss_foundgovernment WHERE IDfound='" & hdfid.Value & "'"
            Dim cmds As New SqlCommand(Ssql)
            If mDB.fReadDataTable(cmds, nDt) Then
                If nDt.Rows.Count > 0 Then

                    Dim strsql As String = "SELECT * FROM oss_imgfoundgovernment WHERE rID = '" & nDt.Rows(0).Item("rID") & "'"
                    Dim cmdd As New SqlCommand(strsql)
                    Dim i As Integer
                    If mDB.fReadDataTable(cmdd, nDt) Then
                        If nDt.Rows.Count > 0 Then
                            For i = 0 To nDt.Rows.Count - 1
                                delpic(nDt.Rows(i).Item("ID_imgfound"))
                            Next
                        End If
                    End If

                End If
            End If

            Dim sql As String = "DELETE FROM oss_foundgovernment WHERE rID='" & hdfid.Value & "'"
            Dim cmd As New SqlCommand(sql)
            mDB.fExecuteCommand(cmd, pValue)


            fBindePaging()
            fShowData(1)
        End If
        'End If
    End Sub

    Private Sub delpic(ByVal id As Integer)
        Dim nValue As String

        Dim nDt As DataTable

        Dim sqldelimg As String
        Dim namefile As String
        sqldelimg = "SELECT renamefile FROM oss_imgfoundgovernment WHERE ID_imgfound ='" & id & "'"

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

        Dim sqldelete As String = "DELETE FROM oss_imgfoundgovernment WHERE ID_imgfound='" & id & "'"
        Dim cmddel As New SqlCommand(sqldelete)

        If mDB.fExecuteCommand(cmddel, nValue) Then

        End If

    End Sub

End Class