// JS Document
function searchPro(div,li)
{ showState1();
for(i=1;i<=2;i++){
	document.getElementById("box"+i).style.display = 'none';
	document.getElementById("li"+i).className = "";
//        alert("none");
       // showState();
    }
            
	document.getElementById("box"+div).style.display = 'block';
	li.className = "current";
     //  showState2(); 
  //      alert("display");
    

}


function feature(div,li)
{
for(i=1;i<=7;i++){
	document.getElementById("featch"+i).style.display = 'none';
	document.getElementById("fli"+i).className = "";
	}
	document.getElementById("featch"+div).style.display = 'block';
	li.className = "current";
}
function locality(div,li)
{
for(i=1;i<=6;i++){
	document.getElementById("locality"+i).style.display = 'none';
	document.getElementById("lli"+i).className = "";
	}
	document.getElementById("locality"+div).style.display = 'block';
	li.className = "current";
}