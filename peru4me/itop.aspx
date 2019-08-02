<%@ Page Language="VB" AutoEventWireup="false" CodeFile="itop.aspx.vb" Inherits="itop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PeruTourism</title>
		<style type="text/css">
	BODY { BACKGROUND-IMAGE: url(images/fondo.gif); MARGIN: 0px }
	</style>
		<SCRIPT language="javascript">
	function go(URL) 
		{
		window.open(URL,'popup','scrollbars=yes,resizable=yes,width=557,height=480,top=20,left=100');
		}
		</SCRIPT>
	</HEAD>
	<body leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">
		<center>
			<FORM id="Form1" method="post" runat="server">
				<table cellSpacing="0" cellPadding="0" width="805" border="0">
					<tr>
						<td width="170" rowSpan="2"><IMG height="78" src="images/logo2.gif" width="170"></td>
						<td vAlign="top" width="585" colSpan="9"><IMG height="35" src="images/franja.gif" width="635" align="left"></td>
					</tr>
					<tr>
						<td vAlign="middle" colSpan="9">
							<div align="center">
								<table cellSpacing="0" cellPadding="0" width="100%" border="0">
									<tr>
										<td width="60%"><font face="Arial, Helvetica, sans-serif" color="#277e49"><b>Your 
													customized Travel Website</b></font></td>
										<td width="40%"><font face="Arial, Helvetica, sans-serif"><b><asp:label id="lblTf" runat="server">Call us: (51 1) 241-4724</asp:label><br>
													<asp:label id="lblTollFree" runat="server"></asp:label></b></font></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td bgColor="#000000" colSpan="10"><IMG height="2" src="images/transparent.gif" width="1"></td>
					</tr>
					<tr>
						<td colSpan="10">
							<table cellSpacing="0" cellPadding="0" width="805" border="0">
								<tr>
									<td width="134" rowSpan="3" bgcolor="#277E49" >
										<asp:ImageButton ID="ImageButtonItineraries" runat="server" 
                                            ImageUrl="~/images/proing.jpg" />
									</td>
									<td width="1" bgColor="#ffffff" rowSpan="3"><IMG height="1" src="images/transparent.gif" width="2"></td>
									<td width="175" bgColor="#e00789"><asp:hyperlink id="HyperLink5" runat="server" NavigateUrl="javascript:var w=window.open('iformapago.aspx','','width=550,height=580,top=40,left=70,scrollbars=yes,resizeable=yes');"
											ImageUrl="images/go1.gif"></asp:hyperlink></td>


									<td width="0%" bgColor="#ffffff" rowSpan="3"><IMG height="1" src="images/transparent.gif" width="2"></td>
									<td width="175" bgColor="#e00789"><asp:hyperlink id="HyperLink2" runat="server" NavigateUrl="javascript:var w=window.open('reserva.aspx','','width=700,height=580,top=40,left=70,scrollbars=yes,resizeable=yes');"
											ImageUrl="images/go3.gif"></asp:hyperlink></td>
									<td width="1" bgColor="#ffffff" rowSpan="3"><IMG height="1" src="images/transparent.gif" width="2"></td>
									<td vAlign="middle" width="162" bgColor="#366ab5" rowSpan="3"><asp:imagebutton id="ImageButton1" runat="server" ImageUrl="images/payvisa.jpg"></asp:imagebutton></td>
									<td width="0%" bgColor="#ffffff" rowSpan="3"><IMG height="1" src="images/transparent.gif" width="2"></td>
									<td vAlign="middle" width="151" bgColor="#f6a51b" rowSpan="3">
										<div align="center">
										<asp:imagebutton id="ImageButton2" runat="server" 
                                                ImageUrl="~/images/mc_accpt_050_gif.gif"></asp:imagebutton>
										</div>
									</td>
								</tr>
								<tr>
									<td><IMG height="1" src="images/transparent.gif" width="1"></td>
									<td><IMG height="1" src="images/transparent.gif" width="1"></td>
								</tr>
								<tr>
									<td bgColor="#e00789" height="19"><asp:hyperlink id="Hyperlink4" runat="server" NavigateUrl="javascript:var w=window.open('informacion.aspx','','width=650,height=640,top=3,left=70,scrollbars=yes,resizeable=yes');"
											ImageUrl="images/go2.gif"></asp:hyperlink></td>
									<td bgColor="#e00789"><asp:hyperlink id="HyperLink3" runat="server" NavigateUrl="javascript:var w=window.open('ibalance.aspx','','width=650,height=550,top=40,left=70,scrollbars=yes,resizeable=yes');"
											ImageUrl="images/go4.gif"></asp:hyperlink></td>
								</tr>
								<tr height="1">
									<td bgColor="#ffffff"><IMG height="1" src="images/transparent.gif" width="134"></td>
									<td bgColor="#ffffff"><IMG height="1" src="images/transparent.gif" width="1"></td>
									<td bgColor="#ffffff"><IMG height="1" src="images/transparent.gif" width="175"></td>
									<td bgColor="#ffffff"><IMG height="1" src="images/transparent.gif" width="1"></td>
									<td bgColor="#ffffff"><IMG height="1" src="images/transparent.gif" width="175"></td>
									<td bgColor="#ffffff"><IMG height="1" src="images/transparent.gif" width="1"></td>
									<td bgColor="#ffffff"><IMG height="1" src="images/transparent.gif" width="162"></td>
									<td bgColor="#ffffff"><IMG height="1" src="images/transparent.gif" width="1"></td>
									<td bgColor="#ffffff"><IMG height="1" src="images/transparent.gif" width="151"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</FORM>
		</center>
</body>
</html>
