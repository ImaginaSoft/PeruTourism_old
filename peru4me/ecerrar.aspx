<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ecerrar.aspx.vb" Inherits="ecerrar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PeruTourism</title>

		<LINK href="Styles.css" type="text/css" rel="stylesheet">
		<SCRIPT language="javascript">
	     function closeWindow() {
	    var ventana = window.self;
	    ventana.opener = window.self;
	    ventana.close();
		}
		</SCRIPT>
	</HEAD>
	<body >
		<form id="Form1" method="post" runat="server" target="_top">
			<TABLE id="Table2" 
				cellSpacing="1" cellPadding="1" width="343" border="0">
				<TR>
					<TD class="error" align="center">
						<P>Estimado usuario, su sesión de trabajo&nbsp;expiro Por favor volver a ingresar 
							al sistema&nbsp;&nbsp;&nbsp;</P>
						<A href="javascript:closeWindow()">Cerrar ventana</A></TD>
					</TD>
				</TR>
			</TABLE>
		</form>
</body>
</html>
