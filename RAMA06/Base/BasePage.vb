Public Class BasePage
    Inherits System.Web.UI.Page


#Region "Session"

    Private Function userLogin(user As String) As UserInfo
        Dim myCon As New ConnectDB

        'Dim sql As String = " SELECT * FROM View_T01_person WHERE code_person = '" & user & " '  "

        Dim sql As String = "SELECT dbo.temp_staff.id, dbo.temp_staff.date_input, dbo.temp_staff.section_code, dbo.temp_section.section_name, dbo.temp_staff.staff_code,  " &
                    "dbo.temp_staff.title, dbo.temp_staff.fullname, dbo.temp_staff.position, dbo.temp_staff.tel_section, dbo.temp_staff.tel_mobile, " &
                    "dbo.temp_staff.email, dbo.temp_staff.receive_email, dbo.temp_staff.authen_code " &
                    "FROM  dbo.temp_staff INNER JOIN " &
                    "dbo.temp_section ON dbo.temp_staff.section_code = dbo.temp_section.section_code " &
                    "WHERE staff_code='" & user & "'"

        Dim dt As DataTable = myCon.GetDataTable(sql)
        Dim userInfo As New UserInfo

        If dt.Rows.Count > 0 Then
            userInfo.status = True
            userInfo.Code = dt.Rows(0).Item("staff_code")
            userInfo.title = dt.Rows(0).Item("title")
            userInfo.Full_Name = dt.Rows(0).Item("fullname")
            userInfo.section_Name = dt.Rows(0).Item("section_name")
            userInfo.section_Code = dt.Rows(0).Item("section_code")
            userInfo.authen_Level = dt.Rows(0).Item("authen_code")

        End If

        Return userInfo
    End Function

    Protected Sub ManageSecurity(user As String)
        If Not CheckSecuritySession() Then

            Dim userInfo As New UserInfo
            userInfo = userLogin(user)

            If String.IsNullOrEmpty(userInfo.Full_Name) Then
                Session.Add("Error", "ขออภัย คุณไม่มีสิทธิ์ใช้งานระบบ กรุณาติดต่อผู้ดูแลระบบ")
                Response.Redirect("~/AccessDeny.aspx")
            Else
                'Create User Session 
                Session(Configuration.SessionSecurityName) = userInfo
            End If

        Else
            Dim userInfo As UserInfo = DirectCast(Session(Configuration.SessionSecurityName), UserInfo)
            Session(Configuration.SessionSecurityName) = userInfo
        End If
    End Sub

    Public ReadOnly Property LoginInformation As UserInfo
        Get
            If CheckSecuritySession() Then
                Return DirectCast(Session(Configuration.SessionSecurityName), UserInfo)
            Else
                Return Nothing
            End If
        End Get
    End Property

    Private Function CheckSecuritySession() As Boolean
        Dim isNotNullSession As Boolean = False
        If Session(Configuration.SessionSecurityName) IsNot Nothing Then
            isNotNullSession = True
        End If

        Return isNotNullSession
    End Function

    Protected Function HasSession(sessionName As String) As Boolean
        Dim isHasSession As Boolean = False
        If Session(sessionName) IsNot Nothing Then
            isHasSession = True
        End If
        Return isHasSession
    End Function

    Protected Sub ClearSession(sessionName As String)
        Session.Remove(sessionName)
    End Sub

    Protected Sub CheckSessionExpire(sessionName As String)
        If Session(sessionName) Is Nothing Then
            Response.Redirect("~/AccessDeny.aspx")
        End If
    End Sub


#End Region

End Class
