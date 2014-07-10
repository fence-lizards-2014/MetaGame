$(document).ready(function(){
	prependBaseUri()
	modifyText()
})

function prependBaseUri(){
	var list = $(".game_info a")
	for(var key in list){
		url_attr = list[key].href
		list[key].href = "http://www.giantbomb.com/" + url_attr
	}
}

function modifyText(){
	var list = $(".game_info p")
	for(var key in list){
		list[key].style.color = "white"
	}
}
