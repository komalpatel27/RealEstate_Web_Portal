
<%@page import="org.apache.struts2.components.Include"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <title></title>
        <script>
            function view(){
                document.forms[0].submit();
            }
        </script>
    </head>
    <body>
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
        else
       {
           %>
           <%@include file="Header.jsp"%>
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
  
        <div>
                     
           
        <table align="left" border="0" style="width:1000px;height:inherit;background-color: white;">
            <tr>
                <td valign="top" style="width:320;">
                    <%
                      String clt3=(String)session.getAttribute("clt");
                      if(clt3!=null)
                        {
                      if(clt3.equalsIgnoreCase("Admin"))
                      {
                                            %>
                   
                    <%@include file="SideMenu.jsp" %>
                    <%
                      }
                   else
                   {
                    %>
                     <div id="div1" style="border: 1px solid black;border-radius:8px;  float: left;margin-top:0px;"><img src="images/MC.gif " width="280" height="320" style="border-radius:8px;"></div>
                     <%
                   }
                  }
                      else
                       {
                        out.println("please login again");  
                      }
                      %>
                   
                      
                    
           
                </td>
                
                <td valign="top">
                    <table border="1" width="650" style="border: 1px solid black;">
                        <tr>
                            <td>                               
                                <img src="images/advertisement.jpg" width="100%" height="230px" />
                                 <%
                            String m=(String)request.getAttribute("m");
                            if(m!=null)
                            {
                                out.println("<b style=color: #b56767>"+m);
                            }
                        %>
                            </td>
                        </tr>
                        
                            <td>
                                <s:form action="ARCP.action">
                                <b>&nbsp;&nbsp;Select Property Type For Post</b>
                                <div><s:hidden value="10" name="counter"/></div>
                                <div><s:select list="{'Residential','Commercial'}" headerKey="None" headerValue="Select" name="pType" onchange="view(this.value)" /></div>
                                </s:form>
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