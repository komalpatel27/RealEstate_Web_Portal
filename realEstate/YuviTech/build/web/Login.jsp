<head>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<link rel="stylesheet" href="css/abc.css"/>
 <script>
$(function() {
$( "#show-option" ).tooltip({
show: {
effect: "slideDown",
delay: 250
}
});
$( "#hide-option" ).tooltip({
hide: {
effect: "explode",
delay: 250
}
});
$( "#open-event" ).tooltip({
show: null,
position: {
my: "left top",
at: "left bottom"
},
open: function( event, ui ) {
ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
}
});
});
</script>
    <style>
        #change{
          height:30px;
          margin-left:75px;
        }
        #change div{
            width:120px;
            position:relative;
            float:left;
        }        
        #head{
            font-size: 28px;
            font-weight: 700;
            height:35px;
        }
        input[type=submit]{
            margin-left: -35px;
            margin-top: 5px;
        }
        #maindiv{
            background-color: red;
            height:inherit;
            position: absolute;
        }
        #imagediv{
            width:inherit;
            height:inherit;
        }
        #imagediv, #frdesign1{
            position: relative;
            float:left;
        }
        #frmdesign1{
            margin-left:540px;
        }
    </style>
</head>
<%@include file="Header.jsp"%>
<div class="maindiv" style="background-color: #ffffff;margin-top:172px;">
    <div id="imagediv">
        <img src="images/pic15.jpg" width="500" height="320"/>
    </div>
    <div class="outer" style="height: 320px;margin-bottom: -100px;">
        <div>
            <div align="center"><h1>LOGIN</h1></div>
            <div  align="center">   
                <s:property value="msg1"/> 
                <s:property value="msg"/>
            </div>
            <table border="0">
                <tr>
                    <td>
                        <img src="images/loginpic1.png" width="105" height="98"/>
                    </td>
                    <td width="300">
                    <br/>
                    <s:head theme="ajax"/>
                    <s:form action="Login" validate="true" >
                        <s:hidden name="ctr" value="8"/>
                        <div> <s:textfield id="hide-option" title="Enter Your Email Id" label="Email" name="email"/></div>
                            <div> <s:password label="Password" name="pass" /></div>
                            <s:submit value="Login" align="center"/>
                    </s:form>
                    </td>
                </tr>
            </table>
                    <div style="margin-left: 80px;">
                <div align="left" style="position: static;float: left;margin-left: 90px;"><img src="images/q3.gif" align="" style="margin-top: 24px;width: 20px; height: 20px;"></div><div align="center" style="font-family: serif;font-size: 18;position: relative;float: left;margin-top: 24px;">&nbsp;<a href="FPass.action"><b>Forget Password</b></a></div>
            </div>
        </div>
    </div>
                    <div>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                    </div>
</div>
<%@include file="Footer.jsp"%>