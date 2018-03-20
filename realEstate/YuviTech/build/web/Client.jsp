<%@include file="Header.jsp"%>
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

    <div   style=" width: 470px; margin-top: 5px; height: 550px; float: left; background-color:gainsboro;border-radius: 20px;  ">
        <img src="images/property.jpg" width="470" height="550px" style="border-radius: 20px;" />
    </div>    
<div>
<div class="outer">  
    <div align="center"><h1>REGISTRATION</h1>
        <s:form action="AddStu.action" validate="true" >
        <s:hidden name="ctr" value="1"/>
        <s:textfield label="Email" name="email"  required="true"/>
        <s:password label="passward" name="pass"  required="true"/>
        <s:textfield label="Name" name="cname" size="15" required="true"/>
        <s:datetimepicker label="D O B(yy-mm-dd)" name="dob"  value="" displayFormat="yyyy-MM-dd" required="true"/>
        <s:select name="clt" label="Client type" headerKey=""  headerValue="select" list="{'Customer','Dealer','Builder'}"/>
        <s:textfield name="addr" label="Address"  required="true" />
        <s:select  name="state" required="true"  headerKey="0" headerValue="Select State" onchange="showCity(this.value)" label="State" list="stateList"/>
        <s:select name="city" id="cty" required="true"  headerKey="0" headerValue="Select City" label="City" list="{}"/>
        <s:textfield label="Pin code" name="Pin" size="15"  required="true"/> 
        <s:textfield label="Country" name="cntry" required="true"/>
        <s:textfield label="Std code" name="stdcd"  required="true"/>
        <s:textfield label="Landline" name="lndline"  required="true"/>
        <s:textfield label="Mobile" name="mbl"  required="true"/>
        <s:select label="Sequrity question"  name="sq" headerKey="" headerValue="select seq question" list="{'what your nick name','what your mother name','what your pet name','what your favorite childhood friend','what was your childhood '}" required="true" />
        <s:textfield label="Answer"  name="sa" required="true"/>
        <s:submit value="Continue"   align="center" />
        </div>

 </s:form>
        
    </div>
    </div>
<div style="margin-left: 0px;"><%@include file="Footer.jsp"%></div>

  </body>