Public Class cTools

    Public IFP_Eng As IFormatProvider = New System.Globalization.CultureInfo("en-US")
    Public IFP_TH As IFormatProvider = New System.Globalization.CultureInfo("th-TH")
    Public Enum alertCssClassType
        success = 1
        info = 2
        warning = 3
        danger = 4
    End Enum

    ''' <summary>
    ''' แปลงรูปแบบวันที่จาก dd/MM/yyyy -> yyyy-MM-dd
    ''' </summary>
    ''' <param name="pDateStr">date string [dd/MM/yyyy]</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function fDateDisplayToDB(ByVal pDateStr As String) As String
        Dim nDate As String
        Try
            nDate = Date.ParseExact(pDateStr, "dd/MM/yyyy", IFP_Eng).ToString("yyyy-MM-dd", IFP_Eng)
        Catch ex As Exception
            nDate = ""
        End Try
        Return nDate
    End Function

    ''' <summary>
    ''' แปลงรูปแบบวันที่จาก  yyyy-MM-dd -> dd/MM/yyyy
    ''' </summary>
    ''' <param name="pDateStr">date string [yyyy-MM-dd]</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function fDateDBToDisplay(ByVal pDateStr As String) As String
        Dim nDate As String
        Try
            nDate = Date.ParseExact(pDateStr, "yyyy-MM-dd", IFP_Eng).ToString("dd/MM/yyyy", IFP_Eng)
        Catch ex As Exception
            nDate = ""
        End Try
        Return nDate
    End Function

    Public Sub fBindDataCbo(ByVal pDt As DataTable,
                            ByRef pCbo As Object,
                            ByVal pDisplay As String,
                            ByVal pValue As String,
                            ByVal pPleaseSelectTxt As String)
        With pCbo
            .DataSource = pDt
            .DataValueField = pValue
            .DataTextField = pDisplay
            .DataBind()
            .Items.Insert(0, New ListItem(pPleaseSelectTxt, "-1"))
        End With

    End Sub

    ''' <summary>
    ''' แสดง Message Box
    ''' </summary>
    ''' <param name="pParent">This Parent [Me]</param>
    ''' <param name="pMsg">Message String</param>
    ''' <remarks></remarks>
    Public Sub fShowMsgBox(ByVal pParent As Object, ByVal pMsg As String)
        'Static Dim handlerPages As New Hashtable
        Dim nSb As New StringBuilder()
        Dim nFormObject As System.Web.UI.Control

        pMsg = pMsg.Replace("'", "\'")
        pMsg = pMsg.Replace(Chr(34), "\" & Chr(34))
        pMsg = pMsg.Replace(vbCrLf, "\n")
        pMsg = "alert('" & pMsg & "');"
        nSb = New StringBuilder()
        nSb.Append(pMsg)

        For Each nFormObject In pParent.Controls
            If TypeOf nFormObject Is HtmlForm Then
                Exit For
            End If
        Next
        ScriptManager.RegisterStartupScript(pParent, pParent.GetType(), Guid.NewGuid().ToString(), nSb.ToString, True) '  "alert('xxxx');", True)
    End Sub

    ''' <summary>
    ''' show Alert on div msg use Bootstrap css Class
    ''' </summary>
    ''' <param name="pType">ประเภทการโชว์</param>
    ''' <param name="pParent">Me</param>
    ''' <param name="pTxt">ข้อความที่จะแสดง</param>
    ''' <param name="pTitle">หัวข้อจะแสดงเป็นตัวหนา</param>
    Public Sub fShowAlert(ByVal pType As alertCssClassType,
                           ByVal pParent As Object,
                           ByVal pTxt As String,
                           ByVal pTitle As String)
        Dim nSb As New System.Text.StringBuilder

        nSb.Append("<div class='alert alert-" & pType.ToString & " alert-dismissible' role='alert'>")
        nSb.Append("<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>")
        If pTitle <> "" Then
            nSb.Append("<strong>" & pTitle & "</strong>" & pTxt)
        End If
        nSb.Append("</div>")
        Dim nAllTag As String = ""
        nAllTag = Replace(nSb.ToString, "'", "\'")
        nAllTag = Replace(nAllTag, vbCrLf, " ")
        nAllTag = Replace(nAllTag, ":", " ")

        ScriptManager.RegisterStartupScript(pParent, pParent.GetType(), "fShowAlert", "fShowAlert('" & nAllTag & "')", True)
    End Sub

    Public Sub fHideAlert(ByVal pParent As Object)
        ScriptManager.RegisterStartupScript(pParent, pParent.GetType(), "fHideAlert", "fHideAlert()", True)
    End Sub

    Public Sub fShowModal(ByVal pParent As Object)
        ScriptManager.RegisterStartupScript(pParent, pParent.GetType(), "fShowModal", "fShowModal()", True)
    End Sub

    Public Sub fHideModal(ByVal pParent As Object, ByVal pModalName As String)
        ScriptManager.RegisterStartupScript(pParent, pParent.GetType(), "fHideModal", "fHideModal('#" & pModalName & "')", True)
    End Sub

    Public Sub fHideTzmSection(ByVal pParent As Object)
        fHideModal(pParent, "tzmSection")
    End Sub

    ''' <summary>
    ''' XML From Web Service rama return Dataset
    ''' </summary>
    ''' <param name="pStrXML">XML Document</param>
    ''' <param name="pValue">Return String if Error</param>
    ''' <returns>Return DataSet</returns>
    ''' <remarks></remarks>
    Public Function fReadDataSetFromXML(ByVal pStrXML As String,
                                        Optional ByRef pValue As String = "") As DataSet
        Dim nDs As New DataSet
        Try
            Dim sr As New System.IO.StringReader(pStrXML)
            Dim xDoc As System.Xml.XmlReader = System.Xml.XmlReader.Create(sr)
            nDs.ReadXml(xDoc)
            If Not nDs.Tables.Count > 0 Then
                Throw New Exception("ไม่สามารถอ่านข้อมูลได้")
            End If
        Catch ex As Exception
            pValue = ex.Message
        End Try
        Return nDs
    End Function

End Class
