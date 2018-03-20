 <%
   
       String clt2=(String)session.getAttribute("clt");
       if(clt2!=null)
          {
          
       if(clt2.equalsIgnoreCase("Admin"))
        {
           %>
           <%@include file="ahead.jsp"%>
           <%
         }
      
           }
        else
       {
           %>
           <%@include file="Header.jsp"%>
           <%
       }
       
    
%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>AVAILABLE PROPERTY</title>
        		
                <link href="css/demo_page.css" type="text/css" rel="stylesheet" />
                <link href="css/demo_table.css" type="text/css" rel="stylesheet" />
                <link href="css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
                <script type="text/javascript" language="javascript" src="js/jquery-1.3.2.min.js"></script>
                <script type="text/javascript" language="javascript" src="js/jquery.dataTables.min.js"></script>
                <script>
                    		$(document).ready(function() {
				$('#example1').dataTable();
			} );
                </script>
    </head>
    <body>
                        <% 
     String city=request.getParameter("t");
  
     if(city.equals("0")) // if id & pass is blank
      {
       String city1="GreaterNoida";      
      ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);
      session.setAttribute("rs", rs);
     }
     else if(city.equals("1")) // if id & pass is blank
      {
       String city1="Noida";      
      ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);       
      session.setAttribute("rs", rs);
     }
   else if(city.equals("2")) // if id & pass is blank
      {
       String city1="Delhi";      
      ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);       
      session.setAttribute("rs", rs);
     }        
else if(city.equals("3")) // if id & pass is blank
      {
      String location="Rajnagar";
      String city1="Ghaziabad";      
      ResultSet rs=db.DBConnect.GetSearch_Property_Location(location,city1);       
      session.setAttribute("rs", rs);
     }
     else if(city.equals("4")) // if id & pass is blank
      {
       String location="Rajnagar Extension";
      String city1="Ghaziabad";      
      ResultSet rs=db.DBConnect.GetSearch_Property_Location(location,city1);       
      session.setAttribute("rs", rs);
     }
     else if(city.equals("5")) // if id & pass is blank
      {
       String city1="Ghaziabad";      
      ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);       
      session.setAttribute("rs", rs);
     }

else if(city.equals("6")) // if id & pass is blank
      {
       String city1="Gurgaon";      
      ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);       
      session.setAttribute("rs", rs);
     }
     else if(city.equals("7")) // if id & pass is blank
      {
       String city1="Meerut";      
      ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);       
      session.setAttribute("rs", rs);
     }
     else if(city.equals("8")) // if id & pass is blank
      {
       String city1="Hapur";      
      ResultSet rs=db.DBConnect.GetSearch_Property_city(city1);       
      session.setAttribute("rs", rs);
     }
     %>
        
              
        <table id="example1">
           <thead>
                <tr><th></th><th></th></tr>
            </thead>
             <tbody>
           <%
       int counter=0; 
 boolean flag=true;                              
 ResultSet rs =(ResultSet)session.getAttribute("rs");
 while(rs.next())
 {
       counter ++;
        flag=false;
        int code= rs.getInt(1);
  %>
            
           
               
            <tr>
                <%
                 out.println("<td style=\"width:130px;\">");
        out.println("<div style=\"width:200px; height:180px; background-color:red;\"><img src='PhotoS.jsp?n="+code+"'width=200 height=180/></div>");
        out.println("</td>");
                
                out.println("<td align=\"left\" valign=\"top\">");
        //out.println("<div style=\"font-size:22px;font-weight:600;\">Offer Id: "+rs.getInt(1)+"<srdiv>");
        out.println("<div style=\"font-size:22px;font-weight:600; background-color:lightblue;width:750px;position:relative; \">"+rs.getString(2)+"</div>");
        out.println("<div style=\"font-size:18px;font-weight:200; color:orange;\"> Name:"+rs.getString(2) +"</div>");
          out.println("<div style=\"font-size:13px;font-weight:200;\">Area: "+rs.getString(4) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Price: "+rs.getString(5) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">City: "+rs.getString(6) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">State: "+rs.getString(7) +"</div>");
         out.println("<div style=\"font-size:16px;font-weight:200;\">Details:      "+rs.getString(3) +"</div>");
        out.println("</td>"); 
%>                  </tr>
                       
        
        <%
      
               }
  
        %>
         </tbody>   
        </table>
    </body>
    <%@include file="Footer.jsp" %>
