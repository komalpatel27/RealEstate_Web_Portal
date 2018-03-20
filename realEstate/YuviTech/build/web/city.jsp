<%@page import="java.sql.*"%>   
<%
   String st=request.getParameter("t");
   out.println("<select name='city_name'><option value='-1'>Select City </option>");
   try
   {
     String n;  
     ResultSet rs = db.DBConnect.getCityL(st); // get all cities of user selected state 
     while(rs.next()){
       n = rs.getString(1); // get cityname 
       out.println("<option value=\""+n+"\">"+n+"</option>");
     }
     out.println("</select>");
  }
  catch(Exception e){ } 
 %>