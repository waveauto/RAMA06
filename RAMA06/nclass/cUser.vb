Public Class cUser

    Private mUserID As String
    Public Property tUserID() As String
        Get
            Return mUserID
        End Get
        Set(ByVal value As String)
            mUserID = value
        End Set
    End Property

    Private mBeFrom As Boolean
    Public Property tBeFrom() As Boolean
        Get
            Return mBeFrom
        End Get
        Set(ByVal value As Boolean)
            mBeFrom = value
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

    Private mPrefixName As String
    Public Property tPrefixName() As String
        Get
            Return mPrefixName
        End Get
        Set(ByVal value As String)
            mPrefixName = value
        End Set
    End Property

    Private mAlignAcademic As String
    Public Property tAlignAcademic() As String
        Get
            Return mAlignAcademic
        End Get
        Set(ByVal value As String)
            mAlignAcademic = value
        End Set
    End Property

    Private mDepID As String
    Public Property tDepID() As String
        Get
            Return mDepID
        End Get
        Set(ByVal value As String)
            mDepID = value
        End Set
    End Property

    Private mDepName As String
    Public Property tDepName() As String
        Get
            Return mDepName
        End Get
        Set(ByVal value As String)
            mDepName = value
        End Set
    End Property

    Private mGender As Boolean
    Public Property tGender() As Boolean
        Get
            Return mGender
        End Get
        Set(ByVal value As Boolean)
            mGender = value
        End Set
    End Property
    '*********************************************

    Private mNamelevel As String
    Public Property tNamelevel() As String
        Get
            Return mNamelevel
        End Get
        Set(ByVal value As String)
            mNamelevel = value
        End Set
    End Property

    Private mposition As String
    Public Property tposition() As String
        Get
            Return mposition
        End Get
        Set(ByVal value As String)
            mposition = value
        End Set
    End Property

    Private mrank As String
    Public Property trank() As String
        Get
            Return mrank
        End Get
        Set(ByVal value As String)
            mrank = value
        End Set
    End Property

    Private meducation As String
    Public Property teducation() As String
        Get
            Return meducation
        End Get
        Set(ByVal value As String)
            meducation = value
        End Set
    End Property

    Private mprofession As String
    Public Property tprofession() As String
        Get
            Return mprofession
        End Get
        Set(ByVal value As String)
            mprofession = value
        End Set
    End Property

    Private mdignity As String
    Public Property tdignity() As String
        Get
            Return mdignity
        End Get
        Set(ByVal value As String)
            mdignity = value
        End Set
    End Property

    Private mtel As String
    Public Property ttel() As String
        Get
            Return mtel
        End Get
        Set(ByVal value As String)
            mtel = value
        End Set
    End Property

    Private mmobile As String
    Public Property tmobile() As String
        Get
            Return mmobile
        End Get
        Set(ByVal value As String)
            mmobile = value
        End Set
    End Property

    Private mEmail As String
    Public Property tEmail() As String
        Get
            Return mEmail
        End Get
        Set(ByVal value As String)
            mEmail = value
        End Set
    End Property

End Class
