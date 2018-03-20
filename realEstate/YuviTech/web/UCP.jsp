<%
            String clt1=(String)session.getAttribute("clt");
            if(clt1.equalsIgnoreCase("Admin"))
            {
        %>
        <%@include file="ahead.jsp"%>
        <% }
          else
          {                
         %>
         <%@include file="Header.jsp"%>
         <%}%>
 
<s:head theme="ajax"/>
<script language="javascript" type="text/javascript">
         
    var xmlHttp
    function showCity(str)
    {
      // xx = new XMLHttpRequest;
      if (window.ActiveXObject) // for Internet explorer
        xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      else //if (xx != "undefined") // for any browser excluding IE
        xmlHttp= new XMLHttpRequest(); // XML HTTP Request object design. 
      /*if (xmlHttp==null)
      {
        alert("Browser does not support XMLHTTP Request")
        return;
      }*/
      var url="city.jsp?t="+str;
      xmlHttp.onreadystatechange = myState;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
    }
    function myState()
    {
    //  alert(xmlHttp.readyState);  
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        document.getElementById("cty").innerHTML=xmlHttp.responseText;
    }
   
  function showTr(str2)
  {
      if(str2=="Rent")
          {
              document.getElementById("Duration").style.display="Block";
          }
          else
              {
                  document.getElementById("Duration").style.display="none";
              }
  }
   </script>
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
                    <div id="div1" style="border: 1px solid black;border-radius:8px;  float: left;margin-top:0px;"><img src="images/MC.gif " width="180" height="320" style="border-radius:8px;"/></div>
                  
                   
                     <% } %>
                     
    <%
       String m=(String)request.getAttribute("m");
       if(m!=null)
           out.println(m);
    %>
    <s:form enctype="multipart/form-data" theme="simple" action="APCC">
        <s:hidden name="counter" value="11"/>
            <table>
             <table width=100% border=0>                                                               
            <tr><th colspan="2" bgcolor="#0d2b4a" style="color:white">POST COMMERCIAL PROPERTY </th></tr>
            <tr><th colspan="2" bgcolor="#FFFFEF" align="left">Field marked with asterik(<b style="color: red">*</b>)  are mandatory.</th></tr>
            
          <tr><td colspan="2"><s:radio name="proCategory" onchange="showTr(this.value)" label="Property Category" list="{'Sale','Rent'}" /></td></tr>
          <tr><td>User Id</td><td><s:textfield name="userId" size="20"/></td></tr>
          <tr><td>Property Price Type</td><td><s:select list="{'Inch','Square','Yard'}" name="proPrice" /></td></tr>
          <tr><td>Property Type</td><td><s:textfield name="proType"  value="Commercial" readonly="true"/></td></tr>
          <tr><td>Property Sub Type</td><td><s:select name="proSType" list="cList"/></td></tr>
          <tr><td>Property Name</td><td> <s:textfield name="proName" size="20"/></td></tr>          
          <tr><td>Bath Room</td><td><s:select list="number" headerKey="None" headerValue="Select" name="bathRoom" /></td></tr>        
          <tr><td>Property Image</td><td><s:file name="proImage" size="50"/></td></tr>     
          <tr><td>Street</td><td><s:textfield name="street" size="20"/></td></tr>
          <tr><td>Location</td><td><s:textfield name="loc" size="20"/></td></tr>
          <tr><td>State</td><td><s:select  name="state" required="true" headerKey="0" headerValue="Select State" onchange="showCity(this.value)" list="stateList"/></td></tr>
          <tr><td>City</td><td><s:select name="city" id="cty" headerKey="0" headerValue="Select City" list="{}"/></td></tr>
          <tr><td>Zip Code</td><td><s:textfield name="zip" size="20"/></td></tr>
          <tr><td>Floor No</td><td><s:select list="number" headerKey="None" headerValue="Select" name="floorNo"/></td></tr>
          <tr><td><s:datetimepicker name="dateOfReg" label="Registration Date" theme="ajax" displayFormat="yyyy-MM-dd" /></td></tr>
          <tr><td>Total Price</td><td><s:textfield name="totPrice" size="20"/> </td></tr>
          <tr><td>Is Free Hold</td><td> <s:select name="isFreehold" list="{'Yes','No'}"/> </td></tr>
          <tr><td>Property Status</td><td><s:radio name="proStatus" list="{'Under Construction','Ready to Move'}"/> </td></tr>      
          <tr><td>Max Floor</td><td><s:textfield name="maxFloor" size="10"/></td></tr>
          <tr><td>Area Feet</td><td><s:textfield name="proAreafeet" size="20"/></td></tr>
          <tr id="Duration"><td>Rent Duration</td><td><s:textfield name="rentDur" size="20"/></td></tr>
          <tr><td>Description</td><td><s:textarea name="proDetails"  theme="simple" cols="30" rows="5"/></td></tr>
          <tr><td colspan="2" align="right" bgcolor="#0d2b4a"><s:submit value="C O N T I N U E"/></td></tr>
          </table> 
            </table>
    </s:form>
    <%@include file="Footer.jsp"%>