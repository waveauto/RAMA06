Imports System.Text
Imports System.Data.SqlClient
Imports System.IO

Public Class cAppFunc
    ''' <summary>
    ''' ตรวจสอบการใช้งานหน้าจอ ว่าผู้ใช้งานท่านนั้นมีสิทธิ์ใช้งานหน้านั้นหรือไม่
    ''' </summary>
    ''' <param name="pUserID">Staff Code</param>
    ''' <param name="pMenuCode">Menu Code</param>
    ''' <returns>Page permisstion</returns>
    Private Function fCheckStaffMenu(ByVal pUserID As String, ByVal pMenuCode As String) As Boolean
        Dim nVal As Boolean = False
        Dim nValue As Integer = 0
        Dim nDB As New cDBTool
        Dim nSb As New StringBuilder
        nSb.Append("select count(*) from view_user_menu where userID=@userID and menu_code=@menu_code")
        Dim nComd As New SqlCommand(nSb.ToString)
        With nComd.Parameters
            .AddWithValue("@userID", pUserID)
            .AddWithValue("@menu_code", pMenuCode)
        End With
        If nDB.fReadTopData(nComd, nValue) Then
            nVal = IIf(nValue > 0, True, False)
        End If
        Return nVal
    End Function

    Public Function fGetHTMLMenu(ByVal pUrlMaster As String, ByVal pStaffCode As String) As String
        Dim nAllTagMenu As String = ""
        Dim nMenu As String = ""
        Dim nDt As DataTable
        If fReadStaffMenu(pStaffCode, nDt) Then
            If nDt.Rows.Count > 0 Then
                If nDt.Select("menu_link='#' or menu_parent=''").Count > 0 Then
                    Dim nDtParent As DataTable = nDt.Select("menu_link='#' or menu_parent=''", "sort").CopyToDataTable
                    If nDtParent.Rows.Count > 0 Then
                        For i = 0 To nDtParent.Rows.Count - 1
                            If nDtParent.Rows(i).Item("menu_link") = "#" Then
                                nMenu &= fGetMenuDropDown(nDt, pUrlMaster, nDtParent.Rows(i).Item("menu_code"), nDtParent.Rows(i).Item("menu_name"))
                            Else
                                nMenu &= fGetChilMenu(pUrlMaster, nDtParent.Rows(i).Item("menu_link"), nDtParent.Rows(i).Item("menu_name"))
                            End If
                        Next
                    End If
                End If
            End If
        End If
        If nMenu <> "" Then
            nAllTagMenu = nMenu
        End If
        Return nAllTagMenu
    End Function

    Private Function fReadStaffMenu(ByVal pStaffCode As String, ByRef pDt As DataTable) As Boolean
        Dim nVal As Boolean = False
        Dim nValue As Integer = 0
        Dim nDB As New cDBTool
        Dim nSb As New StringBuilder
        nSb.Append("select * from view_user_menu where userID=@userID and display = 1 order by sort")
        Dim nComd As New SqlCommand(nSb.ToString)
        nComd.Parameters.AddWithValue("@userID", pStaffCode)
        Return nDB.fReadDataTable(nComd, pDt)
    End Function

    Private Function fGetMenuDropDown(ByVal pDt As DataTable,
                                      ByVal pUrlMaster As String,
                                      ByVal pMenuParentCode As String,
                                      ByVal pMenuParentName As String) As String
        Dim nDt As New DataTable
        Dim nSb As New StringBuilder
        Dim nAllTagMenu As String = ""
        Dim nMenu As String = ""
        If pDt.Select("menu_parent='" & pMenuParentCode & "'").Count > 0 Then
            nDt = pDt.Select("menu_parent='" & pMenuParentCode & "'").CopyToDataTable
            For i = 0 To nDt.Rows.Count - 1
                nMenu &= fGetChilMenu(pUrlMaster, nDt.Rows(i).Item("menu_link"), nDt.Rows(i).Item("menu_name"))
            Next
            If nMenu <> "" Then
                nSb.Append("<li class='dropdown'>" & vbCrLf)
                nSb.Append("    <a href='#' class='dropdown-toggle' data-toggle='dropdown'><strong>" & pMenuParentName & "</strong><span class='caret'></span></a>" & vbCrLf)
                nSb.Append("        <ul class='dropdown-menu' role='menu'>" & vbCrLf)
                nSb.Append("        {0}" & vbCrLf)
                nSb.Append("    </ul>" & vbCrLf)
                nSb.Append("</li>" & vbCrLf)
                nAllTagMenu = String.Format(nSb.ToString, nMenu)
            End If
        End If
        Return nAllTagMenu

    End Function

    Private Function fGetChilMenu(ByVal pUrlMaster As String, ByVal pLinkUrl As String, ByVal pLinkName As String) As String
        Return String.Format("<li><a href='{0}'><strong>{1}</strong></a></li>", pUrlMaster & pLinkUrl, pLinkName)
    End Function

    Public Function fReadMenuTitle(ByVal pMenuCode As String) As String
        Dim nDt As DataTable
        Dim nValue As String = ""
        Dim nDB As New cDBTool
        Dim nSb As New StringBuilder
        nSb.Append("select menu_name from menu where menu_code=@menu_code")
        Dim nComd As New SqlCommand(nSb.ToString)
        nComd.Parameters.AddWithValue("@menu_code", pMenuCode)
        If nDB.fReadDataTable(nComd, nDt) Then
            If nDt.Rows.Count > 0 Then
                nValue = nDt.Rows(0).Item(0)
            End If
        End If
        Return nValue
    End Function

    Public Sub fBindDDLDep(ByRef pDdl As DropDownList)
        Dim nDB As New cDBTool
        Dim mTool As New cTools
        Dim nSb As New StringBuilder
        nSb.Append("select depID,depName from department where status = 1 order by depID")
        Dim nDt As DataTable
        If nDB.fReadDataTable(nSb.ToString, nDt) Then
            mTool.fBindDataCbo(nDt, pDdl, "depName", "depID", "กรุณาเลือก")
        End If
    End Sub

    Public Sub fBindDDLDuty(ByRef pDdl As DropDownList, Optional pSelectTxt As String = "กรุณาเลือก")
        Dim nDB As New cDBTool
        Dim mTool As New cTools
        Dim nSb As New StringBuilder
        nSb.Append("select idDuty,researcherDuty from m_Duty order by idDuty")
        Dim nDt As DataTable
        If nDB.fReadDataTable(nSb.ToString, nDt) Then
            mTool.fBindDataCbo(nDt, pDdl, "researcherDuty", "idDuty", pSelectTxt)
        End If
    End Sub

    Public Function fCheckSession() As Boolean
        If HttpContext.Current.Session("cUser") Is Nothing Then
            HttpContext.Current.Response.Redirect("~/login.aspx?returnUrl=" & HttpContext.Current.Request.Url.AbsoluteUri)
        End If
        Dim nUser As cUser = HttpContext.Current.Session("cUser")

        'Dim nMenuCode As String = Path.GetFileNameWithoutExtension(HttpContext.Current.Request.Url.AbsolutePath)
        'If Not fCheckStaffMenu(nUser.tUserID, nMenuCode) Then
        '    HttpContext.Current.Response.Redirect("~/nMaster/MS00.aspx")
        'End If
        Return True
    End Function




    ''' <summary>
    ''' ตรวจสอบข้อมูลในDropDownListหากไม่เลือกข้อมูลจะส่งค่า NULL ออกไป
    ''' </summary>
    ''' <param name="pValue">ช้อความที่จะทำการตรวจสอบ Nothing and -1 -> NULL value </param>
    ''' <returns>NULL Value or SelectedValue</returns>
    Public Function fCheckNullValue(ByVal pValue As String) As Object
        If pValue = "-1" Or pValue = "" Then
            Return DBNull.Value
        Else
            Return pValue
        End If
    End Function

End Class
