Imports System.Data.SqlClient

Public Class Download
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack() Then
            fInitialProgram()
        End If
    End Sub

    Private Sub fInitialProgram()
        fReadData()
    End Sub

    Private Sub fReadData()
        Dim nDtCat As DataTable = fReadCategory()
        If Not nDtCat Is Nothing Then
            If nDtCat.Rows.Count > 0 Then
                Dim nPath As String = Page.ResolveUrl("~/files-uploads/")
                Dim nDtFile As DataTable = fReadFile()
                For i = 0 To nDtCat.Rows.Count - 1
                    Dim nHead As String = nDtCat.Rows(i).Item("catName")
                    Dim nBody As String = ""
                    Dim nDr() As DataRow = nDtFile.Select("categoryID='" & nDtCat.Rows(i).Item("catID") & "'", "sort")
                    If nDr.Count > 0 Then
                        Dim nSb As New System.Text.StringBuilder
                        For j = 0 To nDr.Count - 1
                            With nSb
                                .Append("<div>")
                                .Append("   <strong>" & nDr(j)("Name") & "</strong>")
                                .Append("   ")
                                .Append(String.Format("&nbsp;<a href='{0}'>ตัวอย่าง</a>", nPath & nDr(j)("Example")))
                                .Append(String.Format("&nbsp;<a href='{0}'>แบบฟอร์ม</a>", nPath & nDr(j)("Form")))
                                If Not IsDBNull(nDr(j)("Remark")) Then
                                    .Append("<p><small>" & nDr(j)("Remark") & "</small></p>")
                                End If
                                .Append("</div>")
                            End With
                        Next
                        nBody = nSb.ToString
                    Else

                    End If
                    ltrData.Text &= String.Format(fGetTemplate(), i + 1, nHead, nBody)
                Next

            Else
                'ltrData.Text = "<tr><td>ไม่พบข้อมูล</td></tr>"
            End If
        End If
    End Sub

    Private Function fReadCategory() As DataTable
        Dim nDB As New ConnectDB
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select ID as catID,Name as catName from oss_fileCategory where status > 0 ")
            .Append("order by (CASE WHEN sort IS NULL THEN 1 ELSE 0 END), sort")
        End With
        Dim nDt As DataTable = nDB.GetDataTable(nSb.ToString)
        'Dim nComd As New SqlCommand(nSb.ToString)
        'nDB.fReadDataTable(nComd, nDt)
        Return nDt
    End Function

    Private Function fReadFile() As DataTable
        Dim nDB As New ConnectDB
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select Name,categoryID,Example,Form,Remark,sort  ")
            .Append("from oss_file where status > 0")
        End With
        Dim nDt As DataTable = nDB.GetDataTable(nSb.ToString)
        'Dim nComd As New SqlCommand(nSb.ToString)
        'nDB.fReadDataTable(nComd, nDt)
        Return nDt
    End Function

    Private Function fGetTemplate() As String
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("<div class='panel panel-default'>")
            .Append("   <div class='panel-heading' role='tab' id='h{0}'>")
            .Append("       <h4 class='panel-title'>")
            .Append("           <a role='button' data-toggle='collapse' data-parent='#tb' href='#d{0}' aria-expanded='true' aria-controls='d{0}'>{1}</a>")
            .Append("       </h4>")
            .Append("   </div>")
            .Append("   <div id='d{0}' class='panel-collapse collapse' role='tabpanel' aria-labelledby='h{0}'>")
            .Append("       <div class='panel-body'>")
            .Append("           {2}")
            .Append("       </div>")
            .Append("   </div>")
            .Append("</div>")
        End With
        Return nSb.ToString()
    End Function



End Class