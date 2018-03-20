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
       document.forms[0].elements[0].value="6";
       document.forms[0].submit();
     }
        </script>
    </head>   
   
   <s:form action="URPF.action" method="post">
         <table height=100% width=100% border=0>
                                <table width=100% border=0>
                                                               
            <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white"> UPDATE RESIDENTIAL PROPERTY FEATURES</th></tr>
            <tr><th colspan="2" bgcolor="#FFFFEF" align="left">Field marked with asterik(<b style="color: red">*</b>)  are mandatory.</th></tr>        
              <s:hidden name="counter" value="9"/>
                <tr>
                    <td><s:select label="Residential Property Feature" name="rpf" list="rpfList" onchange="view()"/></td>
                </tr>
                 <tr>
                    <td><s:select label="Parking" name="parking" value="%{parking}" list="{'yes','no'}"/></td>
                </tr>
                <tr>
                    <td>
                        <s:select label="Swimming pool" name="swimpool" value="%{swimpool}" list="{'yes','no'}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:select label="AirConditioner" name="aircon" value="%{aircon}" list="{'yes','no'}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:select label="Lift" name="lift" value="%{lift}" list="{'yes','no'}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                       <s:select label="Furnished" name="furnished" list="{'Fully Furnished','Non Furnished'}" required="true"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:textfield label="Nearest Highway Distance" name="nhd" value="%{nhd}" size="30"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:textfield label="Nearest Bank Distance" name="nbd" value="%{nbd}" size="30"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:textfield label="Nearest Railways distance" name="nrd" value="%{nrd}" size="30"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:textfield label="Nearest Hospital distance" name="nhsd" value="%{nhsd}" size="30"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <s:textfield label="Nearest School distance" name="nsd" value="%{nsd}" size="30"/>
                    </td>
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
