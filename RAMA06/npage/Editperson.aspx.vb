Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Editperson
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

#Region "EVEN"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            If mFunc.fCheckSession Then
                Dim nUser As cUser = Session("cUser")
                Dim nDt As DataTable

                Dim sql As String = "SELECT * FROM oss_person WHERE codestaff='" & nUser.tUserID & "'"
                Dim cmd As New SqlCommand(sql)
                If mDB.fReadDataTable(cmd, nDt) Then

                    'Image1.ImageUrl = ("IMGT.ashx?IMID=" + nUser.tUserID)


                    tbcodestaff.Text = nDt.Rows(0).Item("codestaff")
                    tbposition.Text = nDt.Rows(0).Item("position")
                    tbrank.Text = nDt.Rows(0).Item("rank")
                    tbeducation.Text = nDt.Rows(0).Item("education")
                    tbprofession.Text = nDt.Rows(0).Item("profession")
                    tbdignity.Text = nDt.Rows(0).Item("dignity")
                    ddlfname.SelectedItem.Text = nDt.Rows(0).Item("fname")
                    tbname.Text = nDt.Rows(0).Item("name")
                    tbtel.Text = nDt.Rows(0).Item("tel")
                    tbmobile.Text = nDt.Rows(0).Item("mobile")
                    tbemail.Text = nDt.Rows(0).Item("email")
                    Image1.ImageUrl = "~/IMGT.ashx?IMID=" + nDt.Rows(0).Item("codestaff")

                End If
            End If
        End If

    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        If mFunc.fCheckSession Then
            Response.Redirect("~/Page/Menu1.aspx")
        End If

    End Sub

    Private Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String
        If mFunc.fCheckSession Then



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



            If fUpdateData(nValue) Then
                ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)

            End If
        End If
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

    Private Function fUpdateData(ByRef pValue As String) As Boolean
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_person set ")
        nSb.Append("position = @position,rank = @rank,education = @education,profession = @profession,dignity = @dignity,fname = @fname,name = @name,tel = @tel,mobile = @mobile, email = @email,Image = @Image ")
        nSb.Append("where codestaff=@codestaff")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        'Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters
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


            .AddWithValue("@codestaff", tbcodestaff.Text)
        End With
    End Sub
#End Region
End Class