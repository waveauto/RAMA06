Public Class Configuration
    Private Shared Function GetConfigValue(key As String) As String
        Dim value As String = String.Empty

        If Not String.IsNullOrEmpty(key) Then
            value = ConfigurationManager.AppSettings(key)
        End If

        Return value
    End Function

    Public Shared ReadOnly Property SessionSecurityName() As String
        Get
            Return GetConfigValue("SessionUserLogin")
        End Get
    End Property

    Public Shared ReadOnly Property SessionName(key As String) As String
        Get
            Return GetConfigValue(key)
        End Get
    End Property


End Class
