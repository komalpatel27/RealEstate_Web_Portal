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
 <%@page import="org.apache.struts2.components.Include"%>
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
        document.getElementById("cty").innerHTML=xmlHttp.responseText
    }

</script>
 
<body bgcolor="lightyellow">
      
     <link rel="stylesheet" href="abc.css"/>
      
    <div  id="frdesign" style=" width: 37%; height: 250px; float: left; background-color:gainsboro;border-radius: 20px;  ">
        <img src="images/update.jpg" width="100%" height="250px" style="border-radius: 20px;" />
    </div>    

     <div  class="outer"> 
  
     <div  align="center"> <h1 style="color: red"> PERSONAL UPDATE</h1>
                   
    <s:form action="PUpdate" validate="true" >
    <s:hidden name="ctr" value="1"/>
    <s:textfield label="Name" name="name" value="%{name}"  required="true"  />
    <s:datetimepicker label="Date of birth" name="dob" displayFormat="yyyy-MM-dd" value="%{dob}" required="true"/>
   <s:select name="clt" label="Client type" headerKey="" headerValue="%{clt}" list="{'Customer','Agent','Builder'}"/>
   <s:textfield name="addr" label="Address" value="%{addr}" required="true" />
  <s:select  name="state" headerKey="0" headerValue="%{state}" onchange="showCity(this.value)" label="State" list="stateList"/>
  <div> <s:select name="city" id="cty" headerKey="0" headerValue="%{city}" label="City" list="{}"/></div>
 <s:textfield label="Pin code" name="pin" size="15" value="%{pin}" /> 
 <s:textfield label="Country" name="cntry" value="%{cntry}" required="true"/>
 <s:textfield label="Std code" name="stdcd" value="%{stdcd}" required="true"/>
 <s:textfield label="Landline" name="lndline" value="%{lndline}" required="true"/>
 <s:textfield label="Mobile" name="mbl" value="%{mbl}" required="true"/>
  <s:submit value="update" align="center" />
 </s:form>
     </div>
     </div>
</body>
<%@include file="Footer.jsp" %>