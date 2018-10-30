<script type="text/javascript">
var currenttime = '<?php print date("F d, Y H:i:s", time())?>' ;//PHP method of getting server date
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
var serverdate=new Date(currenttime);

function padlength(what){
var output=(what.toString().length==1)? "0"+what : what
return output
}

function displaytime(){
serverdate.setSeconds(serverdate.getSeconds()+1);
var datestring=montharray[serverdate.getMonth()]+" "+padlength(serverdate.getDate())+", "+serverdate.getFullYear();
var timestring=padlength(serverdate.getHours())+":"+padlength(serverdate.getMinutes())+":"+padlength(serverdate.getSeconds());
var hora = serverdate.getHours();
var meridiano = " am";
if(hora > 12){hora -= 12; meridiano = " pm"; timestring=padlength(serverdate.getHours()-12)+":"+padlength(serverdate.getMinutes())+":"+padlength(serverdate.getSeconds());}
	if(hora >= 12){meridiano = " pm";}
document.getElementById("servertime").innerHTML=timestring + meridiano
}

window.onload=function(){
setInterval("displaytime()", 1000);
}
</script>