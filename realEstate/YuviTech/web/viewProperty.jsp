<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head >
        <title>VIEW PROPERTY</title>
    </head>
    <body>
        <%
        out.println("<form action=\"\">");
        out.println("<table border=0 style=\"height:auto;border:1px solid black;\">");
        out.println("<tr>");
        out.println("<td style=\"width:130px;\">");
        out.println("<div style=\"width:130px; height:130px; background-color:red;\">IMAGE</div>");
        out.println("</td>");
        out.println("<td align=\"left\" valign=\"top\">");
        out.println("<div style=\"font-size:22px;font-weight:600;\">PROPERTY NAME</div>");
        out.println("<div style=\"font-size:16px;font-weight:200;\">TYPE: Residential</div>");
        out.println("<div style=\"font-size:16px;font-weight:200;\">Property for CATEGORY</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">PROPERTY SIZE: AREA PRIZE</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">STATUS</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">IS FREE HOLD</div>");
        out.println("</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td colspan=2>");
        out.println("<div style=\"font-size:12px;width:320px;height:auto;\"><span>DETAILS.</span></div>");
        out.println("</td>");
        out.println("</tr>");
        out.println("</table>");
        out.println("<input type=\"submit\" value=\"DELETE\">");
        out.println("</form>");
        out.println("<hr size=2 width=\"400\" align=\"left\"/>");
        %>
    </body>
</html>