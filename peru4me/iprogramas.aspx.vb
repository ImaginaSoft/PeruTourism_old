﻿Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports Microsoft.VisualBasic
'enviar correo
'Imports System.Web.Mail

Partial Class iprogramas
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
    Protected WithEvents cmdGrabar As System.Web.UI.WebControls.Button
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents HyperLink2 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents lblResumen2 As System.Web.UI.WebControls.Label
    ' Dim wTotalSum As Double = 0


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
            Response.Redirect("ifinsesion.aspx")
        End If

        If Not Page.IsPostBack Then
            Session("Opcion") = 0

            ListaPublicacion()

            lblNomCliente.Text = "Proposals for " & Session("NomCliente")

            lblMensaje1.Text = "Welcome to your personal web page for your customized trip.<br> "
            lblMensaje1.Text = lblMensaje1.Text & "Here you will find the travel itineraries we make specially for you."


            If dgPublica.Items.Count = 0 Then
                lblMensaje2.Text = lblMensaje2.Text & "Foul publish the proposal, inform the travel specialist"
            Else
                lblMensaje2.Text = lblMensaje2.Text & "Click on the travel itinerary you want to look over"
            End If
            'NombreCliente()
        End If
    End Sub

    Private Sub ListaPublicacion()
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_Publica_S"
        da.SelectCommand.Parameters.Add("@CodZonaVta", SqlDbType.Char, 3).Value = "PER"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "PUBLICA")
        dgPublica.DataKeyField = "KeyReg"
        dgPublica.DataSource = ds.Tables("PUBLICA")
        dgPublica.DataBind()
    End Sub

    ' Private Sub NombreCliente()
    ' Dim sNomCliente As String = ""
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
    '
    '    End Sub
End Class
