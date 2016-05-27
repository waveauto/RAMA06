Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Avideo
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc
    Dim buffer As Byte()

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
        hdfmode.Value = "NEW"

        multiview1.SetActiveView(viewadd)
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click

        If FileUpload4.HasFile Then
            Select Case hdfmode.Value
                Case "NEW"
                    Dim fileExt As String = Path.GetExtension(FileUpload4.FileName)
                    If fileExt = ".mp4" Then
                        Dim nValue As String
                        If fSaveData(nValue) Then
                            clstb()
                            ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                        Else
                            'ShowMessage("Choose a valid video file", MessageType.Error)
                        End If
                    Else
                        ShowMessage("อัพโหลดได้เฉพาะไฟล์ MP4", MessageType.Error)
                    End If

                Case "EDIT"
                    Dim fileExt As String = Path.GetExtension(FileUpload4.FileName)
                    If fileExt = ".mp4" Then
                        Dim nValue As String

                        If mFunc.fCheckSession Then
                            If fUpdateData(nValue) Then
                                hdfmode.Value = "NEW"
                                ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                            End If
                        End If
                    Else
                        ShowMessage("อัพโหลดได้เฉพาะไฟล์ MP4", MessageType.Error)
                    End If

            End Select
        Else
            ShowMessage("กรุณาเลือกไฟล์ MP4 ก่อนทำการอัพโหลดค่ะ", MessageType.Error)
        End If

    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        'BindGrid()
        'ifrem.Src = ("VideoHandler.ashx?IDvideo=" + "1")
        fBindePaging()
        fShowData(1)
        multiview1.SetActiveView(viewshow)
    End Sub

    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If mFunc.fCheckSession Then
            If e.CommandName = "aname" Then



            ElseIf e.CommandName = "aEdit" Then
                Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
                hdfIDmanual.Value = ndutyID
                hdfmode.Value = "EDIT"
                showdatavideo(hdfIDmanual.Value)

                multiview1.SetActiveView(viewadd)


            ElseIf e.CommandName = "aDel" Then
                Dim pValue As String
                Dim nDt As DataTable

                Dim ndutyID As Integer = gvData.DataKeys(e.CommandArgument).Value
                hdfIDmanual.Value = ndutyID

                Dim sql As String = "DELETE FROM oss_video WHERE IDvideo='" & hdfIDmanual.Value & "'"
                Dim cmd As New SqlCommand(sql)
                mDB.fExecuteCommand(cmd, pValue)


                fBindePaging()
                fShowData(1)
            End If
        End If
    End Sub

    Private Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPage.SelectedIndexChanged
        fShowData(ddlPage.SelectedValue)
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If mFunc.fCheckSession Then
            fBindePaging()
            fShowData(1)
        End If
    End Sub
#End Region

#Region "FUNCTION"
    Private Sub fShowData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvData.DataSource = fReadData(pPage, pSortDirection)
        gvData.DataBind()
    End Sub

    Private Function fReadData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nUser As cUser = Session("cUser")
        Dim nPageSize As Integer = gvData.PageSize
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select * from ( ")
        nSb.Append("select ROW_NUMBER() OVER(ORDER BY IDvideo ) AS row,*  ")
        nSb.Append("from oss_video where 1=1")
        nSb.Append(fGetSearchStr())
        nSb.Append(") AS a ")
        nSb.Append(String.Format(" where row between {0} and {1} order by IDvideo",
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
        nSb.Append("select count(*) from oss_video where 1=1 ")
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
        If txtSearch.Text <> "" Then nValue &= " and (Headvideo like @searchTxt )"
        Return nValue
    End Function

    Private Function fUpdateData(ByRef pValue As String) As Boolean

        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_video set ")
        nSb.Append("Headvideo = @Headvideo,video = @video,video_name = @video_name,video_size = @video_size ")
        nSb.Append("where IDvideo = @IDvideo")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")

        If FileUpload4.HasFile AndAlso FileUpload4.PostedFile IsNot Nothing AndAlso FileUpload4.PostedFile.FileName <> "" Then
            Dim file As HttpPostedFile = FileUpload4.PostedFile


            buffer = New Byte(file.ContentLength - 1) {}
            Dim bytesReaded As Integer = file.InputStream.Read(buffer, 0, FileUpload4.PostedFile.ContentLength)


            If bytesReaded > 0 Then
                With pCommand.Parameters
                    .AddWithValue("@Headvideo", tbHeadvideo.Text)
                    .AddWithValue("@video", buffer)
                    .AddWithValue("@video_name", FileUpload4.FileName)
                    .AddWithValue("@video_size", file.ContentLength)
                    .AddWithValue("@IDvideo", hdfIDmanual.Value)


                End With

            End If
        Else
            'Label1.Text = "Choose a valid video file"
        End If

    End Sub

    Private Sub clstb()
        tbHeadvideo.Text = ""
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

    Private Function fSaveData(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_video(Headvideo,video,video_name,video_size) ")
        nSb.Append("values(@Headvideo,@video,@video_name,@video_size)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValue(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")

        If FileUpload4.HasFile AndAlso FileUpload4.PostedFile IsNot Nothing AndAlso FileUpload4.PostedFile.FileName <> "" Then
            Dim file As HttpPostedFile = FileUpload4.PostedFile


            buffer = New Byte(file.ContentLength - 1) {}
            Dim bytesReaded As Integer = file.InputStream.Read(buffer, 0, FileUpload4.PostedFile.ContentLength)


            If bytesReaded > 0 Then
                With pCommand.Parameters
                    .AddWithValue("@Headvideo", tbHeadvideo.Text)
                    .AddWithValue("@video", buffer)
                    .AddWithValue("@video_name", FileUpload4.FileName)
                    .AddWithValue("@video_size", file.ContentLength)

                End With

            End If
        Else
            'Label1.Text = "Choose a valid video file"
        End If



    End Sub

    Private Sub showdatavideo(ByVal id As String)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_video WHERE IDvideo='" & id & "'"
        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbHeadvideo.Text = nDt.Rows(0).Item("Headvideo")
                'ifrem.Src = ("VideoHandler.ashx?IDvideo=" + id)
            End If
        End If
    End Sub

#End Region

    Protected Sub gvData_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvData.SelectedIndexChanged

    End Sub
End Class