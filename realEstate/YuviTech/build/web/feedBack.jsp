<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="Header.jsp"%>
<s:head theme="ajax"/>
<head>
    <link rel="stylesheet" href="css/abc.css"/>
</head>
<div>
    <div style="float: left;margin-left: 100px;">
        <img src="images/feedback.jpg" style="width: 250px; height: 220px;">
    </div>
<div class="outer">    
<div  align="center"> <h1 style="color: red"> FEEDBACK FORM</h1>
    
    
    <s:form action="Feedback"  validate="true" >
        <%
         String m=(String)request.getAttribute("m");
         if(m!=null)
             out.println(m);
        %>
        <s:property value="msg"/>
  <s:hidden name="ctr" value="9"/>
  <s:textfield name="cname" label="Name" theme="ajax" maxLength="20"/>
  <s:textfield name="email" label=" Email id" theme="ajax" maxLength="40"/>
  <s:textfield name="mbl" label="Mobile" theme="ajax" maxLength="10"/>
  <s:textarea name="fmsg" label="Message" cols="40" rows="40"  />
  <s:submit value="Submit" align="center"  />
    </s:form>
     </div>
</div>
</div>
</body>
<%@include file="Footer.jsp" %>