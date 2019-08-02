<%@ Page Language="VB" AutoEventWireup="false" CodeFile="eprogramas.aspx.vb" Inherits="eprogramas" %>

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
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<CENTER>
			<form id="Form1" method="post" runat="server">
				<TABLE cellSpacing="0" cellPadding="0" width="642" border="0" 
                    ms_2d_layout="TRUE" style="height:400px">

					<TR vAlign="top">
						<TD width="0" height="15"></TD>
						<TD colSpan="2" rowSpan="2">
							<TABLE cellSpacing="0" cellPadding="0" width="640" 
                                background="images/fondo_iti.gif" border="0"
								mm_noconvert="TRUE" style="height: 354px">
								<TR>
									<TD vAlign="top" bgColor="#888672" height="1"><IMG src="transparent.gif"></TD>
								</TR>
								<TR >
									<TD  class="style8" height="25">
										<DIV class="style23" align="center"><A name="Programas">
                                                        <asp:Label ID="lblNomCliente" runat="server"></asp:Label>
													</A></DIV>
										</TD>
								</TR>
								<TR >
									<TD class="style8" height="5"></TD>
								</TR>
								<TR >
									<TD class="style24" height="30" align="center">
									              
                                               <asp:Label ID="lblMensaje1" runat="server"></asp:Label>
                                        </TD>
								</TR>
								<TR >
									<TD class="style25" height="30" align="center">
									              
							
                                               <asp:Label ID="lblMensaje2" runat="server"></asp:Label>
                                   
                      
										</TD>
								</TR>
								<TR >
									<TD class="style8" height="5"></TD>
								</TR>
								
								<TR>
									<TD class="style26" height="8"><asp:datagrid id="dgPublica" runat="server" HeaderStyle-CssClass="GridHeader" AutoGenerateColumns="False"
											Width="800px" BorderWidth="1px" BorderColor="#888672">
											<HeaderStyle HorizontalAlign="Center" CssClass="GridHeader"></HeaderStyle>
											<Columns>
												<asp:HyperLinkColumn Text="&lt;img src=images/lupagris.gif&gt;" DataNavigateUrlField="KeyReg" DataNavigateUrlFormatString="eprograma.aspx?ID={0}"></asp:HyperLinkColumn>
												<asp:BoundColumn DataField="FchSys" HeaderText="Publicado" DataFormatString="{0,1:dd MMM yyyy}{0,13:hh:mm tt }">
													<ItemStyle HorizontalAlign="Center" Wrap="false"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="NroPrograma" HeaderText="N&#250;mero">
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="StsPrograma" HeaderText="Estado">
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:HyperLinkColumn  DataTextField="DesPrograma" HeaderText="Descripci&#243;n" DataNavigateUrlField="KeyReg" DataNavigateUrlFormatString="eprograma.aspx?ID={0}"></asp:HyperLinkColumn>
												<asp:BoundColumn DataField="CantDias" HeaderText="N&#250;mero de d&#237;as ">
													<HeaderStyle Wrap="False"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
											</Columns>
										</asp:datagrid></TD>
								</TR>
								<TR>
									<TD class="style16" background="images/fondo.gif" height="56">
										<DIV align="center"><BR><BR><BR><BR><BR><BR>
											<SPAN class="style18">Click aquí para conocer acerca de 
                  Perú:</SPAN>
											<A href="javascript:go('http://www.perutourism.com/links/infoe.htm')">Peru facts</A>
											<BR>
											<BR>
											Háganos saber sus comentarios a <A href="mailto:peru@perutourism.com">peru@perutourism.com</A>.<BR>
											Todos los derechos reservados © 2006 Viajes Pentagrama S.A.<BR>
											Av. Larco 101 Suite 1301 Miraflores, Lima, Peru. Teléfono: (51 1) 241-4724 Fax: 
											(51 1) 444-0015
											<BR>
										</DIV>
									</TD>
								</TR>
								<TR>
									<TD class="style16" align="left" background="images/fondo.gif" height="10">
										&nbsp;</TD>
								</TR>
								<TR>
									<TD class="style16" align="left" background="images/fondo.gif" height="10">
										&nbsp;</TD>
								</TR>
								<TR>
									<TD class="style16" background="images/fondo.gif" height="10"></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>

				</TABLE>
			</form>
		</CENTER>
