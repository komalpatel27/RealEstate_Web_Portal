<%@page import="org.apache.struts2.components.Include"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <title>ADMINISTRATOR</title>
    </head>
    <body>
        <%
      String clt1=(String)session.getAttribute("clt");
      if(clt1!=null)
            {
      %>
       <%@include file="ahead.jsp"%>
       <%
            }
      else
        {
     request.getRequestDispatcher("index.jsp").forward(request, response);
}                   
%>
                <div>
        <table align="left" border="0" style="width:1000px;height:inherit;background-color: white;">
            <tr>
                <td valign="top" style="width:320;">
                   <%@include file="SideMenu.jsp" %>
                </td>
                               <td align="left" valign="top">
                    <img src="images/pic9.jpg"  width="670" height="350"/>
                </td>
            </tr>
        </table>
        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>