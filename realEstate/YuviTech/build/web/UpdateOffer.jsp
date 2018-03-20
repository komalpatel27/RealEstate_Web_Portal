<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
    <script>
     function view()
     {
       document.forms[0].elements[0].value="3";
       document.forms[0].submit();
     }
      </script>
</head>   
    <s:head theme="ajax"></s:head>
    <%@include file="Header.jsp" %>
    <%--<s:property value="idlist"/>--%>
        <s:form enctype="multipart/form-data" action="UpOff.action" > 
        <s:hidden name="ctr" value="4"/>
       
        <table width="50%" height="50%" border="1" bordercolor="red">
            <tr>     <s:select name="i" label="Offer Id"  list="idlist"  onchange="view()"/>
        
            <tr> <td> <s:textfield name="name" value="%{name}" size="18" label="Property Name" /></td></tr>
        
            <td><s:textfield name="type" size="12" value="%{type}" label="Property Type"  />
        
                <td>  <s:datetimepicker name="rdate" value="%{rdate}" displayFormat="yyyy-MM-dd"  label="Register Date"/>
        
                <td> <s:datetimepicker name="sdate" value="%{sdate}" displayFormat="yyyy-MM-dd"  label="Start Date"/>
        
                <td> <s:datetimepicker name="edate" value="%{edate}" displayFormat="yyyy-MM-dd"  label="End Date"/>
        
                <td> <s:textfield name="status" size="20" value="%{status}" label="Status" />
        
                <td> <s:textfield name="dis" size="20" value="%{dis}" label="Discount"/>
                   
                <tr>  <td> old image </td> <td>
                 <%
                    int id = (Integer)session.getAttribute("id");
                    session.setAttribute("src","Photo.jsp?m="+id );
                    out.print( "<img src=Photo.jsp?m="+id+ " border=2 width=250/> ");
                 %></td>
                    
               <%--<td>  <s:file name="img" label="Image" value="%{img}" size="20"/>   --%>
      <s:file name="img" label="Change image"  size="20"/> 
        
                <td>  <s:submit value="Update"/> </tr></table>
        </s:form> 
        <%@include file="Footer.jsp" %>
</html>