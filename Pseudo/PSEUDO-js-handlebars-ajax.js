
//////////////////////////////////
//////\     JS TEMPLATES /////////
///////\    NADIA_KG,   //////////
////////\   BootCoder  ///////////
//////////////////////////////////





//////////////////////////////////
/////////// HANDLEBARS ///////////
//////////////////////////////////

// handlebars samples
// http://www.raymondcamden.com/index.cfm/2012/4/19/Demo-of-Handlebars-and-why-you-should-consider-a-templating-engine


<!DOCTYPE html>
<html>
<head>
	<title>Test 2</title>
	<script src="js/handlebars-1.0.0.beta.6.js"></script>
	<script id="result-template" type="text/x-handlebars-template">
	<h2>Your Favorite Things</h2>
 
	{{#if things}}
		<ul>
		{{#each things}}
			<li>{{this}}</li>
		{{/each}}
		</ul>
	{{else}}
 
		<p>
		Apparently, you like nothing. Poor you.
		</p>
 
	{{/if}}
	</script>
    <link rel="stylesheet" href="style.css" type="text/css" />
</head>
 
<body>
 
	<h2>List of Things</h2>
	<p>
		Enter a comma-separated list of things you like.
	</p>
	<input type="text" id="things" placeholder="Things you like..."><br/>
	<button id="demoButton">Demo</button>
 
	<div id="resultDiv"></div>
 
	<script>
 
	document.addEventListener("DOMContentLoaded", function() {
 
		//Get the contents from the script block 
		var source = document.querySelector("#result-template").innerHTML;
		//Compile that baby into a template
		template = Handlebars.compile(source);
 
		document.querySelector("#demoButton").addEventListener("click", function() {
			var things = document.querySelector("#things").value;
			if(things.length) var arrThings = things.split(",");
 
			var html = template({things:arrThings});
			document.querySelector("#resultDiv").innerHTML = html;
 
		});
	});
 
 
	</script>
 
</body>
</html>










<!DOCTYPE html>
<html>
<head>
	<title>Test 1</title>
	<script src="js/handlebars-1.0.0.beta.6.js"></script>
	<script id="result-template" type="text/x-handlebars-template">
	<h2>Your Bio</h2>
	<p>
	Your name is {{firstname}} {{lastname}} and you are {{age}} years old.
	</p>
	</script>
    <link rel="stylesheet" href="style.css" type="text/css" />
</head>
 
<body>
 
	<h2>Render Simple Bio</h2>
 
	<input type="text" id="firstname" placeholder="First Name"><br/>
	<input type="text" id="lastname" placeholder="Last Name"><br/>
	<input type="number" id="age" placeholder="Age"><br/>
	<button id="demoButton">Demo</button>
 
	<div id="resultDiv"></div>
 
	<script>
 
	document.addEventListener("DOMContentLoaded", function() {
 
		//Get the contents from the script block 
		var source = document.querySelector("#result-template").innerHTML;
		//Compile that baby into a template
		template = Handlebars.compile(source);
 
		document.querySelector("#demoButton").addEventListener("click", function() {
			var fname = document.querySelector("#firstname").value;
			var lname = document.querySelector("#lastname").value;
			var age = document.querySelector("#age").value;
 
			var html = template({firstname:fname, lastname:lname,age:age});
			document.querySelector("#resultDiv").innerHTML = html;
 
		});
	});
 
 
	</script>
 
</body>
</html>



