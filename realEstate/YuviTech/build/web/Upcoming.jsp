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
        
              
        <table id="example1">
           <thead>
                <tr><th></th><th></th></tr>
            </thead>
             <tbody>
           <%
       
                              
 ResultSet rs =db.DBConnect.upcomingproject();
 while(rs.next())
 {
    
       
        int code= rs.getInt(1);
  %>
            
           
               
            <tr>
                <%
                 out.println("<td style=\"width:130px;\">");
        out.println("<div style=\"width:200px; height:180px; background-color:red;\"><img src='PhotoS.jsp?n="+code+"'width=200 height=180/></div>");
        out.println("</td>");
                
                out.println("<td align=\"left\" valign=\"top\">");
        //out.println("<div style=\"font-size:22px;font-weight:600;\">Offer Id: "+rs.getInt(1)+"<srdiv>");
        out.println("<div style=\"font-size:22px;font-weight:600; background-color:lightblue;width:420px;position:relative; \">"+rs.getString(2)+"</div>");
        out.println("<div style=\"font-size:18px;font-weight:200; color:orange;\"> Property Name:"+rs.getString(2) +"</div>");
          
        out.println("<div style=\"font-size:13px;font-weight:200;\">Property Area Feet: "+rs.getInt(5) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">Total Price: "+rs.getInt(6) +"</div>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">City: "+rs.getString(7) +"</div>");
         out.println("<div style=\"font-size:16px;font-weight:200;\">State:  "+rs.getString(8) +"</div>");
         out.println("<div style=\"font-size:13px;font-weight:200;\">Property Details: "+rs.getString(4) +"</div>");
        out.println("</td>"); 
%>                  </tr>
                       
        
        <%
      
               }
  
        %>
         </tbody>   
        </table>
    </body>
    <%@include file="Footer.jsp" %>
