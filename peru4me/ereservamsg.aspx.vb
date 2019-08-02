Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports Microsoft.VisualBasic

Partial Class ereservamsg
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
    Protected WithEvents cmdGrabar As System.Web.UI.WebControls.Button
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents HyperLink2 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink3 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents lblCodReserva As System.Web.UI.WebControls.Label
    Protected WithEvents lblApellido As System.Web.UI.WebControls.Label
    Protected WithEvents lbltitAereo As System.Web.UI.WebControls.Label
    Protected WithEvents lbltitCodReserva As System.Web.UI.WebControls.Label
    Protected WithEvents lbltitApellido As System.Web.UI.WebControls.Label
    Protected WithEvents lblComents As System.Web.UI.WebControls.Label
    Protected WithEvents lblOK As System.Web.UI.WebControls.Label
    Protected WithEvents lbltitTerrestre As System.Web.UI.WebControls.Label
    Protected WithEvents lbltitComents As System.Web.UI.WebControls.Label
    Protected WithEvents lbltitStatus As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
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
            Response.Redirect("efinsesion.aspx")
        End If

        If Not Page.IsPostBack Then
            lblNomCliente.Text = "Estado de la reserva de " & Session("NomCliente")

            lblMsg.Text = "Aún no hemos recibido el prepago del tour que prefiere. Recuerde que estamos a su disposición para ayudarlo a vivir la experiencia única que es visitar Perú, el País de los Incas."
        End If
    End Sub

End Class
