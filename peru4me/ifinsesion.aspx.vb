Imports System.Data
Imports System.Data.SqlClient

Partial Class ifinsesion
    Inherits System.Web.UI.Page


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
        End If
    End Sub

    Private Sub lbtLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lbtLogin.Click
        Response.Redirect("default.htm") 'Ingreso normal
    End Sub


End Class
