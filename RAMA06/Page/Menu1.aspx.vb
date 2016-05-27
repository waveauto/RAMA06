Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class Menu1
    Inherits System.Web.UI.Page

    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mFunc As New cAppFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If mFunc.fCheckSession Then
            Dim nUser As cUser = Session("cUser")

            Select Case nUser.tNamelevel
                Case "User"
                    G1.Visible = True
                    G2.Visible = False
                    G3.Visible = False
                    G4.Visible = False
                
                Case "Staff"
                    G1.Visible = True
                    G2.Visible = True
                    G3.Visible = True
                    G4.Visible = True
               
                Case "Committee"
                    G1.Visible = True
                    G2.Visible = True
                    G3.Visible = True
                    G4.Visible = True
             

                Case "Director"
                    G1.Visible = True
                    G2.Visible = True
                    G3.Visible = True
                    G4.Visible = True
              
                Case "IT"
                    G1.Visible = True
                    G2.Visible = True
                    G3.Visible = True
                    G4.Visible = True
                 

            End Select
        End If
    End Sub

End Class