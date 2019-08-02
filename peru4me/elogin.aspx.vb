Imports System.Data
Imports System.Data.SqlClient
Imports cmpRutinas

Partial Class elogin
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
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
        If Not Page.IsPostBack Then
            Dim sParamID As String = Request.Params("ID")
            Dim sParamO As String = Request.Params("O")

            ' caso español
            'https://www.pentagrama.com/perutourism/elogin.aspx?ID=2671253102600    
            'sParamID = "2733033100784  "
            'sParamID = "8703441103217         "

            ' Inicio - Code To redirect app mobile

            Dim userAgent = Request.UserAgent
            Dim pattern = ConfigurationManager.AppSettings("PatternMobile")
            Dim url = ConfigurationManager.AppSettings("UrlNegociacionMobile")
            If (System.Text.RegularExpressions.Regex.IsMatch(userAgent, pattern, System.Text.RegularExpressions.RegexOptions.IgnoreCase)) Then
                Response.Redirect(String.Format(url, sParamID))
            End If
            ' Fin - Code To redirect app mobile

            If Len(Trim(sParamID)) > 0 Then
                Session("CodCliente") = 0
                ViewState("FlagIdioma") = ""
                ViewState("CantPropuestas") = 0

                'ID = Identificador del cliente
                Try
                    'Parametro Origen solo existe cuando viene de Mozart
                    If Len(Trim(sParamO)) > 0 Then
                        If Request.Params("O") = "M" Then
                            lblAccesoDeMozart.Text = "S" 'No graba log
                        End If
                    End If
                    ViewState("IDCliente") = sParamID
                    ViewState("CodCliente") = Mid(sParamID, 8, 10)
                    ViewState("Acceso") = "A" 'Automatico pasando el N°Pedido
                    LeeCliente()
                Catch ex As Exception
                    ' pide email y clave cliente
                End Try

                If Session("CodCliente") > 0 Then
                    LeeUltimaPublicacion(Session("CodCliente"))
                    ProgramasPublicados()
                End If

            End If
        End If
    End Sub


    Private Sub LeeCliente()
        Session("NomCliente") = ""

        Dim cd As New SqlCommand
        Dim dr As SqlDataReader
        cd.Connection = cn
        cd.CommandText = "VTA_ClienteEmail_S"
        cd.CommandType = CommandType.StoredProcedure
        cd.Parameters.Add("@CodCliente", SqlDbType.Int).Value = ViewState("CodCliente")
        Try
            cn.Open()
            dr = cd.ExecuteReader
            Do While dr.Read()
                If Trim(dr.GetValue(dr.GetOrdinal("IDCliente"))) = Trim(ViewState("IDCliente")) Then
                    Session("CodCliente") = ViewState("CodCliente")
                    Session("NomCliente") = dr.GetValue(dr.GetOrdinal("NomCliente"))
                    Session("EmailCliente") = dr.GetValue(dr.GetOrdinal("Email"))
                End If
            Loop
            dr.Close()
        Finally
            cn.Close()
        End Try
    End Sub

    Private Sub ImageButton1_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        ViewState("Acceso") = "M" ' Manual ingresando el email y clave
        Session("CodCliente") = 0
        Session("NomCliente") = ""

        ValidaEmailClave()
        If Session("CodCliente") = 0 Then
            lblMsg.Text = "Ingrese e-mail y contraseña correctamente."
            If lblMsg.Font.Bold Then
                lblMsg.Font.Bold = False
            Else
                lblMsg.Font.Bold = True
            End If
            'Error al validar 
            objRutina.GrabaLog(txtEmail.Text, txtPaterno.Text, 0, 0, 0, 0, Request.UserHostAddress(), "E", lblAccesoDeMozart.Text)
        Else
            'Email y Clave OK
            Session("EmailCliente") = txtEmail.Text
            LeeUltimaPublicacion(Session("CodCliente"))
            objRutina.GrabaLog(txtEmail.Text, txtPaterno.Text, Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", lblAccesoDeMozart.Text)
            ProgramasPublicados()
        End If

    End Sub

    Private Sub ValidaEmailClave()
        lblMsg.Text = ""
        If txtEmail.Text.Trim.Length <> 0 And txtPaterno.Text.Trim.Length <> 0 Then
            Dim cd As New SqlCommand
            Dim dr As SqlDataReader
            cd.Connection = cn
            cd.CommandText = "P4I_LeeClienteEmail_S"
            cd.CommandType = CommandType.StoredProcedure
            cd.Parameters.Add("@Email", SqlDbType.Char, 50).Value = txtEmail.Text.Trim
            cd.Parameters.Add("@Paterno", SqlDbType.Char, 25).Value = txtPaterno.Text.Trim
            Try
                cn.Open()
                dr = cd.ExecuteReader
                Do While dr.Read()
                    Session("CodCliente") = dr.GetValue(dr.GetOrdinal("CodCliente"))
                    Session("NomCliente") = dr.GetValue(dr.GetOrdinal("NomCliente"))
                Loop
                dr.Close()
            Finally
                cn.Close()
            End Try
        End If
    End Sub


    Private Sub LeeUltimaPublicacion(ByVal pCodCliente As Integer)
        Session("NroPedido") = 0
        Session("NroPropuesta") = 0
        Session("NroVersion") = 0

        Dim cd As New SqlCommand
        Dim dr As SqlDataReader
        cd.Connection = cn
        cd.CommandText = "P4I_PublicaUltimo_S"
        cd.CommandType = CommandType.StoredProcedure
        cd.Parameters.Add("@CodZonaVta", SqlDbType.Char, 3).Value = "PER"
        cd.Parameters.Add("@CodCliente", SqlDbType.Int).Value = pCodCliente
        Try
            cn.Open()
            dr = cd.ExecuteReader
            Do While dr.Read()
                Session("NroPedido") = dr.GetValue(dr.GetOrdinal("NroPedido"))
                Session("NroPropuesta") = dr.GetValue(dr.GetOrdinal("NroPropuesta"))
                Session("NroVersion") = dr.GetValue(dr.GetOrdinal("NroVersion"))
                ViewState("FlagIdioma") = dr.GetValue(dr.GetOrdinal("FlagIdioma"))
                ViewState("CantPropuestas") = dr.GetValue(dr.GetOrdinal("CantPropuestas"))
            Loop
            dr.Close()
        Finally
            cn.Close()
        End Try

    End Sub

    Private Sub ProgramasPublicados()
        If ViewState("FlagIdioma") = "I" Then
            objRutina.GrabaLog("Saw " & CStr(ViewState("CantPropuestas")) & " programs published", "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", lblAccesoDeMozart.Text)
            Response.Redirect("idefault.htm")
        Else
            objRutina.GrabaLog("Vio " & CStr(ViewState("CantPropuestas")) & " programa(s) publicado(s)", "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", lblAccesoDeMozart.Text)
            Response.Redirect("edefault.htm")
        End If

    End Sub


    Private Sub ImageButton2_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("ilogin.aspx")
    End Sub

End Class
