Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Arit
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

    Protected Sub cmdLogin_Click(sender As Object, e As EventArgs) Handles cmdLogin.Click
        Dim nUser As cUser = Session("cUser")
        'fLogin(tbcodestaff.Text, tbpassword.Text)
        Dim nDtt As DataTable
        Dim sql As String = "SELECT * FROM oss_pss WHERE pss ='" & tbpassword.Text & "'"
        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDtt) Then
            If nDtt.Rows.Count > 0 Then


                Dim wService As New patientservice.patientservice
                Dim nDs As DataSet
                Try
                    nDs = mTool.fReadDataSetFromXML(wService.Get_staff_fulldetail(tbcodestaff.Text))
                    If nDs.Tables.Count > 0 Then
                        Dim nDt As DataTable = nDs.Tables(0)
                        If nDt.Rows.Count > 0 Then
                            If nDt.Rows(0).Item(0).ToString <> "" Then
                                Dim id As String = nDt.Rows(0).Item("staff_id")

                                If checklevel(id) Then

                                    If checkhrid(tbstaffcodesend.Text) Then
                                        showpersonal(tbstaffcodesend.Text)
                                        showtel(tbstaffcodesend.Text)
                                        showemail(tbstaffcodesend.Text)
                                        multiveiw1.SetActiveView(viewadd)
                                    Else
                                        ShowMessage("ไม่พบข้อมูล", MessageType.Error)
                                        Exit Sub
                                    End If

                                Else
                                    ShowMessage("ไม่สามารถกรอกข้อมูลได้เนื่องจากระดับสิทธิ์ไม่ถึง", MessageType.Error)
                                    Exit Sub
                                End If


                            Else
                                Throw New Exception("รหัสผ่านผิดพลาด")
                            End If
                        Else
                            Throw New Exception("รหัสบุคคลผิดพลาด")
                        End If
                    End If
                Catch ex As Exception

                End Try

            Else
                ShowMessage("รหัสผ่านLogin พิเศษไม่ถูกต้อง", MessageType.Error)
            End If
        End If

    End Sub



    Private Sub showemail(ByVal staffid As String)
        Dim nValue As String = ""
        Dim hrservice As New HRwebservice.HrStaffProfileWebService

        Try
            Dim nDs As DataSet
            nDs = mTool.fReadDataSetFromXML(hrservice.SearchProfileEmailByPersonId(staffid), nValue)
            If nDs.Tables.Count > 0 Then
                Dim nDt As DataTable = nDs.Tables(0)
                If nDt.Rows.Count > 0 Then
                    If nDt.Rows(0).Item(0).ToString <> "" Then

                        tbemail.Text = nDt.Rows(0).Item("commKey")


                    Else
                        Throw New Exception("ไม่มีข้อมูลในHR")
                    End If
                Else
                    Throw New Exception("ไม่มีข้อมูลในHR")
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub showtel(ByVal staffid As String)
        Dim nValue As String = ""
        Dim hrservice As New HRwebservice.HrStaffProfileWebService

        Try
            Dim nDs As DataSet
            nDs = mTool.fReadDataSetFromXML(hrservice.SearchProfileTelephoneByPersonId(staffid), nValue)
            If nDs.Tables.Count > 0 Then
                Dim nDt As DataTable = nDs.Tables(0)
                If nDt.Rows.Count > 0 Then
                    If nDt.Rows(0).Item(0).ToString <> "" Then
                        tbtel.Text = nDt.Rows(0).Item("telephoneNR")
                        tbmobile.Text = nDt.Rows(0).Item("telephoneNR")
                    Else
                        Throw New Exception("ไม่มีข้อมูลในHR")
                    End If
                Else
                    Throw New Exception("ไม่มีข้อมูลในHR")
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub showpersonal(ByVal staffid As String)
        Dim nValue As String = ""

        Dim hrserviec As New HRwebservice.HrStaffProfileWebService
        Try
            Dim nDs As DataSet
            nDs = mTool.fReadDataSetFromXML(hrserviec.SearchEmployeeInfoByPersonIdForResearch(staffid), nValue)
            If nDs.Tables.Count > 0 Then
                Dim nDt As DataTable = nDs.Tables(0)
                If nDt.Rows.Count > 0 Then
                    If nDt.Rows(0).Item(0).ToString <> "" Then
                        tbcode_staff.Text = nDt.Rows(0).Item("emp_no")
                        tbposition.Text = nDt.Rows(0).Item("emp_title_education")
                        tbrank.Text = nDt.Rows(0).Item("emp_title_army")
                        tbeducation.Text = nDt.Rows(0).Item("emp_title_education")
                        tbprofession.Text = nDt.Rows(0).Item("emp_position")

                        If nDt.Rows(0).Item("emp_title_general") = "นาย" Then
                            ddlfname.SelectedIndex = 1
                        ElseIf nDt.Rows(0).Item("emp_title_general") = "นางสาว" Then
                            ddlfname.SelectedIndex = 2
                        ElseIf nDt.Rows(0).Item("emp_title_general") = "นาง" Then
                            ddlfname.SelectedIndex = 3
                        Else
                            ddlfname.SelectedIndex = 0
                        End If
                        tbname.Text = nDt.Rows(0).Item("emp_fullname")
                    Else
                   
                        Throw New Exception("ไม่พบข้อมูล")
                    End If


                End If
            End If
        Catch ex As Exception

        End Try

    End Sub

    Function checklevel(ByVal codestaff As String) As Boolean
        Dim nDt As DataTable
        Dim level As String
        Dim nVal As Boolean
        Dim strsql As String = "SELECT * FROM view_user_info WHERE codestaff ='" & codestaff & "'"
        Dim cmd As New SqlCommand(strsql)
        Try
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    level = nDt.Rows(0).Item("namelevel")
                    If level = "IT" Then
                        nVal = True
                    Else
                        nVal = False
                    End If
                Else
                    nVal = False
                End If
            End If
        Catch ex As Exception
            nVal = False
        End Try

        Return nVal

    End Function

    Function checkhrid(ByVal codestaff) As Boolean
        Dim nValue As String = ""
        Dim nVal As Boolean
        Dim hrserviec As New HRwebservice.HrStaffProfileWebService
        Try
            Dim nDs As DataSet
            nDs = mTool.fReadDataSetFromXML(hrserviec.SearchEmployeeInfoByPersonIdForResearch(codestaff), nValue)
            If nDs.Tables.Count > 0 Then
                Dim nDt As DataTable = nDs.Tables(0)
                If nDt.Rows.Count > 0 Then
                    If nDt.Rows(0).Item(0).ToString <> "" Then
                        nVal = True
                    Else
                        nVal = False
                        Throw New Exception("ไม่พบข้อมูล")
                    End If


                End If
            End If
        Catch ex As Exception
             nVal = False
        End Try

        Return nVal

    End Function



    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String
        Dim pvalue As String
        Dim nDt As DataTable

        Dim sqlcheck As String = "SELECT * FROM oss_person WHERE codestaff='" & tbstaffcodesend.Text & "'"
        Dim cmdc As New SqlCommand(sqlcheck)
        If mDB.fReadDataTable(cmdc, nDt) Then
            If nDt.Rows.Count > 0 Then
                ShowMessage("รหัสบุคคลซ้ำไม่สามารถบันทึกข้อมูลได้", MessageType.Error)

                Exit Sub
            End If
        End If

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
                .AddWithValue("@codestaff", tbstaffcodesend.Text)
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
            .AddWithValue("@codestaff", tbstaffcodesend.Text)
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

    Private Sub clstb()
        tbcode_staff.Text = ""
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


End Class