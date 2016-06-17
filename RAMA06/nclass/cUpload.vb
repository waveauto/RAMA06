Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.IO.Path
Public Class cUpload
    Private mUploadFloder As String = "/files-uploads/"

    Enum fileType
        All = 0
        Document = 1
        Vedio = 2
        Image = 3
        Document_and_Image = 4
    End Enum

    Public Function fUploadFile(ByVal pFile As HttpPostedFile, _
                           Optional ByVal pFileType As fileType = fileType.All, _
                           Optional ByVal pPreTxtNewName As String = "") As String
        Dim nFileName As String
        If fChkUploadType(pFile, pFileType) Then
            If fChkFileLimit(pFile.ContentLength) Then
                Dim nNewName As String = fGetNewName(pFile, pPreTxtNewName)
                pFile.SaveAs(nNewName)
                nFileName = System.IO.Path.GetFileName(nNewName)
            Else
                Throw New Exception(String.Format("ไม่สามารถอัปโหลดไฟล์ได้ เนื่องจาก {0} ไฟล์มีขนาดใหญ่กว่าที่ระบบกำหนด", fGetTxtSize(pFile.ContentLength)))
            End If
        Else
            Throw New Exception(String.Format("ไม่สามารถอัปโหลดไฟล์ได้ เนื่องจากไฟล์ประเภท {0} ระบบไม่รองรับ", GetExtension(pFile.FileName)))
        End If
        Return nFileName
    End Function

    Private Function fChkFileLimit(pSize As Integer) As Boolean
        Dim nHttpRunTime As HttpRuntimeSection = ConfigurationManager.GetSection("system.web/httpRuntime")
        Dim nLimitSize As Integer = nHttpRunTime.MaxRequestLength
        Return nLimitSize > pSize
    End Function

    Private Function fGetNewName(ByVal pFile As HttpPostedFile, Optional ByVal pPreTxtNewName As String = "") As String
        Dim nTool As New cTools
        Return System.Web.HttpContext.Current.Server.MapPath("~") & mUploadFloder & pPreTxtNewName & Now.ToString("yyyyMMddHHmmss", nTool.IFP_Eng) & GetExtension(pFile.FileName)
    End Function

    Private Function fChkUploadType(ByVal pFile As HttpPostedFile, _
                                   Optional ByVal pType As fileType = fileType.All) As Boolean
        Dim nDB As New cDBTool
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select count(ID) from oss_fileMime where status > 0 ")
            .Append("and Name = @Name ")
            Select Case pType
                Case fileType.Document : .Append("and Type = 1 ")
                Case fileType.Image : .Append("and Type = 3 ")
                Case fileType.Vedio : .Append("and Type = 2 ")
                Case fileType.Document_and_Image : .Append("and Type in (1,3) ")
            End Select
        End With
        Dim nComd As New SqlCommand(nSb.ToString)
        With nComd.Parameters
            .AddWithValue("@Name", GetExtension(pFile.FileName))
        End With
        Dim nValue As Integer = 0
        nDB.fReadTopData(nComd, nValue)
        Return CBool(nValue)
    End Function

    Private Function fGetTxtSize(pSize As Integer) As String
        Dim nSize As Double
        Dim nUnit As String
        If pSize > 1024 * 1024 Then
            nSize = pSize / 1024 / 1024
            nUnit = "MB"
        ElseIf pSize > 1024 Then
            nSize = pSize / 1024
            nUnit = "KB"
        Else
            nSize = pSize
            nUnit = "B"
        End If
        Return String.Format("{0} {1}", nSize.ToString("N"), nUnit)
    End Function

    Public Function fDeleteFile(ByVal pFileName As String) As String
        Dim nValue As String = ""
        Dim nFile As String = System.Web.HttpContext.Current.Server.MapPath("~") & mUploadFloder & pFileName
        If System.IO.File.Exists(nFile) Then
            System.IO.File.Delete(nFile)
        Else
            'Throw New Exception(String.Format("ไม่พบไฟล์ {0} ในระบบ", pFileName))
            nValue = String.Format("ไม่พบไฟล์ {0} ในระบบ", pFileName)
        End If
        Return nValue
    End Function

End Class
