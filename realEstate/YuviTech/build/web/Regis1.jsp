<%@include file="Header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s" %>
    <div style="position:static;">
        
            <div id="div1" style="border: 1px solid black;border-radius:8px;  float: left;margin-top:0px;"><img src="images/MC.gif " width="180" height="320" style="border-radius:8px;"/></div>
        
        
 <div  id="frdesign" align="center" style="margin-top: 0 px;background-color: lavenderblush;position: relative;float: left;">
     
            <h1 style="color: red"/>  
  <br/><a href="SUpdate.action">Security Update</a>
  <br/><a href="PUpdate.action">Personnel Update</a>
  <br/><a href="Feedback.action">Feedback</a>
   <br/><a href="Comp.action"> Complaint Report</a>
   <%-- <br><a href="RPF.action">Residential Property Feature</a>
   <br><a href="CPF.action">Commercial Property Feature</a>
   <br><a href="UpdatePropertyAction.action">Update Property Information</a>
<br><a href="DeletePropertyAction.action">Delete Property Information</a>
   <br> <a href="ARCP.jsp">Add  Property</a>
   <br><a href="APC.action">Add Property Information</a>--%>
   <br/><a href="PChange.action">Change Password</a>
        </div>

<div id="div2" style="float:left;position:relative; margin-left: -70px;margin-top: 0px;width: 190px; height:inherit;"><blink>OFFERS/SCHEME</blink>
    <% 
        out.println("<marquee direction=\"up\" style=\"height:300px;\" loop=\"INFINITE\" behaviour=\"\" vspace=\"\" onmouseover=\"this.stop()\"  onmouseout=\"this.start()\">");
    ResultSet rs = db.DBConnect.getOfferScheme();
        while(rs.next())
                       {
        int id= rs.getInt(1);
        
        out.println("<form>");
        out.println("<input type=\"hidden\" name=\"ctr\" value=\"5\"/>");
        out.println("<input type=\"hidden\" name=\"oid\" value=\'"+rs.getInt(1)+"'/>");
        out.println("<table border=0 style=\"height:auto;border:1px solid black; width:100px; margin-left:0px;\">");
        out.println("<tr>");
        out.println("<td>");
        out.println("<div style=\"width:80px; height:80px; background-color:blue;\"><img src='Photo.jsp?n="+id+"'width=80 height=80/></div>");
        out.println("</td>");
        out.println("<td align=\"left\" valign=\"top\">");
        //out.println("<div style=\"font-size:22px;font-weight:600;\">Offer Id: "+rs.getInt(1)+"<srdiv>");
        out.println("<div style=\"font-size:20px;font-weight:100; background-color:lightblue;width:80px;position:relative; float:left\">"+rs.getString(2)+"</div>");
        out.println("<div style=\"font-size:12px;font-weight:50; color:orange;\">Discount:"+rs.getInt(8) +"%</div>");
        out.println("<div style=\"font-size:12px;font-weight:50;\">Register Date: "+rs.getString(4) +"</div>");
        out.println("<div style=\"font-size:12px;font-weight:50;\">Start Date: "+rs.getString(5) +"</div>");
        out.println("<div style=\"font-size:12px;font-weight:50;\">End Date: "+rs.getString(6) +"</div>");
        out.println("<div style=\"font-size:12px;font-weight:50;\">Status: "+rs.getString(7) +"</div>");
        out.println("<div style=\"font-size:12px;font-weight:50;\">Type: "+rs.getString(3) +"</div>");
        out.println("</td>");
        out.println("</tr>");
        out.println("</table>");
        out.println("</form>");
        out.println("<br/>");
        }
         out.println("</marquee>");
            %>
    </div>

    </div>
<%@include file="Footer.jsp"%>