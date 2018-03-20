<%@include file="Header.jsp"%>
<body bgcolor="lightblue">
     <link rel="stylesheet" href="css/abc.css"/>
    <div  style="height: 250px">
    <div  id="frdesign" style=" width: 37%; height: 250px; float: left; background-color:gainsboro;border-radius: 20px;  ">
        <img src="images/forget.jpg" width="100%" height="250px" style="border-radius: 20px;" />
    </div>    

    <div class="outer" style="height: 250px"> 
   
      <div  align="center">
       <h1 >Forget Passward </h1>
 
        <s:form action="FPass" validate="true">
          
      <s:hidden name="ctr" value="5"/>
      <s:actionerror/>
     
    <s:textfield name="email" label="Enter Email id"/>
   
    <s:submit value="submit"/>
</s:form>
        
    </div>
    </div>
    <%@include file="Footer.jsp"%>
    
</body>