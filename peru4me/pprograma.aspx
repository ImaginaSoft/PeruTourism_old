<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pprograma.aspx.vb" Inherits="pprograma" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PeruTourism</title>
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
			<SCRIPT language="javascript">
	function go(URL) 
		{
		window.open(URL,'popup','scrollbars=yes,resizable=yes,width=557,height=480,top=20,left=100');
		}
			</SCRIPT>
	<style type="text/css">
        .style27
        {
            width: 135px;
        }
    </style>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<CENTER>
			<form id="Form1" method="post" runat="server">
				<TABLE height="1382" cellSpacing="0" cellPadding="0" width="642" border="0" ms_2d_layout="TRUE">
					<TR>
						<TD width="0" height="0"></TD>
						<TD width="9" height="0"></TD>
						<TD width="642" height="0"></TD>
					</TR>
					<TR vAlign="top">
						<TD width="0" height="15"></TD>
						<TD colSpan="2" rowSpan="2">
							<TABLE cellSpacing="0" cellPadding="0" width="640" background="images/fondo_iti.gif" border="0"
								mm_noconvert="TRUE" height="1381">
								<TR>
									<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
								</TR>
								<TR>
									<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
								</TR>
								<TR>
									<td colSpan="2" height="7" align="right"><asp:hyperlink id="HyperlinkPrint" runat="server" NavigateUrl="javascript:var w=window.open('pprogramafull.aspx','','width=680,height=490,top=20,left=70,scrollbars=yes,resizeable=yes');"
											ImageUrl="images/printfull.jpg">Imprimir Itinerario</asp:hyperlink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								</TR>
								<TR>
									<TD class="style8" colSpan="2" height="65">
										<DIV align="center"><SPAN class="style10">
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
									<TD class="style12" colSpan="2" height="16">
									<asp:datagrid id="dgItinerary" runat="server" HeaderStyle-CssClass="GridHeader" GridLines="None"
											AutoGenerateColumns="False" Width="649px">
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
												<asp:BoundColumn DataField="HoraServicio" SortExpression="HoraServicio" HeaderText="TEMPO">
													<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
													<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Servicio" HeaderText="SERVIÇO">
													<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
												</asp:BoundColumn>
											</Columns>
										</asp:datagrid></TD>
								</TR>
								<TR>
									<TD class="style12" colSpan="2" height="16">&nbsp;
										<TABLE height="102" cellSpacing="0" cellPadding="0" width="649" background="images/fondo_iti.gif"
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
									<TD vAlign="top" colSpan="2" height="2">
										<TABLE id="Table3" height="28" cellSpacing="0" cellPadding="0" width="649" background="images/fondo_iti.gif"
											border="0">
											<TR>
												<TD vAlign="top" bgColor="#888672" colSpan="5" height="1"><IMG src="transparent.gif"></TD>
											</TR>
											<TR class="style12">
												<TD width="440" background="images/fondo_iti_tit.gif" colSpan="3" height="20">
													<DIV align="left"><STRONG>HOTÉIS SELECCIONADOS</STRONG>&nbsp;</DIV>
												</TD>
												<TD width="200" borderColor="#888672" borderColorLight="#888672" background="images/fondo_iti_tit.gif"
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
													<DIV align="left"><STRONG><asp:label id="lblHotel" runat="server" Width="440px"></asp:label></STRONG></DIV>
												</TD>
												<TD width="200" vAlign="top" borderColor="#888672" borderColorLight="#888672" align="left"
													borderColorDark="#888672" colSpan="1" height="14"><asp:label id="lblResuComida" runat="server" Width="200px"></asp:label></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD vAlign="top" colSpan="2" height="2"></TD>
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
									<TD vAlign="top" background="images/fondo_iti_price.gif" colSpan="2" height="90">
										<DIV align="center">&nbsp;
											<asp:datagrid id="dgPrecio" runat="server" AutoGenerateColumns="False" Width="476px" ShowFooter="True"
												OnItemDataBound="ComputeSum" BorderWidth="1px" BorderColor="#888672">
												<FooterStyle HorizontalAlign="Center" CssClass="style16"></FooterStyle>
												<ItemStyle HorizontalAlign="Center" CssClass="style16"></ItemStyle>
												<HeaderStyle HorizontalAlign="Center" CssClass="style15"></HeaderStyle>
												<Columns>
													<asp:BoundColumn DataField="DesOrden" HeaderText="Descrição">
														<ItemStyle Wrap="False"></ItemStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="PrecioxPersona" HeaderText="Preço por passageiro " DataFormatString="{0:USD ###,###,###,###.##}">
														<ItemStyle Wrap="False"></ItemStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="CantPersonas" HeaderText="Número de passageiros" DataFormatString="{0:###}">
														<ItemStyle Wrap="False"></ItemStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="PrecioTotal" HeaderText="Preço total  " DataFormatString="{0:USD ###,###,###,###.00}">
														<ItemStyle Wrap="False"></ItemStyle>
														<FooterStyle Wrap="False"></FooterStyle>
													</asp:BoundColumn>
												</Columns>
											</asp:datagrid></DIV>
										&nbsp;
										<asp:label id="lblEuro" runat="server" Width="462px" ForeColor="Blue" Font-Size="Small"> X,XXX.XX US$  é igual a <b>
												X,XXX.XX EUROS </b></asp:label><br>
										&nbsp;
									</TD>
								</TR>
								<TR>
									<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
								</TR>
								<TR class="style12">
									<TD background="images/fondo_iti_tit.gif" colSpan="2">
										<DIV align="center"><A name="SendEmailOK"><STRONG>COMUNICAÇÃO</STRONG></DIV>
										</A></TD>
								</TR>
								<TR>
									<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
								</TR>
								<TR>
									<TD class="style15" vAlign="top" width="86%" background="images/fondo_iti.gif" height="34"><DIV align="right"><BR>
											<asp:label id="lblSendVendedor" runat="server"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<BR>
										</DIV>
									</TD>
									<TD vAlign="top" width="14%" background="images/fondo_iti.gif" rowSpan="2">
										<DIV align="left"><asp:image id="ImgFotoVendedor" runat="server" Width="68px" Height="52px"></asp:image><BR>
											<asp:Label ID="lblBlog" runat="server"></asp:Label>
											<BR>
											<BR>
											<BR>
											<BR>
											<BR>
											<asp:hyperlink id="HyperLinkLog" runat="server" Width="40px" Height="31px" NavigateUrl="javascript:var w=window.open('plog.aspx','', 'width=600,height=500,top=20,left=100,scrollbars=yes,resizeable=yes');"
												ImageUrl="images/buzon.gif"></asp:hyperlink><BR>
											<SPAN class="style17">Registro de comunicação </SPAN><BR>
										</DIV>
									</TD>
								</TR>
								<TR class="style15">
									<TD vAlign="top" background="images/fondo_iti.gif" height="141">
										<DIV align="center">&nbsp;
											<asp:textbox id="txtComentario" runat="server" Width="515px" Height="137px" TextMode="MultiLine"
												Columns="60" Rows="7"></asp:textbox><BR>
											<asp:imagebutton id="ImageButtonSend" runat="server" ImageUrl="images/enviar.gif"></asp:imagebutton><BR>
											<asp:label id="lblMsg" runat="server"></asp:label>&nbsp;</DIV>
									</TD>
								</TR>
								<TR>
									<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="16">&nbsp;</TD>
								</TR>
								<TR>
									<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="16">
										<asp:Label id="lblAutorizaVisa" runat="server" class="style18">Esta loja está autorizada pela Visa e MasterCard para realizar transações eletrônicas.</asp:Label></TD>
								</TR>
								<TR>
									<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="8">&nbsp;</TD>
								</TR>
								<TR>
									<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="99"
										vAlign="top">
										<TABLE id="Table2" height="65" cellSpacing="0" cellPadding="0" width="663" border="0" background="images/fondo_iti.gif">
											<TR>
												<TD width="5"></TD>
												<TD class="style27">
													<asp:HyperLink id="HyperLink3" runat="server" ImageUrl="images/logo_visa.jpg" NavigateUrl="http://www.visanet.com.pe/"
														Target="_blank">HyperLink</asp:HyperLink></TD>
												<TD width="10"></TD>
												<TD>
													<asp:HyperLink id="HyperLink4" runat="server" ImageUrl="images/logo_visa_verified.gif" NavigateUrl="http://www.visanet.com.pe/visa.htm"
														Target="_blank">HyperLink</asp:HyperLink></TD>
												<TD>
													<asp:HyperLink id="HyperLink5" runat="server" Width="104px" Height="46px" ImageUrl="images/logo_visa_afiliate.gif"
														NavigateUrl="http://www.visanet.com.pe/promovbv/bancos.html" Target="_blank">HyperLink</asp:HyperLink></TD>
												<TD width="50"></TD>
												<TD>
													<asp:HyperLink id="HyperLink6" runat="server" 
                                                        ImageUrl="~/images/mc_accpt_050_gif.gif" NavigateUrl="http://www.mastercard.us"
														Target="_blank">HyperLink</asp:HyperLink></TD>
												<TD width="1"></TD>
												<TD>
													<asp:HyperLink id="HyperLink7" runat="server" 
                                                        ImageUrl="~/images/sclogolearn_80x44.gif" NavigateUrl="http://www.mastercard.us/securecode.html"
														Target="_blank">HyperLink</asp:HyperLink></TD>
														
										
											</TR>
										</TABLE>
									</TD>
								</TR>
								
								
								<TR>
									<TD class="style16" background="images/fondo.gif" colSpan="2" height="56">
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
								<TR>
									<TD class="style16" align="left" background="images/fondo.gif" colSpan="2" 
                                        height="10">
										<asp:label id="lblFlagPublicaEuro" runat="server" Visible="False"></asp:label></TD>
								</TR>
								<TR>
									<TD class="style16" align="left" background="images/fondo.gif" colSpan="2" 
                                        height="10">
										<asp:label id="lblTipoCambioEuro" runat="server" Visible="False"></asp:label></TD>
								</TR>
								<TR>
									<TD class="style16" background="images/fondo.gif" colSpan="2" height="10">

                                        &nbsp;</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR vAlign="top">
						<TD width="0" height="1382"></TD>
					</TR>
				</TABLE>
			</form>
		</CENTER>
</body>
</html>
