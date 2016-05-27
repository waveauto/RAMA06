Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Epriv
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Dim objRandom As New System.Random( _
CType(System.DateTime.Now.Ticks Mod System.Int32.MaxValue, Integer))

#Region "EVEN"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim value1 As String = Request.QueryString("value1")

            hdfid.Value = value1

            fShowDetail(hdfid.Value)

            Dim nDt As DataTable
            Dim sql As String = "SELECT rID FROM oos_foundpriv WHERE IDpriv = @IDpriv"
            Dim cmd As New SqlCommand(sql)
            cmd.Parameters.AddWithValue("@IDpriv", hdfid.Value)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    hdfrid.Value = nDt.Rows(0).Item("rID")
                    fShowPic(nDt.Rows(0).Item("rID"))
                End If
            End If

        End If
    End Sub

    Private Sub gvpic_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvpic.RowCommand
        If e.CommandName = "aviewfile" Then
            Dim nDt As DataTable
            Dim nID As Integer = gvpic.DataKeys(e.CommandArgument).Value
            Dim sql As String
            sql = "SELECT renamefile FROM oss_imgfoundpriv WHERE id_imgoss_foundpriv = '" & nID & "'"
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

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        Response.Redirect("~/nPage/Apriv.aspx")
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
                        'InsertT01_IMG

                        Dim rename As String = checkrenamefile(intDiceRoll, ext)

                        Dim sqlinsert As String = ""
                        sqlinsert = "INSERT INTO oss_imgfoundpriv(rID,namefile,renamefile,datesand,sizefile,typefile,codestaff)" & _
                        "VALUES" & _
                        "(@rID,@namefile,@renamefile,@datesand,@sizefile,@typefile,@codestaff)"

                        Dim cmd As New SqlCommand(sqlinsert)
                        cmd.Parameters.AddWithValue("@rID", hdfrid.Value)
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

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String
        If mFunc.fCheckSession Then
            If fUpdateData(nValue) Then
                ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
            End If
        End If
    End Sub


#End Region

