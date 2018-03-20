<%@page import="java.io.*,java.sql.*"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="Header.jsp" %>
<s:property value="msg"/>
<h1>available property</h1>
 <%  
       boolean flag = true;
       ResultSet rs = (ResultSet)(request.getAttribute("rs"));
       String code="";
       String Name="";
       String Details="";
       String Area="";
       String Price="";
       String City="";
       String State="";
             // ResultSetMetaData mt = rs.getMetaData();
       //int c = mt.getColumnCount();
       //out.println("<table width=100% border=1><tr>");
       //for(int i=1;i<=c;i++)
       //out.print("<th>"+mt.getColumnName(i)+"</th>");
       while(rs.next())
       {
        flag = false;
        code  = rs.getString(1);
        Name = rs.getString(2);
        Details = rs.getString(3);
       Area = rs.getString(4);
       Price = rs.getString(5);
      City = rs.getString(6);
        State = rs.getString(7); 
%>
<div style="border: 1px; width: 37%;height: 100px; border-color: red;">
      Code :         <%=code%>
      <br> Name :  <%=Name%>
     <br> Details :  <%=Details %>
     <br> Area :  <%=Area%>
      <br> Price :  <%=Price %>
      <br> City :  <%=City%>
      <br> State :  <%=State%>
    </div>
<hr size="5" color="red">
<%
       }
       if(flag)
           out.println("sorry their is no property- ");
   
%>

<%@include file="Footer.jsp" %>