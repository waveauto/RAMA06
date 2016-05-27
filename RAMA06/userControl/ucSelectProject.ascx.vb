Public Class ucSelectProject
    Inherits System.Web.UI.UserControl

    Private mStaffID As String
    Public Property tStaffID() As String
        Get
            Return mStaffID
        End Get
        Set(ByVal value As String)
            mStaffID = value
        End Set
    End Property

    Private mPjID As Integer
    Public Property tPjID() As Integer
        Get
            Return mPjID
        End Get
        Private Set(ByVal value As Integer)
            mPjID = value
        End Set
    End Property

    Private mPjNameThai As String
    Public Property tPjNameThai() As String
        Get
            Return mPjNameThai
        End Get
        Private Set(ByVal value As String)
            mPjNameThai = value
        End Set
    End Property

    Private mPjNameEng As String
    Public Property tPjNameEng() As String
        Get
            Return mPjNameEng
        End Get
       Private Set(ByVal value As String)
            mPjNameEng = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack() Then
            fShowData(fReadData())
        End If
    End Sub

    Private Function fReadData() As DataTable
        Dim nDt As New DataTable("nDt")
        nDt.Columns.Add("pjID", GetType(Integer))
        nDt.Columns.Add("pjName", GetType(String))

        nDt.Rows.Add(New Object() {1, "เครื่องมือคัดกรองและประเมินภาวะโภชนาการในผู้ป่วยที่รักษาในโรงพยาบาล"})
        nDt.Rows.Add(New Object() {2, "ผลของอาหารและเครื่องดื่มที่มีฤทธิ์เป็นกรดต่อความแข็งผิวของเคลือบฟัน เนื้อฟัน และวัสดุบูรณะสีเหมือนฟัน"})
        nDt.Rows.Add(New Object() {3, "การพัฒนาบทเรียนวิทยาศาสตร์ท้องถิ่น เรื่อง การเสริมสร้างสุขภาพผู้สูงอายุในเขตเมืองด้วยภูมิปัญญาพื้นบ้านล้านนาด้านจิตบำบัด"})
        nDt.Rows.Add(New Object() {4, "คุณภาพการให้บริการและความภักดีด้านพฤติกรรมของนักท่องเที่ยวชาวต่างชาติต่อการท่องเที่ยวเพื่อสุขภาพทางการแพทย์ในเขตกรุงเทพมหานคร"})
        nDt.Rows.Add(New Object() {5, "พฤติกรรมการใช้บริการทางการแพทย์ของผู้มีบัตรทอง ในโครงการหลักประกันสุขภาพถ้วนหน้า"})
        nDt.Rows.Add(New Object() {6, "แบบแผนการเจ็บป่วยและนโยบายเกี่ยวกับสวัสดิการ การรักษาพยาบาลของผู้สูงอายุในประเทศไทย"})
        Return nDt
    End Function

    Private Sub fShowData(pDt As DataTable)
        gvData.DataSource = pDt
        gvData.DataBind()
    End Sub

    Public Event eCancel_Click()
    Private Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        RaiseEvent eCancel_Click()
    End Sub

    Public Event eSelect_Click()
    Private Sub gvData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If e.CommandName = "aSelect" Then
            tPjID = gvData.DataKeys(e.CommandArgument).Value
            tPjNameThai = gvData.Rows(e.CommandArgument).Cells(1).Text
            tPjNameEng = "Name project english " & Now.ToString("hhMMss")
            RaiseEvent eSelect_Click()
        End If
    End Sub

    Private Sub gvData_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvData.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = e.Row.RowIndex + 1
        End If
    End Sub

End Class