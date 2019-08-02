<%@ Page Language="VB" AutoEventWireup="false" CodeFile="elog.aspx.vb" Inherits="elog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PeruTourism</title>
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
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY>
		<form id="Form1" method="post" runat="server">
		<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="552" border="0" background="images/fondo_iti.gif">
			<TR>
				<TD class="style8" align="center" colSpan="2" height="56">
					<span class="style10">
						<br>
						<asp:label id="lblTitulo" runat="server"></asp:label>
					</span>
					<br>
				</TD>
			</TR>
			<TR>
				<td class="style12" colSpan="2" height="56">
					<asp:datagrid id="dglog" runat="server" HeaderStyle-CssClass="GridHeader" CssClass="style12" AutoGenerateColumns="False"
						Width="544px" BorderWidth="1px" BorderColor="#888672" DESIGNTIMEDRAGDROP="113">
						<HeaderStyle CssClass="GridHeader"></HeaderStyle>
						<Columns>
							<asp:BoundColumn DataField="Fchsys" HeaderText="Fecha" DataFormatString="{0,1:dd MMM yyyy}{0,13:hh:mm tt }">
								<HeaderStyle VerticalAlign="Top"></HeaderStyle>
							</asp:BoundColumn>
							<asp:BoundColumn DataField="DesLog" HeaderText="Mesaje"></asp:BoundColumn>
							<asp:BoundColumn DataField="Autor" HeaderText="Autor"></asp:BoundColumn>
							<asp:BoundColumn Visible="False" DataField="TipoLog" HeaderText="TipoLog"></asp:BoundColumn>
						</Columns>
					</asp:datagrid></td>
			</TR>
			<TR>
				<TD borderColor="#ff6633" align="center"><a href="javascript:closeWindow()">Cerrar ventana</a></TD>
			</TR>
		</TABLE>
    </form>
</body>
</html>
