<%@page import="org.apache.struts2.components.Include"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <title>UPDATE COMPANY</title>
           <script>
     function view()
     {
       document.forms[0].elements[0].value="5";
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
                   <td valign="top">
                    <table border="1" width="650" style="border: 1px solid black;">
                        <tr>
                            <td>
                                <s:form action="update1.action">
                                    
             <table height=100% width=100% border=0>             
             <table  width=50% border=0>
                 <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white">Update Data</th></tr>   
                 
             <s:hidden name="ctr" value="4"/>
            <tr>
                <td> <s:property value="msg"/></td>
            <tr><td><s:select name="compid" label="Company Id" list="complist" onchange="view()"/></td></tr>
            <td><s:textfield name="name"  label="Name"  size="20"/></td>
            <td><s:textfield name="addr"  label="Address" size="50"/></td>
            </tr>
            <tr>
            <td><s:textfield name="cpname"  label="ContactPersonName" size="20"/></td>
            <td><s:textfield name="cpmob"  label="ContactPersonMobile" size="20"/></td>
            </tr>
            <tr>
            <td><s:textfield name="cpmid" label="ContactpersonMailId" size="20"/></td>
            <td><s:textfield name="uid"  label="UserId" size="20"/></td>
            
            <td><s:submit value="Submit" /></td>
            </tr>
           </table>
        </s:form>
                 <a href="index.jsp">Home</a>
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