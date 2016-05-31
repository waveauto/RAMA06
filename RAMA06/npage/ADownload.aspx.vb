Imports System.Data.SqlClient

Public Class ADownload
    Inherits System.Web.UI.Page

    Private mFunc As New cAppFunc
    Private mTool As New cTools
    Private mDB As New cDBTool
    Private mPath As String = "/files-uploads/"

    'Private Sub btnSaveFile_Click(sender As Object, e As EventArgs) Handles btnSaveFile.Click
    '    If mFunc.fCheckSession Then
    '        Dim nFileExampleName As String = ""
    '        Dim nFileFormName As String = ""
    '        Dim nUpload As New cUpload
    '        Try
    '            If uploadExample.HasFile Then
    '                nFileExampleName = nUpload.fUploadFile(uploadExample.PostedFile, cUpload.fileType.Document_and_Image, "1_")
    '                Session("nFileExampleName") = nFileExampleName
    '            End If
    '            If uploadForm.HasFile Then
    '                nFileFormName = nUpload.fUploadFile(uploadForm.PostedFile, cUpload.fileType.Document_and_Image, "2_")
    '                Session("nFileFormName") = nFileFormName
    '            End If
    '        Catch ex As Exception
    '            'ตรวจสอบหากมีไฟล์ให้ลบ
    '            mTool.fShowMsgBox(Me, ex.Message)
    '            If nFileExampleName <> "" Then nUpload.fDeleteFile(nFileExampleName) : Session("nFileExampleName") = Nothing
    '            If nFileFormName <> "" Then nUpload.fDeleteFile(nFileFormName) : Session("nFileFormName") = Nothing
    '        End Try

    '    End If
    'End Sub

    Private Sub fInitialProgram()

    End Sub

