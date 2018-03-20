<%@taglib uri="/struts-tags" prefix="s" %>
    <s:head theme="ajax"/>
   <%@include file="Header1.jsp"%>
    <s:form  action="DeletePropertyAction.action"> 
        <table height=0% width=100% border=0>
            <td width=60%><table width=100% border=0>                                                               
            <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white"> DELETE PROPERTY </th></tr>
            <tr><th colspan="2" bgcolor="#FFFFEF" align="left">Field marked with asterik(<b style="color: red">*</b>)  are mandatory.</th></tr>
            
                <s:hidden name="counter" value="3"/>
              <tr><td>            
             <s:autocompleter name="propCode" label="Property Code" list="propertyCodeList" /> </td></tr>        
              <tr >    <td > <s:submit value="Submit" align="center"/>
                    </td></tr> 
                 </table>
    </s:form>
      <%@include file="Footer.jsp"%>