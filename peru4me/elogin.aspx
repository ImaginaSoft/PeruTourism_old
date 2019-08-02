<%@ Page Language="VB" AutoEventWireup="false" CodeFile="elogin.aspx.vb" Inherits="elogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PeruTourism</title>
		<style>A:link { COLOR: #32651c; TEXT-DECORATION: none }
	A:visited { COLOR: #32651c; TEXT-DECORATION: none }
	A:active { COLOR: #32651c; TEXT-DECORATION: none }
	A:hover { COLOR: #32651c; TEXT-DECORATION: underline }
	.style1 { FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif }
	.style7 { FONT-SIZE: 10px; COLOR: #999999 }
	#Layer4 { Z-INDEX: 128; LEFT: 487px; WIDTH: 178px; POSITION: absolute; TOP: 592px; HEIGHT: 30px }
	#Layer1 { Z-INDEX: 115; LEFT: 250px; WIDTH: 224px; POSITION: absolute; TOP: 381px; HEIGHT: 272px }
	#Layer2 { Z-INDEX: 58; LEFT: 247px; WIDTH: 133px; POSITION: absolute; TOP: 346px; HEIGHT: 171px }
	#Layer5 { Z-INDEX: 59; LEFT: 380px; WIDTH: 306px; POSITION: absolute; TOP: 300px; HEIGHT: 133px }
	#Layer6 { Z-INDEX: 60; LEFT: 0px; WIDTH: 387px; POSITION: absolute; TOP: 0px; HEIGHT: 332px }
	#Layer8 { Z-INDEX: 61; LEFT: 171px; WIDTH: 154px; POSITION: absolute; TOP: 185px; HEIGHT: 226px }
	#Layer9 { Z-INDEX: 62; LEFT: 390px; WIDTH: 310px; POSITION: absolute; TOP: 258px; HEIGHT: 119px }
	#Layer3 { Z-INDEX: 62; LEFT: 294px; WIDTH: 345px; POSITION: absolute; TOP: 151px; HEIGHT: 126px }
	#Layer10 { Z-INDEX: 63; LEFT: 341px; WIDTH: 280px; POSITION: absolute; TOP: 169px; HEIGHT: 69px }
	.style8 { FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #57732d; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif }
	#Layer11 { Z-INDEX: 64; LEFT: 406px; WIDTH: 137px; POSITION: absolute; TOP: 426px; HEIGHT: 24px }
	.style9 { FONT-WEIGHT: bold; FONT-SIZE: 16px; COLOR: #57732d; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif }
	#Layer12 { Z-INDEX: 65; LEFT: 420px; WIDTH: 102px; POSITION: absolute; TOP: 456px; HEIGHT: 25px }
	#Layer13 { Z-INDEX: 66; LEFT: 340px; WIDTH: 311px; POSITION: absolute; TOP: 289px; HEIGHT: 62px }
	#Layer14 { Z-INDEX: 67; LEFT: 585px; WIDTH: 45px; POSITION: absolute; TOP: 372px; HEIGHT: 25px }
	#Layer15 { Z-INDEX: 68; LEFT: 367px; WIDTH: 325px; POSITION: absolute; TOP: 410px; HEIGHT: 19px }
	.style10 { FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif }
		</style>
	</HEAD>
	<body >
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" style="Z-INDEX: 102; LEFT: 0px; POSITION: absolute; TOP: 0px" cellSpacing="0"
				cellPadding="0" width="100%" border="0">
				<TR>
					<TD><asp:image id="Image1" runat="server" ImageUrl="images/arriba.gif"></asp:image></TD>
				</TR>
			</TABLE>
			<TABLE id="Table6" style="Z-INDEX: 109; LEFT: 64px; WIDTH: 644px; POSITION: absolute; TOP: 520px; HEIGHT: 19px"
				cellSpacing="0" cellPadding="0" width="644" border="0">
				<TR>
					<TD class="style7" align="center">Travel to Peru, Cuzco, Inca trail, Machu picchu, 
						Nazca lines, Cusco, Titicaca lake, Travel, Rainforest, Best tour with 
						PeruTourism.
					</TD>
				</TR>
			</TABLE>
			<TABLE id="Table5" style="Z-INDEX: 108; LEFT: 64px; WIDTH: 644px; POSITION: absolute; TOP: 456px; HEIGHT: 54px"
				cellSpacing="0" cellPadding="0" width="644" border="0">
				<TR>
					<TD class="style1" align="center"><font size="1">Por favor, envíenos sus comentarios a <font color="#0000ff">
								<u><A href="mailto:miguel@perutourism.com">miguel@perutourism.com</A><br>
								</u></font>Este sitio © 2007 es patrocinado por PeruTourism y Viajes 
							Pentagrama S.A. Perú. Todos los derechos reservados.</font><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><br>
							Av. Larco 101, Suite 1301 Miraflores, Lima, Perú. Teléfono: (51 1) 241-4724 
							Fax: (51 1) 444-0015</font>
					</TD>
				</TR>
			</TABLE>
			<TABLE id="Table4" style="Z-INDEX: 107; LEFT: 272px; WIDTH: 384px; POSITION: absolute; TOP: 384px; HEIGHT: 19px"
				cellSpacing="0" cellPadding="0" width="384" border="0">
				<TR>
					<TD class="style10" align="right"><A href="mailto:customer@perutourism.com"><u>Si tiene 
								problemas para ingresar, contáctenos.</u></A>
					</TD>
				</TR>
			</TABLE>
			<IMG style="Z-INDEX: 105; LEFT: 112px; POSITION: absolute; TOP: 160px" height="225" src="images/izqdedo.gif"
				width="155">
			<TABLE id="Table3" style="Z-INDEX: 101; LEFT: 584px; WIDTH: 184px; POSITION: absolute; TOP: 160px; HEIGHT: 24px"
				cellSpacing="1" cellPadding="1" width="184" border="0">
				<TR>
					<TD background="images/cenefa.gif" height="12"><asp:imagebutton id="ImageButton2" runat="server" ImageUrl="images/version_ing.gif"></asp:imagebutton></TD>
				</TR>
			</TABLE>
			<TABLE id="Table8" style="Z-INDEX: 103; LEFT: 272px; WIDTH: 386px; POSITION: absolute; TOP: 240px; HEIGHT: 137px"
				cellSpacing="1" cellPadding="1" width="386" border="0">
				<TR>
					<TD style="FONT-SIZE: 10pt; FONT-FAMILY: Verdana, Arial"><asp:label id="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:label></TD>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table1" style="WIDTH: 378px; HEIGHT: 95px" cellSpacing="0" cellPadding="0" width="378"
							border="0">
							<TR>
								<td class="style9" style="WIDTH: 182px; HEIGHT: 36px" width="182" height="36">Correo 
									electrónico:
								</td>
								<TD style="FONT-SIZE: 9pt; WIDTH: 175px; FONT-FAMILY: Verdana, Arial; HEIGHT: 36px"><asp:textbox id="txtEmail" runat="server" Height="21px" Width="201px" Columns="30" Rows="1"></asp:textbox></TD>
							</TR>
							<TR>
								<td class="style9" style="WIDTH: 182px" height="29">Contraseña:
								</td>
								<TD style="FONT-SIZE: 9pt; WIDTH: 175px; FONT-FAMILY: Verdana, Arial; HEIGHT: 9px"><asp:textbox id="txtPaterno" runat="server" Height="21px" Width="201px" TextMode="Password" MaxLength="30"
										Columns="30" Rows="1"></asp:textbox></TD>
							</TR>
							<TR>
								<TD style="FONT-SIZE: 9pt; WIDTH: 182px; FONT-FAMILY: Verdana, Arial"></TD>
								<TD style="FONT-SIZE: 9pt; WIDTH: 175px; FONT-FAMILY: Verdana, Arial; HEIGHT: 25px"><asp:imagebutton id="ImageButton1" runat="server" ImageUrl="images/enter.gif" Height="28px" Width="71px"></asp:imagebutton></TD>
							</TR>
						</TABLE>
						<asp:label id="lblAccesoDeMozart" runat="server" Visible="False">N</asp:label></TD>
				</TR>
			</TABLE>
			<IMG style="Z-INDEX: 106; LEFT: 240px; POSITION: absolute; TOP: 144px" src="images/nube_esp.gif">
		</form>
</body>
</html>
