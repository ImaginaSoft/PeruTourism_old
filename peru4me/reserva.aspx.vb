Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports Microsoft.VisualBasic
Imports System.Drawing
Imports cmpRutinas

Partial Class reserva
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
    Protected WithEvents cmdGrabar As System.Web.UI.WebControls.Button
    Dim objRutina As New cmpRutinas

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.

    End Sub

#End Region


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Session("CodCliente") = 0 Then
            Response.Redirect("efinsesion.aspx")
        End If

        If Not Page.IsPostBack Then
            VersionFacturada()
        End If
    End Sub


    Private Sub VersionFacturada()
        Dim cd As New SqlCommand
        cd.Connection = cn
        Dim pa As New SqlParameter
        pa = cd.Parameters.Add("@NroPropuesta", SqlDbType.Int)
        pa.Direction = ParameterDirection.Output
        pa.Value = 0
        pa = cd.Parameters.Add("@NroVersion", SqlDbType.Int)
        pa.Direction = ParameterDirection.Output
        pa.Value = 0
        pa = cd.Parameters.Add("@FlagIdioma", SqlDbType.Char, 1)
        pa.Direction = ParameterDirection.Output
        pa.Value = ""
        pa = cd.Parameters.Add("@CantDias", SqlDbType.Int)
        pa.Direction = ParameterDirection.Output
        pa.Value = 0
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        cd.CommandText = "P4I_VersionFact_S"
        cd.CommandType = CommandType.StoredProcedure

        Try
            cn.Open()
            cd.ExecuteNonQuery()
            ViewState("NroPropuesta") = cd.Parameters("@NroPropuesta").Value
            ViewState("NroVersion") = cd.Parameters("@NroVersion").Value
            ViewState("FlagIdioma") = cd.Parameters("@FlagIdioma").Value
            ViewState("CantDias") = cd.Parameters("@CantDias").Value
            lblMsg.Text = ""
        Catch ex1 As System.Data.SqlClient.SqlException
            lblMsg.Text = "Error1:" & ex1.Message
        Catch ex2 As System.Exception
            lblMsg.Text = "Error2:" & ex2.Message
        Finally
            cn.Close()
        End Try

        'Existe error
        If lblMsg.Text <> "" Then
            Return
        End If


        If ViewState("NroVersion") = 0 Then
            ' No existe versiones facturadas    

            If ViewState("FlagIdioma") = "I" Then
                lblNomCliente.Text = "Booking Status to " & Session("NomCliente")
                objRutina.GrabaLog("Booking Status - foul payment", "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", "N")
                Response.Redirect("ireservamsg.aspx")

            ElseIf ViewState("FlagIdioma") = "E" Then
                lblNomCliente.Text = "Estado de su reserva " & Session("NomCliente")
                objRutina.GrabaLog("Estado de su reserva - falta prepago", "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", "N")
                Response.Redirect("ereservamsg.aspx")
            Else
                lblNomCliente.Text = "Estado da sua reserva " & Session("NomCliente")
                objRutina.GrabaLog("Estado da sua reserva - falta prepago", "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", "N")
                Response.Redirect("preservamsg.aspx")
            End If

        Else
            If ViewState("FlagIdioma") = "I" Then
                lblNomCliente.Text = "Booking Status to " & Session("NomCliente")
                Programa.Text = "Sold " & "&nbsp;" & ViewState("NroVersion")
                Dias.Text = "&nbsp;(" & cd.Parameters("@CantDias").Value & " days tour)"
                objRutina.GrabaLog("Booking Status", "", Session("CodCliente"), Session("NroPedido"), ViewState("NroPropuesta"), ViewState("NroVersion"), Request.UserHostAddress(), "A", "N")

                lblPasajero.Text = "PASSENGERS"
                dgPasajero.Columns(0).HeaderText = "Name passenger"
                dgPasajero.Columns(1).HeaderText = "Last Name passenger"
                dgPasajero.Columns(2).HeaderText = "Date of birth"
                dgPasajero.Columns(3).HeaderText = "Passport"
                dgPasajero.Columns(4).HeaderText = "Country"
                dgPasajero.Columns(5).HeaderText = "Passenger type"

                lblTerrestre.Text = "LAND"
                lbltitStatus.Text = "Status"
                lbltitComents.Text = "Comments"
                lblallservice.Text = "All Land Services"
                lblOK.Text = "OK"
                lblComents.Text = ""

                lblboletoTerrrestre.Text = "TRANSPORT TICKET"
                dgTerrestre.Columns(0).HeaderText = "Date "
                dgTerrestre.Columns(1).HeaderText = "Route"
                dgTerrestre.Columns(2).HeaderText = "Company"
                dgTerrestre.Columns(3).HeaderText = "Ticket No."
                dgTerrestre.Columns(4).HeaderText = "Departure"
                dgTerrestre.Columns(5).HeaderText = "Arrival"
                'dgTerrestre.Columns(6).HeaderText = "Reservation No."
                dgTerrestre.Columns(6).HeaderText = "Tickets"
                dgTerrestre.Columns(7).HeaderText = "Status"


                lblboletoAereo.Text = "AIR TICKET"
                dgAereo.Columns(0).HeaderText = "Date Flight"
                dgAereo.Columns(1).HeaderText = "Flight"
                dgAereo.Columns(2).HeaderText = "Airline"
                dgAereo.Columns(3).HeaderText = "Flight No."
                dgAereo.Columns(4).HeaderText = "Departure"
                dgAereo.Columns(5).HeaderText = "Arrival"
                dgAereo.Columns(6).HeaderText = "Reservation No."
                dgAereo.Columns(7).HeaderText = "Tickets"
                dgAereo.Columns(8).HeaderText = "Status"

                lblHotel.Text = "HOTEL"
                dgHotel.Columns(0).HeaderText = "Country"
                dgHotel.Columns(1).HeaderText = "Hotel"
                dgHotel.Columns(2).HeaderText = "Phone"
                dgHotel.Columns(3).HeaderText = "Status"
                dgHotel.Columns(4).HeaderText = "Alternative"
                dgHotel.Columns(5).HeaderText = "Updated"

                lblInfoPenta.Text = "Please let us know your comments: <A href='mailto:peru@perutourism.com'>peru@perutourism.com</A>.<br>"
                lblInfoPenta.Text = lblInfoPenta.Text & "Copyright © 2006 Viajes Pentagrama S.A.<br>"
                lblInfoPenta.Text = lblInfoPenta.Text & "Av. Larco 101 Suite 1301 Miraflores, Lima, Peru. Phone: (51 1) 241-4724 Fax: (51 1) 444-0015"

            ElseIf ViewState("FlagIdioma") = "E" Then
                lblNomCliente.Text = "Estado de su reserva " & Session("NomCliente")
                Programa.Text = "Vendido " & "&nbsp;" & ViewState("NroVersion")
                Dias.Text = "&nbsp;(Tour de " & cd.Parameters("@CantDias").Value & " días)"
                objRutina.GrabaLog("Estado de su reserva", "", Session("CodCliente"), Session("NroPedido"), ViewState("NroPropuesta"), ViewState("NroVersion"), Request.UserHostAddress(), "A", "N")

                lblPasajero.Text = "PASAJERO"
                dgPasajero.Columns(0).HeaderText = "Nombre de pasajero"
                dgPasajero.Columns(1).HeaderText = "Apellido de pasajero"
                dgPasajero.Columns(2).HeaderText = "Fecha de Nacimiento"
                dgPasajero.Columns(3).HeaderText = "Pasaporte"
                dgPasajero.Columns(4).HeaderText = "País"
                dgPasajero.Columns(5).HeaderText = "Tipo de pasajero"

                lblTerrestre.Text = "TERRESTRE"
                lbltitStatus.Text = "Estado"
                lbltitComents.Text = "Comentario"
                lblallservice.Text = "Todos los servicios  terrestres"
                lblOK.Text = "OK"
                lblOK.ForeColor = Color.FromName("0000ff")
                lblComents.Text = ""

                lblboletoTerrrestre.Text = "BOLETO TRANSPORTE"
                dgTerrestre.Columns(0).HeaderText = "Fecha"
                dgTerrestre.Columns(1).HeaderText = "Ruta "
                dgTerrestre.Columns(2).HeaderText = "Compañia"
                dgTerrestre.Columns(3).HeaderText = "N° Boleto"
                dgTerrestre.Columns(4).HeaderText = "Hora Salida"
                dgTerrestre.Columns(5).HeaderText = "Hora Llegada"
                'dgTerrestre.Columns(6).HeaderText = "Código Reserva"
                dgTerrestre.Columns(6).HeaderText = "Tickets"
                dgTerrestre.Columns(7).HeaderText = "Estado"

                lblboletoAereo.Text = "BOLETO AEREO"
                dgAereo.Columns(0).HeaderText = "Fecha Vuelo"
                dgAereo.Columns(1).HeaderText = "Ruta Vuelo"
                dgAereo.Columns(2).HeaderText = "Aerolínea"
                dgAereo.Columns(3).HeaderText = "N° Vuelo"
                dgAereo.Columns(4).HeaderText = "Hora Salida"
                dgAereo.Columns(5).HeaderText = "Hora Llegada"
                dgAereo.Columns(6).HeaderText = "Código Reserva"
                dgAereo.Columns(7).HeaderText = "Tickets"
                dgAereo.Columns(8).HeaderText = "Estado"

                lblHotel.Text = "HOTEL"
                dgHotel.Columns(0).HeaderText = "Ciudad"
                dgHotel.Columns(1).HeaderText = "Hotel"
                dgHotel.Columns(2).HeaderText = "Teléfono"
                dgHotel.Columns(3).HeaderText = "Estado"
                dgHotel.Columns(4).HeaderText = "Alternativo"
                dgHotel.Columns(5).HeaderText = "Actualizado"

                lblInfoPenta.Text = "Háganos saber sus comentarios a <a href='mailto:peru@perutourism.com'>peru@perutourism.com</a>.<br>"
                lblInfoPenta.Text = lblInfoPenta.Text & "Todos los derechos reservados © 2006 Viajes Pentagrama S.A.<br>"
                lblInfoPenta.Text = lblInfoPenta.Text & "Av. Larco 101 Suite 1301 Miraflores, Lima, Peru. Teléfono: (51 1) 241-4724 Fax:(51 1) 444-0015"

            Else
                lblNomCliente.Text = "Estado da sua reserva" & Session("NomCliente")
                Programa.Text = "Vendido " & "&nbsp;" & ViewState("NroVersion")
                Dias.Text = "&nbsp;(Tour de " & cd.Parameters("@CantDias").Value & " dias)"
                objRutina.GrabaLog("Estado da sua reserva", "", Session("CodCliente"), Session("NroPedido"), ViewState("NroPropuesta"), ViewState("NroVersion"), Request.UserHostAddress(), "A", "N")

                lblPasajero.Text = "PASSAGEIROS"
                dgPasajero.Columns(0).HeaderText = "Nome do passageiro"
                dgPasajero.Columns(1).HeaderText = "Sobrenome do passageiro"
                dgPasajero.Columns(2).HeaderText = "Data de nascimento"
                dgPasajero.Columns(3).HeaderText = "Passaporte"
                dgPasajero.Columns(4).HeaderText = "País"
                dgPasajero.Columns(5).HeaderText = "Tipo passageiros"

                lblTerrestre.Text = "TERRESTRE"
                lbltitStatus.Text = "Estado"
                lbltitComents.Text = "Comentário"
                lblallservice.Text = "Todos os serviços terrestres"
                lblOK.Text = "OK"
                lblOK.ForeColor = Color.FromName("0000ff")
                lblComents.Text = ""

                lblboletoTerrrestre.Text = "TRANSPORTE DE BILHETES"
                dgTerrestre.Columns(0).HeaderText = "Data"
                dgTerrestre.Columns(1).HeaderText = "Rota "
                dgTerrestre.Columns(2).HeaderText = "Companhia"
                dgTerrestre.Columns(3).HeaderText = "No. de Bilheteira"
                dgTerrestre.Columns(4).HeaderText = "Tempo fora"
                dgTerrestre.Columns(5).HeaderText = "Hora de chegada"
                'dgTerrestre.Columns(6).HeaderText = "Código Reserva"
                dgTerrestre.Columns(6).HeaderText = "Bilhetes"
                dgTerrestre.Columns(7).HeaderText = "Estado"

                lblboletoAereo.Text = "PASSAGEM AÉREA"
                dgAereo.Columns(0).HeaderText = "Data do voo"
                dgAereo.Columns(1).HeaderText = "Rota de vôo"
                dgAereo.Columns(2).HeaderText = "Companhia aérea"
                dgAereo.Columns(3).HeaderText = "No. vôo"
                dgAereo.Columns(4).HeaderText = "Tempo fora"
                dgAereo.Columns(5).HeaderText = "Hora de chegada"
                dgAereo.Columns(6).HeaderText = "Código Reserva"
                dgAereo.Columns(7).HeaderText = "Bilhetes"
                dgAereo.Columns(8).HeaderText = "Estado"

                lblHotel.Text = "HOTEL"
                dgHotel.Columns(0).HeaderText = "Cidade"
                dgHotel.Columns(1).HeaderText = "Hotel"
                dgHotel.Columns(2).HeaderText = "Telefone"
                dgHotel.Columns(3).HeaderText = "Estado"
                dgHotel.Columns(4).HeaderText = "Alternativa"
                dgHotel.Columns(5).HeaderText = "Atualizado"

                lblInfoPenta.Text = "Deixe-nos saber seus comentários <a href='mailto:peru@perutourism.com'>peru@perutourism.com</a>.<br>"
                lblInfoPenta.Text = lblInfoPenta.Text & "Todos os direitos reservados © 2006 Viajes Pentagrama S.A.<br>"
                lblInfoPenta.Text = lblInfoPenta.Text & "Av. Larco 101 Suite 1301 Miraflores, Lima, Peru. Teléfono: (51 1) 241-4724 Fax:(51 1) 444-0015"

            End If
        End If


        CargaPasajero()
        CargaTerrestre()
        CargaAereo()
        CargaHotel()
    End Sub

    Private Sub CargaPasajero()
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_Pasajeros_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "pasajero")
        dgPasajero.DataSource = ds
        dgPasajero.DataBind()
    End Sub


    Private Sub CargaTerrestre()
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_ReservaAereo_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = ViewState("NroPropuesta")
        da.SelectCommand.Parameters.Add("@NroVersion", SqlDbType.Int).Value = ViewState("NroVersion")
        da.SelectCommand.Parameters.Add("@CodTipoServicio", SqlDbType.Int).Value = 3 ' Servicios transporte terrestre

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "terrestre")
        dgTerrestre.DataSource = ds
        dgTerrestre.DataBind()

        If dgTerrestre.Items.Count = 0 Then
            'lblboletoTerrrestre.Visible = False
            dgTerrestre.Visible = False
        Else
            'lblboletoTerrrestre.Visible = True
            dgTerrestre.Visible = True
        End If
    End Sub


    Private Sub CargaAereo()
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_ReservaAereo_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = ViewState("NroPropuesta")
        da.SelectCommand.Parameters.Add("@NroVersion", SqlDbType.Int).Value = ViewState("NroVersion")
        da.SelectCommand.Parameters.Add("@CodTipoServicio", SqlDbType.Int).Value = 1 ' Servicios transporte aereo

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "aereo")
        dgAereo.DataSource = ds
        dgAereo.DataBind()
    End Sub


    Private Sub CargaHotel()
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_ReservaHotelFact_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = ViewState("NroPropuesta")
        da.SelectCommand.Parameters.Add("@NroVersion", SqlDbType.Int).Value = ViewState("NroVersion")

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "Documentos")
        dgHotel.DataSource = ds
        dgHotel.DataBind()
    End Sub



    'Protected Sub dgAereo_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles dgAereo.ItemDataBound
    '    If e.Item.ItemType = ListItemType.Item Or _
    '       e.Item.ItemType = ListItemType.AlternatingItem Then
    '        If e.Item.Cells(8).Text = "OK" Then
    '            e.Item.Cells(8).ForeColor = Color.FromName("0000ff")
    '        Else
    '            e.Item.Cells(8).ForeColor = Color.FromName("ff0000")
    '        End If
    '    End If
    '    End Sub

    Protected Sub dgAereo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dgAereo.SelectedIndexChanged

    End Sub
End Class
