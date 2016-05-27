Imports System.Data.SqlClient

Public Class cDBTool
    Private mConStr As String = ConfigurationManager.AppSettings("conStr").ToString

#Region "System Function"

    ''' <summary>
    ''' สร้าง Connection
    ''' </summary>
    ''' <returns>SqlConnection</returns>
    ''' <remarks></remarks>
    Private Function fConnenction() As SqlConnection
        Dim nConnData As New SqlConnection(mConStr)
        Try
            If nConnData.State = Data.ConnectionState.Open Then nConnData.Close()
            nConnData.Open()
        Catch ex As Exception
        End Try
        Return nConnData
    End Function

    ''' <summary>
    ''' ทำการ Execute Query Insert update delete
    ''' </summary>
    ''' <param name="pQuery">อาเรย์คำสั่ง</param>
    ''' <param name="pvalue">ข้อความจากการ Execute หากเกิด Error</param>
    ''' <param name="pRowAffected">จำนวนแถวผลลัพธ์</param>
    ''' <returns>ผลการ Execute</returns>
    ''' <remarks></remarks>
    Public Function fExecuteCommand(ByVal pQuery() As String, _
                                    ByRef pValue As String, _
                                    Optional ByRef pRowAffected As Integer = 0) As Boolean
        Dim nValue As Boolean
        Dim tempQuery As String = ""
        pRowAffected = 0
        Using connection As New SqlConnection(mConStr)
            connection.Open()
            Dim cmd As SqlCommand = connection.CreateCommand()
            Dim transaction As SqlTransaction
            transaction = connection.BeginTransaction("SaveTransaction")
            cmd.Connection = connection
            cmd.Transaction = transaction
            Try
                For i = 0 To pQuery.Length - 1
                    cmd.CommandText = pQuery(i)
                    tempQuery = pQuery(i)
                    pRowAffected += cmd.ExecuteNonQuery()
                Next
                transaction.Commit()
                nValue = True
            Catch ex As Exception
                nValue = False
                pValue = String.Format("Commit Exception Type: {0}", ex.GetType())
                pValue &= String.Format(" Message: {0}", ex.Message)
                pValue &= String.Format(" Error query : {0}", tempQuery)
                Try
                    transaction.Rollback()
                Catch ex2 As Exception
                    pValue = String.Format("Rollback Exception Type: {0}", ex2.GetType())
                    pValue &= String.Format("  Message: {0}", ex2.Message)
                    pValue &= String.Format(" Error query : {0}", tempQuery)
                End Try
            End Try
        End Using
        Return nValue
    End Function

    ''' <summary>
    ''' ทำการ Execute Query Insert update delete
    ''' </summary>
    ''' <param name="pCommand">sqlcommand ผูกคำสั่งและ Parameters</param>
    ''' <param name="pValue">Error string เมื่อทำงานไม่สำเร็จ</param>
    ''' <param name="pRowAffected">จำนวนแถวผลลัพธ์</param>
    ''' <returns>ผลการ Execute</returns>
    ''' <remarks></remarks>
    Public Function fExecuteCommand(ByVal pCommand As SqlCommand, _
                                    ByRef pValue As String, _
                                    Optional ByRef pRowAffected As Integer = 0) As Boolean
        Dim nValue As Boolean
        pRowAffected = 0
        Using connection As New SqlConnection(mConStr)
            connection.Open()
            Dim transaction As SqlTransaction
            transaction = connection.BeginTransaction("SaveTransaction")
            Try
                With pCommand
                    .Connection = connection
                    .Transaction = transaction
                    pRowAffected += .ExecuteNonQuery()
                End With
                transaction.Commit()
                nValue = True
            Catch ex As Exception
                nValue = False
                pValue &= ex.Message
                Try
                    transaction.Rollback()
                Catch ex2 As Exception
                    pValue &= ex2.Message
                End Try
            End Try
        End Using
        Return nValue
    End Function

    ''' <summary>
    ''' ทำการ Execute Query Insert update delete แบบ Transection จาก Connection ที่เปิดไว้แล้ว
    ''' </summary>
    ''' <param name="pQuery">คำสั่ง</param>
    ''' <param name="pConn">SqlConnection ที่เปิดอยู่</param>
    ''' <param name="pTran">SqlTransaction</param>
    ''' <param name="pValue">ผลลัพธ์การทำงานหากเกิดข้อผิดพลาด</param>
    ''' <param name="pRowAffected">จำนวนรายการที่บันทึก</param>
    ''' <returns>ผลการทำงาน</returns>
    ''' <remarks></remarks>
    Public Function fExecuteCommand(ByVal pQuery As String, _
                                    ByVal pConn As SqlConnection, _
                                    ByVal pTran As SqlTransaction, _
                                    ByRef pValue As String, _
                                    Optional ByRef pRowAffected As Integer = 0) As Boolean
        Dim nValue As Boolean
        Dim nTempQuery As String = ""
        pRowAffected = 0
        Dim nCmd As SqlCommand = pConn.CreateCommand()
        nCmd.Connection = pConn
        nCmd.Transaction = pTran
        Try
            nCmd.CommandText = pQuery
            nTempQuery = pQuery
            pRowAffected += nCmd.ExecuteNonQuery()
            nValue = True
        Catch ex As Exception
            nValue = False
            pValue = String.Format("Commit Exception Type: {0}", ex.GetType())
            pValue &= String.Format(" Message: {0}", ex.Message)
            pValue &= String.Format(" Error query : {0}", nTempQuery)
        End Try
        Return nValue
    End Function

    ''' <summary>
    ''' ทำการเรียกดูข้อมูลจากคำสั่ง โดยแสดงข้อมูล Top เพียงค่าเดียว เช่น Sum,AVG
    ''' </summary>
    ''' <param name="pQuery">คำสั้ง</param>
    ''' <param name="pValue">ผลลัพธ์</param>
    ''' <returns>ผลการ Execute</returns>
    ''' <remarks></remarks>
    Public Function fReadTopData(ByVal pQuery As String, _
                                 ByRef pValue As String) As Boolean
        Dim nConn As SqlConnection = fConnenction()
        Dim nValue As Boolean
        If nConn.State = ConnectionState.Open Then
            Try
                Dim cmd As New SqlCommand(pQuery, nConn)
                pValue = cmd.ExecuteScalar.ToString
                cmd.Dispose()
                nConn.Close()
                nConn.Dispose()
                nValue = True
            Catch
                pValue = Err.Description
                nValue = False
            End Try
        Else
            pValue = "Error - Can't open connection."
            nValue = False
        End If

        Return nValue
    End Function

    ''' <summary>
    ''' ทำการเรียกดูข้อมูลจากคำสั่ง โดยแสดงข้อมูล Top เพียงค่าเดียว เช่น Sum,AVG
    ''' </summary>
    ''' <param name="pCommand">sqlCommand ที่ผูกคำสั่ง</param>
    ''' <param name="pValue">ค่าจากคำสั่ง</param>
    ''' <returns>ผลการทำงาน</returns>
    ''' <remarks></remarks>
    Public Function fReadTopData(ByVal pCommand As SqlCommand, ByRef pValue As String) As Boolean
        Dim nConn As SqlConnection = fConnenction()
        Dim nValue As Boolean
        If nConn.State = ConnectionState.Open Then
            Try
                pCommand.Connection = nConn
                pValue = pCommand.ExecuteScalar.ToString
                pCommand.Dispose()
                nConn.Close()
                nConn.Dispose()
                nValue = True
            Catch
                pValue = Err.Description
                nValue = False
            End Try
        Else
            pValue = "Error - Can't open connection."
            nValue = False
        End If

        Return nValue
    End Function

    ''' <summary>
    ''' ทำการเรียกดูข้อมูลจากคำสั่ง โดยแสดงข้อมูล Top เพียงค่าเดียว เช่น Sum,AVG จาก Transection ที่เปิดไว้แล้ว
    ''' </summary>
    ''' <param name="pQuery">คำสั้ง</param>
    ''' <param name="pConn">sqlConnection</param>
    ''' <param name="pTran">sqlTransection</param>
    ''' <param name="pValue">ค่าที่ได้จากคำสั่ง</param>
    ''' <returns>ผลการทำงาน</returns>
    ''' <remarks></remarks>
    Public Function fReadTopData(ByVal pQuery As String, _
                                        ByVal pConn As SqlConnection, _
                                        ByVal pTran As SqlTransaction, _
                                        ByRef pValue As String) As Boolean
        Dim nValue As Boolean = False
        Try
            Dim nCmd As New SqlCommand(pQuery, pConn, pTran)
            pValue = nCmd.ExecuteScalar.ToString
            nValue = True
        Catch ex As Exception
        End Try
        Return nValue
    End Function

    ''' <summary>
    ''' ทำการเรียกดูข้อมูล จากคำสั่ง โดยแสดงข้อมูลเป็น datatable
    ''' </summary>        
    ''' <param name="pQuery">Query</param>
    ''' <param name="pDt">Data Datatable</param>
    ''' <returns>Value</returns>
    ''' <remarks></remarks>
    Public Function fReadDataTable(ByVal pQuery As String, ByRef pDt As DataTable) As Boolean
        Dim nConn As SqlConnection = fConnenction()
        Dim nValue As Boolean
        Dim nDt As DataTable
        If nConn.State = ConnectionState.Open Then
            Try
                nDt = New DataTable("dt")
                Dim nDa As New SqlDataAdapter(pQuery, nConn)
                nDa.Fill(nDt)
                nConn.Close()
                nConn.Dispose()
                nValue = True
                pDt = nDt
            Catch
                nDt = New DataTable("err")
                nDt.Columns.Add("err_message")
                nDt.Rows.Add("Read data Error : " & Err.Description & " " & pQuery)
                nValue = False
            End Try
        Else
            nDt = New DataTable("err")
            nDt.Columns.Add("err_message")
            nDt.Rows.Add("Error - Can't open connection.")
            nValue = False
        End If
        Return nValue
    End Function

    ''' <summary>
    ''' ทำการเรียกดูข้อมูลแบบ Transection จากการ connection เดิมที่เปิดไว้แล้ว
    ''' </summary>
    ''' <param name="pQuery">คำสั่ง</param>
    ''' <param name="pConn">SqlConnection</param>
    ''' <param name="pTran">SqlTransaction</param>
    ''' <param name="pDtValue">Datetable</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function fReadDataTable(ByVal pQuery As String, ByVal pConn As SqlConnection, ByVal pTran As SqlTransaction, ByRef pDtValue As DataTable) As Boolean
        Dim nValue As Boolean = False
        Try
            Dim nDa As New SqlDataAdapter(pQuery, pConn)
            nDa.SelectCommand.Transaction = pTran
            nDa.Fill(pDtValue)
            nValue = True
        Catch ex As Exception
        End Try
        Return nValue
    End Function

    ''' <summary>
    ''' ทำการเรียกดูข้อมูล จากคำสั่ง โดยแสดงข้อมูลเป็น datatable
    ''' </summary>
    ''' <param name="pCommand">sqlCommand ที่ผูกคำสั่ง</param>
    ''' <param name="pDt">Datatable</param>
    ''' <returns>ผลการทำงาน</returns>
    ''' <remarks></remarks>
    Public Function fReadDataTable(ByVal pCommand As SqlCommand, ByRef pDt As DataTable) As Boolean
        Dim nConn As SqlConnection = fConnenction()
        Dim nValue As Boolean
        Dim nDt As DataTable
        If nConn.State = ConnectionState.Open Then
            Try
                pCommand.Connection = nConn
                nDt = New DataTable("dt")
                Dim nDa As New SqlDataAdapter(pCommand)
                nDa.Fill(nDt)
                nConn.Close()
                nConn.Dispose()
                nValue = True
                pDt = nDt
            Catch
                nDt = New DataTable("err")
                nDt.Columns.Add("err_message")
                nDt.Rows.Add("Read data Error : " & Err.Description & " " & pCommand.CommandText)
                nValue = False
            End Try
        Else
            nDt = New DataTable("err")
            nDt.Columns.Add("err_message")
            nDt.Rows.Add("Error - Can't open connection.")
            nValue = False
        End If
        Return nValue
    End Function

    ''' <summary>
    ''' สร้าง Datatable Err
    ''' </summary>
    ''' <param name="pErrStr">ข้อความผิดพลาดที่ต้องการแสดง</param>
    ''' <returns>DataTable</returns>
    ''' <remarks></remarks>
    Public Function fCreateDtErr(ByVal pErrStr As String) As DataTable
        Dim errDt As New DataTable("Err")
        errDt.Columns.Add("ErrStr", GetType(String))
        errDt.Rows.Add(pErrStr)
        Return errDt
    End Function

#End Region

End Class