#Region "FUNCTION"
    Private Sub fShowDetail(ByVal pID As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oos_foundpriv WHERE IDpriv = '" & pID & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbprivHead.Text = nDt.Rows(0).Item("privHead")

                Literal1.Text = nDt.Rows(0).Item("privdetail")
                tbprivdetail.Text = Literal1.Text
            End If
        End If
    End Sub

    Private Sub fShowPic(ByVal id As Integer)
        Dim nDt As DataTable

        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_foundpriv ASC) AS row,* FROM oss_imgfoundpriv WHERE rID='" & id & "'"
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

    Public Enum MessageType
        Success
        [Error]
        Info
        Warning
    End Enum

    Protected Sub ShowMessage(Message As String, type As MessageType)
        ScriptManager.RegisterStartupScript(Me, Me.[GetType](), System.Guid.NewGuid().ToString(), "ShowMessage('" & Message & "','" & type.ToString() & "');", True)
    End Sub

    Public Function GetRandomNumber( _
        Optional ByVal Low As Integer = 1, _
        Optional ByVal High As Integer = 100) As Integer
        ' Returns a random number,
        ' between the optional Low and High parameters
        Return objRandom.Next(Low, High + 1)
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

    Private Sub BindGrid()

        Dim nDt As DataTable
        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_foundpriv ASC) AS row,* FROM oss_imgfoundpriv  WHERE rID='" & hdfid.Value & "'"

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

    Private Function fUpdateData(ByRef pValue As String) As Boolean
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oos_foundpriv set ")
        nSb.Append("privHead = @privHead,privdetail = @privdetail,statusdate = @statusdate,datestart = @datestart,dateend = @dateend,statusicon = @statusicon,codestaff = @codestaff ")
        nSb.Append("where IDpriv = @IDpriv")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        Dim datesand As String = DateTime.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
        Dim dat As String = datesand
        datesand = DateToDisplay(dat, True)

        With pCommand.Parameters

            If ddlstatusdate.SelectedIndex = 0 Then
                '1วัน
                Dim datestart As String = Date.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
                Dim dstart As String = datestart
                datestart = DateToDisplay(dstart, True)

                Dim dateend As String = Date.Parse(Date.Now.AddDays(1), System.Globalization.CultureInfo.CurrentCulture)
                Dim dennd As String = dateend
                dateend = DateToDisplay(dennd, True)


                .AddWithValue("@privHead", tbprivHead.Text)
                .AddWithValue("@privdetail", tbprivdetail.Text)

                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", datestart)
                .AddWithValue("@dateend", dateend)
                .AddWithValue("@statusicon", "2")
                .AddWithValue("@codestaff", nUser.tUserID)
                .AddWithValue("@IDpriv", hdfid.Value)

            ElseIf ddlstatusdate.SelectedIndex = 1 Then
                '2วัน
                Dim datestart As String = Date.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
                Dim dstart As String = datestart
                datestart = DateToDisplay(dstart, True)

                Dim dateend As String = Date.Parse(Date.Now.AddDays(2), System.Globalization.CultureInfo.CurrentCulture)
                Dim dennd As String = dateend
                dateend = DateToDisplay(dennd, True)


                .AddWithValue("@privHead", tbprivHead.Text)
                .AddWithValue("@privdetail", tbprivdetail.Text)
                .AddWithValue("@datesend", datesand)
                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", datestart)
                .AddWithValue("@dateend", dateend)
                .AddWithValue("@statusicon", "2")
                .AddWithValue("@codestaff", nUser.tUserID)
                .AddWithValue("@IDpriv", hdfid.Value)
            ElseIf ddlstatusdate.SelectedIndex = 2 Then
                '3วัน
                Dim datestart As String = Date.Parse(Date.Now, System.Globalization.CultureInfo.CurrentCulture)
                Dim dstart As String = datestart
                datestart = DateToDisplay(dstart, True)

                Dim dateend As String = Date.Parse(Date.Now.AddDays(3), System.Globalization.CultureInfo.CurrentCulture)
                Dim dennd As String = dateend
                dateend = DateToDisplay(dennd, True)

                .AddWithValue("@privHead", tbprivHead.Text)
                .AddWithValue("@privdetail", tbprivdetail.Text)
                .AddWithValue("@datesend", datesand)
                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", datestart)
                .AddWithValue("@dateend", dateend)
                .AddWithValue("@statusicon", "2")
                .AddWithValue("@codestaff", nUser.tUserID)
                .AddWithValue("@IDpriv", hdfid.Value)
            ElseIf ddlstatusdate.SelectedIndex = 3 Then
                'แสดงตลอด

                .AddWithValue("@privHead", tbprivHead.Text)
                .AddWithValue("@privdetail", tbprivdetail.Text)
                .AddWithValue("@datesend", datesand)
                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", "")
                .AddWithValue("@dateend", "")
                .AddWithValue("@statusicon", "1")
                .AddWithValue("@codestaff", nUser.tUserID)
                .AddWithValue("@IDpriv", hdfid.Value)

            ElseIf ddlstatusdate.SelectedIndex = 4 Then
                'ไม่แสดง
                .AddWithValue("@privHead", tbprivHead.Text)
                .AddWithValue("@privdetail", tbprivdetail.Text)
                .AddWithValue("@datesend", datesand)
                .AddWithValue("@statusdate", ddlstatusdate.SelectedItem.Text)
                .AddWithValue("@datestart", "")
                .AddWithValue("@dateend", "")
                .AddWithValue("@statusicon", "0")
                .AddWithValue("@codestaff", nUser.tUserID)
                .AddWithValue("@IDpriv", hdfid.Value)

            End If
        End With

    End Sub

    Private Function checkrenamefile(ByVal id As Long, ByVal ext As String)
        Dim nDt As DataTable
        Dim nVal As String

        Dim sql As String = "SELECT * FROM oss_imgfoundpriv WHERE renamefile='" & id & ext & "'"
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

#End Region

End Class