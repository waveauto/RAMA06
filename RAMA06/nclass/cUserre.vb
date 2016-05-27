Public Class cUserre
    Private mUserID As String
    Public Property tUserID() As String
        Get
            Return mUserID
        End Get
        Set(ByVal value As String)
            mUserID = value
        End Set
    End Property

    Private mFullName As String
    Public Property tFullName() As String
        Get
            Return mFullName
        End Get
        Set(ByVal value As String)
            mFullName = value
        End Set
    End Property

End Class
