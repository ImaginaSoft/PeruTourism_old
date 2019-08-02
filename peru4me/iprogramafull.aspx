<%@ Page Language="VB" AutoEventWireup="false" CodeFile="iprogramafull.aspx.vb" Inherits="iprogramafull" %>

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

		function go(URL) 
		{
		window.open(URL,'popup','scrollbars=yes,resizable=yes,width=557,height=480,top=20,left=100');
		}

		</SCRIPT>
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<center>
			<table cellSpacing="0" cellPadding="0" width="648" background="images/fondo_iti.gif" border="0"
				mm_noconvert="TRUE" height="561">
				<TR>
					<TD colSpan="2" height="14" align="left" background="images/fondo_iti_tit.gif">
						<TABLE id="Table1" height="36" cellSpacing="0" cellPadding="0" width="624" border="0">
							<TR>
								<TD width="294"><IMG src="images/logomini.gif" DESIGNTIMEDRAGDROP="1006"></TD>
								<TD width="232"><A href="javascript:printWindow()">Print this page</A></TD>
								<TD><A href="javascript:closeWindow()">Close window</A>&nbsp;&nbsp;</TD>
							</TR>
						</TABLE>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
				</TR>
				<TR>
					<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
				</TR>
				<TR>
					<TD class="style8" colSpan="2" height="63">
						<DIV align="center"><SPAN class="style10"><BR>
								<asp:label id="lblNomCliente" runat="server"></asp:label>
								<BR>
								<asp:label id="Programa" runat="server"></asp:label>
								<SPAN class="style20">
									<asp:label id="Dias" runat="server"></asp:label>
								</SPAN>
							</SPAN><BR>
							<asp:label id="lblFechayHora" runat="server"></asp:label><BR>
							<BR>
							<SPAN class="style19">
								<asp:label id="DesPrograma" runat="server"></asp:label>
							</SPAN>
							<BR>
							&nbsp;</DIV>
					</TD>
				</TR>
				<TR>
					<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
				</TR>
				<TR>
					<TD class="style12" colSpan="2" height="91">
						<asp:datagrid id="dgItinerary" runat="server" HeaderStyle-CssClass="GridHeader" GridLines="None"
							AutoGenerateColumns="False" Width="646px" DESIGNTIMEDRAGDROP="466">
							<HeaderStyle CssClass="GridHeader"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="Dia" HeaderText="DATE">
									<ItemStyle Wrap="False" VerticalAlign="Top"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="FchInicio" HeaderText="DATE" DataFormatString="{0:ddd dd MMM yy}">
									<ItemStyle Wrap="False" VerticalAlign="Top"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Ciudad" HeaderText="DESTINATION">
									<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" ForeColor="#CC3300" VerticalAlign="Top"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="HoraServicio" HeaderText="TIME">
									<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Servicio" HeaderText="SERVICE">
									<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn Visible="False" DataField="FlagColor" HeaderText="FlagColor"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
				<TR>
					<TD class="style12" colSpan="2" height="1"></TD>
				</TR>
				<TR>
					<TD class="style12" colSpan="2" height="1">
						<TABLE id="Table2" height="102" cellSpacing="0" cellPadding="0" width="649" background="images/fondo_iti.gif"
							border="0">
							<TR>
								<TD vAlign="top" bgColor="#888672" height="1"><IMG src="transparent.gif"></TD>
							</TR>
							<TR class="style12">
								<TD width="647" background="images/fondo_iti_tit.gif" colSpan="3" height="3"><DIV align="center"><STRONG>SPECIAL 
											FEATURES</STRONG>
									</DIV>
								</TD>
							</TR>
							<TR>
								<TD vAlign="top" bgColor="#888672" height="1"><IMG src="transparent.gif"></TD>
							</TR>
							<TR>
								<TD vAlign="top" width="647" height="8">&nbsp;</TD>
							</TR>
							<TR>
								<TD vAlign="top" width="647" height="15">
									<DIV class="style21" align="left"><U>YOUR PERUTOURISM PROGRAM INCLUDED :</U></DIV>
								</TD>
							</TR>
							<TR>
								<TD vAlign="top" align="left" width="647" height="8">&nbsp;</TD>
							</TR>
							<TR>
								<TD vAlign="top" align="left" width="647" height="16">
									<asp:Label id="lblResumen" runat="server"></asp:Label></TD>
							</TR>
							<TR>
								<TD vAlign="top" align="left" width="647" height="15">
									<DIV class="style21"><U>EXCLUSIVE DETAILS&nbsp;:</U>
									</DIV>
								</TD>
							</TR>
							<TR>
								<TD vAlign="top" align="left" width="647" height="8">&nbsp;</TD>
							</TR>
							<TR>
								<TD vAlign="top" align="left" width="647" height="16">
									<asp:Label id="lblResuCaraEspe" runat="server"></asp:Label></TD>
							</TR>
						</TABLE>
						&nbsp;</TD>
				</TR>
				<TR>
					<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
				</TR>
				<TR>
					<TD vAlign="top" colSpan="2" height="2">
						<TABLE id="Table3" height="28" cellSpacing="0" cellPadding="0" width="649" background="images/fondo_iti.gif"
							border="0">
							<TR>
								<TD vAlign="top" bgColor="#888672" colSpan="5" height="1"><IMG src="transparent.gif"></TD>
							</TR>
							<TR class="style12">
								<TD width="440" background="images/fondo_iti_tit.gif" colSpan="3" height="20"><DIV align="left"><STRONG>SELECTED 
											HOTELS</STRONG>&nbsp;</DIV>
								</TD>
								<TD borderColor="#888672" borderColorLight="#888672" width="200" background="images/fondo_iti_tit.gif"
									borderColorDark="#888672" colSpan="1" height="18">
									<DIV align="left"><STRONG>MEALS&nbsp;INCLUDED</STRONG></DIV>
								</TD>
							</TR>
							<TR>
								<TD vAlign="top" bgColor="#888672" colSpan="5" height="2"><IMG src="transparent.gif"></TD>
							</TR>
							<TR>
								<TD vAlign="top" width="440" colSpan="3" height="5">&nbsp;</TD>
								<TD vAlign="top" borderColor="#888672" borderColorLight="#888672" align="left" width="200"
									borderColorDark="#888672" height="14"></TD>
							</TR>
							<TR class="style12">
								<TD vAlign="top" width="440" colSpan="3" height="14">
									<DIV align="left"><STRONG>
											<asp:label id="lblHotel" runat="server" Width="440px"></asp:label></STRONG></DIV>
								</TD>
								<TD vAlign="top" borderColor="#888672" borderColorLight="#888672" align="left" width="200"
									borderColorDark="#888672" colSpan="1" height="14">
									<asp:label id="lblResuComida" runat="server" Width="200px"></asp:label></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
				</TR>
				<TR class="style12">
					<TD background="images/fondo_iti_tit.gif" colSpan="2" height="16">
						<DIV align="center"><STRONG>PRICE IN US DOLLARS</STRONG></DIV>
					</TD>
				</TR>
				<TR>
					<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
				</TR>
				<TR>
					<TD vAlign="top" background="images/fondo_iti_price.gif" colSpan="2" height="70">
						<DIV align="center">&nbsp;</DIV>
						<asp:datagrid id="dgPrecio" runat="server" Width="450px" AutoGenerateColumns="False" BorderColor="#888672"
							BorderWidth="1px" OnItemDataBound="ComputeSum" ShowFooter="True" F>
							<FooterStyle HorizontalAlign="Center" CssClass="style16"></FooterStyle>
							<ItemStyle HorizontalAlign="Center" CssClass="style16"></ItemStyle>
							<HeaderStyle HorizontalAlign="Center" CssClass="style15"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="DesOrden" HeaderText="Description">
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="PrecioxPersona" HeaderText="Price per passenger " DataFormatString="{0:USD ###,###,###,###.##}">
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="CantPersonas" HeaderText="Number of passengers" DataFormatString="{0:###}">
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="PrecioTotal" HeaderText="Total price " DataFormatString="{0:USD ###,###,###,###.00}">
									<ItemStyle Wrap="False"></ItemStyle>
									<FooterStyle Wrap="False"></FooterStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						&nbsp;
					</TD>
				</TR>
				<TR>
					<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
				</TR>
				<TR>
					<TD class="style16" background="images/fondo.gif" colSpan="2" height="60">
						<DIV align="center"><BR>
							<SPAN class="style18">Click here to learn about 
      Peru:</SPAN>
							<A href="javascript:go('http://www.perutourism.com/links/info.htm')">Peru facts</A>
							<BR>
							<BR>
							Please let us know your comments: <A href="mailto:peru@perutourism.com">peru@perutourism.com</A>.<BR>
							Copyright © 2006 Viajes Pentagrama S.A.<BR>
							Av. Larco 101 Suite 1301 Miraflores, Lima, Peru. Phone: (51 1) 241-4724 Fax: 
							(51 1) 444-0015
							<BR>
						</DIV>
					</TD>
				</TR>
			</table>
		</center>
</body>
</html>
