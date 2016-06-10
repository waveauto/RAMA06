Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class testindex1
    Inherits System.Web.UI.Page
    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Private ItemActive As Integer = 1
    Private ItemPerSlide As Integer = 1
    Private Slide As Integer = 1
    Private TotalSlide As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BindData()
     
        End If
    End Sub

    Private Sub BindData()
        Dim objBind As New DataTable
        With objBind.Columns

            .Add("namefile", GetType(String))
            .Add("renamefile", GetType(String))
        End With

        Dim nDt As DataTable
        Dim strsql As String = "SELECT * FROM oss_picpopup WHERE rID='3' ORDER BY id_imgoss_popup"
        Dim cmdpic As New SqlCommand(strsql)
        If mDB.fReadDataTable(cmdpic, nDt) Then
            If nDt.Rows.Count > 0 Then
                TotalSlide = nDt.Rows.Count
                rptObject.DataSource = nDt
                rptObject.DataBind()
            End If
        End If

    End Sub

    Private Sub rptObject_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rptObject.ItemDataBound
        If (e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem) Then
            'Dim CarouselName As String = DataBinder.Eval(e.Item.DataItem, "CarouselName")
            Dim ImageName As String = DataBinder.Eval(e.Item.DataItem, "renamefile")
            Dim URL As String = DataBinder.Eval(e.Item.DataItem, "renamefile")
            Dim sCarousel As String = ""
            Dim ltCarousel As Literal = DirectCast(e.Item.FindControl("ltCarousel"), Literal)

            If ItemActive <= ItemPerSlide Then
                If ItemActive = 1 Then
                    sCarousel &= "<div class=""item active"">" & vbCrLf
                    sCarousel &= "<div class=""row text-center"">" & vbCrLf
                End If
                sCarousel &= "<div class=""span3"">" & vbCrLf
                sCarousel &= "<div class=""thumbnail product-item"">" & vbCrLf
                sCarousel &= "<a href=""#""><img width=""883px"" ""height: 275px"" src=""" & "http://10.6.22.114/RAMA06/RAMA06/files-uploads" & Page.ResolveUrl(ImageName) & """ alt="""" /></a>" & vbCrLf
                sCarousel &= "</div>" & vbCrLf


                'sCarousel &= "<p><a class=""btn btn-large btn-block"" href=""" & "http://10.6.22.114/RAMA06/RAMA06/files-uploads/" & URL & """>View details »</a></p>	" & vbCrLf
                sCarousel &= "</div>" & vbCrLf

                If ItemActive = ItemPerSlide Then
                    sCarousel &= "</div>" & vbCrLf
                    sCarousel &= "</div><!-- /Slide1 --> " & vbCrLf
                End If
            Else
                If ItemActive = (ItemPerSlide * Slide) + 1 Then
                    sCarousel &= "<div class=""item"">" & vbCrLf
                    sCarousel &= "<div class=""row text-center"">" & vbCrLf
                    Slide += 1
                End If
                sCarousel &= "<div class=""span3"">" & vbCrLf
                sCarousel &= "<div class=""thumbnail product-item"">" & vbCrLf
                sCarousel &= "<a href=""#""><img width=""883px"" ""height: 275px"" src=""" & "http://10.6.22.114/RAMA06/RAMA06/files-uploads" & Page.ResolveUrl(ImageName) & """ alt="""" /></a>" & vbCrLf
                sCarousel &= "</div>" & vbCrLf


                'sCarousel &= "<p><a class=""btn btn-large btn-block"" href=""" & "http://10.6.22.114/RAMA06/RAMA06/files-uploads/" & URL & """>View details »</a></p>	" & vbCrLf
                sCarousel &= "</div>" & vbCrLf
                If (ItemActive = (ItemPerSlide * Slide)) Or TotalSlide = ItemActive Then
                    sCarousel &= "</div>" & vbCrLf
                    sCarousel &= "</div><!-- /Slide --> " & vbCrLf
                End If
            End If
            ItemActive += 1
            ltCarousel.Text = sCarousel
        End If
    End Sub


End Class