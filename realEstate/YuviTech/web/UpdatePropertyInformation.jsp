<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="org.apache.struts2.components.Else"%>
<%@page import="org.apache.struts2.components.Include"%>

    <s:head theme="ajax"/>
<script>
    function view()
    {
        document.forms[0].elements[0].value="12";
       document.forms[0].submit();
    }
   
   </script>
   <%@include file="Header1.jsp" %>
 
   <div align="center">
       <s:form enctype="multipart/form-data" action="UpdatePropertyAction.action">  
           <div style="alignment-adjust: auto">      
    
         <s:hidden name="counter" value="2" />
          <%
                    int id = (Integer)session.getAttribute("id");
                    session.setAttribute("src","Pphoto.jsp?n="+id );                  
                    out.print("<img src=Pphoto.jsp?n="+id+" border=2 width=200/>");
           %>
        <b> <s:select name="propCode" label="Property Code"  theme="ajax" list="propertyCodeList" onchange="view()" /></b>
         
           <s:textfield name="userId"  theme="ajax" label="Enter User Id" value="%{userId}" size="20"/>
        <s:textfield name="proCategory" theme="ajax" label="Enter Property Category" value="%{proCategory}" size="20"/>
        <s:textfield name="proAreafeet"  theme="ajax" label="Enter Propert Feet" value="%{proAreafeet}" size="20"/>
        <s:textfield name="proType"  theme="ajax" label="Enter Property Type" value="%{proType}" size="20"/>
        <s:select name="bedRoom"  theme="ajax" label="Number Of Bed Room" list="{1,2,3,4,5,6,7}"/>
       <s:select name="bathRoom"  theme="ajax" label="Number Of Bath Room" list="{1,2,3,4,5}"/>
       <s:select name="hall"  theme="ajax" label="Number Of Hall" list="{1,2,3,4,5}"/>
       <s:select name="kitchen"  theme="ajax" label="Number Of Kitchen" list="{1,2,3,4}"/>
       <s:select name="maxFloor"  theme="ajax" label="Maximum Number Of Flor" list="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}"/>
      <s:textfield name="proName"  theme="ajax" label="Enter Property Name" value="%{proName}" size="20"/>
        
      <s:file name="proImage"  theme="ajax" label="Change Image"  size="20"/>
       <s:textfield name="isFreehold"  theme="ajax" label="Is Free Hold" value="%{isFreehold}" size="20"/>
       <s:textfield name="proFloor"  theme="ajax" label="Enter Foor Number" value="%{proFloor}" size="20"/>
       <s:datetimepicker label="Date Of Registration"  name="dateOfReg" value="%{dateOfReg}" theme="ajax" displayFormat="yyyy-MM-dd"/>
       <s:textfield name="proStatus" label="Enter Property Status                                                                                                                                                                                                                                                                                                                                                                                                                                                                             atus" value="%{proStatus}" size="20"/></td></tr>
     Provide further Details <s:textarea name="proDetails" theme="simple" rows="5" value="%{proDetails}" cols="10"/>
      <s:submit value="Submit"/>
      
       </s:form>
   </div>
       <%@include file="Footer.jsp" %>