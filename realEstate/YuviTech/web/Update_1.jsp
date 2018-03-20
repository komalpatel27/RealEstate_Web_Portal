<%@page import="org.apache.struts2.components.Include"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
     <s:head theme="ajax"/>
    <head>
        <title>ADMINISTRATOR</title>
       
        <script>
            function view()
            {
             document.forms[0].elements[0].value ="3";
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
                   <%@include file="SideMenu.jsp" %>
                </td>
                <td style="width:3px;" valign="top">
                    <img src="images/1.jpg" height="350" width="7"/>
                </td>
                <td valign="top">
                    <table border="0" width="650" style="border: 1px solid black;">
                        <tr>
                            <td>
                                <s:form enctype="multipart/form-data" action="update.action">
        <table width=100% border=0>
            <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white">UPDATE OFFER & SCHEME</th></tr>
            <tr><th colspan="2" bgcolor="#FFFFEF" align="left">Field marked with asterisk(<b style="color: red">*</b>)  are mandatory.</th></tr>
            
    <td>
     <%
       String s=(String)request.getAttribute("s");
       if(s!=null)
           out.println("               "+s);
      %>
    </td>
            <s:hidden name="ctr" value="4"/>
        <tr>
            <td><s:select name="oid" label="Offer Id"  list="oidList"  onchange="view()"/></td>
        </tr>
        <tr>
            <td><s:textfield name="propertyname" size="18"  value="%{propertyname}" label="Property Name"/></td>
        </tr><tr>
            <td><s:autocompleter name="propertytype" size="12"  label="Property Type" value="%{propertytype}" list="{'Residential','Commercial'}"/></td>
        </tr><tr>
            <td><s:datetimepicker name="registerdate" value="%{registerdate}" displayFormat="yyyy-MM-dd" label="Register Date"/></td>
        </tr><tr>
            <td><s:datetimepicker name="startdate" value="%{startdate}" displayFormat="yyyy-MM-dd" label="Start Date"/></td>
        </tr><tr>
            <td><s:datetimepicker name="enddate" value="%{enddate}" displayFormat="yyyy-MM-dd" label="End Date"/></td>
        </tr><tr>
            <td><s:autocompleter name="status" size="20" label="Status" value="%{status}" list="{'BUY','SOLD','Available','To be sell'}"/></td>
        </tr><tr>
            <td><s:autocompleter name="discount" size="20" value="%{discount}" label="Discount" list="{'10%','20%','30%','40%','50%'}"/></td>
        </tr><tr>
            <td><s:file name="file" value="%{file}" label="Image" size="20"/></td>
        </tr><tr>
            <td colspan="2" align="center"><s:submit value="Update" theme="simple"/></td>
        </tr>
        </tr>
        </table></td><td>&nbsp;</td></tr>
           <tr height=10%><td colspan=3>&nbsp;</td></tr>
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