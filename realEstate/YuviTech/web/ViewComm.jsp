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
                   <%@include file="SideMenu.jsp" %>
                </td>
                <td style="width:3px;" valign="top">
                    <img src="images/1.jpg" height="350" width="7"/>
                </td>
                <td valign="top">
                    <table border="0" width="650" style="border: 1px solid black; background-color:white;">
                        <tr>
                            <td>
                                <% 
ResultSet rs = db.DBConnect.getCommPropFeature();
        while(rs.next())
        {
        int id= rs.getInt(1);
        out.println("<form action=\"DelCommProp.action\">");
        out.println("<input type=\"hidden\" name=\"counter\" value=\"7\"/>");
        out.println("<input type=\"hidden\" name=\"propCode\" value=\'"+rs.getInt(1)+"'/>");
        out.println("<table border=0 style=\"height:auto;border:1px solid black;width:670px;\">");
        out.println("<tr>");
        out.println("<td align=\"left\" valign=\"top\" style=\"width:120px;\">");
        out.println("<div style=\"width:120px; height:130px; background-color:red;position:relative;float:left;\"><img src='Pphoto.jsp?n="+id+"'width=130 height=150/></div>");
        out.println("</td>");
        out.println("<td align=\"left\" valign=\"top\" style=\"width:280px;\">");
        //out.println("<div style=\"font-size:22px;font-weight:600;\">Offer Id: "+rs.getInt(1)+"<srdiv>");
        out.println("<div style=\"font-size:18px;font-weight:600; background-color:lightblue; \">Property Category: "+rs.getString(3)+"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Property Type:</b> "+rs.getString(3) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Property Sub Type:</b> "+rs.getString(4) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Property Name:</b> "+rs.getString(5) +"</div>");
       // out.println("<div style=\"font-size:13px;font-weight:200;\">Details: "+rs.getInt(7) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Price:</b> "+rs.getInt(8) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Street:</b> "+rs.getString(9) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Location:</b> "+rs.getString(10) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>City:</b> "+rs.getString(11) +"</div>");
       // out.println("<div style=\"font-size:13px;font-weight:200;\">State: "+rs.getInt(12) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Zip:</b> "+rs.getInt(13) +"</div>");
        out.println("</td>");
        out.println("<td align=\"left\" valign=\"top\" width=\"160\">");
        out.println("<div style=\"font-size:18px;font-weight:600; background-color:lightblue;\">Features</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Bathroom:</b> "+rs.getInt(14) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Parking:</b> "+rs.getString(15) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Swimming Pool:</b> "+rs.getString(16) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>AirCondition:</b> "+rs.getString(17) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Nearest Highway Dist.:</b> "+rs.getInt(18) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Nearest Railway Dist.:</b> "+rs.getInt(19) +"</div>");
        out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Nearest Hospital Dist.:</b> "+rs.getInt(20) +"</div>");
      //  out.println("<div style=\"font-size:13px;font-weight:200;\">Nearest School Dist.: "+rs.getInt(21) +"</div>");
        //out.println("<div style=\"font-size:13px;font-weight:200;\"><hr   size='4' color='lightblue'></div>");
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