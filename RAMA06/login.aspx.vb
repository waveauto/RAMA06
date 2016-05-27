Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient


Public Class login1
    Inherits BasePage

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    'Dim myconn As New ConnectDB


    'Function CheckLoginService(ByVal txtUser As String) As Boolean

    '    Dim CheckName As String = ""

    '    Dim tmpChk As Boolean
    '    If CheckName Is Nothing Then
    '        tmpChk = False
    '    Else
    '        tmpChk = True
    '    End If

    '    Return tmpChk
    'End Function

    'Function CheckLoginStaff(ByVal txtUser As String) As String()
    '    Dim myCon As New ConnectDB

    '    'Dim sql As String = "SELECT * FROM View_T01_person WHERE code_person='" & txtUser & "'"

    '    Dim sql As String = "SELECT dbo.Temp_staff.id, dbo.Temp_staff.date_input, dbo.Temp_staff.section_code, dbo.Temp_section.section_name, dbo.Temp_staff.staff_code,  " &
    '                        "dbo.Temp_staff.title, dbo.Temp_staff.fullname, dbo.Temp_staff.position, dbo.Temp_staff.tel_section, dbo.Temp_staff.tel_mobile, " &
    '                        "dbo.Temp_staff.email, dbo.Temp_staff.receive_email, dbo.Temp_staff.authen_code " &
    '                        "FROM  dbo.Temp_staff INNER JOIN " &
    '                        "dbo.Temp_section ON dbo.Temp_staff.section_code = dbo.Temp_section.section_code " &
    '                        "WHERE staff_code='" & txtUser & "'"


    '    Dim dt As DataTable = myCon.GetDataTable(sql)

    '    Dim strUser As String()
    '    '0=staff_code, 1=title, 2=fullname,3=authen_code, 4=section_code
    '    If dt.Rows.Count > 0 Then
    '        strUser = New String() {"True", dt.Rows(0).Item("staff_code"), dt.Rows(0).Item("title"), dt.Rows(0).Item("fullname"),
    '                                dt.Rows(0).Item("section_code"), dt.Rows(0).Item("authen_code")}
    '    Else
    '        strUser = New String() {"False", "", "", "", "", ""}
    '    End If

    '    Return strUser
    'End Function

    Protected Sub cmdLogin_Click(sender As Object, e As EventArgs) Handles cmdLogin.Click
        ''Dim patientservice As New get_staff_detail.patientservice()
        ''Dim re As String = patientservice.Get_staff_detail(tbusername.Text, tbpassword.Text)

        ''Dim sr As New StringReader(re)
        ''Dim reader As XmlReader = XmlReader.Create(sr)
        ''Dim ds As New DataSet()
        ''ds.ReadXml(reader)

        ''If ds.Tables(0).Rows(0)(0).ToString().Trim().Length > 0 Then

        ''Else
        ''    Dim strScript As String
        ''    strScript = "<script language=javascript> alert(""ข้อมูลไม่ถูกต้องกรุณาตรวจสอบ"") </script>"
        ''    Page.Response.Write(strScript)

        ''    Exit Sub

        ''End If

        ''check table staff
        'Dim ChkService As Boolean = CheckLoginService(Me.tbusername.Text)
        'If ChkService = False Then
        '    Dim strScript As String
        '    strScript = "<script language=javascript> alert(""ไม่มีสิทธิ์เข้าใช้งาน"") </script>"
        '    Page.Response.Write(strScript)
        'ElseIf ChkService = True Then
        '    Dim txtStr As String() = CheckLoginStaff(Me.tbusername.Text)

        '    If txtStr(0) = "False" Then
        '        Dim strScript As String
        '        strScript = "<script language=javascript> alert(""ไม่พบข้อมูล"") </script>"
        '        Page.Response.Write(strScript)


        '    ElseIf txtStr(0) = "True" Then
        '        Session("staff_code") = txtStr(1)
        '        Session("title") = txtStr(2)
        '        Session("fullname") = txtStr(3)
        '        Session("section_code") = txtStr(4)
        '        Session("authen_code") = txtStr(5)

        '        MyBase.ManageSecurity(Me.tbusername.Text)

        '        If MyBase.LoginInformation.status = True Then

        '            'ใช้เก้บ log การ login ลงnotepad หรือลง DATABASE
        '            'loglogin()

        '            'Response.Redirect("~/Page/Home.aspx")
        '            If Session("authen_code") = "Level-1" Then

        '                Response.Redirect("~/RamaRegister.aspx")

        '            ElseIf Session("authen_code") = "Level-2" Then

        '                Response.Redirect("~/Page/Menu1.aspx")

        '            ElseIf Session("authen_code") = "Level-3" Then

        '                Response.Redirect("~/Page/Home3.aspx")

        '            ElseIf Session("authen_code") = "Level-4" Then

        '                Response.Redirect("~/Page/Home3.aspx")


        '            End If


        '        Else
        '            Dim strScript As String
        '            strScript = "<script language=javascript> alert(""ไม่พบข้อมูล"") </script>"
        '            Page.Response.Write(strScript)
        '        End If

        '    End If

        'End If


        If fLogin(tbusername.Text, tbpassword.Text) Then

            Dim nUser As cUser = fGetUserInfo(tbusername.Text)

            If nUser.tUserID <> "" Then
                Session("cUser") = nUser
                Dim nReturnUrl As String = Request.QueryString("returnUrl")
                If nReturnUrl Is Nothing Then
                    Response.Redirect("~/Page/Menu1.aspx")
                Else
                    Response.Redirect(nReturnUrl)
                End If
            Else
                Response.Redirect("~/nPages/SD01.aspx")
            End If

        Else

            mTool.fShowMsgBox(Me, "ไม่สามารถเข้าสู่ระบบได้\nรหัสพนักงานหรือรหัสผ่านผิดพลาด กรุณาตรวจสอบค่ะ")
        End If

    End Sub


    Private Function fLogin(ByVal pStaffCode As String, ByVal pPsssword As String) As Boolean
        Dim nVal As Boolean
        Dim nValue As String = ""
        Dim wService As New patientservice.patientservice
        Dim nDs As DataSet
        Try
            nDs = mTool.fReadDataSetFromXML(wService.Get_staff_detail(pStaffCode, pPsssword), nValue)
            If nDs.Tables.Count > 0 Then
                Dim nDt As DataTable = nDs.Tables(0)
                If nDt.Rows.Count > 0 Then
                    If nDt.Rows(0).Item(0).ToString <> "" Then
                        nVal = True
                    Else
                        Throw New Exception("รหัสผ่านผิดพลาด")
                    End If
                Else
                    Throw New Exception("รหัสผ่านผิดพลาด")
                End If
            End If
        Catch ex As Exception
            nVal = False
        End Try
        Return nVal
    End Function

    Private Function fGetUserInfo(ByVal pUserID As String) As cUser
        Dim nUser As New cUser
        Dim nDt As DataTable
        Dim nSb As New System.Text.StringBuilder
        nSb.Append("select * from view_user_info where codestaff=@codestaff")
        Dim nComd As New SqlCommand(nSb.ToString)
        nComd.Parameters.AddWithValue("@codestaff", pUserID)
        If mDB.fReadDataTable(nComd, nDt) Then
            If nDt.Rows.Count > 0 Then
                With nDt.Rows(0)
                    nUser.tUserID = .Item("codestaff")
                    nUser.tNamelevel = .Item("namelevel")

                    nUser.tposition = .Item("position")
                    nUser.trank = .Item("rank")
                    nUser.teducation = .Item("education")
                    nUser.tprofession = .Item("profession")
                    nUser.tdignity = .Item("dignity")
                    nUser.tPrefixName = .Item("fname")
                    nUser.tFullName = .Item("name")
                    nUser.ttel = .Item("tel")
                    nUser.tmobile = .Item("mobile")
                    nUser.tEmail = .Item("email")


                End With
            End If
        End If
        Return nUser
    End Function

End Class