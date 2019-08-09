<%@ Page Language="VB" AutoEventWireup="false" CodeFile="itop.aspx.vb" Inherits="itop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PeruTourism</title>
    <style type="text/css">
        BODY {
            BACKGROUND-IMAGE: url(images/fondo.gif);
            MARGIN: 0px
        }

        .codCliente {
            text-decoration: solid;
            color: white;
            font-size: 22px;
        }

        .descripcion {
            font-size: 15px;
            color: white;
        }
    </style>
    <script language="javascript">
        function go(URL) {
            window.open(URL, 'popup', 'scrollbars=yes,resizable=yes,width=557,height=480,top=20,left=100');
        }
    </script>

</head>
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
    <center>
        <form id="Form1" method="post" runat="server">
            <table cellspacing="0" cellpadding="0" width="805" border="0">
                <tr>
                    <td width="170" rowspan="2">
                        <img height="78" src="images/logo2.gif" width="170"></td>
                    <td valign="top" width="585" colspan="9">
                        <img height="35" src="images/franja.gif" width="635" align="left"></td>
                </tr>
                <tr>
                    <td valign="middle" colspan="9">
                        <div align="center">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td width="60%"><font face="Arial, Helvetica, sans-serif" color="#277e49"><b>Your 
													customized Travel Website</b></font></td>
                                    <td width="40%"><font face="Arial, Helvetica, sans-serif"><b>
                                                                                <asp:Label ID="lblTf" runat="server">Call us: (51 1) 241-4724</asp:Label><br>
                                        <asp:Label ID="lblTollFree" runat="server" CssClass="descripcion"> </asp:Label>
<%--                                        <asp:Label ID="lblCodCliente" runat="server" CssClass="codCliente"></asp:Label></b>--%>
                                    </font></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#000000" colspan="10">
                        <img height="2" src="images/transparent.gif" width="1"></td>
                </tr>
                <tr>
                    <td colspan="10">
                        <table cellspacing="0" cellpadding="0" width="805" border="0">
                            <tr>
                                <td width="134" rowspan="3" bgcolor="#277E49">
                                    <asp:ImageButton ID="ImageButtonItineraries" runat="server"
                                        ImageUrl="~/images/proing.jpg" />
                                </td>
                                <td width="1" bgcolor="#ffffff" rowspan="3">
                                    <img height="1" src="images/transparent.gif" width="2"></td>
                                <td width="175" bgcolor="#e00789">
                                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="javascript:var w=window.open('iformapago.aspx','','width=550,height=580,top=40,left=70,scrollbars=yes,resizeable=yes');"
                                        ImageUrl="images/go1.gif"></asp:HyperLink></td>


                                <td width="0%" bgcolor="#ffffff" rowspan="3">
                                    <img height="1" src="images/transparent.gif" width="2"></td>
                                <td width="175" bgcolor="#e00789">
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="javascript:var w=window.open('reserva.aspx','','width=700,height=580,top=40,left=70,scrollbars=yes,resizeable=yes');"
                                        ImageUrl="images/go3.gif"></asp:HyperLink></td>
                                <td width="1" bgcolor="#ffffff" rowspan="3">
                                    <img height="1" src="images/transparent.gif" width="2"></td>
                                <td valign="middle" width="162" bgcolor="#366ab5" rowspan="3">
<%--                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/payvisa.jpg"></asp:ImageButton>--%>
                                                                <a title="VisaLink" href="https://www.visanetlink.pe/pagoseguro/PERUTOURISM/26688" target="_blank"><img src="images/pagolinkEN_gif.gif" alt="VisaLink" /></a>


                                </td>
                                <td width="0%" bgcolor="#ffffff" rowspan="3">
                                    <img height="1" src="images/transparent.gif" width="2"></td>
                                <td valign="middle" width="151" bgcolor="#f6a51b" rowspan="3">
                                    <div align="center">
                                        <%--<asp:ImageButton ID="ImageButton2" runat="server"
                                            ImageUrl="~/images/mc_accpt_050_gif.gif"></asp:ImageButton>--%>
                                         <asp:Label ID="Label1" runat="server" CssClass="descripcion">Your Customer Code : </asp:Label>
                                <asp:Label ID="lblCodCliente" runat="server" CssClass="codCliente"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img height="1" src="images/transparent.gif" width="1"></td>
                                <td>
                                    <img height="1" src="images/transparent.gif" width="1"></td>
                            </tr>
                            <tr>
                                <td bgcolor="#e00789" height="19">
                                    <asp:HyperLink ID="Hyperlink4" runat="server" NavigateUrl="javascript:var w=window.open('informacion.aspx','','width=650,height=640,top=3,left=70,scrollbars=yes,resizeable=yes');"
                                        ImageUrl="images/go2.gif"></asp:HyperLink></td>
                                <td bgcolor="#e00789">
                                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="javascript:var w=window.open('ibalance.aspx','','width=650,height=550,top=40,left=70,scrollbars=yes,resizeable=yes');"
                                        ImageUrl="images/go4.gif"></asp:HyperLink></td>
                            </tr>
                            <tr height="1">
                                <td bgcolor="#ffffff">
                                    <img height="1" src="images/transparent.gif" width="134"></td>
                                <td bgcolor="#ffffff">
                                    <img height="1" src="images/transparent.gif" width="1"></td>
                                <td bgcolor="#ffffff">
                                    <img height="1" src="images/transparent.gif" width="175"></td>
                                <td bgcolor="#ffffff">
                                    <img height="1" src="images/transparent.gif" width="1"></td>
                                <td bgcolor="#ffffff">
                                    <img height="1" src="images/transparent.gif" width="175"></td>
                                <td bgcolor="#ffffff">
                                    <img height="1" src="images/transparent.gif" width="1"></td>
                                <td bgcolor="#ffffff">
                                    <img height="1" src="images/transparent.gif" width="162"></td>
                                <td bgcolor="#ffffff">
                                    <img height="1" src="images/transparent.gif" width="1"></td>
                                <td bgcolor="#ffffff">
                                    <img height="1" src="images/transparent.gif" width="151"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
