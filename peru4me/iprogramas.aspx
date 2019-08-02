<%@ Page Language="VB" AutoEventWireup="false" CodeFile="iprogramas.aspx.vb" Inherits="iprogramas" %>

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
	<body >
		<center>
			<FORM id="Form1" method="post" runat="server">
							<TABLE cellSpacing="0" cellPadding="0" width="640" 
							    background="images/fondo_iti.gif" border="0"
								mm_noconvert="TRUE" style="height: 354px">

								<TR>
							    	<TD vAlign="top" bgColor="#888672" height="1"><IMG src="transparent.gif"></TD>
								</TR>
								<TR >
									<TD class="style8" height="25">
									              
										<DIV class="style23" align="center"><A name="Programas">
                                               <asp:Label ID="lblNomCliente" runat="server"></asp:Label>
                                        </DIV>
                      
										</A></TD>
								</TR>
								<TR >
									<TD class="style8" height="5"></TD>
								</TR>
								<TR >
									<TD class="style24" height="25" align="center">
									              
                                               <asp:Label ID="lblMensaje1" runat="server"></asp:Label>
                                        </TD>
								</TR>
								<TR >
									<TD class="style25" height="25" align="center">
									              
							
                                               <asp:Label ID="lblMensaje2" runat="server" ></asp:Label>
                                   
                      
										</TD>
								</TR>
								<TR >
									<TD class="style8" height="5"></TD>
								</TR>
								<TR>
									<TD class="style26"><asp:datagrid id="dgPublica" runat="server" HeaderStyle-CssClass="GridHeader" AutoGenerateColumns="False"
										Width="800px" BorderColor="#888672" BorderWidth="1px">
										<HeaderStyle HorizontalAlign="Center" CssClass="GridHeader"></HeaderStyle>
										<Columns>
												<asp:HyperLinkColumn Text="&lt;img src=images/lupagris.gif&gt;" DataNavigateUrlField="KeyReg" DataNavigateUrlFormatString="iprograma.aspx?ID={0}"></asp:HyperLinkColumn>
												<asp:BoundColumn DataField="FchSys" HeaderText="Published" DataFormatString="{0,1:dd MMM yyyy}{0,13:hh:mm tt }">
								            	<ItemStyle HorizontalAlign="Center" Wrap="false"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="NroPrograma" HeaderText="Number">
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="StsPrograma" HeaderText="Status">
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:HyperLinkColumn  DataTextField="DesPrograma" HeaderText="Description" DataNavigateUrlField="KeyReg" DataNavigateUrlFormatString="iprograma.aspx?ID={0}"></asp:HyperLinkColumn>
												<asp:BoundColumn DataField="CantDias" HeaderText="Number of Days">
											    <HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
										</Columns>
										</asp:datagrid></TD>
								</TR>
								<TR>
									<TD class="style16" width="663" background="images/fondo.gif" height="56">
										<DIV align="center">
										    <BR><BR><BR><BR><BR><BR>
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
		</FORM>
	</center>
	
	
	<!-- begin olark code -->
<script data-cfasync="false" type='text/javascript'>/*<![CDATA[*/window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){
f[z]=function(){
(a.s=a.s||[]).push(arguments)};var a=f[z]._={
},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){
f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={
0:+new Date};a.P=function(u){
a.p[u]=new Date-a.p[0]};function s(){
a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){
hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){
return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){
b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{
b.contentWindow[g].open()}catch(w){
c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{
var t=b.contentWindow[g];t.write(p());t.close()}catch(x){
b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({
loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
/* custom configuration goes here (www.olark.com/documentation) */
olark.identify('1383-287-10-5070');/*]]>*/</script><noscript><a href="https://www.olark.com/site/1383-287-10-5070/contact" title="Contact us" target="_blank">Questions? Feedback?</a> powered by <a href="http://www.olark.com?welcome" title="Olark live chat software">Olark live chat software</a></noscript>
<!-- end olark code -->
	
	
	
</body>
</html>
