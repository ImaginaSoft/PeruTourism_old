﻿Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports Microsoft.VisualBasic
'Imports System.Web.Mail

Partial Class eprogramas
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
    Protected WithEvents cmdGrabar As System.Web.UI.WebControls.Button
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    'Dim wTotalSum As Double = 0


#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Session("CodCliente") = 0 Then
            Response.Redirect("efinsesion.aspx")
        End If

        If Not Page.IsPostBack Then
            Session("Opcion") = 0

            ListaPublicacion()

            lblNomCliente.Text = "Propuestas para " & Session("NomCliente")
            lblMensaje1.Text = "Bienvenido a tu página web personalizada.<br> "
            lblMensaje1.Text = lblMensaje1.Text & "Aquí encontraras los itinerarios de viaje que preparamos especialmente para ti."

            If dgPublica.Items.Count = 0 Then
                lblMensaje2.Text = lblMensaje2.Text & "Avisar al especialista de viajes que le falta publicar la propuesta"
            Else
                lblMensaje2.Text = lblMensaje2.Text & "Haz clic sobre el itinerario de viaje que desees revisar"
            End If

        End If

        'NombreCliente()
        'End If
    End Sub

    Private Sub ListaPublicacion()
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4E_Publica_S"
        da.SelectCommand.Parameters.Add("@CodZonaVta", SqlDbType.Char, 3).Value = "PER"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "PUBLICA")
        dgPublica.DataKeyField = "KeyReg"
        dgPublica.DataSource = ds.Tables("PUBLICA")
        dgPublica.DataBind()
    End Sub

    ' Private Sub NombreCliente()
    'Dim sNomCliente As String = ""
    '
    '    Dim cd As New SqlCommand
    '    Dim dr As SqlDataReader
    '        cd.Connection = cn
    '        cd.CommandText = "P4I_PedidoCliente_S"
    '        cd.CommandType = CommandType.StoredProcedure
    '        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
    '        Try
    '            cn.Open()
    '            dr = cd.ExecuteReader
    '            Do While dr.Read()
    'Cliente
    '               If Not IsDBNull(dr.GetValue(dr.GetOrdinal("Nombre"))) Then
    '                   sNomCliente = Trim(dr.GetValue(dr.GetOrdinal("Nombre")))
    '               End If
    '
    '                If Not IsDBNull(dr.GetValue(dr.GetOrdinal("Paterno"))) Then
    '                    sNomCliente = sNomCliente & " " & Trim(dr.GetValue(dr.GetOrdinal("Paterno")))
    '                End If
    '
    '                If Not IsDBNull(dr.GetValue(dr.GetOrdinal("Materno"))) Then
    '                    sNomCliente = sNomCliente & " " & Trim(dr.GetValue(dr.GetOrdinal("Materno")))
    '                End If
    '            Loop
    '            dr.Close()
    '        Finally
    '            cn.Close()
    '        End Try

    '   End Sub


End Class
