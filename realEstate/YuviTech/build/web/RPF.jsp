<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<s:head theme="ajax"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>   
        
        <%
           int r=db.DBConnect.getRPC();
           String m=(String)request.getAttribute("m");
           if(m!=null)
               out.println(m);
        %>
        <%@include file="Header.jsp" %>
        <s:form action="RPF.action" method="post" validate="true">
         <table height=100% width=100% border=0>
                                <table width=100% border=0>
                                                               
            <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white"> RESIDENTIAL PROPERTY FEATURES</th></tr>
            <tr><th colspan="2" bgcolor="#FFFFEF" align="left">Field marked with asterik(<b style="color: red">*</b>)  are mandatory.</th></tr>        
              <s:hidden name="counter" value="5"/>
                 <tr>
                    <td><s:select label="Parking" headerKey="0" headerValue="Select" name="parking" list="{'yes','no'}" required="true"/></td>
                </tr>
                
                <tr>
                    <td><s:select label="Swimming pool" headerKey="0" headerValue="Select" name="swimpool" list="{'yes','no'}" required="true"/></td>
                </tr>
               
                <tr>
                    <td><s:select label="Aircondition" headerKey="0" headerValue="Select" name="aircon" list="{'yes','no'}" required="true"/></td>
                </tr>               
                
                <tr>
                    <td><s:select label="Lift" headerKey="0" headerValue="Select" name="lift" list="{'Yes','No'}" required="true"/></td>
                </tr>

                <tr>
                    <td><s:select label="Furnished" headerKey="0" headerValue="Select" name="furnished" list="{'Fully Furnished','Non Furnished'}" required="true"/></td>
                </tr>
                                
                <tr>
                    <td><s:textfield label="Nearest highway distance" name="nhd" value="" size="30"  required="true"/></td>
                </tr>
                
                 <tr>
                    <td><s:textfield label="Nearest bank distance" name="nbd" value="" size="30"  required="true"/></td>
                </tr>
                
                <tr>
                    <td><s:textfield label="Nearest Railways distance" value="" name="nrd" size="30"  required="true"/></td>
                </tr>
                
                <tr>
                    <td><s:textfield label="Nearest hospital distance" value="" name="nhsd" size="30"  required="true"/></td>
                </tr>
                
                <tr>
                    <td><s:textfield label="Nearest school distance" value="" name="nsd" size="30"  required="true"/></td>
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