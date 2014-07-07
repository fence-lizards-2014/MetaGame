$(document).ready(function(){
	appendBaseUri()
})

function appendBaseUri(){
	var list = $(".game_info a")
	for(var key in list){
		url_attr = list[key].href
		list[key].href = "http://www.giantbomb.com/" + url_attr
	}
}