<%@page import="java.sql.*,java.io.*" %>
<%@taglib  uri="/struts-tags" prefix="s" %>
<s:property value="msg"/>
<body bgcolor="lightyellow">
<% ResultSet rs=db.DBConnect.getcompany();
     
     out.println("<table border=1><tr>");
     out.println("<th>companyid</th><th>name</th><th>address</th><th>cpname</th><th>cpmobile</th><th>cpmailid</th><th>userid</th></tr>");
          while(rs.next())
            {
                out.println("<tr><td>" +rs.getInt(1) +"</td>");
                out.println("<td>" +rs.getString(2) +"</td>");
                out.println("<td>" +rs.getString(3) +"</td>");
                out.println("<td>" +rs.getString(4) +"</td>");
                out.println("<td>" +rs.getInt(5) +"</td>");
                out.println("<td>" +rs.getString(6) +"</td>");
                out.println("<td>" +rs.getInt(7) +"</td></tr>");
            }
            out.println("</table>");
%>
</body>

<a href="index.jsp">Home</a>
<%@include file="Footer.jsp" %>