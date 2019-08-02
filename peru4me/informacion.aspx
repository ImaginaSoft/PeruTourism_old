<%@ Page Language="VB" AutoEventWireup="false" CodeFile="informacion.aspx.vb" Inherits="informacion" %>

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
	<body >
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" 
				cellSpacing="0" cellPadding="0" width="450" align="center" background="images/fondo_iti.gif"
				border="0">
				<TR>
					<TD HEIGHT: 36px" class="SubTitInf">
		            	
					    <table class="style12" width="100%">
                                <tr>
                                    <td>
                                        <DIV align="left"><A  href="javascript:printWindow()">Print 
					    this page</A></DIV></td>
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
					<TD class="style12" style="WIDTH: 548px; HEIGHT: 14px" align="left" height="14"><asp:label id="lblMsg" runat="server"></asp:label></TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px" align="left" height="2">&nbsp;</TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 13px" align="left" 
                        height="13"><asp:label id="lblHotel" runat="server"></asp:label></TD>
				</TR>
				<TR>
					<TD class="style12" style="WIDTH: 548px; HEIGHT: 2px" height="2"><asp:datagrid id="dgHotel" runat="server" CssClass="style12" BorderColor="#888672" BorderWidth="1px"
							Width="608px" AutoGenerateColumns="False" GridLines="None">
							<HeaderStyle CssClass="style8"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="NomCiudad" HeaderText="City"></asp:BoundColumn>
								<asp:BoundColumn DataField="Titulo" HeaderText="Hotel"></asp:BoundColumn>
								<asp:BoundColumn DataField="Telefono1" HeaderText="Telephone"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px" height="2"><asp:label id="lblStaff" runat="server"></asp:label></TD>
				</TR>
				<TR>
					<TD class="SubTitInfNota" style="WIDTH: 548px; HEIGHT: 15px" height="15"><asp:label id="lblNota" runat="server"></asp:label></TD>
				</TR>
				<TR>
					<TD class="style12" style="WIDTH: 548px; HEIGHT: 1px" height="1"><asp:datagrid id="dgStaff" runat="server" CssClass="style12" BorderColor="#888672" BorderWidth="1px"
							Width="608px" AutoGenerateColumns="False" GridLines="None">
							<HeaderStyle CssClass="style8"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="NomVendedor" HeaderText="Name"></asp:BoundColumn>
								<asp:BoundColumn DataField="Cargo" HeaderText="Job"></asp:BoundColumn>
								<asp:BoundColumn DataField="TfEmergencia" HeaderText="Telephone"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
				</TR>
				
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 2px" height="2">&nbsp;&nbsp;</TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 14px" height="14">
                        <asp:label id="lblVideo" runat="server"></asp:label></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 548px; HEIGHT: 14px" height="14">
                        <asp:datagrid id="dgVideo" runat="server" CssClass="style12" 
                            BorderColor="#888672" BorderWidth="1px"
							Width="608px" AutoGenerateColumns="False" GridLines="None" ShowHeader="False">
							<FooterStyle CssClass="GridFooter"></FooterStyle>
							<HeaderStyle HorizontalAlign="Center" CssClass="GridHeader"></HeaderStyle>
							<Columns>

            					
                                <asp:TemplateColumn HeaderText="" >
                                    <ItemTemplate>
                                        <asp:HyperLink ID="Hyperlink2" runat="server"  NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"VideoURL")%>'
                                            Text='<%# DataBinder.Eval(Container.DataItem,"VideoTitulo")%>'  Target="_blank"  >
                                                        </asp:HyperLink>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left"/>                                                        
                                </asp:TemplateColumn>						
							</Columns>
						</asp:datagrid></TD>
				</TR>
				
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px" height="2">&nbsp;</TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 19px" height="19"><asp:label id="lblClima" runat="server"></asp:label></TD>
				</TR>
				<TR>
					<TD class="style12" style="WIDTH: 548px; HEIGHT: 2px" height="2"><asp:datagrid id="dgClima" runat="server" CssClass="style12" BorderColor="#888672" BorderWidth="1px"
							Width="608px" AutoGenerateColumns="False" GridLines="None">
							<HeaderStyle CssClass="style8"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="NomCiudad" HeaderText="City"></asp:BoundColumn>
								<asp:BoundColumn DataField="MesAno" HeaderText="Month-Year"></asp:BoundColumn>
								<asp:BoundColumn DataField="TempMinima" HeaderText="Low">
									<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="TempMaxima" HeaderText="High">
									<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 2px" height="2">&nbsp;&nbsp;</TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 14px" height="14"><asp:label id="lblDocReq" runat="server"></asp:label></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 548px; HEIGHT: 14px" height="14"><asp:datagrid id="dgDocReq" runat="server" CssClass="style12" BorderColor="#888672" BorderWidth="1px"
							Width="608px" AutoGenerateColumns="False" GridLines="None" ShowHeader="False">
							<FooterStyle CssClass="GridFooter"></FooterStyle>
							<HeaderStyle HorizontalAlign="Center" CssClass="GridHeader"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="NomInf" HeaderText="Information">
									<HeaderStyle Wrap="False"></HeaderStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 2px" height="2">&nbsp;&nbsp;</TD>
				</TR>
				<TR>
					<TD class="SubTitInf" style="WIDTH: 548px; HEIGHT: 14px" height="14"><asp:label id="lblOtros" runat="server"></asp:label></TD>
				</TR>
				<TR>
					<TD class="style12" style="WIDTH: 548px; HEIGHT: 89px" height="89"><asp:datagrid id="dgOtros" runat="server" CssClass="style12" BorderColor="#888672" BorderWidth="1px"
							Width="608px" AutoGenerateColumns="False" GridLines="None" ShowHeader="False">
							<FooterStyle CssClass="GridFooter"></FooterStyle>
							<HeaderStyle HorizontalAlign="Center" CssClass="GridHeader"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="NomInf" HeaderText="Information">
									<HeaderStyle Wrap="False"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn Visible="False" DataField="OrdenDet" HeaderText="OrdenDet"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
				</TR>
				<TR>
					<TD class="style12" style="WIDTH: 548px; HEIGHT: 2px" height="2"></TD>
				</TR>
				<TR>
					<TD HEIGHT: 36px" class="SubTitInf">
		            	
					    <table class="style12" width="100%">
                                <tr>
                                    <td>
                                        <DIV align="left"><A  href="javascript:printWindow()">Print 
					    this page</A></DIV></td>
                                    <td>
                                       <div align="right">
							<A href="javascript:closeWindow()">Close window</A></DIV></td>
                                </tr>
                            </table>
                        

					</TD>
				</TR>
				
				<TR>
					<td class="style16" style="WIDTH: 548px" background="images/fondo.gif" 
                        height="60">
						<div align="center"><br>
							<br>
							<br>
							Please let us know your comments: <A href="mailto:peru@perutourism.com">peru@perutourism.com</A>.<br>
							Copyright © 2006 Viajes Pentagrama S.A.<br>
							Av. Larco 101 Suite 1301 Miraflores, Lima, Peru. Phone: (51 1) 241-4724 Fax: 
							(51 1) 444-0015
							<br>
						</div>
					</td>
				</TR>
			</TABLE>
		</form>
</body>
</html>
