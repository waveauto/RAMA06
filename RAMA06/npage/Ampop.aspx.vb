
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Ampop
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc
    Dim buffer As Byte()

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

    Protected Sub rdbinsert1_CheckedChanged(sender As Object, e As EventArgs) Handles rdbinsert1.CheckedChanged
        If rdbinsert1.Checked = True Then
            hdfmodetext.Value = "NEW"
            runrID()

            multiview1.SetActiveView(viewaddtext)
        End If
    End Sub

    Private Sub rdbinsert2_CheckedChanged(sender As Object, e As EventArgs) Handles rdbinsert2.CheckedChanged
        If rdbinsert2.Checked = True Then
            hdfmodevideo.Value = "NEW"
            runrID()
            multiview1.SetActiveView(viewaddvideo)
        End If
    End Sub

    Protected Sub btnsavevideo_Click(sender As Object, e As EventArgs) Handles btnsavevideo.Click
        Dim nValue As String

        If mFunc.fCheckSession Then

            If FileUpload1.HasFile Then
                Select Case hdfmodevideo.Value
                    Case "NEW"
                        Dim fileExt As String = Path.GetExtension(FileUpload1.FileName)
                        If fileExt = ".mp4" Then

                            If fSaveDatavideo(nValue) Then
                                tbHeadvideo.Text = ""
                                runrID()
                                mTool.fShowAlert(cTools.alertCssClassType.success, Me, nValue, "บันทึกข้อมูลเรียบร้อยแล้ว ")
                            Else
                                'ShowMessage("Choose a valid video file", MessageType.Error)
                            End If
                        Else
                            mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, "อัพโหลดได้เฉพาะไฟล์ MP4 ")
                        End If

                    Case "EDIT"
                        Dim fileExt As String = Path.GetExtension(FileUpload1.FileName)
                        If fileExt = ".mp4" Then


                            If fUpdateDatavideo(nValue) Then
                                hdfmodevideo.Value = "NEW"

                                mTool.fShowAlert(cTools.alertCssClassType.success, Me, nValue, "บันทึกข้อมูลเรียบร้อยแล้ว ")
                            End If

                        Else

                            mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, "อัพโหลดได้เฉพาะไฟล์ MP4 ")
                        End If

                End Select
            Else
                mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, "กรุณาเลือกไฟล์ MP4 ก่อนทำการอัพโหลดค่ะ ")

            End If
        End If

    End Sub

    Protected Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        multiview1.SetActiveView(viewadd)
    End Sub

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If e.CommandName = "aEdit" Then

            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim typefile As String = gvData.Rows(index).Cells(2).Text
            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value

            If typefile = "text" Then
                hdfPopID.Value = ndutyID
                hdfmodetext.Value = "EDIT"
                Dim nDt As DataTable
                Dim sql As String = "SELECT rID FROM oss_popup WHERE PopID='" & hdfPopID.Value & "'"
                Dim cmd As New SqlCommand(sql)
                If mDB.fReadDataTable(cmd, nDt) Then
                    If nDt.Rows.Count > 0 Then
                        hdfrID.Value = nDt.Rows(0).Item("rID")

                        showdatatext(hdfPopID.Value)
                        showdatapictext(hdfrID.Value)
                        multiview1.SetActiveView(viewaddtext)
                    End If
                End If

            ElseIf typefile = "vdo" Then
                hdfPopID.Value = ndutyID
                hdfmodevideo.Value = "EDIT"

                showdatavideo(hdfPopID.Value)
                multiview1.SetActiveView(viewaddvideo)
            End If

        ElseIf e.CommandName = "aDel" Then

            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim typefile As String = gvData.Rows(index).Cells(2).Text
            Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value


            If typefile = "text" Then

                Dim pValue As String
                Dim nDt As DataTable


                hdfPopID.Value = ndutyID

                Dim Ssql As String = "SELECT rID FROM oss_popup WHERE PopID='" & hdfPopID.Value & "'"
                Dim cmds As New SqlCommand(Ssql)
                If mDB.fReadDataTable(cmds, nDt) Then
                    If nDt.Rows.Count > 0 Then

                        Dim strsql As String = "SELECT * FROM oss_picpopup WHERE rID = '" & nDt.Rows(0).Item("rID") & "'"
                        Dim cmdd As New SqlCommand(strsql)
                        Dim i As Integer
                        If mDB.fReadDataTable(cmdd, nDt) Then
                            If nDt.Rows.Count > 0 Then
                                For i = 0 To nDt.Rows.Count - 1
                                    delpic(nDt.Rows(i).Item("id_imgoss_popup"))
                                Next
                            End If
                        End If

                    End If
                End If

                Dim sql As String = "DELETE FROM oss_popup WHERE PopID='" & hdfPopID.Value & "'"
                Dim cmd As New SqlCommand(sql)
                mDB.fExecuteCommand(cmd, pValue)




                fBindePaging()
                fShowData(1)

            ElseIf typefile = "vdo" Then
                Dim pValue As String
                hdfPopID.Value = ndutyID

                Dim sql As String = "DELETE FROM oss_popup WHERE PopID='" & hdfPopID.Value & "'"
                Dim cmd As New SqlCommand(sql)
                mDB.fExecuteCommand(cmd, pValue)


                fBindePaging()
                fShowData(1)
            End If

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

    Protected Sub btnbackvideo_Click(sender As Object, e As EventArgs) Handles btnbackvideo.Click
        fBindePaging()
        fShowData(1)

        multiview1.SetActiveView(viewshow)

        'If True Then
        '    Dim userName As String = "John Doe"
        '    Dim javaScript As String = (Convert.ToString("<script type='text/javascript'>" & vbLf + "<!--" & vbLf + "window.onload = function ()" & vbLf + "{" & vbLf + " window.open('NewRegisterIn.aspx?username=") & userName) + "', 'newWin','width=800px,height=600px');" & vbLf + "}" & vbLf + "// -->" & vbLf + "</script>" & vbLf
        '    Me.RegisterStartupScript("OnLoadScript", javaScript)
        'End If
    End Sub

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        fBindePaging()
        fShowData(1)
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        fBindePaging()
        fShowData(1)

        multiview1.SetActiveView(viewshow)
    End Sub

    Protected Sub btnupload_Click(sender As Object, e As EventArgs) Handles btnupload.Click
        If mFunc.fCheckSession() Then
            Dim nValue As String
            Dim nUser As cUser = Session("cUser")

            If FileUpload4.FileName = "" Then


                mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, " กรุณาเลือกไฟล์ก่อนอัพโหลดค่ะ ")
                Exit Sub
            End If
            If FileUpload4.PostedFile.ContentLength > 2147483647 Then


                mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, " ไฟล์มีขนาดเกิน 2MB.ค่ะ ")
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

                        Dim rename As String = checkrenamefile(intDiceRoll, ext)

                        Dim sqlinsert As String = ""
                        sqlinsert = "INSERT INTO oss_picpopup(rID,namefile,renamefile,sizefile,typefile)" & _
                        "VALUES" & _
                        "(@rID,@namefile,@renamefile,@sizefile,@typefile)"

                        Dim cmd As New SqlCommand(sqlinsert)
                        cmd.Parameters.AddWithValue("@rID", hdfrID.Value)
                        cmd.Parameters.AddWithValue("@namefile", FileUpload4.FileName)
                        cmd.Parameters.AddWithValue("@renamefile", rename)
                        cmd.Parameters.AddWithValue("@sizefile", filesize)
                        cmd.Parameters.AddWithValue("@typefile", ext)

                        Try
                            mDB.fExecuteCommand(cmd, 0)

                            BindGrid()

                        Catch ex As Exception

                            mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, " ไม่สามารถบันทึกข้อมูลได้ ")
                        Finally

                        End Try


                        FileUpload4.SaveAs(Server.MapPath("~/files-uploads/") & rename)

                    Catch ex As Exception


                        mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, " The file could not be uploaded. The following error occured ")
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

            ElseIf e.CommandName = "aDel" Then

                Dim nValue As String
                Dim nID As Integer = gvpic.DataKeys(e.CommandArgument).Value
                Dim nDt As DataTable

                Dim sqldelimg As String
                Dim namefile As String
                sqldelimg = "SELECT renamefile FROM oss_picpopup WHERE id_imgoss_popup ='" & nID & "'"

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

                Dim sqldelete As String = "DELETE FROM oss_picpopup WHERE id_imgoss_popup='" & nID & "'"
                Dim cmddel As New SqlCommand(sqldelete)

                If mDB.fExecuteCommand(cmddel, nValue) Then
                    BindGrid()
                End If

            End If
        End If
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        If mFunc.fCheckSession Then
            Dim nValue As String


            Select Case hdfmodetext.Value
                Case "NEW"
                    If fSaveDatatext(nValue) Then
                        tbheadname.Text = ""
                        tbdetailname.Text = ""
                        runrID()
                        BindGrid()
                        mTool.fShowAlert(cTools.alertCssClassType.success, Me, nValue, "บันทึกข้อมูลเรียบร้อยแล้ว ")
                    End If
                Case "EDIT"

                    If fUpdateDatatext(nValue) Then
                        hdfmodevideo.Value = "NEW"

                        mTool.fShowAlert(cTools.alertCssClassType.success, Me, nValue, "บันทึกข้อมูลเรียบร้อยแล้ว ")
                    End If
            End Select



        End If
    End Sub
