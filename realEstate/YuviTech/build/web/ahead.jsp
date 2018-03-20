<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Real Estate</title>
<link rel="icon" href="images/img103.jpg"/>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="css/func.js"></script>
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/jquery.simple_slider.js" type="text/javascript"></script>
<script>
jQuery(document).ready(function(){
	jQuery('#test').simple_slider({
		'leftID': 'leftNav',
		'rightID': 'rightNav',
		'display': 4
	})
});
</script>
<style>
    #saturday1>li>ul{display: none;}
    #saturday1>li:hover ul{display:block;}
    #sublst li{background-image: url(images/bgOFF.gif);
               width:160px;
               margin-top: 0px;
               height:158px;
               display:none;
               
    }
#sublst li>a{                  margin-top: 0px;
                 width:105px;
               height:158px;
               display:none;
               padding: 10px 18px 0 19.3px;
}
    #sublst li>a:hover{background-image: url(images/bgON.gif);
                       display:block;
                     color:white;
    }
    
</style>
</head>
<body>
<div id="wrapper" align="center">
 <div id="container" align="center"  style="background-color:white;">
    <div id="headTop" style="background-color:whitesmoke;">
      <div style="float:left; margin:0 0 0 10px; padding:0; height:20px; font-size:13px;">Yuvitech Developer : Indian Property - The leading Indian Real Estate  site</div>
      <div style="float:right; margin:0 10px 0 0; padding:0; height:20px; font-size:13px;">
         <%
        if(session.getAttribute("id")==null)
                       {
            out.println("<a href=\"Login.action\">Login</a>|<a href=\"AddStu.action\" >Register</a>");
        }       
            else
                               {
            String nm=(String)session.getAttribute("nm");
               
                 out.println("Welcome "+nm);
                  
            out.println("|<a href=\"Logout.jsp\" >Logout</a>");
                   }
    %> 
      </div>
    </div>
     <div id="clear"></div>
      <div id="header">
          <div id="logo"><img src="images/y.png" height="100px" width="250px" /></div>
        <div style="float:right; margin:10px; padding:0; width:auto"><img src="images/image12.gif" /> <img src="images/image34.gif" /></div>
        <div id="menu">
          <ul id="sat">
              <li><a href="Admin.jsp" title="">&nbsp;&nbsp;&nbsp;&nbsp;Home&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="Upcoming.jsp" title="">&nbsp;&nbsp;&nbsp;&nbsp;New Projects&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="view1.action" title="">&nbsp;&nbsp;&nbsp;&nbsp;Partners&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="update1.action" title="">&nbsp;&nbsp;&nbsp;&nbsp;Profile Update&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="ViewFeedBack.jsp" title="">&nbsp;&nbsp;&nbsp;&nbsp;View Feedback&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="ViewComp.action" title="" id="last">&nbsp;&nbsp;&nbsp;View Complaints&nbsp;&nbsp;&nbsp;</a></li>
          </ul>
        </div>
        <div id="circles">
          <ul>
            <li><a href="viewSearch2.jsp?t=0">Greater Noida</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=1">Noida</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=2">Delhi</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=3">Rajnagar</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=4">Rajnagar Extension</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=5">Ghaziabad</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=6">Gurgaon</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=7">Meerut</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=8">Hapur</a></li>
            <li>|</li>
          </ul>
        </div>
      </div>
 

