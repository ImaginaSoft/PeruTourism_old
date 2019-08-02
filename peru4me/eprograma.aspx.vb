Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports Microsoft.VisualBasic
Imports System.Web.Mail
Imports cmpRutinas

Partial Class eprograma
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
    Protected WithEvents cmdGrabar As System.Web.UI.WebControls.Button
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Dim wTotalSum As Double = 0
    Dim objRutina As New cmpRutinas


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
            If Session("Opcion") = 1 Or Mid(Request.Params("Id"), 1, 8).Trim.Length = 0 Then
                Session("Opcion") = 0
                ViewState("GrabaLog") = "NO"
            Else
                Session("NroPedido") = Mid(Request.Params("Id"), 1, 8)
                Session("NroPropuesta") = Mid(Request.Params("Id"), 9, 2)
                Session("NroVersion") = Mid(Request.Params("Id"), 11, 2)
                ViewState("GrabaLog") = "SI"
            End If

            ' Solo cuando envia mensaje se muestra 
            If Session("StsSendEmail") = "" Then
                lblMsg.Text = ""
            Else
                lblMsg.Text = Session("StsSendEmail")
                Session("StsSendEmail") = ""
            End If

            VerPrograma()

        End If
    End Sub


    Private Sub VerPrograma()
        If Session("NroVersion") = 0 Then
            Propuesta()
        Else
            Version()
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
        Dim wTotalAdulto As Double = 0
        Dim wTotalNino As Double = 0
        Dim wTotalInfante As Double = 0
        Dim wTotalSenior As Double = 0

        Dim wFlagAtencion, wFlagIdioma As String

        ' Configurado Ingles Español
        System.Threading.Thread.CurrentThread.CurrentCulture = _
        New System.Globalization.CultureInfo("es-PE")

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

                lblNomCliente.Text = "Itinerario Personalizado para " & Session("NomCliente")
                'Propuesta
                Dim wtexto As String
                wtexto = "Propuesta"

                Programa.Text = wtexto & " " & Session("NroPropuesta")
                Dias.Text = " (Tour de " & dr.GetValue(dr.GetOrdinal("CantDias")) & " días)"
                'Dias.Text = wtexto & "&nbsp" & Session("NroPropuesta") & "&nbsp - Tour de " & dr.GetValue(dr.GetOrdinal("CantDias")) & " días"
                DesPrograma.Text = dr.GetValue(dr.GetOrdinal("DesPropuesta"))

                lblFechayHora.Text = "Publicado el " & String.Format("{0,1:dd MMM yyyy}{0,13:hh:mm tt }", dr.GetValue(dr.GetOrdinal("FchSys")))

                lblSendVendedor.Text = "Envíe un mensaje a su especialista de viajes " & dr.GetValue(dr.GetOrdinal("NomVendedor")) & "</span>"
                ImgFotoVendedor.ImageUrl = "images/v" & Trim(dr.GetValue(dr.GetOrdinal("CodVendedor"))) & ".jpg"

                Session("EmailVendedor") = dr.GetValue(dr.GetOrdinal("EmailVendedor"))
                wFlagAtencion = dr.GetValue(dr.GetOrdinal("FlagAtencion"))
                wFlagIdioma = dr.GetValue(dr.GetOrdinal("FlagIdioma"))

                lblFlagPublicaEuro.Text = dr.GetValue(dr.GetOrdinal("FlagPublicaEuro"))
                lblTipoCambioEuro.Text = dr.GetValue(dr.GetOrdinal("TipoCambioEuro"))

                lblResumen.Text = dr.GetValue(dr.GetOrdinal("Resumen"))
                lblResuCaraEspe.Text = dr.GetValue(dr.GetOrdinal("ResuCaraEspe"))
                lblResuComida.Text = dr.GetValue(dr.GetOrdinal("ResuComida"))

                If dr.GetValue(dr.GetOrdinal("BlogVendedor")) <> "" Then
                    lblBlog.Text = lblBlog.Text & _
                            "<div>" & _
                            "<a href=""" & "javascript:go('" & dr.GetValue(dr.GetOrdinal("BlogVendedor")) & "')""" & ">" & _
                            "Más sobre mi Clic a mi blog" & "</a></div>"
                End If

            Loop
            dr.Close()
        Finally
            cn.Close()
        End Try

        PropuestaServicios(wFlagAtencion, wFlagIdioma)
        PropuestaPrecio()
        PropuestaHoteles()
        'VerLinks()
        If ViewState("GrabaLog") = "SI" Then
            objRutina.GrabaLog("Propuesta", "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), 0, Request.UserHostAddress(), "A", "N")
        End If
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
        'dgItinerary.DataKeyField = "KeyReg"
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
                If Trim(dr.GetValue(dr.GetOrdinal("NomPagina"))) = "" Then
                    lblHotel.Text = lblHotel.Text & _
                            "<div><span class=hotel> " & dr.GetValue(dr.GetOrdinal("NomCiudad")) & ": " & _
                            dr.GetValue(dr.GetOrdinal("Titulo")) & "</span></div>"
                Else
                    lblHotel.Text = lblHotel.Text & _
                            "<div><span class=hotel> " & dr.GetValue(dr.GetOrdinal("NomCiudad")) & ": </span>" & _
                            "<a href=""" & "javascript:go('" & dr.GetValue(dr.GetOrdinal("NomPagina")) & "')""" & ">" & _
                            dr.GetValue(dr.GetOrdinal("Titulo")) & "</a></div>"

                    '        <A href="javascript:go('http://www.perutourism.com/links/infoe.htm')">Peru facts</A>
                End If
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
        ' Configurado Ingles Español
        System.Threading.Thread.CurrentThread.CurrentCulture = _
        New System.Globalization.CultureInfo("es-PE")
        Dim wTotalAdulto As Double = 0
        Dim wTotalNino As Double = 0
        Dim wTotalInfante As Double = 0
        Dim wTotalSenior As Double = 0

        Dim wFlagAtencion As String = ""
        Dim wFlagIdioma As String = ""
        Dim cd As New SqlCommand
        Dim dr As SqlDataReader
        cd.Connection = cn
        cd.CommandText = "VTA_VersionNroVersion_S"
        cd.CommandType = CommandType.StoredProcedure
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        cd.Parameters.Add("@NroPropuesta", SqlDbType.Int).Value = Session("NroPropuesta")
        cd.Parameters.Add("@NroVersion", SqlDbType.Int).Value = Session("NroVersion")
        Try
            cn.Open()
            dr = cd.ExecuteReader
            Do While dr.Read()
                lblNomCliente.Text = "Itinerario Personalizado para " & Session("NomCliente")

                Dim wtexto As String
                If dr.GetValue(dr.GetOrdinal("CodStsVersion")) = "F" Then
                    wtexto = "Vendido"
                Else
                    wtexto = "Propuesta"
                End If

                Programa.Text = wtexto & " " & Session("NroVersion")
                Dias.Text = " (Tour de " & dr.GetValue(dr.GetOrdinal("CantDias")) & " días)"

                'Dias.Text = wtexto & "&nbsp" & Session("NroVersion") & "&nbsp - " & dr.GetValue(dr.GetOrdinal("CantDias")) & " days tour"
                DesPrograma.Text = dr.GetValue(dr.GetOrdinal("DesVersion"))

                lblFechayHora.Text = "Publicado el " & String.Format("{0,1:dd MMM yyyy}{0,13:hh:mm tt }", dr.GetValue(dr.GetOrdinal("FchSys")))

                lblSendVendedor.Text = "Envíe un mensaje a su especialista de viajes " & dr.GetValue(dr.GetOrdinal("NomVendedor")) & "</span>"
                ImgFotoVendedor.ImageUrl = "images/v" & Trim(dr.GetValue(dr.GetOrdinal("CodVendedor"))) & ".jpg"

                Session("EmailVendedor") = dr.GetValue(dr.GetOrdinal("EmailVendedor"))
                wFlagAtencion = dr.GetValue(dr.GetOrdinal("FlagAtencion"))
                wFlagIdioma = dr.GetValue(dr.GetOrdinal("FlagIdioma"))

                lblFlagPublicaEuro.Text = dr.GetValue(dr.GetOrdinal("FlagPublicaEuro"))
                lblTipoCambioEuro.Text = dr.GetValue(dr.GetOrdinal("TipoCambioEuro"))

                lblResumen.Text = dr.GetValue(dr.GetOrdinal("Resumen"))
                lblResuCaraEspe.Text = dr.GetValue(dr.GetOrdinal("ResuCaraEspe"))
                lblResuComida.Text = dr.GetValue(dr.GetOrdinal("ResuComida"))

                If dr.GetValue(dr.GetOrdinal("BlogVendedor")) <> "" Then
                    lblBlog.Text = lblBlog.Text & _
                            "<div>" & _
                            "<a href=""" & "javascript:go('" & dr.GetValue(dr.GetOrdinal("BlogVendedor")) & "')""" & ">" & _
                            "Más sobre mi Clic a mi blog" & "</a></div>"
                End If

            Loop
            dr.Close()
        Finally
            cn.Close()
        End Try

        VersionServicios(wFlagAtencion, wFlagIdioma)
        VersionPrecio()
        VersionHoteles()
        'VerLinks()
        If ViewState("GrabaLog") = "SI" Then
            objRutina.GrabaLog("Versión", "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", "N")
        End If
    End Sub

    Private Sub VersionServicios(ByVal pFlagAtencion As String, _
                              ByVal pFlagIdioma As String)

        If pFlagAtencion = "F" Then
            dgItinerary.Columns(0).Visible = False
        Else
            dgItinerary.Columns(1).Visible = False
        End If
        ' dgItinerary.Columns(4).Visible = False

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
        'dgItinerary.DataKeyField = "KeyReg"
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
                If Trim(dr.GetValue(dr.GetOrdinal("NomPagina"))) = "" Then
                    lblHotel.Text = lblHotel.Text & _
                            "<div><span class=hotel> " & dr.GetValue(dr.GetOrdinal("NomCiudad")) & ": " & _
                            dr.GetValue(dr.GetOrdinal("Titulo")) & "</span></div>"
                Else
                    lblHotel.Text = lblHotel.Text & _
                            "<div><span class=hotel> " & dr.GetValue(dr.GetOrdinal("NomCiudad")) & ": </span>" & _
                            "<a href=""" & "javascript:go('" & dr.GetValue(dr.GetOrdinal("NomPagina")) & "')""" & ">" & _
                            dr.GetValue(dr.GetOrdinal("Titulo")) & "</a></div>"
                End If
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

    Private Sub dgItinerary_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles dgItinerary.ItemDataBound
        '  If e.Item.ItemType = ListItemType.Item Or _
        '     e.Item.ItemType = ListItemType.AlternatingItem Then
        ' If e.Item.Cells(4).Text = "1" Then
        'e.Item.BackColor = Color.FromName("F0FFC0")
        'Else
        '    e.Item.BackColor = Color.FromName("F5F4DF")
        'End If
        'End If
    End Sub

    Sub ComputeSum(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
        If e.Item.ItemType = ListItemType.Item Or _
           e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim wTotal As Double = Convert.ToDouble(DataBinder.Eval(e.Item.DataItem, "PrecioTotal"))
            wTotalSum += wTotal
        ElseIf e.Item.ItemType = ListItemType.Footer Then
            e.Item.Cells(3).Text = String.Format("{0:USD ###,###,###,###.00}", wTotalSum)
            'Publica en Euros -> convierte US$ a Euros
            If lblFlagPublicaEuro.Text = "S" Then
                lblEuro.Text = "<br>" & e.Item.Cells(3).Text & " equivale a <b> " & _
                String.Format("{0:###,###,###,###.00}", wTotalSum * CDbl(lblTipoCambioEuro.Text)) & " EUROS<b/>"
            Else
                lblEuro.Text = ""
            End If
            '            e.Item.Cells(3).HorizontalAlign = HorizontalAlign.Right
        End If
    End Sub

    Private Sub ImageButtonSend_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonSend.Click
        If txtComentario.Text.Trim.Length = 0 Or txtComentario.Text = "Please write your message..." Then
            txtComentario.Text = "Please write your message..."
            lblMsg.Text = ""
            Return
        End If

        Dim cd As New SqlCommand
        cd.Connection = cn
        cd.CommandText = "VTA_ClienteLog_I"
        cd.CommandType = CommandType.StoredProcedure

        Dim pa As New SqlParameter

        pa = cd.Parameters.Add("@MsgTrans", SqlDbType.VarChar, 150)
        pa.Direction = ParameterDirection.Output
        pa.Value = ""

        cd.Parameters.Add("@DesLog", SqlDbType.VarChar, 4000).Value = Trim(txtComentario.Text)
        cd.Parameters.Add("@CodCliente", SqlDbType.Int).Value = Session("CodCliente")
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        cd.Parameters.Add("@NroPropuesta", SqlDbType.TinyInt).Value = Session("NroPropuesta")
        cd.Parameters.Add("@NroVersion", SqlDbType.TinyInt).Value = Session("NroVersion")
        cd.Parameters.Add("@TipoLog", SqlDbType.Char, 1).Value = "3"
        cd.Parameters.Add("@TipoMsg", SqlDbType.Char, 1).Value = "E"
        cd.Parameters.Add("@CodUsuario", SqlDbType.Char, 15).Value = "CLIENTE"
        Try
            cn.Open()
            cd.ExecuteNonQuery()
            lblMsg.Text = cd.Parameters("@MsgTrans").Value
        Catch ex1 As System.Data.SqlClient.SqlException
            lblMsg.Text = "Error:" & ex1.Message
        Catch ex2 As System.Exception
            lblMsg.Text = "Error:" & ex2.Message
        End Try
        cn.Close()

        'Grabar log envio email
        objRutina.GrabaLogEnviaEmail("")
        objRutina.GrabaLogEnviaEmail("")
        objRutina.GrabaLogEnviaEmail(DateTime.Now.ToString("yy-MM-dd hh:mm:ss") & " ENVIA EMAIL ")
        objRutina.GrabaLogEnviaEmail(" Session(CodCliente)   = " & Session("CodCliente"))
        objRutina.GrabaLogEnviaEmail(" Session(NroPedido)    = " & Session("NroPedido"))
        objRutina.GrabaLogEnviaEmail(" Session(NroPropuesta) = " & Session("NroPropuesta"))
        objRutina.GrabaLogEnviaEmail(" Session(NroVersion)   = " & Session("NroVersion"))
        objRutina.GrabaLogEnviaEmail(" lblMsg.Text           = " & lblMsg.Text)
        objRutina.GrabaLogEnviaEmail("")
        objRutina.GrabaLogEnviaEmail(" .From Session(EmailCliente)  = " & Session("EmailCliente"))
        objRutina.GrabaLogEnviaEmail(" .To   Session(EmailVendedor) = " & Session("EmailVendedor"))
        objRutina.GrabaLogEnviaEmail(" .Cc   Session(EmailCliente)  = " & Session("EmailCliente"))
        objRutina.GrabaLogEnviaEmail(" .Subject                     = " & "Peru4me - Proposals " & RTrim(Session("NroPropuesta")) & " " & Session("NombrePaterno"))
        objRutina.GrabaLogEnviaEmail("  .Body                       = " & txtComentario.Text)



        If Trim(lblMsg.Text) = "OK" Then
            'Envia Correo del Cliente al Vendedor
            Dim email As New MailMessage
            With email
                .From = Session("EmailCliente")
                .To = Session("EmailVendedor")
                .Cc = Session("EmailCliente")
                .Subject = "Peru4me - Propuesta " & RTrim(Session("NroPropuesta")) & " " & Session("NombrePaterno")
                .Body = txtComentario.Text

                .Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", System.Configuration.ConfigurationSettings.AppSettings("ServidorEmail")) 'smtp Server Address
                .Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", 25)
                .Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", 2) '2 to send using SMTP over the network
                .Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", 1) '1 = basic authentication
                .Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", System.Configuration.ConfigurationSettings.AppSettings("sendusername"))
                .Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", System.Configuration.ConfigurationSettings.AppSettings("sendpassword"))
            End With

            SmtpMail.Send(email)

            objRutina.GrabaLogEnviaEmail("")
            objRutina.GrabaLogEnviaEmail(" SmtpMail.Send(email)")

            txtComentario.Text = ""
            Session("Opcion") = 1
            Session("StsSendEmail") = "Mesaje fue enviado correctamente."
            Response.Redirect("eprograma.aspx#SendEmailOK")
        End If
    End Sub

    Private Sub GrabaLog()
        'Dim ClienteIP As String

        'ClienteIP = Request.UserHostAddress()

        Dim cd As New SqlCommand
        cd.Connection = cn
        cd.CommandText = "SEG_LogAcceso_I"
        cd.CommandType = CommandType.StoredProcedure

        Dim pa As New SqlParameter
        pa = cd.Parameters.Add("@MsgTrans", SqlDbType.VarChar, 150)
        pa.Direction = ParameterDirection.Output
        pa.Value = ""

        cd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = "" 'txtEmail.Text.Trim"
        cd.Parameters.Add("@Paterno", SqlDbType.VarChar, 25).Value = "" ' txtPaterno.Text.Trim
        cd.Parameters.Add("@CodCliente", SqlDbType.Int).Value = Session("CodCliente")
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        cd.Parameters.Add("@NroPropuesta", SqlDbType.TinyInt).Value = Session("NroPropuesta")
        cd.Parameters.Add("@NroVersion", SqlDbType.TinyInt).Value = Session("NroVersion")
        cd.Parameters.Add("@IPAddress", SqlDbType.VarChar, 25).Value = "" ' ClienteIP
        cd.Parameters.Add("@Acceso", SqlDbType.Char, 1).Value = "C"
        cd.Parameters.Add("@AccesoDeMozart", SqlDbType.Char, 1).Value = "N" 'lblAccesoDeMozart.Text
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


End Class
