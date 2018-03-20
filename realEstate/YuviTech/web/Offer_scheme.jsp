<%@page import="org.apache.struts2.components.Include"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <s:head theme="ajax"></s:head>
    <head>
        <title></title>
        <script>
            function view(){
                document.forms[0].submit();
            }
        </script>
    </head>
    <body>
        <%@include file="ahead.jsp"%>
        <div>
        <table align="left" border="0" style="width:1000px;height:inherit;background-color: white;">
            <tr>
                <td valign="top" style="width:320;">
                   <%
                      String clt=(String)session.getAttribute("clt");
                      if(clt.equalsIgnoreCase("Admin"))
                      {
                   %>
                  <%@include file="SideMenu.jsp" %>
                     
                    <%
                      }
                     else
                     {
                    %>
                   <div id="div1" style="border: 1px solid black;border-radius:8px;  float: left;margin-top:0px;"><img src="images/MC.gif " width="180" height="320" style="border-radius:8px;"/></div>
                     <% } %>
     
                </td>
                                <td valign="top">
                    <table border="0" width="650"  style="border: 1px solid black;">
                        
                        <tr>
                            <td>
                                <s:form enctype="multipart/form-data" action="offer.action" validate="true">
        <table height=100% width=100% border=0>
           <table width=100% border="0">
            <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white">ADD OFFER & SCHEME</th></tr>
            <tr><th colspan="2" bgcolor="#FFFFEF" align="left">Field marked with asterisk(<b style="color: red">*</b>)  are mandatory.</th></tr>
            
    <td>
     <%
       String s=(String)request.getAttribute("s");
       if(s!=null)
           out.println("               "+s);
      %>
    </td>
    
        <s:hidden name="ctr" value="1"/>
        <tr>
            <td> <s:textfield name="propertyname" size="18" value="" label="Property Name"/></td>
        </tr>
        <tr>
            <td><s:autocompleter name="propertytype" size="12" label="Property Type" value="select" list="{'Residential','Commercial'}"/></td>
        </tr>
        <tr>
            <td><s:datetimepicker name="registerdate" displayFormat="yyyy-MM-dd" label="Register Date"/></td>
        </tr>
        <tr>
            <td><s:datetimepicker name="startdate" displayFormat="yyyy-MM-dd" label="Start Date"/></td>
        </tr>
        <tr>
            <td><s:datetimepicker name="enddate" displayFormat="yyyy-MM-dd" label="End Date"/></td>
        </tr>
        <tr>
            <td><s:autocompleter name="status" size="20" label="Status" value="select" list="{'BUY','SOLD','Available','To be sell'}"/></td>
        </tr>
        <tr>
            <td><s:autocompleter name="discount" size="20" value="select" label="Discount" list="{'10%','20%','30%','40%','50%'}"/></td>
        </tr>
        <tr>
            <td><s:file name="file" label="Image" size="20"/></td>
        </tr>
        <tr><td colspan="2" bgcolor="#ffffff" align="center"><s:submit value="Save" theme="simple"/></td></tr>
       
</table>
        </table>
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