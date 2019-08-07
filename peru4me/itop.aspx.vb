Imports System
Imports System.Data
Imports System.Data.SqlClient

Partial Class itop
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(System.Configuration.ConfigurationSettings.AppSettings("cnPeru4me"))
    'Protected WithEvents lblTitulo As System.Web.UI.WebControls.Label
    'Protected WithEvents Form2 As System.Web.UI.HtmlControls.HtmlForm
    'Protected WithEvents dglog As System.Web.UI.WebControls.DataGrid
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

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load, Me.Load
		If Not Page.IsPostBack Then

			Dim sIdPedido As String = ""
			Dim iCodCliente As Integer

			Dim cd As New SqlCommand
			Dim dr As SqlDataReader
			cd.Connection = cn
			cd.CommandText = "VISA_Pedido_S"
			cd.CommandType = CommandType.StoredProcedure
            'cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = "161"
            cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
            ''cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = "48659"

            Try
				cn.Open()
				dr = cd.ExecuteReader
				Do While dr.Read()
					sIdPedido = dr.GetValue(dr.GetOrdinal("IdPedido"))
					iCodCliente = dr.GetValue(dr.GetOrdinal("CodCliente"))

				Loop
				dr.Close()
			Finally
				cn.Close()
			End Try


			lblCodCliente.Text = iCodCliente
			'CantidadPropuestas()
			'LeePedido()
		End If
	End Sub


    'Private Sub CantidadPropuestas()
    '    Dim cd As New SqlCommand
    '    cd.Connection = cn
    '    cd.CommandText = "P4I_PublicaCant_S"
    '    cd.CommandType = CommandType.StoredProcedure

    '    Dim pa As New SqlParameter

    '    pa = cd.Parameters.Add("@CantPropuestas", SqlDbType.Int)
    '    pa.Direction = ParameterDirection.Output
    '    pa.Value = ""
    '    cd.Parameters.Add("@CodZonaVta", SqlDbType.Char, 3).Value = "PER"
    '    cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
    '    Try
    '        cn.Open()
    '        cd.ExecuteNonQuery()
    '        If cd.Parameters("@CantPropuestas").Value = 1 Then
    '            'lbtPropuestas.Text = "You have <span class=styleCantProp>" & Trim(cd.Parameters("@CantPropuestas").Value) & "</span> Proposal"
    '        Else
    '            'lbtPropuestas.Text = "You have <span class=styleCantProp>" & Trim(cd.Parameters("@CantPropuestas").Value) & "</span> Proposals"
    '        End If
    '    Catch ex1 As System.Data.SqlClient.SqlException
    '        'lbtPropuestas.Text = "Error:" & ex1.Message
    '    Catch ex2 As System.Exception
    '        'lbtPropuestas.Text = "Error:" & ex2.Message
    '    End Try
    '    cn.Close()
    'End Sub

    'Private Sub LeePedido()
    '    Dim sStsPedido As String
    '    Dim sNroSesionUsuario As String

    '    Dim cd As New SqlCommand
    '    Dim dr As SqlDataReader
    '    cd.Connection = cn
    '    cd.CommandText = "BLOG_SesionCliente_S"
    '    cd.CommandType = CommandType.StoredProcedure
    '    cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
    '    Try
    '        cn.Open()
    '        dr = cd.ExecuteReader
    '        Do While dr.Read()
    '            lblTollFree.Text = dr.GetValue(dr.GetOrdinal("TollFree"))
    '            If dr.GetValue(dr.GetOrdinal("StsPedido")) = "V" Then
    '                'Pedido Vendido
    '                HyperLinkSingle.ImageUrl = "images/boton_version.gif"
    '                HyperLinkSingle.NavigateUrl = System.Configuration.ConfigurationSettings.AppSettings("DominioBlogIng") & "/blogexp.aspx" & _
    '                    "?P=" & CStr(Session("NroPedido")) & _
    '                    "&P4=" & dr.GetValue(dr.GetOrdinal("NroSesionUsuario"))
    '            Else
    '                'Pedido Negociacion
    '                HyperLinkSingle.ImageUrl = "images/boton_peru4me.gif"
    '                HyperLinkSingle.NavigateUrl = System.Configuration.ConfigurationSettings.AppSettings("DominioBlogIng")
    '            End If
    '        Loop
    '        dr.Close()
    '    Finally
    '        cn.Close()
    '    End Try
    'End Sub


    Private Sub ImageButton1_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click


		Dim sIdPedido As String = ""
		Dim iCodCliente As Integer

		Dim cd As New SqlCommand
		Dim dr As SqlDataReader
		cd.Connection = cn
		cd.CommandText = "VISA_Pedido_S"
		cd.CommandType = CommandType.StoredProcedure
		'cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = "161"
		cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
		Try
			cn.Open()
			dr = cd.ExecuteReader
			Do While dr.Read()
				sIdPedido = dr.GetValue(dr.GetOrdinal("IdPedido"))
				iCodCliente = dr.GetValue(dr.GetOrdinal("CodCliente"))

			Loop
			dr.Close()
		Finally
			cn.Close()
		End Try

		'Session("Opcion") = 1
		'Dim URL_PagoVisa As String = System.Configuration.ConfigurationSettings.AppSettings("URL_PagosVISA")
		'Dim script As String = ""

		'script = "<SCRIPT languange='JavaScript'>" & _
		'		 "parent.main.location.href='" & URL_PagoVisa & "/Pago.aspx?ID=" & sIdPedido & "';" & _
		'		 "</SCRIPT>"
		'RegisterStartupScript("Etiq1", script)

		Dim URL_PagosVISALINK As String = System.Configuration.ConfigurationSettings.AppSettings("URL_PagosVISALINK")
		Dim script As String = ""

		script = "<SCRIPT languange='JavaScript'>" & _
				 "parent.location.href='" & URL_PagosVISALINK & "';" & "alert('Please, for payment copy this code : " + iCodCliente.ToString & "');" & _
				 "</SCRIPT>"
		RegisterStartupScript("Etiq1", script)
	End Sub

    Protected Sub ImageButtonItineraries_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonItineraries.Click
        Dim script As String = ""
        script = "<SCRIPT languange='JavaScript'>" & _
                "parent.main.location.href='iprogramas.aspx';" & _
               "</SCRIPT>"
        RegisterStartupScript("Etiq1", script)

    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim sIdPedido As String = ""

        Dim cd As New SqlCommand
        Dim dr As SqlDataReader
        cd.Connection = cn
        cd.CommandText = "MC_Pedido_S"
        cd.CommandType = CommandType.StoredProcedure
        cd.Parameters.Add("@NroPedido", SqlDbType.Int).Value = Session("NroPedido")
        Try
            cn.Open()
            dr = cd.ExecuteReader
            Do While dr.Read()
                sIdPedido = dr.GetValue(dr.GetOrdinal("IdPedido"))
            Loop
            dr.Close()
        Finally
            cn.Close()
        End Try

        Session("Opcion") = 1
        Dim URL_PagoTC As String = System.Configuration.ConfigurationSettings.AppSettings("URL_PagosMASTECARD")
        Dim script As String = ""

        script = "<SCRIPT languange='JavaScript'>" & _
                 "parent.main.location.href='" & URL_PagoTC & "/Pago.aspx?ID=" & sIdPedido & "';" & _
                 "</SCRIPT>"
        RegisterStartupScript("Etiq1", script)

    End Sub
End Class
