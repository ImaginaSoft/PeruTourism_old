<%@ Page Language="VB" AutoEventWireup="false" CodeFile="iprograma.aspx.vb" Inherits="iprograma" %>

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
        .style29
        {
            width: 144px;
        }
        .style30
        {
            width: 135px;
        }
    </style>
	</HEAD>
	<body >
					<center>
						<FORM id="Form1" method="post" runat="server">
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
												<TD colSpan="2" height="7" align="right">
													<asp:hyperlink id="HyperlinkPrint" runat="server" ImageUrl="images/printfull.jpg" NavigateUrl="javascript:var w=window.open('iprogramafull.aspx','','width=680,height=490,top=20,left=70,scrollbars=yes,resizeable=yes');">Print Itinerary</asp:hyperlink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
											</TR>
											<TR>
												<TD class="style8" colSpan="2" height="65">
													<DIV align="center"><SPAN class="style10">
															<asp:label id="lblNomCliente" runat="server" ></asp:label>
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
																<HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>
																<ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
														</Columns>
													</asp:datagrid></TD>
											</TR>
											<TR>
												<TD class="style12" colSpan="2" height="16">
													<TABLE id="Table1" height="102" cellSpacing="0" cellPadding="0" width="649" background="images/fondo_iti.gif"
														border="0">
														<TR>
															<TD vAlign="top" bgColor="#888672" height="1"><IMG src="transparent.gif"></TD>
														</TR>
														<TR class="style12">
															<TD width="647" background="images/fondo_iti_tit.gif" colSpan="3" height="3">
																<DIV align="center"><STRONG>SPECIAL FEATURES</STRONG>
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
															<TD width="440" background="images/fondo_iti_tit.gif" colSpan="3" height="20">
																<DIV align="left"><STRONG>SELECTED HOTELS</STRONG>&nbsp;</DIV>
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
												<TD background="images/fondo_iti_tit.gif" colSpan="2">
													<DIV align="center"><STRONG>PRICE IN US&nbsp;DOLLARS</STRONG></DIV>
												</TD>
											</TR>
											<TR>
												<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
											</TR>
											<TR>
												<TD vAlign="middle" background="images/fondo_iti_price.gif" colSpan="2" height="45">
													<DIV align="center">&nbsp;
														<asp:datagrid id="dgPrecio" runat="server" AutoGenerateColumns="False" Width="450px" BorderColor="#888672"
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
													</DIV>
													<asp:label id="lblEuro" runat="server" Width="412px" ForeColor="Blue" Font-Size="Small">US$  X,XXX.XX equivale a <b>
															X,XXX.XX EUROS </b></asp:label><br>
													&nbsp;
												</TD>
											</TR>
											<TR>
												<TD vAlign="top" bgColor="#888672" colSpan="2" height="1"><IMG src="transparent.gif"></TD>
											</TR>
											<TR class="style12">
												<TD background="images/fondo_iti_tit.gif" colSpan="2">
													<DIV align="center"><A name="SendEmailOK"><STRONG>COMMUNICATION</STRONG></DIV>
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
														<asp:hyperlink id="HyperLinkLog" runat="server" Width="40px" Height="31px" NavigateUrl="javascript:var w=window.open('ilog.aspx','', 'width=600,height=500,top=20,left=100,scrollbars=yes,resizeable=yes');"
															ImageUrl="images/buzon.gif"></asp:hyperlink><BR>
														<SPAN class="style17">Communication Log</SPAN><BR>
													</DIV>
												</TD>
											</TR>
											<TR class="style15">
												<TD vAlign="top" background="images/fondo_iti.gif" height="141">
													<DIV align="center">&nbsp;
														<asp:textbox id="txtComentario" runat="server" Width="515px" Height="137px" TextMode="MultiLine"
															Rows="7" Columns="60"></asp:textbox><BR>
														<asp:imagebutton id="ImageButtonSend" runat="server" ImageUrl="images/send.gif"></asp:imagebutton><BR>
														<asp:label id="lblMsg" runat="server"></asp:label>&nbsp;</DIV>
												</TD>
											</TR>
											<TR>
												<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="16">&nbsp;</TD>
											</TR>
											<TR>
												<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="16">
													<asp:Label id="lblAutorizaVisa" runat="server" class="style18">This shop is authorized by Visa and MasterCard to realize electronic transactions.</asp:Label></TD>
											</TR>
											<TR>
												<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="8">
                                                    &nbsp;</TD>
											</TR>
											<TR>
												<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="16">
													<TABLE id="Table2" height="65" cellSpacing="0" cellPadding="0" width="663" border="0" background="images/fondo_iti.gif">
														<TR>
														<TD width="5"></TD>
															<TD class="style30">
																<asp:HyperLink id="HyperLink3" runat="server" ImageUrl="images/logo_visa.jpg" NavigateUrl="http://www.visanet.com.pe/"
																	Target="_blank">HyperLink</asp:HyperLink></TD>
															<TD>
																<asp:HyperLink id="HyperLink4" runat="server" ImageUrl="images/logo_visa_verified.gif" NavigateUrl="http://www.visanet.com.pe/visa.htm"
																	Target="_blank">HyperLink</asp:HyperLink></TD>
															<TD class="style29">
																<asp:HyperLink id="HyperLink5" runat="server" Width="104px" Height="46px" ImageUrl="images/logo_visa_afiliate.gif"
																	NavigateUrl="http://www.visanet.com.pe/promovbv/bancos.html" Target="_blank">HyperLink</asp:HyperLink></TD>
															<TD width="50"></TD>
															<TD>
																<asp:HyperLink id="HyperLink6" runat="server" 
                                                                    ImageUrl="~/images/mc_accpt_050_gif.gif" NavigateUrl="http://www.mastercard.us"
																	Target="_blank">HyperLink</asp:HyperLink></TD>
															<TD width="5"></TD>
															<TD>
																<asp:HyperLink id="HyperLink7" runat="server" 
                                                                    ImageUrl="~/images/sclogolearn_80x44.gif" NavigateUrl="http://www.mastercard.us/securecode.html"
																	Target="_blank">HyperLink</asp:HyperLink></TD>
																	
														</TR>
													</TABLE>
                                                </TD>
											</TR>
											<TR>
												<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="16">&nbsp;</TD>
											</TR>




											<TR>
												<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="60">
													<DIV align="center">
														<SPAN class="style18">Click here to learn about Peru:</SPAN>
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
											<TR>
												<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="18"
													align="left">
													<asp:label id="lblFlagPublicaEuro" runat="server" Visible="False"></asp:label></TD>
											</TR>
											<TR>
												<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="2"
													align="left">
													<asp:label id="lblTipoCambioEuro" runat="server" Visible="False"></asp:label></TD>
											</TR>
											<TR>
												<TD class="style16" width="663" background="images/fondo.gif" colSpan="2" height="2"></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<TR vAlign="top">
									<TD width="0" height="1416"></TD>
								</TR>
							</TABLE>
						</FORM>
					</center>
</body>
</html>