#End Region

#Region "FUNCTION"
    Private Sub fBindePaging()
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select count(*) from oss_popup where 1=1 ")
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
        If txtSearch.Text <> "" Then nValue &= " and (headname like @searchTxt )"
        Return nValue
    End Function

    Private Sub fShowData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvData.DataSource = fReadData(pPage, pSortDirection)
        gvData.DataBind()
    End Sub

    Private Function fReadData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nUser As cUser = Session("cUser")
        Dim nPageSize As Integer = gvData.PageSize
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select * from ( ")
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY PopID ) AS row,*  ")
        nSb.Append("from oss_popup where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by PopID",
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

    Private Function fUpdateDatavideo(ByRef pValue As String) As Boolean

        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_popup set ")
        nSb.Append("headname = @headname,video = @video,video_name = @video_name,videosize = @videosize ")
        nSb.Append("where PopID = @PopID")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueupvideo(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueupvideo(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")

        If FileUpload1.HasFile AndAlso FileUpload1.PostedFile IsNot Nothing AndAlso FileUpload1.PostedFile.FileName <> "" Then
            Dim file As HttpPostedFile = FileUpload1.PostedFile


            buffer = New Byte(file.ContentLength - 1) {}
            Dim bytesReaded As Integer = file.InputStream.Read(buffer, 0, FileUpload1.PostedFile.ContentLength)


            If bytesReaded > 0 Then
                With pCommand.Parameters
                    .AddWithValue("@headname", tbHeadvideo.Text)
                    .AddWithValue("@video", buffer)
                    .AddWithValue("@video_name", FileUpload1.FileName)
                    .AddWithValue("@videosize", file.ContentLength)
                    .AddWithValue("@PopID", hdfPopID.Value)


                End With

            End If
        Else
            'Label1.Text = "Choose a valid video file"
        End If

    End Sub

    Private Function fSaveDatavideo(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_popup(rID,headname,detailname,typefile,video,video_name,videosize,show) ")
        nSb.Append("values(@rID,@headname,@detailname,@typefile,@video,@video_name,@videosize,@show)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValuevideo(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub runrID()

        Dim nDt As DataTable
        Dim sql As String
        sql = " SELECT MAX(rID) AS rID "
        sql &= " FROM oss_popup "
        'sql &= " WHERE codestaff = '" & cid & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                If IsDBNull(nDt.Rows(0).Item("rID")) Then
                    hdfrID.Value = 1
                Else
                    hdfrID.Value = (CInt(nDt.Rows(0).Item("rID")))
                    hdfrID.Value += 1
                End If
            End If
        End If

    End Sub

    Private Sub fSetParaValuevideo(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")

        If FileUpload1.HasFile AndAlso FileUpload1.PostedFile IsNot Nothing AndAlso FileUpload1.PostedFile.FileName <> "" Then
            Dim file As HttpPostedFile = FileUpload1.PostedFile


            buffer = New Byte(file.ContentLength - 1) {}
            Dim bytesReaded As Integer = file.InputStream.Read(buffer, 0, FileUpload1.PostedFile.ContentLength)


            If bytesReaded > 0 Then
                With pCommand.Parameters
                    .AddWithValue("@rID", hdfrID.Value)
                    .AddWithValue("@headname", tbHeadvideo.Text)
                    .AddWithValue("@detailname", "")
                    .AddWithValue("@typefile", "vdo")
                    .AddWithValue("@video", buffer)
                    .AddWithValue("@video_name", FileUpload1.FileName)
                    .AddWithValue("@videosize", file.ContentLength)
                    .AddWithValue("@show", "0")

                End With

            End If
        Else
            'Label1.Text = "Choose a valid video file"
        End If

    End Sub

    Private Sub showdatatext(ByVal id As Integer)
        Dim sql As String = "SELECT * FROM oss_popup WHERE popID='" & id & "'"
        Dim cmd As New SqlCommand(sql)
        Dim nDt As DataTable
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbheadname.Text = nDt.Rows(0).Item("headname")
                Literal1.Text = nDt.Rows(0).Item("detailname")
                tbdetailname.Text = Literal1.Text
            End If
        End If
    End Sub

    Private Sub showdatapictext(ByVal rid As Integer)
        Dim nUser As cUser = Session("cUser")
        Dim nDt As DataTable
        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_popup ASC) AS row,* FROM oss_picpopup WHERE rID='" & hdfrID.Value & "'"

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

    Private Sub delpic(ByVal id As Integer)
        Dim nValue As String

        Dim nDt As DataTable

        Dim sqldelimg As String
        Dim namefile As String
        sqldelimg = "SELECT renamefile FROM oss_picpopup WHERE id_imgoss_popup ='" & id & "'"

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

        Dim sqldelete As String = "DELETE FROM oss_picpopup WHERE id_imgoss_popup='" & id & "'"
        Dim cmddel As New SqlCommand(sqldelete)

        If mDB.fExecuteCommand(cmddel, nValue) Then

        End If

    End Sub

    Private Sub showdatavideo(ByVal id As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_popup WHERE PopID ='" & id & "'"
        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbHeadvideo.Text = nDt.Rows(0).Item("headname")
            End If
        End If
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
            nSb.Append("update oss_popup set show=@show ")
            nSb.Append("where PopID = @PopID")
            Dim nComd As New SqlCommand(nSb.ToString)
            With nComd
                .Parameters.AddWithValue("@show", nStatus)
                .Parameters.AddWithValue("@PopID", dutyID)
            End With
            Dim nValue As String = ""
            If mDB.fExecuteCommand(nComd, nValue) = False Then
                mTool.fShowMsgBox(Me, "ไม่สามารถปรับปรุงสถานะได้")
            End If
        End If
    End Sub

    Private Sub BindGrid()

        Dim nUser As cUser = Session("cUser")
        Dim nDt As DataTable
        Dim strsql As String = "SELECT row_number() OVER (ORDER BY id_imgoss_popup ASC) AS row,* FROM oss_picpopup WHERE rID='" & hdfrID.Value & "'"

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

    Public Function GetRandomNumber( _
           Optional ByVal Low As Integer = 1, _
           Optional ByVal High As Integer = 100) As Integer
        ' Returns a random number,
        ' between the optional Low and High parameters
        Return objRandom.Next(Low, High + 1)
    End Function

    Private Function fUpdateDatatext(ByRef pValue As String) As Boolean

        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_popup set ")
        nSb.Append("headname = @headname,detailname = @detailname ")
        nSb.Append("where PopID = @PopID")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueuptext(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueuptext(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")

        With pCommand.Parameters
            .AddWithValue("@headname", tbheadname.Text)
            .AddWithValue("@detailname", tbdetailname.Text)
            .AddWithValue("@PopID", hdfPopID.Value)

        End With

    End Sub

    Private Function fSaveDatatext(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_popup(rID,headname,detailname,typefile,video,video_name,videosize,show) ")
        nSb.Append("values(@rID,@headname,@detailname,@typefile,@video,@video_name,@videosize,@show)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValuetext(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValuetext(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters

            .AddWithValue("@rID", hdfrID.Value)
            .AddWithValue("@headname", tbheadname.Text)
            .AddWithValue("@detailname", tbdetailname.Text)
            .AddWithValue("@typefile", "text")
            .AddWithValue("@video", System.Data.SqlTypes.SqlBinary.Null)
            .AddWithValue("@video_name", "")
            .AddWithValue("@videosize", "")
            .AddWithValue("@show", "0")

        End With

    End Sub

    Private Function checkrenamefile(ByVal id As Long, ByVal ext As String)
        Dim nDt As DataTable
        Dim nVal As String

        Dim sql As String = "SELECT * FROM oss_picpopup WHERE renamefile='" & id & ext & "'"
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