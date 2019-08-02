Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports Microsoft.VisualBasic
'enviar correo
Imports System.Web.Mail

Partial Class eprogramafull
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
    Protected WithEvents txtComentario As System.Web.UI.WebControls.TextBox
    Protected WithEvents cmdGrabar As System.Web.UI.WebControls.Button
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents HyperLink2 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents lblDesProgram As System.Web.UI.WebControls.Label
    Protected WithEvents dgPublica As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblSendVendedor As System.Web.UI.WebControls.Label
    Protected WithEvents ImgFotoVendedor As System.Web.UI.WebControls.Image
    Protected WithEvents HyperLinkLog As System.Web.UI.WebControls.HyperLink
    Dim wTotalSum As Double = 0

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
            Response.Redirect("ecerrar.aspx")
        End If

        If Not Page.IsPostBack Then
            ' Configurado Ingles Español
            System.Threading.Thread.CurrentThread.CurrentCulture = _
            New System.Globalization.CultureInfo("es-PE")

            If Session("NroVersion") = 0 Then
                Propuesta()
            Else
                Version()
            End If
        End If
    End Sub
    ' Muestra Links 
    Private Sub VerLinks()
        Dim cd As New SqlCommand
        cd.Connection = cn
        cd.CommandType = CommandType.StoredProcedure
        If Session("NroVersion") = 0 Then
            cd.CommandText = "P4I_PropuestaLink_S"
            cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
            cd.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        Else
            cd.CommandText = "P4I_VersionLink_S"
            cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
            cd.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
            cd.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")
        End If
        cn.Open()
    End Sub

    ' Propuesta 
    Private Sub Propuesta()
        Dim wFlagAtencion As String = ""
        Dim wFlagIdioma As String = ""

        Dim cd As New SqlCommand
        Dim dr As SqlDataReader
        cd.Connection = cn
        cd.CommandText = "P4I_PropuestaNroPropuesta_S"
        cd.CommandType = CommandType.StoredProcedure
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        cd.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        Try
            cn.Open()
            dr = cd.ExecuteReader
            Do While dr.Read()
                'Cliente
                lblNomCliente.Text = "Itinerario Personalizado de"
                If Not IsDBNull(dr.GetValue(dr.GetOrdinal("Nombre"))) Then
                    lblNomCliente.Text = lblNomCliente.Text & " " & Trim(dr.GetValue(dr.GetOrdinal("Nombre")))
                End If

                If Not IsDBNull(dr.GetValue(dr.GetOrdinal("Paterno"))) Then
                    lblNomCliente.Text = lblNomCliente.Text & " " & Trim(dr.GetValue(dr.GetOrdinal("Paterno")))
                End If

                If Not IsDBNull(dr.GetValue(dr.GetOrdinal("Materno"))) Then
                    lblNomCliente.Text = lblNomCliente.Text & " " & Trim(dr.GetValue(dr.GetOrdinal("Materno")))
                End If

                '   lblNombrePaterno.Text = Trim(dr.GetValue(dr.GetOrdinal("Nombre"))) & " " & Trim(dr.GetValue(dr.GetOrdinal("Paterno")))
                'Propuesta
                Dim wtexto As String
                wtexto = "Propuesta"

                Programa.Text = wtexto & " " & Session("NroPropuesta")
                Dias.Text = " (Tour de " & dr.GetValue(dr.GetOrdinal("CantDias")) & " días)"

                'Dias.Text = wtexto & "&nbsp" & Session("NroPropuesta") & "&nbsp - Tour de " & dr.GetValue(dr.GetOrdinal("CantDias")) & " días"
                DesPrograma.Text = dr.GetValue(dr.GetOrdinal("DesPropuesta"))

                lblFechayHora.Text = "Publicado el " & String.Format("{0,1:dd MMM yyyy}{0,13:hh:mm tt }", dr.GetValue(dr.GetOrdinal("FchSys")))

                wFlagAtencion = dr.GetValue(dr.GetOrdinal("FlagAtencion"))
                wFlagIdioma = dr.GetValue(dr.GetOrdinal("FlagIdioma"))

                lblResumen.Text = dr.GetValue(dr.GetOrdinal("Resumen"))
                lblResuCaraEspe.Text = dr.GetValue(dr.GetOrdinal("ResuCaraEspe"))
                lblResuComida.Text = dr.GetValue(dr.GetOrdinal("ResuComida"))
            Loop
            dr.Close()
        Finally
            cn.Close()
        End Try

        PropuestaServicios(wFlagAtencion, wFlagIdioma)
        PropuestaPrecio()
        PropuestaHoteles()
        'VerLinks()
    End Sub

    Private Sub PropuestaServicios(ByVal pFlagAtencion As String, _
                              ByVal pFlagIdioma As String)
        If pFlagAtencion = "F" Then
            dgItinerary.Columns(0).Visible = False
        Else
            dgItinerary.Columns(1).Visible = False
        End If
        'dgItinerary.Columns(4).Visible = False


        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_PropuestaServiciosDet_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "ITINERARY")
        dgItinerary.DataKeyField = "KeyReg"
        dgItinerary.DataSource = ds.Tables("ITINERARY")
        dgItinerary.DataBind()
    End Sub

    Private Sub PropuestaPrecio()
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_PropuestaPrecio_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "PRECIO")
        dgPrecio.DataSource = ds.Tables("PRECIO")
        dgPrecio.DataBind()
    End Sub

    'Propueta Hoteles 
    Private Sub PropuestaHoteles()
        Dim cd As New SqlCommand
        Dim dr As SqlDataReader
        cd.Connection = cn
        cd.CommandText = "P4I_PropuestaHotel_S"
        cd.CommandType = CommandType.StoredProcedure
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        cd.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        Try
            cn.Open()
            dr = cd.ExecuteReader
            Do While dr.Read()
                lblHotel.Text = lblHotel.Text & _
                        "<div><span class=hotel> " & dr.GetValue(dr.GetOrdinal("NomCiudad")) & ": " & _
                        dr.GetValue(dr.GetOrdinal("Titulo")) & "</span></div>"
            Loop
            dr.Close()
        Finally
            cn.Close()
        End Try
        ' Nota por los Holtes
        If lblHotel.Text.Trim.Length > 0 Then
            lblHotel.Text = lblHotel.Text & "<br>" & "<U><font color=#CC3300>Nota Importante:</font></U><br><div><span class=style12>Los hoteles seleccionados estan sujetos a disponibilidad. Se recomienda solicitar las reservas con la mayor antelación posible para tener mejor opción de confirmación. En caso de no haber disponibilidad serán reemplazados por hoteles de similar categoria.</span></div><br>"
        End If

    End Sub


    ' Muestra Versión 
    Private Sub Version()
        Dim wFlagAtencion, wFlagIdioma As String
        Dim cd As New SqlCommand
        Dim dr As SqlDataReader
        cd.Connection = cn
        cd.CommandText = "P4I_VersionNroVersion_S"
        cd.CommandType = CommandType.StoredProcedure
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        cd.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        cd.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")
        Try
            cn.Open()
            dr = cd.ExecuteReader
            Do While dr.Read()
                'Cliente
                lblNomCliente.Text = "Itinerario Personalizado de"
                If Not IsDBNull(dr.GetValue(dr.GetOrdinal("Nombre"))) Then
                    lblNomCliente.Text = lblNomCliente.Text & " " & Trim(dr.GetValue(dr.GetOrdinal("Nombre")))
                End If

                If Not IsDBNull(dr.GetValue(dr.GetOrdinal("Paterno"))) Then
                    lblNomCliente.Text = lblNomCliente.Text & " " & Trim(dr.GetValue(dr.GetOrdinal("Paterno")))
                End If

                If Not IsDBNull(dr.GetValue(dr.GetOrdinal("Materno"))) Then
                    lblNomCliente.Text = lblNomCliente.Text & " " & Trim(dr.GetValue(dr.GetOrdinal("Materno")))
                End If

                'Propuesta
                Dim wtexto As String
                If dr.GetValue(dr.GetOrdinal("CodStsVersion")) = "F" Then
                    wtexto = "Vendido"
                Else
                    wtexto = "Propuesta"
                End If

                Programa.Text = wtexto & " " & Session("NroVersion")
                Dias.Text = " (Tour de " & dr.GetValue(dr.GetOrdinal("CantDias")) & " días)"

                '            Dias.Text = wtexto & "&nbsp" & Session("NroVersion") & "&nbsp - Tour en " & dr.GetValue(dr.GetOrdinal("CantDias")) & " días"
                DesPrograma.Text = dr.GetValue(dr.GetOrdinal("DesVersion"))

                ' Configurado Español PERU
                '            System.Threading.Thread.CurrentThread.CurrentCulture = _
                '           New System.Globalization.CultureInfo("es-PE")

                lblFechayHora.Text = "Publicado el " & String.Format("{0,1:dd MMM yyyy}{0,13:hh:mm tt }", dr.GetValue(dr.GetOrdinal("FchSys")))

                wFlagAtencion = dr.GetValue(dr.GetOrdinal("FlagAtencion"))
                wFlagIdioma = dr.GetValue(dr.GetOrdinal("FlagIdioma"))

                lblResumen.Text = dr.GetValue(dr.GetOrdinal("Resumen"))
                lblResuCaraEspe.Text = dr.GetValue(dr.GetOrdinal("ResuCaraEspe"))
                lblResuComida.Text = dr.GetValue(dr.GetOrdinal("ResuComida"))
            Loop
            dr.Close()
        Finally
            cn.Close()
        End Try

        VersionServicios(wFlagAtencion, wFlagIdioma)
        VersionPrecio()
        VersionHoteles()
        'VerLinks()
    End Sub

    Private Sub VersionServicios(ByVal pFlagAtencion As String, _
                              ByVal pFlagIdioma As String)

        If pFlagAtencion = "F" Then
            dgItinerary.Columns(0).Visible = False
        Else
            dgItinerary.Columns(1).Visible = False
        End If
        'dgItinerary.Columns(4).Visible = False

        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_VersionServiciosDet_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        da.SelectCommand.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "ITINERARY")
        dgItinerary.DataKeyField = "KeyReg"
        dgItinerary.DataSource = ds.Tables("ITINERARY")
        dgItinerary.DataBind()
    End Sub

    Private Sub VersionPrecio()
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_VersionPrecio_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        da.SelectCommand.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        da.SelectCommand.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "PRECIO")
        dgPrecio.DataSource = ds.Tables("PRECIO")
        dgPrecio.DataBind()
    End Sub

    Private Sub VersionHoteles()
        Dim cd As New SqlCommand
        Dim dr As SqlDataReader
        cd.Connection = cn
        cd.CommandText = "P4I_VersionHotel_S"
        cd.CommandType = CommandType.StoredProcedure
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        cd.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        cd.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")
        Try
            cn.Open()
            dr = cd.ExecuteReader
            Do While dr.Read()
                lblHotel.Text = lblHotel.Text & _
                        "<div><span class=hotel> " & dr.GetValue(dr.GetOrdinal("NomCiudad")) & ": " & _
                        dr.GetValue(dr.GetOrdinal("Titulo")) & "</span></div>"
            Loop
            dr.Close()
        Finally
            cn.Close()
        End Try
        ' Nota por los Holtes
        If lblHotel.Text.Trim.Length > 0 Then
            lblHotel.Text = lblHotel.Text & "<br>" & "<U><font color=#CC3300>Nota Importante:</font></U><br><div><span class=style12>Los hoteles seleccionados estan sujetos a disponibilidad. Se recomienda solicitar las reservas con la mayor antelación posible para tener mejor opción de confirmación. En caso de no haber disponibilidad serán reemplazados por hoteles de similar categoria.</span></div><br>"
        End If
    End Sub


    Sub ComputeSum(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        'First, make sure we are dealing with an Item or AlternatingItem
        If e.Item.ItemType = ListItemType.Item Or _
           e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim wTotal As Double = Convert.ToDouble(DataBinder.Eval(e.Item.DataItem, "PrecioTotal"))
            wTotalSum += wTotal
        ElseIf e.Item.ItemType = ListItemType.Footer Then
            e.Item.Cells(3).Text = String.Format("{0:USD ###,###,###,###.00}", wTotalSum)
            '            e.Item.Cells(3).HorizontalAlign = HorizontalAlign.Right
        End If
    End Sub

End Class
