Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class ProblemsandSuggestions
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
                Dim nUser As cUser = Session("cUser")
                fBindePaging()
                fShowData(1)


            End If
        End If
    End Sub

    Protected Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        multiveiw.SetActiveView(viewadd)
        hdfmode.Value = "NEW"
        runidimg()
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        multiveiw.SetActiveView(viewshow)
        fBindePaging()
        fShowData(1)
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String
        If mFunc.fCheckSession Then
            Select Case hdfmode.Value
                Case "NEW"
                    If fSaveData(nValue) Then
                        clstb()
                        runidimg()
                        BindGrid()
                        ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                    End If
                Case "EDIT"
                    'If fUpdateData(nValue) Then
                    '    clstb()
                    '    hdfmode.Value = "NEW"
                    '    ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                    'End If
            End Select
        End If


    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        fBindePaging()
        fShowData(1)
    End Sub

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If e.CommandName = "aEdit" Then

            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
            hdfid.Value = ndutyID


            Response.Redirect("~/nPage/EProblem.aspx?value1=" + hdfid.Value)

        ElseIf e.CommandName = "atopic" Then
            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
            hdfid.Value = ndutyID

            ShowData(hdfid.Value)
            multiveiw.SetActiveView(viewhowto)


        End If
    End Sub

    Protected Sub btnbackhowto_Click(sender As Object, e As EventArgs) Handles btnbackhowto.Click
        multiveiw.SetActiveView(viewshow)
    End Sub

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

                        Dim datesand As String = DateTime.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
                        Dim dat As String = datesand
                        datesand = DateToDisplay(dat, True)
                        Dim tim As String
                        tim = datesand & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)
                        'check

                        Dim ext As String = Path.GetExtension(FileUpload4.FileName)
                        Dim filesize As Integer
                        filesize = FileUpload4.PostedFile.ContentLength
                        'InsertT01_IMG

                        Dim sqlinsert As String = ""
                        sqlinsert = "INSERT INTO oss_imgproblem(rID,namefile,renamefile,datesand,sizefile,typefile,codestaff)" & _
                        "VALUES" & _
                        "(@rID,@namefile,@renamefile,@datesand,@sizefile,@typefile,@codestaff)"

                        Dim cmd As New SqlCommand(sqlinsert)
                        cmd.Parameters.AddWithValue("@rID", hdfIDProblems.Value)
                        cmd.Parameters.AddWithValue("@namefile", FileUpload4.FileName)
                        cmd.Parameters.AddWithValue("@renamefile", intDiceRoll & ext)
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

    Private Sub gvpic_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvpic.RowCommand
        If mFunc.fCheckSession Then

            If e.CommandName = "aviewfile" Then
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

            ElseIf e.CommandName = "aDel" Then

                Dim nValue As String
                Dim nID As Integer = gvpic.DataKeys(e.CommandArgument).Value
                Dim nDt As DataTable

                Dim sqldelimg As String
                Dim namefile As String
                sqldelimg = "SELECT renamefile FROM oss_imgproblem WHERE id_imgoss_Problems ='" & nID & "'"

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

                Dim sqldelete As String = "DELETE FROM oss_imgproblem WHERE id_imgoss_Problems='" & nID & "'"
                Dim cmddel As New SqlCommand(sqldelete)

                If mDB.fExecuteCommand(cmddel, nValue) Then
                    BindGrid()
                End If

            End If
        End If
    End Sub

#End Region

#Region "FUNCTION"
    Private Sub runidimg()

        Dim nDt As DataTable
        Dim sql As String
        sql = " SELECT  MAX(rID) AS rID "
        sql &= " FROM oss_Problems "
        'sql &= " WHERE codestaff = '" & cid & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                If IsDBNull(nDt.Rows(0).Item("rID")) Then
                    hdfIDProblems.Value = 1
                Else
                    hdfIDProblems.Value = (CInt(nDt.Rows(0).Item("rID")))
                    hdfIDProblems.Value += 1
                End If
            End If
        End If

    End Sub

    Private Sub fShowData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvData.DataSource = fReadData(pPage, pSortDirection)
        gvData.DataBind()
    End Sub

    Private Sub fBindePaging()
        Dim nSb As New System.Text.StringBuilder
        Dim nUser As cUser = Session("cUser")
        nSb.Append("select count(*) from oss_Problems where 1=1 AND codestaff='" & nUser.tUserID & "' ")
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
        nSb.Append("from oss_Problems where 1=1 and codestaff = '" & nUser.tUserID & "'")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} and codestaff='" & nUser.tUserID & "' order by IDProblems",
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
        If txtSearch.Text <> "" Then nValue &= " and (Problemshead like @searchTxt )"
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

    Private Function fUpdateData(ByRef pValue As String) As Boolean
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_Problems set ")
        nSb.Append("Problemshead = @Problemshead,Problemsdetial = @Problemsdetial,datesend = @datesend ")
        nSb.Append("where IDProblems = @IDProblems")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters
            .AddWithValue("@Problemshead", tbProblemshead.Text)
            .AddWithValue("@Problemsdetial", tbProblemsdetial.Text)
            .AddWithValue("@datesend", nUser.tUserID)


            .AddWithValue("@IDProblems", hdfid.Value)
        End With
    End Sub

    Private Sub clstb()
        tbProblemshead.Text = ""
        tbProblemsdetial.Text = ""

    End Sub

    Private Function fSaveData(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_Problems(rID,Problemshead,Problemsdetial,statusProblems,codestaff,name,datesend,howto,howtodetail,Acodestaff) ")
        nSb.Append("values(@rID,@Problemshead,@Problemsdetial,@statusProblems,@codestaff,@name,@datesend,@howto,@howtodetail,@Acodestaff)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

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

    Private Sub fSetParaValue(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters
            .AddWithValue("@rID", hdfIDProblems.Value)
            .AddWithValue("@Problemshead", tbProblemshead.Text)
            .AddWithValue("@Problemsdetial", tbProblemsdetial.Text)
            .AddWithValue("@statusProblems", "ส่งเรื่อง")
            .AddWithValue("@codestaff", nUser.tUserID)
            .AddWithValue("@name", nUser.tFullName)

            Dim datestart As String = Date.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
            Dim dstart As String = datestart
            datestart = DateToDisplay(dstart, True)
            .AddWithValue("@datesend", datestart)
            .AddWithValue("@howto", "")
            .AddWithValue("@howtodetail", "")
            .AddWithValue("@Acodestaff", "")

        End With
    End Sub

    Private Sub showdata(ByVal id As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_Problems WHERE IDProblems='" & id & "'"
        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                ltrdetail.Text = nDt.Rows(0).Item("Problemsdetial")
                ltrhowto.Text = nDt.Rows(0).Item("howtodetail")
            End If
        End If
    End Sub

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Public Function GetRandomNumber( _
         Optional ByVal Low As Integer = 1, _
         Optional ByVal High As Integer = 100) As Integer
        ' Returns a random number,
        ' between the optional Low and High parameters
        Return objRandom.Next(Low, High + 1)
    End Function

    Private Sub BindGrid()

        Dim nUser As cUser = Session("cUser")
        Dim nDt As DataTable
        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_Problems ASC) AS row,* FROM oss_imgproblem WHERE codestaff ='" & nUser.tUserID & "' AND rID='" & hdfIDProblems.Value & "'"

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
#End Region

   
End Class