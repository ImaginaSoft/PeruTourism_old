﻿Imports cmpRutinas

Partial Class iformapago
    Inherits System.Web.UI.Page
    Dim objRutina As New cmpRutinas

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        objRutina.GrabaLog("Payment Procedure", "", Session("CodCliente"), Session("NroPedido"), Session("NroPropuesta"), Session("NroVersion"), Request.UserHostAddress(), "A", "N")
    End Sub
End Class
