Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Aabout
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

#Region "EVEN"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hdfmode.Value = "EDIT"
            Dim nDt As DataTable
            Dim sql As String = "SELECT MAX(Idabout) as Idabout FROM oss_about"
            Dim cmd As New SqlCommand(sql)
            If mDB.fReadDataTable(cmd, nDt) Then
                If nDt.Rows.Count > 0 Then
                    hdfid.Value = nDt.Rows(0).Item("Idabout")
                End If
            End If
            showdata(hdfid.Value)
        End If
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Dim nValue As String
        If mFunc.fCheckSession Then
            Select Case hdfmode.Value
                Case "NEW"
                    If fSaveData(nValue) Then
                        ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                    End If

                Case "EDIT"
                    If fUpdateData(nValue) Then
                        ShowMessage("บันทึกข้อมูลเรียบร้อยแล้ว", MessageType.Success)
                    End If
            End Select
        End If


    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs) Handles btnback.Click
        Response.Redirect("~/Page/Menu1.aspx")
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
        nSb.Append("update oss_about set ")
        nSb.Append("aboutdetail = @aboutdetail,codestaff=@codestaff ")
        nSb.Append("where Idabout=@Idabout")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters
            .AddWithValue("@aboutdetail", tbdetaildetailabout.Text)
            .AddWithValue("@codestaff", nUser.tUserID)
            .AddWithValue("@Idabout", hdfid.Value)
        End With
    End Sub

    Private Sub showdata(ByVal id As Integer)
        Dim nDt As DataTable
        Dim sql As String
        sql = "SELECT * FROM oss_about WHERE Idabout ='" & id & "'"
        Dim cmd As New SqlCommand(sql)
        If mDB.fReadDataTable(cmd, nDt) Then

        End If
        If nDt.Rows.Count > 0 Then

            Literal1.Text = nDt.Rows(0).Item("aboutdetail")
            tbdetaildetailabout.Text = Literal1.Text
        Else


        End If
    End Sub

    Private Function fSaveData(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        nSb.Append("insert into oss_about(aboutdetail,codestaff) ")
        nSb.Append("values(@aboutdetail,@codestaff)")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValue(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")
        With pCommand.Parameters

            .AddWithValue("@aboutdetail", tbdetaildetailabout.Text)
            .AddWithValue("@codestaff", nUser.tUserID)
        End With
    End Sub

#End Region

End Class