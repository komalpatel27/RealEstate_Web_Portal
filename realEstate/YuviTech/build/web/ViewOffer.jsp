<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.sql.*,java.io.*" %>
<%@page import="org.apache.struts2.components.Include"%>
<html>
    <head>
        <title>VIEW OFFER SCHEME</title>
    </head>
        <%@include file="Header.jsp"%>
        <div>
           <div id="div1" style="border: 1px solid black;border-radius:8px;  float: left;margin-top:0px;"><img src="images/MC.gif " width="200" height="320" style="border-radius:8px;"></div>
        <div style="float:left;position:relative; margin-left: 20px;margin-top: 0px;width: 450px; height:inherit;background-color: white">
             <% 
                                out.println("<marquee direction=\"up\" style=\"height:400px;\" loop=\"INFINITE\" behaviour=\"\" scrollamount=\"5\" vspace=\"\" onmouseover=\"this.stop()\"  onmouseout=\"this.start()\">");
       ResultSet rs = db.DBConnect.getOfferScheme();
        while(rs.next())
                       {
            
        int id= rs.getInt(1);       
        out.println("<table border=0 style=\"height:auto;border:1px solid black; width:300px; margin-left:30px;\">");
        out.println("<tr>");
        out.println("<td style=\"width:130px;\">");
        out.println("<div style=\"width:130px; height:130px; background-color:red;\"><img src='Photo.jsp?n="+id+"'width=130 height=130/></div>");
        out.println("</td>");
        out.println("<td align=\"left\" valign=\"top\">");       
        out.println("<div style=\"font-size:22px;font-weight:600; background-color:lightblue;width:250px;position:relative; float:left\">"+rs.getString(2)+"</div>");
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
                      }
       out.println("</marquee>");

            %>
            </div>
        </div>
        <%@include file="Footer.jsp" %>
</html>