<%@page import="java.io.*,java.sql.*"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="Header.jsp" %>
<s:property value="msg"/>

 <%
   String city=request.getParameter("t");
  
   if(city.equals("7")) // if id & pass is blank
    {
     String city1="Meerut";
        
        ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
        
       session.setAttribute("rs", rs);
       

    } 
/*  else if(city.equals("1"))
   {
      String city1="Noida";   
       ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
       session.setAttribute("rs", rs);
    } 
 else if(city.equals("2"))
   {
      String city1="Delhi";   
       ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
       session.setAttribute("rs", rs);
    }         
  else if(city.equals("3"))
   {
      String city1="Rajnagar";   
       ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
       session.setAttribute("rs", rs);
    }         
  else if(city.equals("4"))
   {
      String city1="Rajnagar Extension";   
       ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
       session.setAttribute("rs", rs);
    }         
  else if(city.equals("5"))
   {
      String city1="Ghaziabad";   
       ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
       session.setAttribute("rs", rs);
    }         
  else if(city.equals("6"))
   {
      String city1="Gurgaon";   
       ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
       session.setAttribute("rs", rs);
    }         
   else if(city.equals("7"))
   {
      String city1="Meerut";   
       ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
       session.setAttribute("rs", rs);
    }         
  
   else if(city.equals("8"))
   {
      String city1="Ha";   
       ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
       session.setAttribute("rs", rs);
    }         
  
   else if(city.equals("9"))
   {
      String city1="";   
       ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
       session.setAttribute("rs", rs);
    }*/         
  
   // out.println("<h1>available property</h1>");            
          boolean flag = true;
       ResultSet rs = (ResultSet)(session.getAttribute("rs"));
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
<div style="border: 1px; width: 37%;height: 37%; border-color: red;">
    <table>
        <h1>available property</h1>
        <tr><td>Code:</td>  <td><%=code%></td></tr>
      <tr><td> Name :</td> <td> <%=Name%></td></tr>
     <tr><td> Details : </td><td> <%=Details %></td></tr>
     <tr><td> Area :</td><td>  <%=Area%></td></tr>
      <tr><td> Price :</td> <td> <%=Price %></td></tr>
      <tr><td> City :</td><td>  <%=City%></td></tr>
      <tr><td> State :</td> <td> <%=State%></td></tr>
    </table>
    <hr size="5" color="red">
    </div>

<%
       }
       if(flag)
           out.println("<h1>sorry their is no property- </h1>");
   
%>

<%@include file="Footer.jsp" %>