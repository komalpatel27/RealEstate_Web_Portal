<%@taglib  uri="/struts-tags" prefix="s" %>


 <s:form action="delete1.action" cssClass="form-horizontal">
             <table height=100% width=100% border=2>             
             <table  width=50% border=0>
                 <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white">delete Data</th></tr>   
                 
                 <s:hidden name="ctr" value="3"/>
                 <s:select  name="compid" list="complist"/>
                 <tr><td><s:submit value="Submit" /></td></tr>
             </table>
             </s:form>
<a href="index.jsp">Home</a>