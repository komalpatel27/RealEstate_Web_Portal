<%@include file="Header.jsp" %>
                     

<s:head theme="ajax"/>
<body bgcolor="lightyellow">
     <link rel="stylesheet" href="abc.css"/>
      <div  style="height: 250px">
    <div  id="frdesign" style=" width: 37%; height: 250px; float: left; background-color:gainsboro;border-radius: 20px;  ">
        <img src="images/update.jpg" width="100%" height="250px" style="border-radius: 20px;" />
    </div>    

     <div  class="outer" style="height: 250px ;"> 
  
  
     <div   align="center"> <h1 style="color: red"> SECURITY UPDATE</h1>
    <s:form action="SUpdate" validate="true" >
  <s:hidden name="ctr" value="1"/>
  <s:textfield label="Email Id" name="email" value="%{email}"  required="true"  />
  <s:textfield label="Password" name="pass" value="%{pass}" size="15" required="true"/>
 <s:select label="Sequrity question" name="sq" headerKey="" headerValue="%{sq}" list="{'what your nick name','what your mother name','what your pet name','what your favorite childhood friend','what was your childhood '}" required="true" />
  <s:textfield label="Answer" name="sa" value="%{sa}"  required="true" />
 
   
  <s:submit value="update" align="center" />
 </s:form>
     </div>
     </div>
     
    <%@include file="Footer.jsp"%>
</body>
