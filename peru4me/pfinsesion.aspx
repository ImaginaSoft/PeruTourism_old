<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pfinsesion.aspx.vb" Inherits="pfinsesion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PeruTourism</title>
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server" target="_top">
			<TABLE id="Table2" 
				cellSpacing="1" cellPadding="1" width="343" border="0">
				<TR>
					<TD class="error">
						<P>Prezado usuário , sua reunião de trabalho expirou , por favor entrar novamente para o sistema</P>
						<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							&nbsp;&nbsp;&nbsp;
							<asp:LinkButton id="lbtLogin" runat="server">Para clique para continuar</asp:LinkButton></P>
					</TD>
				</TR>
			</TABLE>
		</form>
</body>
</html>
