<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<s:head theme="ajax"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/abc.css"/>      
    </head>   
        <%@include file="Header.jsp"%>
        <div class="outer">
   <s:form action="sendquotation.action" method="post">
         <table style="margin-left: 60px; margin-top: 10px;" border=0>
                                                                                              
            <tr><th colspan="2" align="center" style="color: steelblue; font-size: 20"><b> Post Requirement</b> </th></tr>
            <tr><th colspan="2" align="center">Field marked with (<b style="color: red">*</b>)  are mandatory.</th></tr>        
              <s:hidden name="counter" value="1"/>
                                    
                <tr>
                    <td><s:textfield label="Email-Id" name="email" size="30"  required="true"/></td>
                </tr>
                <tr>
                    <%
                      String m=(String)request.getAttribute("m");
                      if(m!=null)
                          out.println(m);
                    %>
                </tr> 
                 <tr>
                    <td><s:textfield label="Contact No." name="mb" size="30"  required="true"/></td>
                </tr>              
                
                <tr>
                    <td><s:textarea label="Description" name="desc" rows="20" cols="25"  required="true"/></td>
                </tr>                             
                 <tr>
                    <td><s:submit value="Submit" /></td>                    
                   
                
</table>
            
              </s:form>
        </div>
              <%@include file="Footer.jsp" %>
</html> 