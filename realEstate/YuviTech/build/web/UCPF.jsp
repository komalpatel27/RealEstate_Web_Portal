 <%
            String clt1=(String)session.getAttribute("clt");
            if(clt1!=null)
             {
            if(clt1.equalsIgnoreCase("Admin"))
            {
        %>
        <%@include file="ahead.jsp"%>
        <% }
          else
          {                
         %>
         <%@include file="Header.jsp"%>
         <%}}%>
       
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<s:head theme="ajax"/>
<html>
    <head>
        <script>
     function view()
     {
       document.forms[0].elements[0].value="8";
       document.forms[0].submit();
     }
        </script>
    </head>
   <s:form action="UCPF.action" method="post">
         <table height=100% width=100% border=0>
           <table width=100% border=0>                                                               
            <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white"> COMMERCIAL PROPERTY FEATURES</th></tr>
            <tr><th colspan="2" bgcolor="#FFFFEF" align="left">Field marked with asterik(<b style="color: red">*</b>)  are mandatory.</th></tr>
            
                 <s:hidden name="counter" value="9"/>
                <tr>
                    <td><s:select label="Commercial Property feature" name="cpf" list="cpfList" onchange="view()"/></td>
                </tr>
                <tr>
                    <td>
                        <s:select label="Parking" name="parking" value="%{parking}" list="{'yes','no'}"/>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <s:select label="Swimming pool" name="swimpool" value="%{swimpool}" list="{'yes','no'}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:select label="Airconditioner" name="aircon" value="%{aircon}" list="{'yes','no'}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:select label="Bath Room" name="bathroom" value="%{bathroom}" list="{1,2,3,4,5}"/>
                    </td>
                </tr>
                <tr>
                    <td><s:textfield label="Nearest highway distance" name="nhd" value="%{nhd}" size="30"/></td>
                </tr>
                
                 <tr>
                    <td><s:textfield label="Nearest bank distance" name="nbd" value="%{nbd}" size="30"/></td>
                </tr>
                
                <tr>
                    <td><s:textfield label="Nearest Railways distance" name="nrd" value="%{nrd}" size="30"/></td>
                </tr>
                
                <tr>
                    <td><s:textfield label="Nearest hospital distance" name="nhsd" value="%{nhsd}" size="30"/></td>
                </tr>
                             
                 <tr>
                    <td colspan="2" align="right" bgcolor="#0d2b4a"><s:submit value="Submit"/></td>                    
                   
                </tr>                                    
                               
            
                </table></td><td>&nbsp;</td></tr>                             
                                            
            <tr height=10%><td colspan=3>&nbsp;</td></tr>
</table>
            
              </s:form>
              <%@include file="Footer.jsp" %>
</html> 
