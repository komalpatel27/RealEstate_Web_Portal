<%@page import="org.apache.struts2.components.Include"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <s:head theme="ajax"/>
    <head>
        <title>ADMINISTRATOR</title>
        <script>
            function view(){
                document.forms[0].submit();
            }
        </script>
    </head>
    <body>
        <%@include file="ahead.jsp"%>
        <div>
        <table align="left" border="0" style="width:1000px;height:inherit;background-color: white;">
            <tr>
                <td valign="top" style="width:320;">
                   <%@include file="SideMenu.jsp" %>
                </td>
                <td style="width:3px;" valign="top">
                    <img src="images/1.jpg" height="350" width="7"/>
                </td>
                <td valign="top">
                    <table border="0" width="650" style="border: 1px solid black;">
                        <tr>
                            <td>
                                <s:form action="view.action">
     <table height=100% width=100% border=0>
           <table width=100% border=0>
            <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white">VIEW OFFER & SCHEME</th></tr>
            <s:hidden name="ctr" value="5"/> 
            
    <td>
     <%
       String s=(String)request.getAttribute("s");
       if(s!=null)
           out.println("               "+s);
      %>
    </td>
       <tr>
      <td><s:select name="oid" label="Offer Id" value="select" list="oidList"  onchange="view()"/></td></tr>
       
  </table></td><td>&nbsp;</td></tr>
           <tr height=10%><td colspan=3>&nbsp;</td></tr>
</table>
 </s:form>   
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>