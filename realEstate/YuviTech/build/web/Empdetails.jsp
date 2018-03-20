<%@include file="ahead.jsp"%>
<s:head theme="ajax"/>
<link rel="stylesheet" href="abc.css"/>

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
    <div   style=" width: 37%; margin-top: 30px; height: 500px; float: left; background-color:gainsboro;border-radius: 20px;  ">
        <img src="images/property.jpg" width="100%" height="500px" style="border-radius: 20px;" />
    </div>    

<div class="outer">  

    
         <div align="center"  > <h1 style="color: red"> EMPLOYEE  REGISTRATION FORM</h1>
             <s:property value="msg"/>

    <s:form action="Emp.action" validate="true" >
  <s:hidden name="ctr" value="10"/>
  <s:textfield label="Email" name="email" required="true"/>
  <s:password label="passward" name="pass" required="true"/>
  <s:textfield label="Name" name="cname" size="15" required="true"/>
   <s:textfield label="D O B(yy-mm-dd)" name="dob" required="true"/>
  <s:select name="clt" label="Client type" headerKey="" headerValue="select" list="{'Customer','Agent','Builder','Employee'}"/>
  <s:textfield name="addr" label="Address" required="true" />
  <div><s:select  name="state" headerKey="0" headerValue="Select State" onchange="showCity(this.value)" label="State" list="stateList"/></div>
 <s:select name="city" id="cty" headerKey="0" headerValue="Select City" label="City" list="{}"/>
 <s:textfield label="Pin code" name="Pin" size="15" value="" required="true"/> 
  <s:textfield label="Country" name="cntry" required="true"/>
  <s:textfield label="Std code" name="stdcd" required="true"/>
  <s:textfield label="Landline" name="lndline" required="true"/>
  <s:textfield label="Mobile" name="mbl" required="true"/>
  <s:select label="Sequrity question" name="sq" headerKey="" headerValue="select seq question" list="{'what your nick name','what your mother name','what your pet name','what your favorite childhood friend','what was your childhood '}" required="true" />
  <s:textfield label="Answer" name="sa" required="true"/>
  <s:submit value="Continue" align="center" />
 </s:form>
    </div>
</div>
    <%@include file="Footer.jsp"%>
</body>