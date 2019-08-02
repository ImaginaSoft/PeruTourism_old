<%@ Page Language="VB" AutoEventWireup="false" CodeFile="reserva.aspx.vb" Inherits="reserva" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PeruTourism</title>
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
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
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" 
				cellSpacing="0" cellPadding="0" width="552" align="center" background="images/fondo_iti.gif"
				border="0">
				<TR>
					<TD HEIGHT: 36px" class="SubTitInf">
		            	
					    <table class="style12" width="100%">
                                <tr>
                                    <td>
                                        <DIV align="left"><A  href="javascript:printWindow()">Print</A></DIV></td>
                                    <td>
                                       <div align="right">
							<A href="javascript:closeWindow()">Close</A></DIV></td>
                                </tr>
                            </table>
                        

					</TD>
				</TR>				
				
				<TR>
	                <TD class="style8" style="WIDTH: 548px; HEIGHT: 36px" align="center">
						<DIV align="center"><SPAN class="style10"><BR>
								<asp:label id="lblNomCliente" runat="server"></asp:label><BR>
								<asp:label id="Programa" runat="server"></asp:label><SPAN class="style20"><asp:label id="Dias" runat="server"></asp:label></SPAN></SPAN><BR>
							&nbsp;</DIV>
					</TD>				
				</TR>
				<TR>
					<TD class="style8" style="HEIGHT: 6px"><asp:label id="lblMsg" runat="server"></asp:label></TD>
				</TR>
				
				
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px" align="left" height="2">&nbsp;</TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 13px" align="left" 
                        height="13"><asp:label id="lblPasajero" runat="server"></asp:label>
                    </TD>
				</TR>
				<TR>
					<TD class="style12" style="HEIGHT: 14px" height="14">
					<asp:datagrid id="dgPasajero" runat="server" CssClass="style12" BorderColor="#888672" BorderWidth="1px"
							Width="664px" AutoGenerateColumns="False">
							<FooterStyle CssClass="GridFooter"></FooterStyle>
							<HeaderStyle HorizontalAlign="Center" CssClass="style8"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="NomPasajero" HeaderText="Nombre Pasajero">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="ApePasajero" HeaderText="Apellido Pasajero">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="FchNacimiento" HeaderText="Fecha Nacimiento" DataFormatString="{0:dd-MM-yyyy}">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Pasaporte" HeaderText="Pasaporte">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Pais" HeaderText="País">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="TipoPasajero" HeaderText="Tipo Pasajero">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						</TD>
				</TR>


				
				
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px" align="left" height="2">&nbsp;</TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 13px" align="left" 
                        height="13"><asp:label id="lblTerrestre" runat="server"></asp:label>
                    </TD>
				</TR>
				<TR>
					<TD style="HEIGHT: 43px" align="left" height="43">
						<TABLE class="style12" id="Table3" style="WIDTH: 664px; HEIGHT: 30px" cellSpacing="0" cellPadding="0"
							width="664" border="0">
							<TR>
								<TD  style="WIDTH: 268px; HEIGHT: 14px"><asp:label id="lbltitTerrestre" runat="server"></asp:label></TD>
								<TD style="WIDTH: 112px; HEIGHT: 14px"><asp:label id="lbltitStatus" runat="server" 
                                        CssClass="style8" >Estado</asp:label></TD>
								<TD  style="HEIGHT: 14px"><asp:label id="lbltitComents" runat="server" 
                                        CssClass="style8" >Comentario</asp:label></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 268px"><asp:label id="lblallservice" runat="server">Todos los servicios  terrestres</asp:label></TD>
								<TD style="WIDTH: 112px"><asp:label id="lblOK" runat="server">OK</asp:label></TD>
								<TD><asp:label id="lblComents" runat="server"></asp:label></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>




				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px" align="left" height="2">&nbsp;</TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 13px" align="left" 
                        height="13"><asp:label id="lblboletoTerrrestre" runat="server"></asp:label>
                    </TD>
				</TR>
				<TR>
					<TD class="style12" style="HEIGHT: 14px" height="14">
					<asp:datagrid id="dgTerrestre" runat="server" CssClass="style12" 
                            BorderColor="#888672" BorderWidth="1px"
							Width="664px" AutoGenerateColumns="False" AllowCustomPaging="True">
							<FooterStyle CssClass="GridFooter"></FooterStyle>
							<HeaderStyle HorizontalAlign="Center" CssClass="style8"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="FchVuelo" HeaderText="Fecha Vuelo" DataFormatString="{0:dd-MM-yyyy}">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="RutaVuelo" HeaderText="Ruta Vuelo">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Aerolinea" HeaderText="Aerolínea">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="NroVuelo" HeaderText="N° Vuelo">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="HoraSalida" HeaderText="Hora Salida">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="HoraLlegada" HeaderText="Hora Llegada">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="DesCantidad" HeaderText="Cant.">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="CodStsReserva" HeaderText="Estado">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						</TD>
				</TR>

				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px" align="left" height="2">&nbsp;</TD>
				</TR>

				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px" align="left" height="2">
                        <asp:label id="lblboletoAereo" runat="server"></asp:label>
                    </TD>
				</TR>

				<TR>
					<TD class="style12" style="HEIGHT: 14px" height="14">
					<asp:datagrid id="dgAereo" runat="server" CssClass="style12" BorderColor="#888672" BorderWidth="1px"
							Width="664px" AutoGenerateColumns="False">
							<FooterStyle CssClass="GridFooter"></FooterStyle>
							<HeaderStyle HorizontalAlign="Center" CssClass="style8"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="FchVuelo" HeaderText="Fecha Vuelo" DataFormatString="{0:dd-MM-yyyy}">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="RutaVuelo" HeaderText="Ruta Vuelo">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Aerolinea" HeaderText="Aerolínea">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="NroVuelo" HeaderText="N° Vuelo">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="HoraSalida" HeaderText="Hora Salida">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="HoraLlegada" HeaderText="Hora Llegada">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="CodReserva" HeaderText="Código Reserva">
									<HeaderStyle Wrap="True"></HeaderStyle>
									<ItemStyle Wrap="True"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="DesCantidad" HeaderText="Cant.">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="CodStsReserva" HeaderText="Estado">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						</TD>
				</TR>

				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px" align="left" height="2">&nbsp;</TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 13px" align="left" 
                        height="13"><asp:label id="lblHotel" runat="server"></asp:label>
                    </TD>
				</TR>
				<TR>
					<TD class="style12" style="HEIGHT: 14px" height="14">
					<asp:datagrid id="dgHotel" runat="server" CssClass="style12" BorderColor="#888672" BorderWidth="1px"
							Width="664px" AutoGenerateColumns="False">
							<FooterStyle CssClass="GridFooter"></FooterStyle>
							<HeaderStyle HorizontalAlign="Center" CssClass="style8"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="NomCiudad" HeaderText="Ciudad">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Hotel" HeaderText="Hotel">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Telefono1" HeaderText="Tel&#233;fono">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="StsReserva" HeaderText="Estado">
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="HotelAlternativo" HeaderText="Alternativo"></asp:BoundColumn>
								<asp:BoundColumn DataField="FchSys" HeaderText="Actualizado" DataFormatString="{0:dd-MM-yyyy}"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						</TD>
				</TR>
				<TR>
					<td class="style16" background="images/fondo.gif" height="60">
						<div align="center"><br>
							<br>
							<asp:Label ID="lblInfoPenta" runat="server"></asp:Label>
							<br>
						</div>
					</td>
				</TR>
			</TABLE>
		</form>
</body>
</html>
