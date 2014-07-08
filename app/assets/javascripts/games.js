// #CR What is this for?
$(document).ready(function(){
	appendBaseUri()
})

// #CR clean this up in the API Wrapper
function appendBaseUri(){
	var list = $(".game_info a")
	for(var key in list){
		url_attr = list[key].href
		list[key].href = "http://www.giantbomb.com/" + url_attr
	}
}
