Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports Microsoft.VisualBasic
Imports cmpRutinas

Partial Class informacion
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
    Protected WithEvents cmdGrabar As System.Web.UI.WebControls.Button
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents HyperLink2 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents lblSeguro As System.Web.UI.WebControls.Label
    Protected WithEvents dgSeguro As System.Web.UI.WebControls.DataGrid
    Dim objRutina As New cmpRutinas
    Dim sOpcion As String = ""

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.

    End Sub

#End Region


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load, Me.Load
        If Session("CodCliente") = 0 Then
            Response.Redirect("ifinsesion.aspx")
        End If

        If Not Page.IsPostBack Then
            If sOpcion = "" Then
                InformacionSalida()
            End If
        End If
    End Sub


    Private Sub InformacionSalida()
        Dim cd As New SqlCommand
        cd.Connection = cn
        Dim pa As New SqlParameter
        pa = cd.Parameters.Add("@FlagIdioma", SqlDbType.Char, 1)
        pa.Direction = ParameterDirection.Output
        pa.Value = ""
        pa = cd.Parameters.Add("@CantDias", SqlDbType.Int)
        pa.Direction = ParameterDirection.Output
        pa.Value = 0
        pa = cd.Parameters.Add("@CodStsVersion", SqlDbType.Char, 1)
        pa.Direction = ParameterDirection.Output
        pa.Value = ""
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        cd.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        If Session("NroVersion") = 0 Then
            cd.CommandText = "P4I_PropuestaInformacionSalida_S"
        Else
            cd.CommandText = "P4I_VersionInformacionSalida_S"
            cd.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")
        End If
        cd.CommandType = CommandType.StoredProcedure

        Try
            cn.Open()
            cd.ExecuteNonQuery()

            'If cd.Parameters("@NroVersion").Value = 0 Then
            ' No existe versiones facturadas    
            ' Response.Redirect("ireservamsg.aspx")
            'End If
            ViewState("FlagIdioma") = cd.Parameters("@FlagIdioma").Value
            If Session("NroVersion") = 0 Then
                If ViewState("FlagIdioma") = "E" Then
                    Programa.Text = "Propuesta " & "&nbsp;" & Session("NroPropuesta")
                    Dias.Text = "&nbsp;(Tour de " & cd.Parameters("@CantDias").Value & " días)"
                ElseIf ViewState("FlagIdioma") = "I" Then
                    Programa.Text = "Proposal" & "&nbsp;" & Session("NroPropuesta")
                    Dias.Text = "&nbsp;(" & cd.Parameters("@CantDias").Value & " days tour)"
                Else
                    Programa.Text = "Proposta " & "&nbsp;" & Session("NroPropuesta")
                    Dias.Text = "&nbsp;(Tour de " & cd.Parameters("@CantDias").Value & " días)"
                End If
            Else
                If ViewState("FlagIdioma") = "E" Then
                    If cd.Parameters("@CodStsVersion").Value = "F" Then
                        Programa.Text = "Vendido " & "&nbsp;" & Session("NroVersion")
                    Else
                        Programa.Text = "Propuesta " & "&nbsp;" & Session("NroVersion")
                    End If
                    Dias.Text = "&nbsp;(Tour de " & cd.Parameters("@CantDias").Value & " días)"
                ElseIf ViewState("FlagIdioma") = "I" Then
                    If cd.Parameters("@CodStsVersion").Value = "F" Then
                        Programa.Text = "Sold " & "&nbsp;" & Session("NroVersion")
                    Else
                        Programa.Text = "Proposal " & "&nbsp;" & Session("NroVersion")
                    End If
                    Dias.Text = "&nbsp;(" & cd.Parameters("@CantDias").Value & " days tour)"
                Else
                    If cd.Parameters("@CodStsVersion").Value = "F" Then
                        Programa.Text = "Vendido " & "&nbsp;" & Session("NroVersion")
                    Else
                        Programa.Text = "Proposta " & "&nbsp;" & Session("NroVersion")
                    End If
                    Dias.Text = "&nbsp;(Tour de " & cd.Parameters("@CantDias").Value & " días)"

                End If
            End If

            lblMsg.Text = ""
        Catch ex1 As System.Data.SqlClient.SqlException
            lblMsg.Text = "Error1:" & ex1.Message
        Catch ex2 As System.Exception
            lblMsg.Text = "Error2:" & ex2.Message
        Finally
            cn.Close()
        End Try

        If lblMsg.Text <> "" Then
            Return
        End If

        If ViewState("FlagIdioma") = "I" Then
            lblNomCliente.Text = "Pre departure information for " & Session("NomCliente")
            sOpcion = "Before your Arrival"
        ElseIf ViewState("FlagIdioma") = "E" Then
            lblNomCliente.Text = "Pre Información de Salida para " & Session("NomCliente")
            sOpcion = "Antes de su llegada"
        Else
            lblNomCliente.Text = "Pré Informações de Saída para  " & Session("NomCliente")
            sOpcion = "Antes da chegada"
        End If

        CargaHotel()
        CargaStaff()
        CargaVideo()
        CargaClima()
        CargaDocReq()
        CargaInformation() 'Otros

        objRutina.GrabaLog(sOpcion, "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", "N")
    End Sub

    Private Sub CargaHotel()
        If ViewState("FlagIdioma") = "I" Then
            lblHotel.Text = "Selected Hotels"
            dgHotel.Columns(0).HeaderText = "City"
            dgHotel.Columns(1).HeaderText = "Hotel"
            dgHotel.Columns(2).HeaderText = "Telephone"
        ElseIf ViewState("FlagIdioma") = "E" Then
            lblHotel.Text = "Hoteles seleccionados"
            dgHotel.Columns(0).HeaderText = "Ciudad"
            dgHotel.Columns(1).HeaderText = "Hotel"
            dgHotel.Columns(2).HeaderText = "Telefono"
        Else
            lblHotel.Text = "Hotéis selecionados"
            dgHotel.Columns(0).HeaderText = "Cidade"
            dgHotel.Columns(1).HeaderText = "Hotel"
            dgHotel.Columns(2).HeaderText = "Telefone"
        End If

        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        If Session("NroVersion") = 0 Then
            da.SelectCommand.CommandText = "P4I_PropuestaHotel_S"
        Else
            da.SelectCommand.CommandText = "P4I_VersionHotel_S"
            da.SelectCommand.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")
        End If
        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "Hotel")
        dgHotel.DataSource = ds
        dgHotel.DataBind()
    End Sub

    Private Sub CargaStaff()
        If ViewState("FlagIdioma") = "I" Then
            lblStaff.Text = "Perutourism’s 24 hours telephone numbers "
            lblNota.Text = "In case of any emergency during your trip, please contact your travel assistance first or our operation supervisor who knows every detail of your journey."
            dgStaff.Columns(0).HeaderText = "Name"
            dgStaff.Columns(1).HeaderText = "Responsibility"
            dgStaff.Columns(2).HeaderText = "Telephone"
        Else
            lblStaff.Text = "Telefones de PeruTurismo (24 horas)"
            lblNota.Text = "Em caso tenha alguma emergência em sua viagem, não hesite, entre em contato com seu especialista de viagem ou com a chefe de operações que está ciente de todos os detalhes de seu programa."
            dgStaff.Columns(0).HeaderText = "Nome"
            dgStaff.Columns(1).HeaderText = "Cargo"
            dgStaff.Columns(2).HeaderText = "Telefone"
        End If

        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_InformacionStaff_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@FlagIdioma", SqlDbType.Char, 1).Value = ViewState("FlagIdioma")
        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "Staff")
        dgStaff.DataSource = ds
        dgStaff.DataBind()
    End Sub

    Private Sub CargaVideo()
        If ViewState("FlagIdioma") = "I" Then
            lblvideo.Text = "Watch this Video. Important information for your arrival to Lima airport."
        ElseIf ViewState("FlagIdioma") = "E" Then
            lblVideo.Text = "Vea este video. Información importante para su llegada al aeropuerto de Lima."
        Else
            lblVideo.Text = "Veja este vídeo. Informação importante para sua chegada no aeroporto de Lima."
        End If

        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_InformacionVideo_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@FlagIdioma", SqlDbType.Char, 1).Value = ViewState("FlagIdioma")
        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "Video")
        dgVideo.DataSource = ds
        dgVideo.DataBind()
    End Sub

    Private Sub CargaClima()
        If ViewState("FlagIdioma") = "I" Then
            lblClima.Text = "Weather"
            dgClima.Columns(0).HeaderText = "City"
            dgClima.Columns(1).HeaderText = "Month-Year"
            dgClima.Columns(2).HeaderText = "Temperature Low"
            dgClima.Columns(3).HeaderText = "Temperature Hight"
        ElseIf ViewState("FlagIdioma") = "E" Then
            lblClima.Text = "El Clima"
            dgClima.Columns(0).HeaderText = "Ciudad"
            dgClima.Columns(1).HeaderText = "Mes-Año"
            dgClima.Columns(2).HeaderText = "Temperatura Mínima"
            dgClima.Columns(3).HeaderText = "Temperatura Maxima"
        Else
            lblClima.Text = "El Clima"
            dgClima.Columns(0).HeaderText = "Cidade"
            dgClima.Columns(1).HeaderText = "Mês-Ano"
            dgClima.Columns(2).HeaderText = "Temperatura Mínima"
            dgClima.Columns(3).HeaderText = "Temperatura Maxima"
        End If

        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        If Session("NroVersion") = 0 Then
            da.SelectCommand.CommandText = "P4I_PropuestaInformacionClima_S"
        Else
            da.SelectCommand.CommandText = "P4I_VersionInformacionClima_S"
            da.SelectCommand.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")
        End If
        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "Clima")
        dgClima.DataSource = ds
        dgClima.DataBind()
    End Sub

    Private Sub CargaDocReq()
        If ViewState("FlagIdioma") = "I" Then
            lblDocReq.Text = "Requirements to visit Peru"
        ElseIf ViewState("FlagIdioma") = "E" Then
            lblDocReq.Text = "Requerimientos para visitar Perú"
        Else
            lblDocReq.Text = "Requerimentos para visitar o Peru"
        End If

        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_InformacionDocReq_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@FlagIdioma", SqlDbType.Char, 1).Value = ViewState("FlagIdioma")
        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "DocReq")
        dgDocReq.DataSource = ds
        dgDocReq.DataBind()
    End Sub

    Private Sub CargaInformation()
        If ViewState("FlagIdioma") = "I" Then
            lblOtros.Text = "Specific information for your trip"
        ElseIf ViewState("FlagIdioma") = "E" Then
            lblOtros.Text = "Información específica para su viaje"
        Else
            lblOtros.Text = "Informação especifica para sua viagem"
        End If
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        If Session("NroVersion") = 0 Then
            da.SelectCommand.CommandText = "P4I_PropuestaInformacionOtros_S"
        Else
            da.SelectCommand.CommandText = "P4I_VersionInformacionOtros_S"
            da.SelectCommand.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")
        End If
        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "Lista")
        dgOtros.DataSource = ds
        dgOtros.DataBind()
    End Sub

    Private Sub dgOtros_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles dgOtros.ItemDataBound
        If e.Item.ItemType = ListItemType.Item Or _
           e.Item.ItemType = ListItemType.AlternatingItem Then
            If e.Item.Cells(1).Text = "0" Then
                e.Item.Cells(0).Font.Bold = True
            End If
        End If
    End Sub


End Class
