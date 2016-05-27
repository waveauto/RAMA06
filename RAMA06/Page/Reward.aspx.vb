Public Class Reward
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub btnSearchPj_Click(sender As Object, e As EventArgs) Handles btnSearchPj.Click
        Multiview1.SetActiveView(viewSearchPj)
    End Sub

    Private Sub ucSelectProject_eCancel_Click() Handles ucSelectProject.eCancel_Click
        Multiview1.SetActiveView(viewAllData)
    End Sub

    Private Sub ucSelectProject_eSelect_Click() Handles ucSelectProject.eSelect_Click
        txtNameThai.Text = ucSelectProject.tPjNameThai
        txtNameEng.Text = ucSelectProject.tPjNameEng
        Multiview1.SetActiveView(viewAllData)
    End Sub

End Class