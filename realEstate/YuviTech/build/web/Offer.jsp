<%@taglib uri="/struts-tags" prefix="s" %>
<s:head theme="ajax"/>
<%@include file="Header.jsp" %>
<%
                      String clt2=(String)session.getAttribute("clt");
                      if(clt2.equalsIgnoreCase("Admin"))
                      {
                    %>
                    <%@include file="SideMenu.jsp" %>
                    <%
                      }
                     else
                     {
                    %>
                     <%@include file="Customer.jsp" %>
                     <% } %>
                     
<s:form enctype="multipart/form-data" action="AddOff.action" validate="true">
          <s:hidden name="ctr" value="1"/> 
  <table width="50%" border="1">
      <tr>
          <td><s:textfield label="Property Name" name="name" /></td>
          <td> <s:autocompleter name="type" size="12" label="Property Type" list="{'COMMERCIAL','RESIDENTIAL','OTHER'}"/></td>
          <td>  <s:datetimepicker label="Registartion Dtae" displayFormat="yyyy-MM-dd" name="rdate" /></td>
  <s:datetimepicker label="Starting Date" displayFormat="yyyy-MM-dd" name="sdate" />
  <s:datetimepicker label="Ending Date" displayFormat="yyyy-MM-dd" name="edate" />
   <s:autocompleter name="status" size="20" label="Status" list="{'sold','to be sell'}"/>
   <s:autocompleter name="dis" label="Discount" size="10" list="{'10%','15%','20%','25%','30%'}" />
  <s:file name="img" label="Image" size="20"/>  
  <%--<s:textfield label="image" name="img" />--%>
    <s:submit value="Save" />
      </s:form>
      </tr>

    <a href="DelOff.action">click here for DELETE offer & scheme</a><br>

<a href="UpOff.action">click here for UPDATE offer & scheme</a><br>

<a href="ViewOff.action">click here for VIEW the offer & scheme</a>
<%@include file="Footer.jsp" %>