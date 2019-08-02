Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Partial Class elog
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
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
            Viewstate("NroPedido") = Session("NroPedido")
            lblTitulo.Text = "Log de Communicación"
            ShowLog()
        End If
    End Sub

    Private Sub ShowLog()
        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_PedidoHistorial_S"
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Viewstate("NroPedido")
        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "Log")
        'dgServicio.DataKeyField = "KeyReg"
        dglog.DataSource = ds.Tables("Log")
        dglog.DataBind()
    End Sub

    Private Sub dglog_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles dglog.ItemDataBound
        'aca preguntamos  si es que el tipo de fila es la adecuada para contener datos
        If e.Item.ItemType = ListItemType.Item Or _
           e.Item.ItemType = ListItemType.AlternatingItem Then
            If e.Item.Cells(3).Text = "2" Then
                '               e.Item.BackColor = Color.FromName("F0FFC0")
            Else
                e.Item.BackColor = Color.FromName("F5F4DF")
            End If
        End If

    End Sub

End Class
