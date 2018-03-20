<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.sql.*,java.io.*" %>
<%@page import="org.apache.struts2.components.Include"%>
<html>
    <head>
        <title>VIEW OFFER SCHEME</title>
    </head>
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
ResultSet rs = db.DBConnect.getOfferScheme();
        while(rs.next())
                       {
        int id= rs.getInt(1);
        out.println("<form action=\"DelOffer.action\">");
        out.println("<input type=\"hidden\" name=\"ctr\" value=\"5\"/>");
        out.println("<input type=\"hidden\" name=\"oid\" value=\'"+rs.getInt(1)+"'/>");
        out.println("<table border=0 style=\"height:auto;border:1px solid black; width:600px; margin-left:20px;\">");
        out.println("<tr>");
        out.println("<td style=\"width:130px;\">");
        out.println("<div style=\"width:130px; height:130px; background-color:red;\"><img src='Photo.jsp?n="+id+"'width=130 height=130/></div>");
        out.println("</td>");
        out.println("<td align=\"left\" valign=\"top\">");
        //out.println("<div style=\"font-size:22px;font-weight:600;\">Offer Id: "+rs.getInt(1)+"<srdiv>");
        out.println("<div style=\"font-size:22px;font-weight:600; background-color:lightblue;width:420px;position:relative; float:left\">"+rs.getString(2)+"</div><input type=\"image\" src=\"images/close.jpg\" width=\"34.5\" height=\"28\" style=\"margin-top:-3px;\">");
        out.println("<div style=\"font-size:18px;font-weight:200; color:orange;\">Discount:"+rs.getInt(8) +"%</div>");
        out.println("<div style=\"font-size:16px;font-weight:200;\">Register Date: "+rs.getString(4) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Start Date: "+rs.getString(5) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">End Date: "+rs.getString(6) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Status: "+rs.getString(7) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Type: "+rs.getString(3) +"</div>");
        out.println("</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td colspan=2>");
        out.println("</td>");
        out.println("</tr>");
        out.println("</table>");
        out.println("</form>");
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