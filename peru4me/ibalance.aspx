<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ibalance.aspx.vb" Inherits="ibalance" %>

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
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" 
				cellSpacing="0" cellPadding="0" width="594" background="images/fondo_iti.gif" border="0"
				align="center">
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
					<TD align="center" class="style8" style="HEIGHT: 44px">
						<span class="style10">
							<br>
							<asp:label id="lblNomCliente" runat="server"></asp:label>
						</span>
						<br>
					</TD>
				</TR>
				<TR>
					<TD class="style8" align="center" style="HEIGHT: 2px">&nbsp;&nbsp;</TD>
				</TR>
				<TR>
					<TD class="style12" style="HEIGHT: 7px" colSpan="2" height="7" align="center">
						<asp:Label id="lblMsg" runat="server"></asp:Label></TD>
				</TR>
				<TR>
				
						
						<td colSpan="2" height="14">
						<asp:GridView id="dgBalance" runat="server" Width="600px"  Height="17px" 
							BorderColor="#888672" AutoGenerateColumns="False" BorderWidth="1px" CellPadding="2"  >
							<Columns>
								<asp:BoundField  DataField="FchEmision"  HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" >
									<ItemStyle HorizontalAlign="left" VerticalAlign="Middle"></ItemStyle>
									<HeaderStyle  CssClass = "GridCab"   /> 
								</asp:BoundField >
								<asp:BoundField  DataField="Referencia"  HeaderText="Detail">
									<ItemStyle HorizontalAlign="left" VerticalAlign="Middle"></ItemStyle>
									<HeaderStyle  CssClass = "GridCab"   /> 
								</asp:BoundField >
								<asp:BoundField  DataField="Cargo" HeaderText="Due" DataFormatString="{0:###,###,###,###.##}">
									<ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"></ItemStyle>
									<ItemStyle Width="10%" />
									<HeaderStyle  CssClass = "GridCab"   /> 
								</asp:BoundField >
								<asp:BoundField  DataField="Abono" HeaderText="Payment received" DataFormatString="{0:###,###,###,###.##}">
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
									<ItemStyle Width="10%" />
									<HeaderStyle  CssClass = "GridCab"   /> 
								</asp:BoundField >
							</Columns>
						</asp:GridView></td>

						
						
				</TR>
				<TR>
					<td class="style16" background="images/fondo.gif" colSpan="2" height="60">
						<div align="center"><br>
							&nbsp;&nbsp;
							<asp:Label ID="lblTotal" runat="server" Font-Bold="True"></asp:Label>
							<br>
							<br>
							<br>
							<br>
							<br>
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
