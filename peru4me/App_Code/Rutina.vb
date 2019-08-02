Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports Microsoft.VisualBasic
Imports System.IO


Public Class cmpRutinas

    Public Sub GrabaLog(ByVal pEmail As String, ByVal pPaterno As String, _
                        ByVal pCodCliente As Integer, ByVal pNroPedido As Integer, ByVal pNroPropuesta As Integer, ByVal pNroVersion As Integer, _
                        ByVal pIP As String, ByVal pTipoAcceso As String, ByVal pMozart As String)
        'Dim ClienteIP As String

        'ClienteIP = Request.UserHostAddress()
        Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))


        Dim cd As New SqlCommand
        cd.Connection = cn
        cd.CommandText = "SEG_LogAcceso_I"
        cd.CommandType = CommandType.StoredProcedure

        Dim pa As New SqlParameter
        pa = cd.Parameters.Add("@MsgTrans", SqlDbType.VarChar, 150)
        pa.Direction = ParameterDirection.Output
        pa.Value = ""

        cd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = pEmail  'txtEmail.Text.Trim"
        cd.Parameters.Add("@Paterno", SqlDbType.VarChar, 25).Value = pPaterno ' txtPaterno.Text.Trim
        cd.Parameters.Add("@CodCliente", SqlDbType.Int).Value = pCodCliente  'Session("CodCliente")
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = pNroPedido  'Session("NroPedido")
        cd.Parameters.Add("@NroPropuesta", SqlDbType.TinyInt).Value = pNroPropuesta  'Session("NroPropuesta")
        cd.Parameters.Add("@NroVersion", SqlDbType.TinyInt).Value = pNroVersion  'Session("NroVersion")
        cd.Parameters.Add("@IPAddress", SqlDbType.VarChar, 25).Value = pIP  ' ClienteIP
        cd.Parameters.Add("@Acceso", SqlDbType.Char, 1).Value = pTipoAcceso '"A" Tipo Acceso A=Acceso URL M=Manual con correo y clave
        cd.Parameters.Add("@AccesoDeMozart", SqlDbType.Char, 1).Value = pMozart ' "N" S=Si Accesa desde Mozart N=No 'lblAccesoDeMozart.Text
        Try
            cn.Open()
            cd.ExecuteNonQuery()
            'lblMsg.Text = cd.Parameters("@MsgTrans").Value
        Catch ex1 As System.Data.SqlClient.SqlException
            'lblMsg.Text = "Error:" & ex1.Message
        Catch ex2 As System.Exception
            'lblMsg.Text = "Error:" & ex2.Message
        Finally
            cn.Close()
        End Try
    End Sub


    Public Sub GrabaLogEnviaEmail(ByVal mensaje As String)
        If ConfigurationManager.AppSettings("FlagLogEmailEnviado") = "S" Then
            Dim sFileLog = ConfigurationManager.AppSettings("RutaLogEmailEnviado") & DateTime.Now.ToString("yyMMdd") & ".txt"

            Dim fs As FileStream = Nothing
            Dim s As FileStream = Nothing

            If (Not File.Exists(sFileLog)) Then
                ' Create a Text File
                fs = File.Create(sFileLog)
                Using fs
                End Using
            End If

            ' Write to a Text File
            Using sw As StreamWriter = New StreamWriter(sFileLog, True)
                'sw.WriteLine(DateTime.Now.ToString("yy-MM-dd hh:mm:ss") & "   " & mensaje)
                sw.WriteLine(mensaje)
            End Using
        End If
    End Sub


End Class
