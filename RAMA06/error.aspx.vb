Public Class _error
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not Request.QueryString("pStatuscode") Is Nothing Then
                fInitialProgram(Request.QueryString("pStatuscode"))
            End If

        End If
    End Sub

    Private Sub fInitialProgram(pStatusCode As String)
        Select Case pStatusCode
            Case "404.13"
                ltrMsg.Text = "ไม่สามารถอัปโหลดไฟล์ได้ เนื่องจากไฟล์มีขนาดใหญ่เกินกว่าที่ระบบกำหนด"
                Dim nUpload As New cUpload
                If Not Session("nFileExampleName") Is Nothing Then
                    nUpload.fDeleteFile(Session("nFileExampleName"))
                    Session("nFileExampleName") = Nothing
                End If
                If Not Session("nFileFormName") Is Nothing Then
                    nUpload.fDeleteFile(Session("nFileFormName"))
                    Session("nFileFormName") = Nothing
                End If
        End Select
    End Sub

End Class