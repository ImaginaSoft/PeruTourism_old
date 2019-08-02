<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ireservamsg.aspx.vb" Inherits="ireservamsg" %>

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
		
		function printWindow() {
		bV = parseInt(navigator.appVersion);
		if (bV >= 4) window.print();
		}
		</SCRIPT>
	</HEAD>
	<body>
	<center>
	
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" 
				cellSpacing="0" cellPadding="0" width="552" background="images/fondo_iti.gif" border="0"
				align="center">
				<TR>
					<TD align="center" class="style8" style="HEIGHT: 44px">
						<span class="style10">
							<br>
							<asp:label id="lblNomCliente" runat="server"></asp:label>
						</span>
						<br>
					</TD>
				</TR>
				<TR>
					<TD class="style8" align="center" style="HEIGHT: 37px">&nbsp;&nbsp;</TD>
				</TR>
				<TR>
					<TD class="style12" style="HEIGHT: 7px" colSpan="2" height="7" align="center">
						<asp:Label id="lblMsg" runat="server"></asp:Label></TD>
				</TR>
				<TR>
					<td class="style12" colSpan="2" height="14" style="HEIGHT: 14px"></td>
				</TR>
				<TR>
					<td class="style16" background="images/fondo.gif" colSpan="2" height="60">
						<div align="center"><br>
							<A href="javascript:closeWindow()">Close window</A>&nbsp;&nbsp;
							<br>
							<br>
							Please let us know your comments: <A href="mailto:peru@perutourism.com">peru@perutourism.com</A>.<br>
							Copyright © 2006 Viajes Pentagrama S.A.<br>
							Av. Larco 101 Suite 1301 Miraflores, Lima, Peru. Phone: (51 1) 241-4724 Fax: 
							(51 1) 444-0015
							<br>
						</div>
					</td>
				</TR>
			</TABLE>
		</form>
		</center> 
</body>
</html>
