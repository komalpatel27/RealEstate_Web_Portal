<%@page import="java.sql.*,java.io.*" %>
<%@page import="org.apache.struts2.components.Include"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <title>View Company</title>
        <script>
            function view(){
                document.forms[0].elements[0].value=2;
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
                <td valign="top">
                    <table border="0" width="650" style="border: 1px solid black; background-color:white;">
                        <tr>
                            <td>
         <% 
         ResultSet rs=db.DBConnect.getcompany();
     
         out.println("<table border=0><tr>");
     
          while(rs.next())
            {
                out.println("<form action=\"delete1.action\">");
                out.println("<input type=\"hidden\" name=\"compid\" value=\'"+rs.getInt(1)+"'/>");
                
                out.println("<input type=\"hidden\" name=\"ctr\" value=\"3\"/>");
                out.println("<table border=0 style=\"height:auto;border:1px solid black;background-color:#f2f2f2; margin-left:32px;width:90%;\">");
                out.println("<tr>");
                out.println("<td align=\"left\" valign=\"top\">");
                out.println("<div style=\"font-size:16px;font-weight:600; background-color:lightblue; width:534px; position:relative; float:left;\">"+ rs.getString(2)+"</div><input type=\"image\" src=\"images/close.jpg\" width=\"34.5\" height=\"26\" style=\"margin-top:-5px;\"");
                out.println("<div style=\"font-size:16px;font-weight:200; background-color:#f0f0f0;\">Location: "+rs.getString(3) +"</div>");
                out.println("<div style=\"font-size:13px;font-weight:200; background-color:#f0f0f0;\">Contact Person Name: " +rs.getString(4) +"</div>");
                out.println("<div style=\"font-size:13px;font-weight:200; background-color:#f0f0f0;\">Contact No: " +rs.getString(5) +"</div>");
                out.println("<div style=\"font-size:13px;font-weight:200; background-color:#f0f0f0;\">Mail ID: " +rs.getString(6) +"</div>");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("</form>");
                out.println("<hr size=2 width=\"645\" align=\"left\" style=\"color:black;\"/>");
             }
            %>
            <a href="index.jsp">Home</a>

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