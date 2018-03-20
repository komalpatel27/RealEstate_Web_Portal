<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.sql.*,java.io.*" %>
<%@page import="org.apache.struts2.components.Include"%>
<html>
    <head>
        <title>VIEW FEEDBACK DETAILS</title>
    </head>
        <%@include file="ahead.jsp"%>
        <div>
        <table align="left" border="0" style="width:1000px;height:inherit;background-color: white;">
            <tr>
                  <td valign="top" style="width:320;">
                   <%@include file="SideMenu.jsp" %>
                </td><td valign="top">
                    <table border="0" width="650" style="border: 1px solid black; background-color:white;">
                        <tr>
                            <td>
                                <% 
       ResultSet rs = db.DBConnect.getFeedBack();
        while(rs.next())
                       {
        int id= rs.getInt(1);       
        out.println("<table border=0 style=\"height:auto;border:1px solid black; width:600px; margin-left:20px;\">");
        out.println("<tr>");
        out.println("<td align=\"left\" valign=\"top\">");       
        out.println("<div style=\"font-size:22px;font-weight:600; background-color:lightblue;width:570px;position:relative; float:left\">"+rs.getString(2)+"</div>");
        if(rs.getString(3)!=null)
        out.println("<div style=\"font-size:16px;font-weight:200;\">User id: "+rs.getString(3) +"</div>");
        else
          out.println("<div style=\"font-size:16px;font-weight:200;\">User id: GUEST</div>");  
        out.println("<div style=\"font-size:13px;font-weight:200;\">Email id: "+rs.getString(4) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Mobline no.: "+rs.getString(5) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Message: "+rs.getString(6) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Date of feedback: "+rs.getString(7) +"</div>");
        out.println("</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td colspan=2>");
        out.println("</td>");
        out.println("</tr>");
        out.println("</table>");       
        out.println("<hr size=2 width=\"640\" align=\"left\"/>");
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
</html>