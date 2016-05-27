Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Eman
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

#Region "EVEN"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If mFunc.fCheckSession() Then
                Dim value1 As String = Request.QueryString("value1")
                hdfIDmanual.Value = value1
                fShowDetail(hdfIDmanual.Value)




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
        Response.Redirect("~/npage/Aman.aspx")
    End Sub

#End Region

#Region "FUNCTION"
    Private Sub fShowDetail(ByVal id As Integer)
        Dim nDt As DataTable
        Dim sql As String = "SELECT * FROM oss_manual WHERE IDmanual ='" & id & "'"
        Dim cmd As New SqlCommand(sql)

        If mDB.fReadDataTable(cmd, nDt) Then
            If nDt.Rows.Count > 0 Then
                tbHeadmanual.Text = nDt.Rows(0).Item("Headmanual")
                Literal1.Text = nDt.Rows(0).Item("detailmanual")
                tbdetailmanual.Text = Literal1.Text
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

    Private Function fUpdateData(ByRef pValue As String) As Boolean

        Dim nSb As New System.Text.StringBuilder
        nSb.Append("update oss_manual set ")
        nSb.Append("Headmanual = @Headmanual,detailmanual = @detailmanual,codestaff = @codestaff ")
        nSb.Append("where IDmanual = @IDmanual")
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetParaValueup(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetParaValueup(ByRef pCommand As SqlCommand)
        Dim nUser As cUser = Session("cUser")

        With pCommand.Parameters

            'ไม่แสดง
            .AddWithValue("@Headmanual", tbHeadmanual.Text)
            .AddWithValue("@detailmanual", tbdetailmanual.Text)

            .AddWithValue("@codestaff", nUser.tUserID)
            .AddWithValue("@IDmanual", hdfIDmanual.Value)

        End With

    End Sub

#End Region


End Class