<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ifinsesion.aspx.vb" Inherits="ifinsesion" %>

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
					<TD class="error" align="center">
						<P>Dear user, his meeting of work expired please enter again to the 
							system&nbsp;&nbsp;</P>
						<P align="center">
							&nbsp;&nbsp;&nbsp;
							<asp:LinkButton id="lbtLogin" runat="server">To click to continue</asp:LinkButton></P>
					</TD>
				</TR>
			</TABLE>
		</form>
</body>
</html>
