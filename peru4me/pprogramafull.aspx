<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pprogramafull.aspx.vb" Inherits="pprogramafull" %>

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
		<TABLE height="538" cellSpacing="0" cellPadding="0" width="650" border="0" ms_2d_layout="TRUE">
			<TR vAlign="top">
				<TD width="1" height="8"></TD>
				<TD width="649"></TD>
			</TR>
			<TR vAlign="top">
				<TD height="48"></TD>
				<TD>
					<TABLE id="Table2" height="46" cellSpacing="0" cellPadding="0" width="648" border="0">
						<TR>
							<TD width="293"><IMG height="36" src="images/logomini.gif" width="178"></TD>
							<TD width="245">
								<DIV ms_positioning="text2D"><A href="javascript:printWindow()">Imprimir página</A>&nbsp;</DIV>
							</TD>
							<TD>
								<DIV ms_positioning="text2D"><A href="javascript:closeWindow()">Fechar janela</A>&nbsp;&nbsp;</DIV>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<TR vAlign="top">
				<TD height="482"></TD>
				<TD>
					<TABLE height="481" cellSpacing="0" cellPadding="0" width="632" background="images/fondo_iti.gif"
						border="0" mm_noconvert="TRUE">
						<TR>
							<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
						</TR>
						<TR>
							<TD class="style8" colSpan="2" height="108">
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
									</SPAN><BR>
									&nbsp;</DIV>
							</TD>
						</TR>
						<TR>
							<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
						</TR>
						<TR>
							<TD class="style12" colSpan="2" height="12"><asp:datagrid id="dgItinerary" runat="server" Width="648px" AutoGenerateColumns="False" GridLines="None"
									HeaderStyle-CssClass="GridHeader">
									<HeaderStyle CssClass="GridHeader"></HeaderStyle>
									<Columns>
										<asp:BoundColumn DataField="Dia" HeaderText="FECHA">
											<ItemStyle Wrap="False" VerticalAlign="Top"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="FchInicio" HeaderText="FECHA" DataFormatString="{0:ddd dd MMM yy}">
											<ItemStyle Wrap="False" VerticalAlign="Top"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="Ciudad" HeaderText="DESTINO">
											<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
											<ItemStyle HorizontalAlign="Center" ForeColor="#CC3300" VerticalAlign="Top"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="HoraServicio" HeaderText="TEMPO">
											<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
											<ItemStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="Servicio" HeaderText="SERVIÇO">
											<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
											<ItemStyle VerticalAlign="Top"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn Visible="False" DataField="FlagColor" HeaderText="FlagColor"></asp:BoundColumn>
									</Columns>
								</asp:datagrid></TD>
						</TR>
						<TR>
							<TD class="style12" colSpan="2" height="12">
								<TABLE id="Table1" height="102" cellSpacing="0" cellPadding="0" width="649" background="images/fondo_iti.gif"
									border="0">
									<TR>
										<TD vAlign="top" bgColor="#888672" height="1"><IMG src="transparent.gif"></TD>
									</TR>
									<TR class="style12">
										<TD width="647" background="images/fondo_iti_tit.gif" colSpan="3" height="3">
											<DIV align="center"><STRONG>CARACTERÍSTICAS ESPECIAIS</STRONG>
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
											<DIV class="style21" align="left"><U>SEU PROGRAMA PERUTOURISM INCLUÍDO :</U></DIV>
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
											<DIV class="style21"><U>DETALHES EXCLUSIVOS:</U>
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
							</TD>
						</TR>
						<TR>
							<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
						</TR>
						<TR>
							<TD vAlign="top" colSpan="2" height="8">
								<TABLE id="Table3" height="28" cellSpacing="0" cellPadding="0" width="649" background="images/fondo_iti.gif"
									border="0">
									<TR>
										<TD vAlign="top" bgColor="#888672" colSpan="5" height="1"><IMG src="transparent.gif"></TD>
									</TR>
									<TR class="style12">
										<TD width="440" background="images/fondo_iti_tit.gif" colSpan="3" height="20">
											<DIV align="left"><STRONG>HOTÉIS SELECCIONADOS</STRONG>&nbsp;</DIV>
										</TD>
										<TD borderColor="#888672" borderColorLight="#888672" width="200" background="images/fondo_iti_tit.gif"
											borderColorDark="#888672" colSpan="1" height="18">
											<DIV align="left"><STRONG>ALIMENTAÇÃO</STRONG></DIV>
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
							<TD background="images/fondo_iti_tit.gif" colSpan="2">
								<DIV align="center"><STRONG>PREÇO EM DÓLARES AMERICANOS</STRONG></DIV>
							</TD>
						</TR>
						<TR>
							<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
						</TR>
						<TR>
							<TD vAlign="top" align="center" background="images/fondo_iti_price.gif" colSpan="2"
								height="10">&nbsp;
								<asp:datagrid id="dgPrecio" runat="server" Width="479px" AutoGenerateColumns="False" BorderColor="#888672"
									BorderWidth="1px" OnItemDataBound="ComputeSum" ShowFooter="True" F>
									<FooterStyle HorizontalAlign="Center" CssClass="style16"></FooterStyle>
									<ItemStyle HorizontalAlign="Center" CssClass="style16"></ItemStyle>
									<HeaderStyle HorizontalAlign="Center" CssClass="style15"></HeaderStyle>
									<Columns>
										<asp:BoundColumn DataField="DesOrden" HeaderText="Descripci&#243;n">
											<ItemStyle Wrap="False"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="PrecioxPersona" HeaderText="Preço por passageiro " DataFormatString="{0:USD ###,###,###,###.00}">
											<ItemStyle Wrap="False"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="CantPersonas" HeaderText="Número de passageiros">
											<ItemStyle Wrap="False"></ItemStyle>
										</asp:BoundColumn>
										<asp:BoundColumn DataField="PrecioTotal" HeaderText="Preço total " DataFormatString="{0:USD ###,###,###,###.00}">
											<ItemStyle Wrap="False"></ItemStyle>
											<FooterStyle Wrap="False"></FooterStyle>
										</asp:BoundColumn>
									</Columns>
								</asp:datagrid>&nbsp;
							</TD>
						</TR>
						<TR>
							<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
						</TR>
						<TR>
							<TD class="style16" background="images/fondo.gif" colSpan="5" height="56">
								<DIV align="center"><BR>
									<SPAN class="style18">Clique aqui para saber mais sobre Peru:</SPAN>
									<A href="javascript:go('http://www.perutourism.com/links/infoe.htm')">Peru facts</A>
									<BR>
									<BR>
									Por favor, deixe-nos saber seus comentários <A href="mailto:peru@perutourism.com">peru@perutourism.com</A>.<BR>
									Todos os direitos reservados © 2006 Viajes Pentagrama S.A.<BR>
									Av. Larco 101 Suite 1301 Miraflores, Lima, Peru. Teléfono: (51 1) 241-4724 Fax: 
									(51 1) 444-0015
									<BR>
								</DIV>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
    </form>
</body>
</html>
