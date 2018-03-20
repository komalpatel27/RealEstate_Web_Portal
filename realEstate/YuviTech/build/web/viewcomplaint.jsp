<%@page import="org.apache.struts2.components.Else"%>
<%@page import="java.io.*,java.sql.*"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="ahead.jsp" %>
<div>
    
        <table align="left" border="0" style="width:1000px;height:inherit;background-color: white;">
            
            <tr style="border: none;">
                <td valign="top" style="width:320;border: none;">
                   <%@include file="SideMenu.jsp" %>
                </td>
                               
           <td>
          <%
         int ctr=0;
         int counter=0;
          boolean flag=true;
          ResultSet rs=db.DBConnect.getcomplaint();
        if(rs.next())
          {
            ctr++;
        }
         if(rs.previous()){} 
      
        if(ctr!=0)
        {            
      
      out.println("<div style=\"align=center\">");   
      out.println("<form action=\"ViewComp.action\">");         
      out.println("<table border=0 style=\"height:auto;border:1px solid black; width:600px; margin-left:20px;align=center\">");
     %>
          <s:property value="msg"/>
               <%
      out.println("<tr>");
      out.println("<td style=\"width:0px;\">");
      out.println("</td>");
      out.println("<td align=\"left\" valign=\"top\">");                                             
      out.println("<tr>");  
      out.println("<th >");
      out.println("<div style=\"font-size:18px;font-weight:200;\">"+"NAME" +"</div>");
      out.print("</th>");
      out.println("<th >");
      out.println("<div style=\"font-size:18px;font-weight:200;\">"+"MESSAGE" +"</div>");
      out.print("</th>");
      out.println("</td>");
      out.println("</tr>");
      out.println("</tr>");
      out.println("</table>");
      out.println("</div>");
   while (rs.next())
   {
       
       
      counter ++;
        flag=false;
       out.println("<div style=\"align=center float=left\">");
        out.println("<input type=\"hidden\" name=\"ctr\" value=\"2\"/>");
        out.println("<input type=\"hidden\" name=\"cid\" value=\'"+rs.getInt(1)+"'/>");
        out.println("<table border=0 style=\"height:auto;border:1px solid black; width:600px; margin-left:20px;align=center\">");
        out.println("<tr>");
        out.println("<td style=\"width:0px;\">");
        out.println("</td>");
        out.println("<td align=\"left\" valign=\"top\">");
        out.println("<div style=\"font-size:18px;font-weight:200;\">"+rs.getString(2) +"</div>");
        out.println("</td>");
        out.println("<td>");
        out.println("<div style=\"font-size:13px;font-weight:200;\">"+rs.getString(3) +"</div>");         
        out.println("</td>");
        out.println("<td>");
        out.print("<input type=\"submit\" value=\"RESOLVE\"\">");
        out.println("</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td colspan=2>");
        out.println("</td>");
        out.println("</tr>");
        out.println("</table>");
                      }
        out.println(counter+" . Record Searched, ");
        out.println("</div>");
             }
          else
                           {
   if(flag)
       out.println("sorry thier is no complaints");
     }

            %>
</div>
</td>
 </tr>
        </table>
<%@include file="Footer.jsp" %>