﻿Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class NewResiterIn
    Inherits System.Web.UI.Page
    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

#Region "EVEN"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim nUser As cUserre = Session("cUser")
        If Not Page.IsPostBack Then

            tbcodestaff.Text = nUser.tUserID
            tbname.Text = nUser.tFullName
        End If
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String
        Dim pvalue As String
        Dim nDt As DataTable

        Dim sqlcheck As String = "SELECT * FROM oss_person WHERE codestaff='" & tbcodestaff.Text & "'"
        Dim cmdc As New SqlCommand(sqlcheck)
        If mDB.fReadDataTable(cmdc, nDt) Then
            If nDt.Rows.Count > 0 Then
                ShowMessage("รหัสบุคคลซ้ำไม่สามารถบันทึกข้อมูลได้", MessageType.Error)

                Exit Sub
            End If
        End If




        'If mFunc.fCheckSession Then
        If Not Me.FileUpload1.HasFile Then
            ShowMessage("กรุณาแนบไฟล์ข้อมูลที่เป็นรูปภาพ *gif, *.jpg, *.png  ก่อนการบันทึกข้อมูลด้วยค่ะ", MessageType.Error)

            Exit Sub
        End If

        If Me.FileUpload1.PostedFile Is Nothing OrElse String.IsNullOrEmpty(FileUpload1.PostedFile.FileName) OrElse
                 FileUpload1.PostedFile.InputStream Is Nothing Then
            ShowMessage("กรุณา Upload ไฟล์ข้อมูลที่เป็นรูปภาพ *gif, *.jpg, *.png ", MessageType.Error)

            Exit Sub

        End If
        Dim strMIMEType As String = String.Empty
        Dim strExtension As String = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower()
        Select Case strExtension

            Case ".gif"
                strMIMEType = "image/gif"
            Case ".jpg", ".jpeg", ".jpe"
                strMIMEType = "image/jpeg"
            Case ".png"
                strMIMEType = "image/png"

            Case Else
                ShowMessage("รูปแบบไฟล์ที่ Upload ไม่ถูกต้อง ", MessageType.Error)

                Exit Sub
        End Select



        If fSaveData(nValue) Then

            Dim sqlsavelevel As String
            sqlsavelevel = "INSERT INTO oss_authen (codestaff,IDlevel,Fun01,Fun02,Fun03,Fun04,Fun05) " & _
      " VALUES " & _
      " (@codestaff,@IDlevel,@Fun01,@Fun02,@Fun03,@Fun04,@Fun05)"

            Dim cmd As New SqlCommand(sqlsavelevel)
            With cmd.Parameters
                .AddWithValue("@codestaff", tbcodestaff.Text)
                .AddWithValue("@IDlevel", 1)
                .AddWithValue("@Fun01", "-")
                .AddWithValue("@Fun02", "-")
                .AddWithValue("@Fun03", "-")
                .AddWithValue("@Fun04", "-")
                .AddWithValue("@Fun05", "-")

            End With

            If mDB.fExecuteCommand(cmd, pvalue) Then
                clstb()
                ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)

            End If
        End If
        'End If

    End Sub

#End Region

#Region "FUNCTION"
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
        tbcodestaff.Text = ""
        tbposition.Text = ""
        tbrank.Text = ""
        tbeducation.Text = ""
        tbprofession.Text = ""
        tbdignity.Text = ""
        ddlfname.SelectedIndex = 0
        tbname.Text = ""
        tbtel.Text = ""
        tbmobile.Text = ""
        tbemail.Text = ""
    End Sub

    Private Function fSaveData(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_person(codestaff,position,rank,education,profession,dignity,fname,name,tel,mobile,email,Image) ")
        nSb.Append("values(@codestaff,@position,@rank,@education,@profession,@dignity,@fname,@name,@tel,@mobile,@email,@Image)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValue(ByRef pCommand As SqlCommand)

        With pCommand.Parameters
            .AddWithValue("@codestaff", tbcodestaff.Text)
            .AddWithValue("@position", tbposition.Text)
            .AddWithValue("@rank", tbrank.Text)
            .AddWithValue("@education", tbeducation.Text)
            .AddWithValue("@profession", tbprofession.Text)
            .AddWithValue("@dignity", tbdignity.Text)
            .AddWithValue("@fname", ddlfname.SelectedItem.Text)
            .AddWithValue("@name", tbname.Text)
            .AddWithValue("@tel", tbtel.Text)
            .AddWithValue("@mobile", tbmobile.Text)
            .AddWithValue("@email", tbemail.Text)

            Dim imageBytes(FileUpload1.PostedFile.InputStream.Length) As Byte
            FileUpload1.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length)


            .AddWithValue("@Image", imageBytes)
        End With
    End Sub

#End Region

End Class