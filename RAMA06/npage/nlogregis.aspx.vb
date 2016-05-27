Imports System.IO
Imports System.Data
Imports System.Data.SqlClient


Public Class nlogregis
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub cmdLogin_Click(sender As Object, e As EventArgs) Handles cmdLogin.Click
        Dim nUser As New cUserre
        'fLogin(tbcodestaff.Text, tbpassword.Text)
        Dim wService As New patientservice.patientservice
        Dim nDs As DataSet
        Try
            nDs = mTool.fReadDataSetFromXML(wService.Get_staff_detail(tbcodestaff.Text, tbpassword.Text))
            If nDs.Tables.Count > 0 Then
                Dim nDt As DataTable = nDs.Tables(0)
                If nDt.Rows.Count > 0 Then
                    If nDt.Rows(0).Item(0).ToString <> "" Then
                        nUser.tUserID = tbcodestaff.Text
                        nUser.tFullName = nDt.Rows(0).Item("name")
                        Session("cUser") = nUser
                        Response.Redirect("~/NewRegisterIn.aspx")
                    Else
                        Throw New Exception("รหัสผ่านผิดพลาด")
                    End If
                Else
                    Throw New Exception("รหัสผ่านผิดพลาด")
                End If
            End If
        Catch ex As Exception

        End Try



    End Sub

    Private Function fLogin(ByVal pStaffCode As String, ByVal pPsssword As String)
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

End Class