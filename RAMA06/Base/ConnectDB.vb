Imports System.Data.SqlClient
Imports System.Data

Public Class ConnectDB
    'Public strcon As String = "Server=SQL2008;uid=kp;pwd=1234;Database=TestKp;Max Pool Size=400;Connect Timeout=600;"

    'Public strcon As String = "Server=PED-PC\SQLEXPRESS;uid=test;pwd=1234;Database=Elective_meded;Max Pool Size=400;Connect Timeout=600;"
    'Public strcon As String = "Server=PED;uid=sa;pwd=1234;Database=Elective_meded;Max Pool Size=400;Connect Timeout=600;"

    'Test DB
    'Public strcon As String = "Server=MAC\SQL2008;uid=KP;pwd=nong1234;Database=Elective_meded;Max Pool Size=400;Connect Timeout=600;"
    'Public strcon As String = "Server=10.6.22.59;uid=KP;pwd=1234;Database=TestKP;Max Pool Size=400;Connect Timeout=600;"


    'Public strcon As String = "Server=KPMAC-PC\SQLSERVER;uid=011695;pwd=011695kp;Database=Elective_meded;Max Pool Size=400;Connect Timeout=600;"

    'Apple MAC
    'Public strcon As String = "Server=KPMAC-PC\SQLSERVER;uid=011695;pwd=011695kp;Database=Elective_meded;Max Pool Size=400;Connect Timeout=600;"

    'PC RAMA
    'Public strcon As String = "Server=MEC-C7547-BP\SQLEXPRESS;uid=011695;pwd=011695kp;Database=Elective_meded;Max Pool Size=400;Connect Timeout=600;"

    'DB RAMA TestPK
    Public strcon As String = "Server=10.6.22.59;uid=kp;pwd=1234;Database=TestKP;Max Pool Size=400;Connect Timeout=600;"


    'Real DB
    'Public strcon As String = "Server=10.6.22.59;uid=011695;pwd=846771;Database=Elective_meded;Max Pool Size=400;Connect Timeout=600;"


    Public Function GetDataset(ByVal Strsql As String, _
        Optional ByVal DatasetName As String = "Dataset1", _
        Optional ByVal TableName As String = "Table") As DataSet
        Dim DA As New SqlDataAdapter(Strsql, strcon)
        Dim DS As New DataSet(DatasetName)
        Try
            DA.Fill(DS, TableName)
        Catch x1 As Exception
            Err.Raise(60002, , x1.Message)
        End Try
        Return DS
    End Function

    Public Function GetDataTable(ByVal Strsql As String, _
         Optional ByVal TableName As String = "Table") As DataTable
        Dim DA As New SqlDataAdapter(Strsql, Strcon)
        Dim DT As New DataTable(TableName)
        Try
            DA.Fill(DT)
        Catch x1 As Exception
            Err.Raise(60002, , x1.Message)
        End Try
        Return DT
    End Function

    Public Function CreateCommand(ByVal Strsql As String) As SqlCommand
        Dim cmd As New SqlCommand(Strsql)
        Return cmd
    End Function

    Public Function Execute(ByVal Strsql As String) As Integer
        Dim cmd As New SqlCommand(Strsql)
        Dim X As Integer = Me.Execute(cmd)
        Return X
    End Function

    Public Function Execute(ByRef Cmd As SqlCommand) As Integer
        Dim Cn As New SqlConnection(Strcon)
        Cmd.Connection = Cn
        Dim X As Integer
        Try
            Cn.Open()
            X = Cmd.ExecuteNonQuery()
        Catch
            X = -1
        Finally
            Cn.Close()
        End Try
        Return X
    End Function

    Public Sub CreateParam(ByRef Cmd As SqlCommand, ByVal StrType As String)
        'T:Text, M:Memo, Y:Currency, D:Datetime, I:Integer, S:Single, B:Boolean, P: Picture
        Dim i As Integer
        Dim j As String
        For i = 1 To Len(StrType)
            j = UCase(Mid(StrType, i, 1))
            Dim P1 As New SqlParameter
            P1.ParameterName = "@P" & i
            Select Case j
                Case "T"
                    P1.SqlDbType = SqlDbType.VarChar
                Case "M"
                    P1.SqlDbType = SqlDbType.Text
                Case "Y"
                    P1.SqlDbType = SqlDbType.Money
                Case "D"
                    P1.SqlDbType = SqlDbType.DateTime
                Case "I"
                    P1.SqlDbType = SqlDbType.Int
                Case "S"
                    P1.SqlDbType = SqlDbType.Decimal
                Case "B"
                    P1.SqlDbType = SqlDbType.Bit
                Case "P"
                    P1.SqlDbType = SqlDbType.Image
            End Select
            Cmd.Parameters.Add(P1)
        Next
    End Sub

    Shared Function QueryDataSet(strSQL As String) As DataSet
        Throw New NotImplementedException
    End Function

End Class
