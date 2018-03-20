<%@include file="Header.jsp" %>
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
		<script type="text/javascript" language="javascript" src="jquery.dataTables.js"></script>
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
                <tr><th></th><th></th><th></th></tr>
           </thead>
 
           <%
       
                              
          ResultSet rs = db.DBConnect.getPropList();

 while(rs.next())
 {
    
       
        int id= rs.getInt(1);

 %>
 <tr>
     <%
                 out.println("<td align=\"left\" valign=\"top\" style=\"width:100px;\">");
          out.println("<div style=\"width:280; height:180; background-color:red;\"><img src='Pphoto.jsp?n="+id+"'width=280 height=180/></div>");

           out.println("</td>");               
               out.println("<td align=\"left\" valign=\"top\" style=\"width:420;\">");
           out.println("<div style=\"font-size:18px;font-weight:600; background-color:lightblue; \">Property Category: "+rs.getString(3)+"</div>");
           out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Property Type:</b> "+rs.getString(3) +"</div>");
           out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Property Owener:</b> "+rs.getString(4) +"</div>");
           out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Price:</b> "+rs.getInt(7) +"</div>");
           out.println("<div style=\"font-size:13px;font-weight:200;\">Details: "+rs.getString(6) +"</div>");
           out.println("</td>");
           out.println("<td align=\"left\" valign=\"top\" width=\"200\">");
           out.println("<div style=\"font-size:18px;font-weight:600; background-color:lightblue;\">Address</div>");
           out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Street:</b> "+rs.getString(8) +"</div>");
           out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Location:</b> "+rs.getString(9) +"</div>");
           out.println("<div style=\"font-size:14px;font-weight:200;\"><b>City:</b> "+rs.getString(10) +"</div>");
           out.println("<div style=\"font-size:13px;font-weight:200;\">State: "+rs.getString(11) +"</div>");
           out.println("<div style=\"font-size:14px;font-weight:200;\"><b>Zip:</b> "+rs.getInt(12) +"</div>");
           out.println("</td>");
           
                     }
           %>
                
                </tr>
                       
        
      
          
        </table>
    </body>
    <%@include file="Footer.jsp" %>
