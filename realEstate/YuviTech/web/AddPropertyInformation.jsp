<%@taglib uri="/struts-tags" prefix="s" %>
<html>
     <s:head theme="ajax" debug="false"/>
     
    <head>
        <link rel="stylesheet" href="css/abc.css"/>
        <title></title>
<style>
    #one,#two
    {
        width: 850px;
        height:700px;
        background-color: #d8e7e2;
        border: 2px solid black;
    }
    #test{
        width:850px;
        height: 700px;
        border: 2px medium black;
        
    }
     #res{
        margin-left: 280px;
    }
    #head
    {
        margin-top: 20px;
        width:800px;
        height: 600px;
        border: 2px solid orange;
    }
    #textar{
        margin-top: 20px;
       margin-left: 200px;
       margin-right: 200px;
      
    }
    
</style>
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
    </head>
    <body>
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
          

        <div>
            
        <table align="left" border="0">
            <tr>
                <td valign="top" style="width:320;">
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
                    <img src="images/r1.gif " width="450" height="700" style="border-radius:8px;"/>
                     <% } %>
                </td>
                </tr>
        </table>
                                
         <div class="outer">        
        <div align="center">
            <s:form enctype="multipart/form-data"  action="APC.action"  validate="true">
            <s:hidden name="counter" value="1"/>
            <table border="0">
          <tr><th colspan="4"> Post Residential Property</th></tr>
          <tr><td colspan="2">
                  <%--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      Sale <input type="radio" name="proCategory" id="add" value="Sale"/>
                        Rent <input type="radio" name="proCategory" id="add" value="Rent"/>
                        Buy <input type="radio" name="proCategory" id="add" value="Buy"/>--%>
   
                  <s:radio name="proCategory" id="add" label="Property Category" onchange="showTr(this.value)" list="{'Rent','Buy','Sale'}" /></td>
              <td><s:select label="Property Price Type" theme="ajax" required="true" list="{'Inch','Square','Yard'}" name="proPrice" /></td></tr>
          <tr> <td><s:textfield name="proType" theme="ajax" required="true" label="Property Type" value="Residential" readonly="true"/></td>
               <td><s:select label="Property Sub Type" theme="ajax" required="true" name="proSType" list="rList"/></td> </tr>
          <tr><td> <s:textfield label="Property Name" theme="ajax" required="true" name="proName" size="20"/></td>
              <td><s:select name="bedRoom" label="Bedroom" theme="ajax" required="true" list="{1,2,3,4,5,6,7,8}" headerKey="0" headerValue="Select" /></td></tr>
          <tr><td><s:select list="{1,2,3,4,5,6,7,8}" label="Bathroom" required="true" theme="ajax" headerKey="0" headerValue="Select" name="bathRoom" /></td>
              <td> <s:select list="{1,2,3,4,5,6,7,8}" label="Hall" required="true" theme="ajax" headerKey="0" headerValue="Select" name="hall" /></td></tr>
          <tr><td><s:select list="{1,2,3,4,5,6,7,8}" label="Kitchen" required="true" theme="ajax"  headerKey="0" headerValue="Select" name="kitchen"/></td>
              <td><s:file name="proImage" label="Property Image" required="true" theme="ajax" size="20"/></td></tr>     
          <tr><td><s:textfield label="Street" name="street" value="" required="true" theme="ajax" size="20"/></td>
              <td><s:textfield name="loc" label="Location" value="" required="true" theme="ajax" size="20"/></td></tr>
          <tr><td><s:select  name="state" required="true" theme="ajax" headerKey="0" headerValue="Select State" onchange="showCity(this.value)" label="State" list="stateList"/></td>
              <td><s:select name="city" label="City" theme="ajax" id="cty" headerKey="" headerValue="Select City" list="{}"/></td></tr>
          <tr><td><s:textfield name="zip" label="Zip Code" value="" required="true" theme="ajax" size="20"/></td>
              <td><s:select list="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}" required="true" label="Floor No" theme="ajax" headerKey="0" headerValue="Select" name="floorNo"/></td></tr>
          <tr><td><s:textfield label="Total Price" theme="ajax" value="" required="true" name="totPrice" size="20"/> </td>
              <td> <s:select name="isFreehold" theme="ajax" required="true" label="Is Free Hold" list="{'Yes','No'}"/> </td></tr>
          <tr><td><s:radio label="Property Status" theme="ajax" required="true" name="proStatus" list="{'Under Construction','Ready to Move'}"/> </td>     
              <td><s:textfield name="maxFloor" theme="ajax" value="" required="true" label="Max Floor" size="10"/></td></tr>
          <tr><td><s:textfield name="proAreafeet" label="Area Feet" required="true" size="20"/></td></tr>
           <tr id="Duration"><th>Rent Duration </th><td colspan="2"><s:textfield name="rentDur"  label="Rent Duration" size="20" theme="simple"/></td></tr>
          <tr><th>Description</th><td colspan="2"><s:textarea theme="simple" required="true" name="proDetails" cols="30" rows="5"/></td></tr>
          <tr><s:submit value="CONTINUE"  /></tr>
            </table>
      
            </s:form>
     </div> 
         </div>
        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>