<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<%
  response.setHeader("Cache-Control", "no-cache");
  response.setDateHeader("Expires", 0);
  
%>
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
    function showState()
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
     var url="state.jsp";
      xmlHttp.onreadystatechange = state;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
    }
    function state()
    {
    //  alert(xmlHttp.readyState);      }

      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        document.getElementById("state").innerHTML=xmlHttp.responseText;
    }
  </script>

</head>
    <body onload="showState()">
        
                <%@page import="java.sql.*"%>  
<%@page import="java.util.*" %>
  
<div id="wrapper" align="center">
 <div id="container" align="center"  style="background-color:white;">
    <div id="headTop" style="background-color:whitesmoke;">
      <div style="float:left; margin:0 0 0 10px; padding:0; height:20px; font-size:13px;">Yuvitech Developer : Indian Property - The leading Indian Real Estate  site</div>
      <div style="float:right; margin:0 10px 0 0; padding:0; height:20px; font-size:13px;"><%
        if(session.getAttribute("id")==null)
                       {
            
            
            
            out.println("<a href=\"Login.action\">Login</a>|<a href=\"AddStu.action\" >Register</a>");
        }       
            else
                               {
               String nm=(String)session.getAttribute("nm");
             // out.println(""+(String)session.getAttribute("clt"));
               out.println("Welcome "+nm);                  
            out.println("|<a href=\"Logout.jsp\" >Logout</a>");
                   }
             %>
</div>
    </div>
     <div id="clear"></div>
     <div id="header" >
         <div id="logo"><img src="images/y.png" height="100px" width="250px" /></div>
        <div style="float:right; margin:10px; padding:0; width:auto"><img src="images/image12.gif" /> <img src="images/image34.gif" /></div>
        <div id="menu">
            <ul id="saturday">
            <li>
                <%
                String clt=(String)session.getAttribute("clt");
                if(clt!=null)
                    {
                  if(clt.equalsIgnoreCase("Customer"))
                    {
                  %>
                  <a href="Regis1.jsp">&nbsp;&nbsp;&nbsp;Home&nbsp;&nbsp;&nbsp;&nbsp;</a>
                  <%
                   }
                   else if(clt.equalsIgnoreCase("Dealer"))
                    {
                  %>
                   <a href="dealer.jsp">&nbsp;&nbsp;&nbsp;Home&nbsp;&nbsp&nbsp;&nbsp;</a>
                   <%
                   }
                                   else if(clt.equalsIgnoreCase("builder")) 
                    {
                %>
                 <a href="builder.jsp">&nbsp;&nbsp;&nbsp;Home&nbsp;&nbsp;&nbsp;&nbsp;</a>
                 <%
                     }
                else
                 {
                     
                      %>
                   <a href="index.jsp">&nbsp;&nbsp;&nbsp;Home&nbsp;&nbsp;&nbsp;&nbsp;</a> 
                   <%
                 }
                            }
                else
                 {
                     
                      %>
                   <a href="index.jsp">&nbsp;&nbsp;&nbsp;Home&nbsp;&nbsp;&nbsp;&nbsp;</a> 
                   <%
                 }
                 %>
            </li>
            <li><a href="Search.action" title="">Search&nbsp;Property</a></li>
            <li><a href="ViewPList.jsp" title="">List&nbsp;Property</a></li>
            <li><a href="sendquotation.action" title="">Post&nbsp;Requirement</a></li>
            <li><a href="Upcoming.jsp" title="">Upcoming&nbsp;Project</a></li>
            <li><a href="Feedback.action" title="">Feedback</a></li>
            <li><a href="Aboutus.jsp" title="">About&nbsp;Us</a></li>
            <li><a href="Contactus.jsp" title="" id="last">&nbsp;Contact&nbsp;Us&nbsp;</a></li>
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
            <li><a href="viewSearch2.jsp?t=8"><b><blink> New Offer</blink></b></a></li>
            
          </ul>
        </div>
      </div>