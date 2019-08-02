<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ilogin.aspx.vb" Inherits="ilogin" %>

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
	.style8 { FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #57732d; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif }
	.style9 { FONT-WEIGHT: bold; FONT-SIZE: 16px; COLOR: #57732d; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif }
	.style10 { FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif }
		</style>
    
</head>
<body>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table6" style="Z-INDEX: 107; LEFT: 272px; WIDTH: 352px; POSITION: absolute; TOP: 376px; HEIGHT: 23px"
				cellSpacing="1" cellPadding="1" width="352" border="0">
				<TR>
					<TD class="style10" align="right"><A href="mailto:customer@perutourism.com"><u>Having 
								troubles to Login, contact us.</u></A>
					</TD>
				</TR>
			</TABLE>
			<TABLE id="Table5" style="Z-INDEX: 106; LEFT: 96px; WIDTH: 576px; POSITION: absolute; TOP: 520px; HEIGHT: 23px"
				cellSpacing="1" cellPadding="1" width="576" border="0">
				<TR>
					<TD class="style7" align="center">Travel to Peru, Cuzco, Inca trail, Machu picchu, 
						Nazca lines, Cusco, Titicaca lake, Travel, Rainforest, Best tour with 
						PeruTourism.
					</TD>
				</TR>
			</TABLE>
			<TABLE id="Table4" style="Z-INDEX: 105; LEFT: 96px; WIDTH: 576px; POSITION: absolute; TOP: 464px; HEIGHT: 23px"
				cellSpacing="1" cellPadding="1" width="576" border="0">
				<TR>
					<TD class="style1" align="center"><font size="1">Please let us know your comments <font color="#0000ff">
								<u><A href="mailto:miguel@perutourism.com">miguel@perutourism.com</A><br>
								</u></font>This site © 2007 is sponsored by Peru Tourism and Viajes 
							Pentagrama S.A. Peru. All rights reserved.</font><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><br>
							Av. Larco 101, Suite 1301 Miraflores, Lima, Peru. Phone: (51 1) 241-4724 Fax: 
							(51 1) 444-0015</font>
					</TD>
				</TR>
			</TABLE>
			<IMG style="Z-INDEX: 104; LEFT: 112px; POSITION: absolute; TOP: 160px" height="225" src="images/izqdedo.gif"
				width="155">
			<TABLE id="Table2" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 100%; POSITION: absolute; TOP: 0px; HEIGHT: 8px"
				cellSpacing="0" cellPadding="0" width="672" border="0">
				<TR>
					<TD><asp:image id="Image1" runat="server" ImageUrl="images/arriba.gif"></asp:image></TD>
				</TR>
			</TABLE>
			<TABLE id="Table8" style="Z-INDEX: 103; LEFT: 272px; WIDTH: 352px; POSITION: absolute; TOP: 240px; HEIGHT: 133px"
				cellSpacing="1" cellPadding="1" width="352" border="0">
				<TR>
					<TD style="FONT-SIZE: 10pt; FONT-FAMILY: Verdana, Arial"><asp:label id="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:label></TD>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table1" style="WIDTH: 344px; HEIGHT: 91px" cellSpacing="0" cellPadding="0" width="344"
							border="0">
							<TR>
								<td class="style9" style="WIDTH: 139px" width="139" height="32">E-Mail address:</td>
								<TD style="FONT-SIZE: 9pt; WIDTH: 175px; FONT-FAMILY: Verdana, Arial; HEIGHT: 29px"><asp:textbox id="txtEmail" runat="server" Height="21px" Width="201px" Columns="30" Rows="1"></asp:textbox></TD>
							</TR>
							<TR>
								<td class="style9" style="WIDTH: 139px" height="29">Password:</td>
								<TD style="FONT-SIZE: 9pt; WIDTH: 175px; FONT-FAMILY: Verdana, Arial; HEIGHT: 25px"><asp:textbox id="txtPaterno" runat="server" Height="21px" Width="201px" TextMode="Password" MaxLength="30"
										Columns="30" Rows="1"></asp:textbox></TD>
							</TR>
							<TR>
								<TD style="FONT-SIZE: 9pt; WIDTH: 139px; FONT-FAMILY: Verdana, Arial"></TD>
								<TD style="FONT-SIZE: 9pt; WIDTH: 175px; FONT-FAMILY: Verdana, Arial; HEIGHT: 25px"><asp:imagebutton id="ImageButton1" runat="server" ImageUrl="images/enter.gif" Height="28px" Width="71px"></asp:imagebutton></TD>
							</TR>
						</TABLE>
						<asp:label id="lblAccesoDeMozart" runat="server" Visible="False">N</asp:label></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 102; LEFT: 576px; WIDTH: 160px; POSITION: absolute; TOP: 144px; HEIGHT: 24px"
				cellSpacing="1" cellPadding="1" width="160" border="0">
				<TR>
					<TD background="images/cenefa.gif" height="12"><asp:imagebutton id="ImageButton2" runat="server" ImageUrl="images/version_esp.gif"></asp:imagebutton></TD>
				</TR>
			</TABLE>
			<IMG style="Z-INDEX: 108; LEFT: 248px; POSITION: absolute; TOP: 144px" src="images/nube_ing.gif">
		</form>
		
		
</body>
</html>
