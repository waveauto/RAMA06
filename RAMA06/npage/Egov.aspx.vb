Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Egov
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
            Dim sql As String = "SELECT rID FROM oss_foundgovernment WHERE IDfound = @IDfound"
            Dim cmd As New SqlCommand(sql)
            cmd.Parameters.AddWithValue("@IDfound", hdfid.Value)
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
            sql = "SELECT renamefile FROM oss_imgfoundgovernment WHERE ID_imgfound = '" & nID & "'"
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
            sqldelimg = "SELECT renamefile FROM oss_imgfoundgovernment WHERE ID_imgfound ='" & nID & "'"

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

            Dim sqldelete As String = "DELETE FROM oss_imgfoundgovernment WHERE ID_imgfound='" & nID & "'"
            Dim cmddel As New SqlCommand(sqldelete)

            If mDB.fExecuteCommand(cmddel, nValue) Then
                BindGrid()
            End If
        End If
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



                        Dim ext As String = Path.GetExtension(FileUpload4.FileName)
                        Dim filesize As Integer
                        filesize = FileUpload4.PostedFile.ContentLength
                        'InsertT01_IMG

                        Dim rename As String = checkrenamefile(intDiceRoll, ext)

                        Dim sqlinsert As String = ""
                        sqlinsert = "INSERT INTO oss_imgfoundgovernment(rID,namefile,renamefile,sizefile,typefile)" & _
                        "VALUES" & _
                        "(@rID,@namefile,@renamefile,@sizefile,@typefile)"

                        Dim cmd As New SqlCommand(sqlinsert)
                        cmd.Parameters.AddWithValue("@rID", hdfrid.Value)
                        cmd.Parameters.AddWithValue("@namefile", FileUpload4.FileName)
                        cmd.Parameters.AddWithValue("@renamefile", rename)
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

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String
        If mFunc.fCheckSession Then
            If fUpdateData(nValue) Then
                ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
            End If
        End If
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        Response.Redirect("~/npage/Agov.aspx")
    End Sub

#End Region

#Region "FUNCTION"
    Private Sub fShowDetail(ByVal pID As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_foundgovernment WHERE IDfound = '" & pID & "'"

        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbnamefound.Text = nDt.Rows(0).Item("namefound")
                Literal1.Text = nDt.Rows(0).Item("detailfound")
                tbdetailfound.Text = Literal1.Text

                tbnumfound.Text = nDt.Rows(0).Item("numfound")
                tbnummoneyfound.Text = nDt.Rows(0).Item("nummoneyfound")

                tbdatefound.Text = nDt.Rows(0).Item("datefound")
                tbendfound.Text = nDt.Rows(0).Item("endfound")
                tbtypefound.Text = nDt.Rows(0).Item("typefound")

            End If
        End If
    End Sub

    Private Sub fShowPic(ByVal id As Integer)
        Dim nDt As DataTable

        Dim strsql As String = "SELECT row_number() OVER (ORDER BY ID_imgfound ASC) AS row,* FROM oss_imgfoundgovernment WHERE rID='" & id & "'"
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

    Private Sub BindGrid()

        Dim nUser As cUser = Session("cUser")
        Dim nDt As DataTable
        Dim strsql As String = "SELECT row_number() OVER (ORDER BY ID_imgfound ASC) AS row,* FROM oss_imgfoundgovernment WHERE rID='" & hdfrid.Value & "'"

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
        nSb.Append("update oss_foundgovernment set ")
        nSb.Append("namefound = @namefound,detailfound = @detailfound,numfound = @numfound,nummoneyfound = @nummoneyfound,datefound = @datefound,endfound = @endfound,typefound = @typefound ")
        nSb.Append("where IDfound = @IDfound")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@namefound", tbnamefound.Text)
            .AddWithValue("@detailfound", tbdetailfound.Text)
            .AddWithValue("@numfound", tbnumfound.Text)
            .AddWithValue("@nummoneyfound", tbnummoneyfound.Text)
            .AddWithValue("@datefound", tbdatefound.Text)
            .AddWithValue("@endfound", tbendfound.Text)
            .AddWithValue("@typefound", tbtypefound.Text)

            .AddWithValue("@IDfound", hdfid.Value)
        End With
    End Sub

    Private Function checkrenamefile(ByVal id As Long, ByVal ext As String)
        Dim nDt As DataTable
        Dim nVal As String

        Dim sql As String = "SELECT * FROM oss_imgfoundgovernment WHERE renamefile='" & id & ext & "'"
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