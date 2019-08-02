<%@ Page Language="VB" AutoEventWireup="false" CodeFile="etop.aspx.vb" Inherits="etop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PeruTourism</title>
		<style type="text/css">
	BODY { BACKGROUND-IMAGE: url(images/fondo.gif); MARGIN: 0px }
	</style>
		<SCRIPT language="javascript">
function go(URL) {
  window.open(URL,'popup','scrollbars=yes,resizable=yes,width=557,height=480,top=20,left=100');
}
		</SCRIPT>
	</HEAD>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<FORM id="Form1" method="post" runat="server">
				<table width="805" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="170" rowspan="2"><img src="images/logo2.gif" width="170" height="78"></td>
						<td width="585" colspan="9" valign="top"><img src="images/franja.gif" width="635" height="35" align="left"></td>
					</tr>
					<tr>
						<td colspan="9" valign="middle"><div align="center">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="60%"><font face="Arial, Helvetica, sans-serif" color="#277e49"><b>Su Página de 
													Viaje Personalizada</b></font></td>
										<td width="40%"><font face="Arial, Helvetica, sans-serif"><b> Llámenos: (51 1) 241-4724<br>
													<asp:label id="lblTollFree" runat="server"></asp:label>
												</b></font>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="10" bgcolor="#000000"><img src="images/transparent.gif" width="1" height="2"></td>
					</tr>
					<tr>
						<td colspan="10">
						    <table width="805" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="134" rowspan="3" bgcolor="#277e49">
                                        <asp:ImageButton ID="ImageButtonItinerarios" runat="server" 
                                         ImageUrl="~/images/proesp.jpg" />
                                           <%-- ImageUrl="~/images/go0_por.gif" />--%>
									</td>
									<td width="1" rowspan="3" bgcolor="#ffffff"><img src="images/transparent.gif" width="2" height="1"></td>
									</td>
									<td width="175" bgcolor="#e00789"><div align="center">
                                      <%--  <asp:hyperlink id="HyperLink1" runat="server" ImageUrl="~/images/go1_por.gif" --%>
                                         <asp:hyperlink id="HyperLink1" runat="server" ImageUrl="~/images/go1_esp.gif" 
                                            NavigateUrl="javascript:var w=window.open('eformapago.aspx','','width=550,height=580,top=40,left=70,scrollbars=yes,resizeable=yes');"></asp:hyperlink></div>

									
									<td width="0%" rowspan="3" bgcolor="#ffffff"><img src="images/transparent.gif" width="2" height="1"></td>
									<td width="175" bgcolor="#e00789"><div align="center">
                                        <asp:hyperlink id="HyperLink2" runat="server" ImageUrl="images/go3_esp.gif" 
                                            NavigateUrl="javascript:var w=window.open('reserva.aspx','','width=700,height=580,top=40,left=70,scrollbars=yes,resizeable=yes');"></asp:hyperlink></div>
									</td>
									<td width="1" rowspan="3" bgcolor="#ffffff"><img src="images/transparent.gif" width="2" height="1"></td>
									<td width="162" rowspan="3" valign="bottom" bgcolor="#366ab5">
										<asp:ImageButton id="ImageButton1" runat="server" 
                                            ImageUrl="~/images/pagovisa.png"></asp:ImageButton>
								    </td>
									<td width="0%" rowspan="3" bgcolor="#ffffff"><img src="images/transparent.gif" width="2" height="1"></td>

									<td width="151" rowspan="3" valign="middle" bgcolor="#f6a51b"><div align="center">
										<asp:ImageButton id="ImageButton2" runat="server" 
                                            ImageUrl="~/images/mc_accpt_050_gif.gif"></asp:ImageButton>
									</td>
								</tr>
								<tr>
									<td><img src="images/transparent.gif" width="1" height="1"></td>
									<td><img src="images/transparent.gif" width="1" height="1"></td>
								</tr>
								<tr>
									<td height="19" bgcolor="#e00789"><div align="center">
                                       <%-- <asp:hyperlink id="Hyperlink4" runat="server" ImageUrl="~/images/go3_por.gif" --%>
                                        <asp:hyperlink id="Hyperlink4" runat="server" ImageUrl="~/images/go2_esp.gif" 
                                            NavigateUrl="javascript:var w=window.open('informacion.aspx','','width=650,height=640,top=3,left=70,scrollbars=yes,resizeable=yes');"></asp:hyperlink></div>
									</td>
									<td bgcolor="#e00789"><div align="center"><asp:hyperlink id="HyperLink3"                                            
                                            runat="server" ImageUrl="~/images/go4_esp.gif" 
                                            NavigateUrl="javascript:var w=window.open('ebalance.aspx','','width=650,height=550,top=40,left=70,scrollbars=yes,resizeable=yes');"></asp:hyperlink></div>
									</td>
								</tr>
								<tr height="1">
									<td bgcolor="#ffffff"><img src="images/transparent.gif" width="134" height="1"></td>
									<td bgcolor="#ffffff"><img src="images/transparent.gif" width="1" height="1"></td>
									<td bgcolor="#ffffff"><img src="images/transparent.gif" width="175" height="1"></td>
									<td bgcolor="#ffffff"><img src="images/transparent.gif" width="1" height="1"></td>
									<td bgcolor="#ffffff"><img src="images/transparent.gif" width="175" height="1"></td>
									<td bgcolor="#ffffff"><img src="images/transparent.gif" width="1" height="1"></td>
									<td bgcolor="#ffffff"><img src="images/transparent.gif" width="162" height="1"></td>
									<td bgcolor="#ffffff"><img src="images/transparent.gif" width="1" height="1"></td>
									<td bgcolor="#ffffff"><img src="images/transparent.gif" width="151" height="1"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</FORM>
		</center>
</body>
</html>
