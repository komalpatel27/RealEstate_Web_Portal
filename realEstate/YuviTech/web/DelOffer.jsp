<%@taglib uri="/struts-tags" prefix="s" %>
<s:head theme="ajax"/>
  <%@include file="Header1.jsp" %>
      <s:form action="del.action">
          <table height=100% width=100% border=0>
           <table width=100% border=0>
            <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white">DELETE OFFER & SCHEME</th></tr>
            <s:hidden name="ctr" value="2"/>
            
    <td>
     <%
       String s=(String)request.getAttribute("s");
       if(s!=null)
           out.println("               "+s);
      %>
    </td>
          <tr>
              <td><s:autocompleter name="oid" label="Offer Id" value="select" list="oidList" /></td>
          </tr><tr>
              <td colspan="2" align="right" bgcolor="#0d2b4a"><s:submit value="Delete"/></td>
              </tr>
              </table></td><td>&nbsp;</td></tr>
           <tr height=10%><td colspan=3>&nbsp;</td></tr>
</table>
      </s:form>
   <%@include file="Footer.jsp" %>