#Region "FUNCTION Category"

    Private Sub fInitialCatNew()
        hdfMode.Value = "new"
        lblCatSubtitle.Text = "(เพิ่มข้อมูลใหม่)"
        txtCatName.Text = ""
        txtCatSort.Text = ""
        chkCatStatus.Checked = True
    End Sub

    Private Sub fInitialCatEdit()
        hdfMode.Value = "edit"
        lblCatSubtitle.Text = "(แก้ข้อมูลใหม่)"
    End Sub

    Private Sub fClrCatObj()
        txtCatName.Text = ""
        txtCatSort.Text = ""
        chkCatStatus.Checked = True
    End Sub

    Private Sub fShowCatData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvCatData.DataSource = fReadCatData(pPage, pSortDirection)
        gvCatData.DataBind()
    End Sub

    Private Function fReadCatData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nPageSize As Integer = gvCatData.PageSize
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select * from ( ")
            If pSortDirection = "" Then
                .Append("select ROW_NUMBER() OVER(ORDER BY a.ID) AS row, ")
            Else
                .Append("select ROW_NUMBER() OVER(ORDER BY " & pSortDirection & ") AS row, ")
            End If
            .Append("a.ID,a.Name,a.sort,a.status,")
            .Append("count(b.Name) as nFile ")
            .Append("from oss_fileCategory as a left outer join ")
            .Append("oss_file as b on a.ID = b.CategoryID ")
            .Append("where 1=1 ")
            .Append(fGetCatSearchStr())
            .Append(" group by a.ID,a.Name,a.sort,a.status ")
            .Append(") AS a ")
            .Append(String.Format(" where row between {0} and {1} ",
                                     ((pPage - 1) * nPageSize) + 1,
                                     ((pPage - 1) * nPageSize) + nPageSize))
        End With

        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCatCommandFilterValue(nComd)
        Dim nDt As DataTable
        mDB.fReadDataTable(nComd, nDt)
        Return nDt
    End Function

    Private Function fGetCatSearchStr() As String
        Dim nValue As String = ""
        If txtCatSearch.Text <> "" Then nValue &= " and (a.Name like @searchTxt )"
        Return nValue
    End Function

    Private Sub fSetCatCommandFilterValue(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@searchTxt", "%" & txtCatSearch.Text & "%")
        End With
    End Sub

    Private Sub fBindePagingCatData()
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select count(*) from oss_fileCategory as a where 1=1 ")
            .Append(fGetCatSearchStr())
        End With

        Dim nVal As Integer
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCatCommandFilterValue(nComd)
        mDB.fReadTopData(nComd, nVal)
        ddlCatPage.Items.Clear()
        If nVal > 0 Then
            Dim nPage As Integer = Math.Ceiling(nVal / gvCatData.PageSize)
            lblCatAllPage.Text = nPage
            For i = 1 To nPage
                ddlCatPage.Items.Insert(i - 1, New ListItem(i, i))
            Next
        Else
            lblCatAllPage.Text = "0"
        End If
    End Sub

    Private Function fSaveCatData(ByRef pValue As String) As Boolean
        Dim nSb As New StringBuilder
        With nSb
            .Append("insert into oss_fileCategory(Name,Sort,Status) ")
            .Append("values(@Name,@Sort,@Status)")
        End With
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCatParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Function fUpdateCatData(ByRef pValue As String) As Boolean
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("update oss_fileCategory set ")
            .Append("Name = @Name ,")
            .Append("sort = @Sort ,")
            .Append("Status = @Status ")
            .Append("where ID=@ID")
        End With
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetCatParaValue(nComd)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

    Private Sub fSetCatParaValue(ByRef pCommand As SqlCommand)
        With pCommand.Parameters
            .AddWithValue("@Name", txtCatName.Text)
            If txtCatSort.Text = "" Then
                .AddWithValue("@Sort", DBNull.Value)
            Else
                .AddWithValue("@Sort", txtCatSort.Text)
            End If
            .AddWithValue("@ID", hdfID.Value)
            If chkCatStatus.Checked = True Then
                .AddWithValue("@Status", 1)
            Else
                .AddWithValue("@Status", 0)
            End If
        End With
    End Sub

    Private Function fReadCatDetail(ByVal pID As Integer) As DataTable
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select * from oss_fileCategory where ID=@ID")
        End With
        Dim nDt As DataTable
        Dim nComd As New SqlCommand(nSb.ToString)
        nComd.Parameters.AddWithValue("@ID", pID)
        mDB.fReadDataTable(nComd, nDt)
        Return nDt
    End Function

    Private Sub fShowCatDetail(ByVal pDt As DataTable)
        If Not pDt Is Nothing Then
            If pDt.Rows.Count > 0 Then
                With pDt.Rows(0)
                    txtCatName.Text = .Item("Name")
                    txtCatSort.Text = IIf(IsDBNull(.Item("sort")), "", .Item("sort"))
                    chkCatStatus.Checked = CBool(.Item("Status"))
                End With
            End If
        End If
    End Sub

    Private Function fDeleteCatData(ByVal pID As Integer, ByRef pValue As String) As Boolean
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("delete oss_file where CategoryID=@ID;")
            .Append("delete oss_fileCategory where ID=@ID;")
        End With
        Dim nComd As New SqlCommand(nSb.ToString)
        nComd.Parameters.AddWithValue("@ID", pID)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

#End Region

#Region "EVEN Category"

    Protected Sub chkCatStatus_CheckedChanged(sender As Object, e As EventArgs)
        If mFunc.fCheckSession() Then
            Dim chkreleased As CheckBox = DirectCast(sender, CheckBox)
            Dim row As GridViewRow = DirectCast(chkreleased.NamingContainer, GridViewRow)
            Dim nID As String = gvCatData.DataKeys(row.RowIndex).Value.ToString()


            Dim nChk As CheckBox = CType(sender, CheckBox)
            Dim nStatus As String
            nStatus = IIf(nChk.Checked, "1", "0")
            Dim nSb As New System.Text.StringBuilder
            nSb.Append("update oss_fileCategory set [status]=@status,timeUpdate=getdate() ")
            nSb.Append("where ID = @ID")
            Dim nComd As New SqlCommand(nSb.ToString)
            With nComd.Parameters
                .AddWithValue("@status", nStatus)
                .AddWithValue("@ID", nID)
            End With
            Dim nValue As String = ""
            If mDB.fExecuteCommand(nComd, nValue) = False Then
                mTool.fShowAlert(cTools.alertCssClassType.danger, Me, "ไม่สามารถปรับปรุงสถานะได้", "เกิดข้อผิดพลาด ")
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
           

            If mFunc.fCheckSession() Then
                fInitialProgram()
                fBindePagingCatData()
                fShowCatData(1)
            End If
        End If
    End Sub

    Protected Sub btnCatNew_Click(sender As Object, e As EventArgs) Handles btnCatNew.Click
        fInitialCatNew()
        multiview1.SetActiveView(viewAddCatData)
    End Sub

    Protected Sub btnCatBack_Click(sender As Object, e As EventArgs) Handles btnBack.Click
        If hdfFlagSave.Value <> "" Then
            hdfFlagSave.Value = ""
            btnCatSearch_Click(Nothing, Nothing)
        End If
        multiview1.SetActiveView(viewAllCatData)
    End Sub

    Protected Sub btnCatSave_Click(sender As Object, e As EventArgs) Handles btnCatSave.ServerClick
        If mFunc.fCheckSession() Then
            Dim nValue As String = ""
            Try
                Select Case hdfMode.Value
                    Case "new"
                        If fSaveCatData(nValue) Then
                            mTool.fShowAlert(cTools.alertCssClassType.success, Me, "", "บันทึกข้อมูลเรียบร้อย")
                            hdfFlagSave.Value = 1
                            fClrCatObj()
                        Else
                            mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, "ไม่สามารถบันทึกข้อมูลได้ ")
                        End If
                    Case "edit"
                        If fUpdateCatData(nValue) Then
                            multiview1.SetActiveView(viewAllCatData)
                            btnCatSearch_Click(Nothing, Nothing)
                            mTool.fShowAlert(cTools.alertCssClassType.success, Me, "", "แก้ไขข้อมูลเรียบร้อย")
                        Else
                            mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, "ไม่สามารถบันทึกข้อมูลได้ ")
                        End If
                End Select
            Catch ex As Exception
                mTool.fShowAlert(cTools.alertCssClassType.danger, Me, ex.Message, "ไม่สามารถบันทึกข้อมูลได้ ")
            End Try
        End If
    End Sub

    Private Sub gvCatData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvCatData.RowCommand
        If e.CommandName = "aEdit" Then
            fInitialCatEdit()
            Dim nID As Integer = gvCatData.DataKeys(e.CommandArgument).Value
            hdfID.Value = nID
            fShowCatDetail(fReadCatDetail(nID))
            multiview1.SetActiveView(viewAddCatData)
        ElseIf e.CommandName = "aFile" Then
            hdfCatID.Value = gvCatData.DataKeys(e.CommandArgument).Value
            ltrCatFile1.Text = gvCatData.Rows(e.CommandArgument).Cells(1).Text
            ltrCatFile2.Text = gvCatData.Rows(e.CommandArgument).Cells(1).Text
            fBindePagingFileData()
            fShowFileData(1)
            multiview1.SetActiveView(viewAllFileData)
        ElseIf e.CommandName = "aDelete" Then
            Dim nValue As String = ""
            Dim nID As Integer = gvCatData.DataKeys(e.CommandArgument).Value
            Dim nDt As DataTable = fReadFileData(nID)
            Try
                If fDeleteCatData(nID, nValue) Then

                    Dim nUpload As New cUpload
                    For i = 0 To nDt.Rows.Count - 1
                        With nDt.Rows(i)
                            If Not IsDBNull(.Item("Example")) Then nUpload.fDeleteFile(.Item("Example"))
                            If Not IsDBNull(.Item("Form")) Then nUpload.fDeleteFile(.Item("Form"))
                        End With
                    Next
                    btnCatSearch_Click(Nothing, Nothing)
                Else
                    mTool.fShowMsgBox(Me, nValue)
                End If
            Catch ex As Exception
                mTool.fShowMsgBox(Me, ex.Message)
            End Try
        End If
    End Sub

    Private Sub gvCatData_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvCatData.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = ((ddlCatPage.SelectedValue - 1) * gvCatData.PageSize) + e.Row.RowIndex + 1

            With CType(e.Row.FindControl("chkStatus"), CheckBox)
                .Checked = DataBinder.Eval(e.Row.DataItem, "status")
            End With

        End If
    End Sub

    Private Sub gvCatData_Sorting(sender As Object, e As GridViewSortEventArgs) Handles gvCatData.Sorting
        Dim nSortDirecton As String = ""
        If hdfSortField.Value <> e.SortExpression Then
            hdfSortField.Value = e.SortExpression
            hdfSortDirectoin.Value = "ASC"
        Else
            If hdfSortDirectoin.Value = "ASC" Then
                hdfSortDirectoin.Value = "DESC"
            Else
                hdfSortDirectoin.Value = "ASC"
            End If
        End If
        fShowCatData(ddlCatPage.SelectedValue, e.SortExpression & " " & hdfSortDirectoin.Value)
    End Sub

    Protected Sub btnCatSearch_Click(sender As Object, e As EventArgs) Handles btnCatSearch.ServerClick
        fBindePagingCatData()
        fShowCatData(1)
    End Sub

    Protected Sub ddlCatPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlCatPage.SelectedIndexChanged
        fShowCatData(ddlCatPage.SelectedValue)
    End Sub

