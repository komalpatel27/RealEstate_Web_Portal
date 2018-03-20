<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import ="java.sql.*,java.io.*" %>
<%@page import="org.apache.struts2.components.Include"%>
<html>
    <head>
        <title>VIEW PROPERTY INFORMATION</title>
    </head>
        <%@include file="ahead.jsp"%>
        <div>
        <table align="left" border="0" style="width:1000px;height:inherit;background-color: white;">
            <tr>
                <td valign="top" style="width:320;">
                   <%
                      String clt=(String)session.getAttribute("clt");
                      if(clt.equalsIgnoreCase("Admin"))
                      {
                    %>
                    <%@include file="SideMenu.jsp" %>
                    <%
                      }
                     else
                     {
                    %>
                     <%@include file="Customer.jsp" %>
                     <% } %>
                     
                </td>
                <td valign="top">
                    <table border="0" width="650" style="border: 1px solid black; background-color:white;">
                        <tr>
                            <td>
        <% 
        ResultSet rs = db.DBConnect.getResPropFeature();
        while(rs.next())
        {
        int id= rs.getInt(1);
        out.println("<form action=\"DelProp.action\">");
        out.println("<input type=\"hidden\" name=\"counter\" value=\"6\"/>");
        out.println("<input type=\"hidden\" name=\"propCode\" value=\'"+rs.getInt(1)+"'/>");
        out.println("<table border=0 style=\"height:auto;border:1px solid black;\">");
        out.println("<tr>");
        out.println("<td align=\"left\" valign=\"top\" style=\"width:130px;\">");
        out.println("<div style=\"width:130px; height:130px; background-color:red;position:relative;float:left;\"><img src='Pphoto.jsp?n="+id+"'width=130 height=180/></div>");
        out.println("</td>");
        out.println("<td align=\"left\" valign=\"top\" style=\"width:280px;\">");
        //out.println("<div style=\"font-size:22px;font-weight:600;\">Offer Id: "+rs.getInt(1)+"<srdiv>");
        out.println("<div style=\"font-size:18px;font-weight:600; background-color:lightblue; \"> Property Category:"+rs.getString(3)+"</div>");
        out.println("<div style=\"font-size:16px;font-weight:200;\">Property Type:"+rs.getString(3) +"</div>");
        out.println("<div style=\"font-size:16px;font-weight:200;\">Property Name: "+rs.getString(4) +"</div>");
       
        out.println("<div style=\"font-size:13px;font-weight:200;\">Price: "+rs.getInt(7) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Street: "+rs.getString(8) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Location: "+rs.getString(9) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">City: "+rs.getString(10) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">State: "+rs.getString(11) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Zip: "+rs.getInt(12) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Details: "+rs.getString(6) +"</div>");
        //out.println("<div style=\"font-size:13px;font-weight:200;\"><hr size='4' color='lightblue'></div>");
        out.println("</td>");
        out.println("<td align=\"left\" valign=\"top\" width=\"160\">");
        out.println("<div style=\"font-size:18px;font-weight:600; background-color:lightblue;\">Features</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Bedroom: "+rs.getInt(13) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Bathroom: "+rs.getInt(14) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Hall: "+rs.getInt(15) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Kitchen: "+rs.getInt(16) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Max Floor: "+rs.getInt(17) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Parking: "+rs.getString(18) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Swimming Pool: "+rs.getString(19) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">AirCondition: "+rs.getString(20) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Lift: "+rs.getString(21) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Furnished: "+rs.getString(22) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Nearest Highway Dist.: "+rs.getInt(23) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Nearest Railway Dist.: "+rs.getInt(24) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Nearest Hospital Dist.: "+rs.getInt(25) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Nearest School Dist.: "+rs.getInt(26) +"</div>");
        out.println("</td>");
        out.println("<td valign=\"top\" width=\"30\">");
 
        //out.println("</td>");
       out.println("</td>");
        out.println("<td valign=\"top\" width=\"30\">");
        out.println("<input type=\"image\" src=\"images/close.jpg\" value=\" \" width=30 height=25 style=\"margin-top:-3px;\">");
        out.println("</td>");
        out.println("</tr>");        
        out.println("</table>");
        out.println("</form>");
        out.println("<hr size=2 width=\"400\" align=\"left\"/>");
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