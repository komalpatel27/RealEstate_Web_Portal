<%@page import="java.io.*,java.sql.*"%>
<%@page import="org.apache.struts2.components.Include"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
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
                    <table border="1" width="650" style="border: 1px solid black;">
                        <tr>
                            <td>
                                <%
   int oid=(Integer)session.getAttribute("id");
   //int oid=Integer.parseInt(s);
   try
   {
       ResultSet rs = db.DBConnect.getDataoffer_scheme(oid);
       ResultSetMetaData mt = rs.getMetaData();
       int NOC = mt.getColumnCount();
       out.println("<table width=100% border=1><tr>");
       for(int i=1;i<=NOC;i++)
       out.print("<th>"+mt.getColumnName(i)+"</th>");
       while(rs.next())
       {
         out.println("<tr>");  
         for(int i=1;i<NOC;i++)
         out.print("<td>"+rs.getString(i)+"</td>");
         out.print("<td><center><img src='Photo.jsp?n="+oid+"' border=2 height=100 width=200/></center></td>");
       }
       out.println("</tr></table>");
  }catch(Exception ex) {}
   
         //{out.println(ex); }
%>

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