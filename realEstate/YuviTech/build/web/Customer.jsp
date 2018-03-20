<style>
    .sidemenu>ul>li{
        list-style: none;
        width:242px;
        height:30px;
        background-color:white;
        border-left: 1px solid black;
        border-right:1px solid black;
        border-top:1px solid black;
    }
    .sidemenu>ul{
        width:230px;
        height:inherit;
        margin-top: 20px;
    }
    #last{
        border-bottom:1px solid black;
        margin-left: 0px;
    }
    .sidemenu>ul>li>a{
        text-decoration:none;
        margin-left:6px;
        color:#2e3ab0;
        font-size:19px;
        margin-top:5px;
        position: relative;
        float:left;
    }
    .sidemenu>ul>li>a:hover{
        color:#151839;
        font-weight: normal;
    }
    #main{
        width:240px;
        height:38px;
        border-left: 3px solid black;
        border-right:3px solid black;
        border-top:3px solid black;
        border-bottom:1px solid black;
        background-image: url(images/fill.gif) ;
    }
    li>div{
       color:white;
       font-size:21px;
       font-weight:normal;
       margin-top:6px;
    }
    li>ul{
        height:20px;
        margin-left: 204px;
        margin-top: 5px;
        position:absolute;
        z-index: 10;
    }
    li>ul>li{
        display:none;
        background-color:white;
        height:30px;
        width:150px;
        font-size:19px;
        border-left: 1px solid black;
        border-right: 1px solid black;
        border-top: 1px solid black;
    }
    .sidemenu li>a{
        text-decoration: none;
        color: #2e3ab0;
    }
    .sidemenu li>a:hover{
        text-decoration: none;
        font-weight:normal;
        color:#151839;
    }
    li:hover>ul>li{
        display:block;
    }
    #last1{
        border-bottom: 1px solid black;
    }
    li>img{
       margin-top: -10px;
       display:none;
       position: relative;
       float:left;
    }
    li:hover img{
        display:block;
    }
    li>ul>li>img{
    width:0px;
    height:0px;
    }
    li>ul>li:hover>img{
    width:46;
    height:40;
    }
</style>
<div class="sidemenu">
    <ul style="z-index:5;">
        <li id="main"><div align="center">Customer Section</div></li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="PUpdate.action">Personal Update</a>            
        </li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="PUpdate.action">Personal Update</a>            
        </li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="PUpdate.action">Change Password</a>            
        </li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="#">Property</a>
            <ul>
                <li>&nbsp;&nbsp;<a href="ARCP.jsp">Add Property</a></li>
                <li>&nbsp;&nbsp;<a href="URPF.action">Update RP</a></li>
                <li>&nbsp;&nbsp;<a href="UCPF.action">Update RC</a></li>
                <li id="last1">&nbsp;&nbsp;<a href="ViewPList.jsp">View Property</a></li>
            </ul>
        </li>
       
        <li><img src="images/arrow.png" width="46" height="40"/><a href="ViewOffer.jsp">View Offer</a></li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="Feedback.action">Feedback</a></li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="Comp.action">Complain</a></li>        
    </ul>
</div>