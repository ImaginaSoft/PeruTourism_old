Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports Microsoft.VisualBasic
Imports System.Drawing
Imports cmpRutinas
Partial Class ibalance
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
    Dim wCargo As Double = 0
    Dim wAbono As Double = 0

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
            Response.Redirect("ifinsesion.aspx")
        End If

        If Not Page.IsPostBack Then
            lblNomCliente.Text = "Balance to " & Session("NomCliente")

            CargaDocumentos()
        End If
    End Sub

    Private Sub CargaDocumentos()
        Dim sMsgLog As String = ""

        Dim da As New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = cn
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = "P4I_MovtosxCliente2_S"
        da.SelectCommand.Parameters.Add("@CodCliente", SqlDbType.Int).Value = Session("CodCliente")
        da.SelectCommand.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")

        Dim ds As New DataSet
        Dim nReg As Integer = da.Fill(ds, "Documentos")

        If nReg = 0 Then
            sMsgLog = "Your Balance - foul payment"
            lblMsg.Text = "We have not received the first payment for the tour of your preference yet. Remember we are here to help you live the unique experience of visiting Peru, Land of the Incas."
        Else
            sMsgLog = "Your Balance"
            dgBalance.DataSource = ds
            dgBalance.DataBind()
        End If
        objRutina.GrabaLog(sMsgLog, "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", "N")


    End Sub


    'Sub ComputeSum(ByVal sender As Object, ByVal e As DataGridItemEventArgs)
    'First, make sure we are dealing with an Item or AlternatingItem
    'If e.Item.ItemType = ListItemType.Item Or _
    '   e.Item.ItemType = ListItemType.AlternatingItem Then
    '    Dim wTotal As Double = Convert.ToDouble(DataBinder.Eval(e.Item.DataItem, "Cargo"))
    '    Dim wSaldo As Double = Convert.ToDouble(DataBinder.Eval(e.Item.DataItem, "Abono"))
    '    wCargo += wCargo
    '    wAbono += wAbono
    '            If DataBinder.Eval(e.Item.DataItem, "TipoOperacion") = "A" Then
    '       Else
    '          wCargo -= wTotal
    '     End If
    'ElseIf e.Item.ItemType = ListItemType.Footer Then
    '    e.Item.Cells(1).HorizontalAlign = HorizontalAlign.Center
    'Console.WriteLine("-5  0;(0)     {0, 10:0;(0)}",    -5); //         (5)
    ' e.Item.Cells(2).Text = String.Format("{0,12:2;(###,###,###,###.00)}", wCargo)

    '            MyString = MyNeg.ToString("$#,##0.00;($#,##0.00);Zero")

    ' In the U.S. English culture, MyString has the value: ($19.95).
    ' The minus sign is omitted by default.


    '        e.Item.Cells(2).Text = String.Format("{0:###,###,###,###.00}", wCargo)
    '        e.Item.Cells(2).HorizontalAlign = HorizontalAlign.Right
    '        e.Item.Cells(4).Text = String.Format("{0:###,###,###,###.00}", wCargo)
    '        e.Item.Cells(4).HorizontalAlign = HorizontalAlign.Right

    '        If wCargo >= 0 Then
    '            e.Item.Cells(1).Text = "Balance US$ "
    '            e.Item.Cells(1).ForeColor = Color.FromName("0000ff")
    '            e.Item.Cells(2).ForeColor = Color.FromName("0000ff")
    '            e.Item.Cells(4).ForeColor = Color.FromName("0000ff")
    '        Else
    '            e.Item.Cells(1).Text = "Pending Balance US$ "
    '            e.Item.Cells(1).ForeColor = Color.FromName("ff0000")
    '            e.Item.Cells(2).ForeColor = Color.FromName("ff0000")
    '            e.Item.Cells(4).ForeColor = Color.FromName("ff0000")
    '        End If
    '    End If
    'End Sub

    'Private Sub dgBalance_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles dgBalance.ItemDataBound
    '    If e.Item.ItemType = ListItemType.Item Or _
    '       e.Item.ItemType = ListItemType.AlternatingItem Then
    '        If e.Item.Cells(3).Text = "A" Then
    '            e.Item.Cells(2).ForeColor = Color.FromName("0000ff")
    '            e.Item.Cells(4).ForeColor = Color.FromName("0000ff")
    '        Else
    '            e.Item.Cells(2).ForeColor = Color.FromName("ff0000")
    '            e.Item.Cells(4).ForeColor = Color.FromName("ff0000")
    '        End If
    '    End If
    'End Sub


    Protected Sub dgBalance_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles dgBalance.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(2).ForeColor = Color.Red
            e.Row.Cells(3).ForeColor = Color.Blue

            If IsNumeric(e.Row.Cells(2).Text) Then
                wCargo += CDbl(e.Row.Cells(2).Text)
            End If

            If IsNumeric(e.Row.Cells(3).Text) Then
                wAbono += CDbl(e.Row.Cells(3).Text)
            End If

        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim wSaldo As Double = wCargo - wAbono

            lblTotal.Text = "PENDING BALANCE US$ " & wSaldo.ToString
        End If

    End Sub
End Class
