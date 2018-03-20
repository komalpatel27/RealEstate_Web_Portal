<%@include file="Header.jsp" %>
<body bgcolor="lightyellow">
     <link rel="stylesheet" href="abc.css"/>
     
    <div  id="frdesign" style=" width: 37%; height: 250px; float: left; background-color:gainsboro;border-radius: 20px;  ">
        <img src="images/complaint.jpg" width="100%" height="250px" style="border-radius: 20px;" />
    </div> 
    

     <div  class="outer" style="height: 250px ;"> 

     <div  align="center"> <h1 style="color: red"> COMPLAINT FORM</h1>
       
    <s:head theme="ajax"/>
    <s:form action="Comp" validate="true" >
  <s:hidden name="ctr" value="1"/>
    <s:textfield name="name" label="Name"/>
    <s:textarea name="cmsg" label="Message" cols="30" rows="5"/>
    <s:submit value="Submit" align="center"  />
    <h1 style="color: red"> <s:property value="msg"/></h1>
    </s:form>
     </div>
     </div>
</body>
<%@include file="Footer.jsp" %>