#End Region

#Region "FUNCTION File"

    Private Sub fInitialFileNew()
        hdfMode.Value = "new"
        lblFileSubtitle.Text = "(เพิ่มข้อมูลใหม่)"
        ltrFileExample.Visible = False
        ltrFileForm.Visible = False
        fClrFileObj()
    End Sub

    Private Sub fInitialFileEdit()
        hdfMode.Value = "edit"
        lblFileSubtitle.Text = "(แก้ไขข้อมูล)"
    End Sub

    Private Sub fClrFileObj()
        txtFileName.Text = ""
        txtFileSort.Text = ""
        txtFileRemark.Text = ""
        chkFileStatus.Checked = True
    End Sub

    Private Sub fBindePagingFileData()
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select count(*) from oss_file as a where categoryID=@categoryID ")
            .Append(fGetSearchStr())
        End With

        Dim nVal As Integer
        Dim nComd As New SqlCommand(nSb.ToString)
        fSetFileCommandFilterValue(nComd)
        mDB.fReadTopData(nComd, nVal)
        ddlFilePage.Items.Clear()
        If nVal > 0 Then
            Dim nPage As Integer = Math.Ceiling(nVal / gvFileData.PageSize)
            lblFileAllPage.Text = nPage
            For i = 1 To nPage
                ddlFilePage.Items.Insert(i - 1, New ListItem(i, i))
            Next
        Else
            lblFileAllPage.Text = "0"
        End If
    End Sub

    Private Sub fShowFileData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "")
        gvFileData.DataSource = fReadFileData(pPage, pSortDirection)
        gvFileData.DataBind()
    End Sub

    Private Function fReadFileData(ByVal pCatID As Integer) As DataTable

        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select * ")
            .Append("from oss_file ")
            .Append("where CategoryID=@ID ")
            .Append(fGetSearchStr())
        End With
        Dim nComd As New SqlCommand(nSb.ToString)
        nComd.Parameters.AddWithValue("@ID", pCatID)
        Dim nDt As DataTable
        mDB.fReadDataTable(nComd, nDt)
        Return nDt
    End Function

    Private Function fReadFileData(ByVal pPage As Integer, Optional ByVal pSortDirection As String = "") As DataTable
        Dim nPageSize As Integer = gvFileData.PageSize
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select * from ( ")
            If pSortDirection = "" Then
                .Append("select ROW_NUMBER() OVER(ORDER BY a.ID) AS row, ")
            Else
                .Append("select ROW_NUMBER() OVER(ORDER BY " & pSortDirection & ") AS row, ")
            End If
            .Append("a.ID,a.Name,a.sort,a.Example,a.Form,a.Remark,a.status ")
            .Append("from oss_file as a ")
            .Append("where a.categoryID=@categoryID ")
            .Append(fGetSearchStr())
            .Append(") AS a ")
            .Append(String.Format(" where row between {0} and {1} ",
                                     ((pPage - 1) * nPageSize) + 1,
                                     ((pPage - 1) * nPageSize) + nPageSize))
        End With

        Dim nComd As New SqlCommand(nSb.ToString)
        fSetFileCommandFilterValue(nComd)
        Dim nDt As DataTable
        mDB.fReadDataTable(nComd, nDt)
        Return nDt
    End Function

    Private Function fGetSearchStr() As String
        Dim nValue As String = ""
        If txtFileSearch.Text <> "" Then nValue &= " and (a.Name like @searchTxt )"
        Return nValue
    End Function

    Private Sub fSetFileCommandFilterValue(ByRef pComd As SqlCommand)
        With pComd.Parameters
            .AddWithValue("@categoryID", hdfCatID.Value)
            .AddWithValue("@searchTxt", "%" & txtFileSearch.Text & "%")
        End With
    End Sub

    Private Function fSaveFileData(ByRef pValue As String) As Boolean
        Dim nVal As Boolean = False
        Dim nFileExampleName As String = ""
        Dim nFileFormName As String = ""
        Dim nUpload As New cUpload
        Try
            If uploadExample.HasFile Then
                nFileExampleName = nUpload.fUploadFile(uploadExample.PostedFile, cUpload.fileType.Document_and_Image, "1_")
                Session("nFileExampleName") = nFileExampleName
            End If
            If uploadForm.HasFile Then
                nFileFormName = nUpload.fUploadFile(uploadForm.PostedFile, cUpload.fileType.Document_and_Image, "2_")
                Session("nFileFormName") = nFileFormName
            End If
            Dim nSb As New System.Text.StringBuilder
            With nSb
                .Append("Insert into oss_file(CategoryID,Name,Sort,Example,Form,Remark,Status,userInsert) ")
                .Append("values(@CategoryID,@Name,@Sort,@Example,@Form,@Remark,@Status,@userInsert)")
            End With
            Dim nComd As New SqlCommand(nSb.ToString)
            fSetFileParaValue(nComd, nFileExampleName, nFileFormName)
            nVal = mDB.fExecuteCommand(nComd, pValue)
        Catch ex As Exception
            'ตรวจสอบหากมีไฟล์ให้ลบ
            mTool.fShowMsgBox(Me, ex.Message)
            If nFileExampleName <> "" Then nUpload.fDeleteFile(nFileExampleName) : Session("nFileExampleName") = Nothing
            If nFileFormName <> "" Then nUpload.fDeleteFile(nFileFormName) : Session("nFileFormName") = Nothing
        End Try
        Return nVal
    End Function

    Private Function fUpdateFileData(ByRef pValue As String) As Boolean
        Dim nVal As Boolean = False
        Dim nFileExampleName As String = ""
        Dim nFileFormName As String = ""
        Dim nUpload As New cUpload
        Try
            If uploadExample.HasFile Then
                nFileExampleName = nUpload.fUploadFile(uploadExample.PostedFile, cUpload.fileType.Document_and_Image, "1_")
                Session("nFileExampleName") = nFileExampleName
            End If
            If uploadForm.HasFile Then
                nFileFormName = nUpload.fUploadFile(uploadForm.PostedFile, cUpload.fileType.Document_and_Image, "2_")
                Session("nFileFormName") = nFileFormName
            End If
            Dim nSb As New System.Text.StringBuilder
            With nSb
                .Append("update oss_file ")
                .Append("set Name=@Name, Sort=@Sort,Remark=@Remark,")
                .Append("Status=@Status,userUpdate=@userUpdate,timeUpdate=getdate() ")
                If uploadExample.HasFile Then
                    .Append(",Example=@Example")
                End If
                If uploadForm.HasFile Then
                    .Append(",Form=@Form")
                End If
                .Append(" where ID=@ID and CategoryID=@CategoryID ")
            End With
            Dim nComd As New SqlCommand(nSb.ToString)
            fSetFileParaValue(nComd, nFileExampleName, nFileFormName)
            nVal = mDB.fExecuteCommand(nComd, pValue)
            If nVal Then
                If uploadExample.HasFile And hdfOldFileExample.Value <> "" Then nUpload.fDeleteFile(hdfOldFileExample.Value)
                If uploadForm.HasFile And hdfOldFileForm.Value <> "" Then nUpload.fDeleteFile(hdfOldFileForm.Value)
            End If
        Catch ex As Exception
            'ตรวจสอบหากมีไฟล์ให้ลบ
            mTool.fShowMsgBox(Me, ex.Message)
            If nFileExampleName <> "" Then nUpload.fDeleteFile(nFileExampleName) : Session("nFileExampleName") = Nothing
            If nFileFormName <> "" Then nUpload.fDeleteFile(nFileFormName) : Session("nFileFormName") = Nothing
        End Try
        Return nVal
    End Function

    Private Sub fSetFileParaValue(ByRef pComd As SqlCommand, _
                                  Optional ByVal pNameExample As String = "", _
                                  Optional ByVal pNameForm As String = "")
        Dim nUser As cUser = Session("cUser")
        With pComd.Parameters
            .AddWithValue("@CategoryID", hdfCatID.Value)
            .AddWithValue("@ID", hdfID.Value)
            .AddWithValue("@Name", txtFileName.Text)
            .AddWithValue("@Sort", IIf(txtFileSort.Text = "", DBNull.Value, txtFileSort.Text))
            .AddWithValue("@Remark", IIf(txtFileRemark.Text = "", DBNull.Value, txtFileRemark.Text))
            .AddWithValue("@Status", IIf(chkFileStatus.Checked, 1, 0))
            .AddWithValue("@userInsert", nUser.tUserID)
            .AddWithValue("@userUpdate", nUser.tUserID)
            If hdfMode.Value = "new" Then
                .AddWithValue("@Example", IIf(pNameExample = "", DBNull.Value, pNameExample))
                .AddWithValue("@Form", IIf(pNameForm = "", DBNull.Value, pNameForm))
            ElseIf hdfMode.Value = "edit" Then
                If uploadExample.HasFile Then
                    .AddWithValue("@Example", IIf(pNameExample = "", DBNull.Value, pNameExample))
                End If
                If uploadForm.HasFile Then
                    .AddWithValue("@Form", IIf(pNameForm = "", DBNull.Value, pNameForm))
                End If
            End If
        End With
    End Sub

    Private Function fReadFileDetail(ByVal pID As Integer) As DataTable
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("select * from oss_file where ID=@ID")
        End With
        Dim nDt As DataTable
        Dim nComd As New SqlCommand(nSb.ToString)
        nComd.Parameters.AddWithValue("@ID", pID)
        mDB.fReadDataTable(nComd, nDt)
        Return nDt
    End Function

    Private Sub fShowFileDetail(ByVal pDt As DataTable)
        If Not pDt Is Nothing Then
            If pDt.Rows.Count > 0 Then
                With pDt.Rows(0)
                    txtFileName.Text = .Item("Name")
                    txtFileSort.Text = IIf(IsDBNull(.Item("sort")), "", .Item("sort"))
                    txtFileRemark.Text = IIf(IsDBNull(.Item("Remark")), "", .Item("Remark"))
                    chkFileStatus.Checked = CBool(.Item("Status"))
                    If Not IsDBNull(.Item("Example")) Then
                        ltrFileExample.Visible = True
                        ltrFileExample.Text = String.Format("<a href='{0}' traget='_blank'>ตัวอย่าง</a>", Page.ResolveClientUrl("~" & mPath & .Item("Example")))
                        hdfOldFileExample.Value = .Item("Example")
                    Else
                        ltrFileExample.Visible = False
                    End If

                    If Not IsDBNull(.Item("Form")) Then
                        ltrFileForm.Visible = True
                        ltrFileForm.Text = String.Format("<a href='{0}' traget='_blank'>แบบฟอร์ม</a>", Page.ResolveClientUrl("~" & mPath & .Item("Form")))
                        hdfOldFileForm.Value = .Item("Form")
                    Else
                        ltrFileForm.Visible = False
                    End If

                End With
            End If
        End If
    End Sub

    Private Function fDeleteFileData(ByVal pID As Integer, ByRef pValue As String) As String
        Dim nSb As New System.Text.StringBuilder
        With nSb
            .Append("delete oss_file where ID=@ID;")
        End With
        Dim nComd As New SqlCommand(nSb.ToString)
        nComd.Parameters.AddWithValue("@ID", pID)
        Return mDB.fExecuteCommand(nComd, pValue)
    End Function

#End Region

#Region "EVEN File"

    Protected Sub chkFileStatus_CheckedChanged(sender As Object, e As EventArgs)
        If mFunc.fCheckSession() Then
            Dim chkreleased As CheckBox = DirectCast(sender, CheckBox)
            Dim row As GridViewRow = DirectCast(chkreleased.NamingContainer, GridViewRow)
            Dim nID As String = gvFileData.DataKeys(row.RowIndex).Value.ToString()
            Dim nChk As CheckBox = CType(sender, CheckBox)
            Dim nStatus As String
            nStatus = IIf(nChk.Checked, "1", "0")
            Dim nSb As New System.Text.StringBuilder
            With nSb
                .Append("update oss_file set [status]=@status,timeUpdate=getdate() ")
                .Append("where categoryID=@categoryID and ID = @ID")
            End With
            Dim nComd As New SqlCommand(nSb.ToString)
            With nComd.Parameters
                .AddWithValue("@status", nStatus)
                .AddWithValue("@ID", nID)
                .AddWithValue("@categoryID", hdfCatID.Value)
            End With
            Dim nValue As String = ""
            If mDB.fExecuteCommand(nComd, nValue) = False Then
                mTool.fShowAlert(cTools.alertCssClassType.danger, Me, "ไม่สามารถปรับปรุงสถานะได้", "เกิดข้อผิดพลาด ")
            End If
        End If
    End Sub

    Protected Sub btnFileNew_Click(sender As Object, e As EventArgs) Handles btnFileNew.Click
        fInitialFileNew()
        multiview1.SetActiveView(viewAddFileData)
        txtFileName.Focus()
    End Sub

    Protected Sub btnFileBack1_Click(sender As Object, e As EventArgs) Handles btnFileBack1.Click
        If hdfFlagSave.Value <> "" Then
            hdfCatID.Value = ""
            hdfFlagSave.Value = ""
            btnCatSearch_Click(Nothing, Nothing)
        End If
        multiview1.SetActiveView(viewAllCatData)
    End Sub

    Protected Sub btnFileBack_Click(sender As Object, e As EventArgs) Handles btnFileBack.Click
        If hdfFlagSave.Value <> "" Then
            btnFileSearch_Click(Nothing, Nothing)
        End If
        multiview1.SetActiveView(viewAllFileData)
    End Sub

    Protected Sub btnFileSave_Click(sender As Object, e As EventArgs) Handles btnFileSave.ServerClick
        If mFunc.fCheckSession() Then
            Dim nValue As String = ""
            Try
                Select Case hdfMode.Value
                    Case "new"
                        If fSaveFileData(nValue) Then
                            mTool.fShowAlert(cTools.alertCssClassType.success, Me, "", "บันทึกข้อมูลเรียบร้อย")
                            hdfFlagSave.Value = 1
                            fClrFileObj()
                        Else
                            mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, "ไม่สามารถบันทึกข้อมูลได้ ")
                        End If
                    Case "edit"
                        If fUpdateFileData(nValue) Then
                            multiview1.SetActiveView(viewAllFileData)
                            btnFileSearch_Click(Nothing, Nothing)
                            mTool.fShowAlert(cTools.alertCssClassType.success, Me, "", "แก้ไขข้อมูลเรียบร้อย")
                        Else
                            mTool.fShowAlert(cTools.alertCssClassType.danger, Me, nValue, "ไม่สามารถบันทึกข้อมูลได้ ")
                        End If
                End Select
            Catch ex As Exception
                mTool.fShowAlert(cTools.alertCssClassType.danger, Me, ex.Message, "ไม่สามารถบันทึกข้อมูลได้ ")
            End Try
        End If
    End Sub

    Private Sub gvFileData_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvFileData.RowCommand
        If e.CommandName = "aEdit" Then
            fInitialFileEdit()
            Dim nID As Integer = gvFileData.DataKeys(e.CommandArgument).Value
            hdfID.Value = nID
            fShowFileDetail(fReadFileDetail(nID))
            multiview1.SetActiveView(viewAddFileData)
            txtFileName.Focus()
        ElseIf e.CommandName = "aDelete" Then
            Dim nValue As String = ""
            Dim nID As Integer = gvFileData.DataKeys(e.CommandArgument).Value
            Dim nDt As DataTable = fReadFileDetail(nID)
            If fDeleteFileData(nID, nValue) Then
                Dim nUpload As New cUpload
                If Not nDt Is Nothing Then
                    If nDt.Rows.Count > 0 Then
                        With nDt.Rows(0)
                            If Not IsDBNull(.Item("Example")) Then nUpload.fDeleteFile(.Item("Example"))
                            If Not IsDBNull(.Item("Form")) Then nUpload.fDeleteFile(.Item("Form"))
                        End With
                    End If
                End If
                btnFileSearch_Click(Nothing, Nothing)
            Else
                mTool.fShowMsgBox(Me, nValue)
            End If
        End If
    End Sub

    Private Sub gvFileData_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvFileData.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = ((ddlFilePage.SelectedValue - 1) * gvFileData.PageSize) + e.Row.RowIndex + 1

            With CType(e.Row.FindControl("chkFileStatus"), CheckBox)
                .Checked = DataBinder.Eval(e.Row.DataItem, "status")
            End With

            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "Example")) Then
                With CType(e.Row.FindControl("ltrExample"), Literal)
                    .Text = String.Format("<a href='{0}' traget='_blank'>ตัวอย่าง</a>", Page.ResolveClientUrl("~" & mPath & DataBinder.Eval(e.Row.DataItem, "Example")))
                End With
            End If

            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "Form")) Then
                With CType(e.Row.FindControl("ltrForm"), Literal)
                    .Text = String.Format("<a href='{0}' traget='_blank'>แบบฟอร์ม</a>", Page.ResolveClientUrl("~" & mPath & DataBinder.Eval(e.Row.DataItem, "Form")))
                End With
            End If


        End If
    End Sub

    Private Sub gvFileData_Sorting(sender As Object, e As GridViewSortEventArgs) Handles gvFileData.Sorting
        Dim nSortDirecton As String = ""
        If hdfSortField.Value <> e.SortExpression Then
            hdfSortField.Value = e.SortExpression
            hdfSortDirectoin.Value = "ASC"
        Else
            If hdfSortDirectoin.Value = "ASC" Then
                hdfSortDirectoin.Value = "DESC"
            Else
                hdfSortDirectoin.Value = "ASC"
            End If
        End If
        fShowFileData(ddlFilePage.SelectedValue, e.SortExpression & " " & hdfSortDirectoin.Value)
    End Sub

    Protected Sub btnFileSearch_Click(sender As Object, e As EventArgs) Handles btnFileSearch.ServerClick
        fBindePagingFileData()
        fShowFileData(1)
    End Sub

    Protected Sub ddlPage_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlFilePage.SelectedIndexChanged
        fShowFileData(ddlFilePage.SelectedValue)
    End Sub

#End Region

End Class