//////////////////////////////////
//////\     METAGAME     /////////
///////\    NADIA_KG,   //////////
////////\   BootCoder  ///////////
//////////////////////////////////


$(document).ready( function() {
  console.log("FLizards To the Lodge!");
  handleBarListener();
});

















//////////////////////////////////
/////////// HANDLEBARS ///////////
//////////////////////////////////


var handleBarListener = function() {

    $(".ajax-private-profile-button").on("ajax:success", function(event, data, status, xhr){
      console.log("INSIDE ajax-private-profile-button");
      console.log(data);
      $(".old-profile").fadeOut("slow");
      setTimeout(function(){$(".private-profile-handlebars").fadeIn();}, 1000);
      var templateIndexSource = $(".private-profile-template").html();
      // debugger;
      console.log(templateIndexSource);
      var template = Handlebars.compile(templateIndexSource);
      console.log(template);
      // console.log(indexHTML);
          var indexHTML = template({user: data[0], user_games: data[1][0], user_groups: data[2][0], user_events: data[3][0]});
      $(".private-profile-handlebars").append(indexHTML);
      $(".private-profile-handlebars").hide();

    }).on("ajax:error", function(){
      console.log("Damn it Martha Jean Joe Bob, I thought I told you to format JSON!, ajax-private-profile-button ERROR");
    });













    ///////////////////////////////
    // Not part of our Presentation
    ///////////////////////////////
    $(".newQuestionForm").on("ajax:success", function(event, data, status, xhr) {
      console.log("Its a me newQuestionForm!!!");
      var templateSource = $("#question-template").html(),
        template = Handlebars.compile(templateSource),
        questionHTML = template(data);
        // debugger;
      $(".newQuestionForm").html(questionHTML);
    }).on("ajax:error", function() {
      console.log("ALL your CODEBASE has belongs to MEEEEE!");
    });
};















//////////////////////////////////
////////  WIDGET PSEUDO //////////
//////////////////////////////////


// keyup listener for all keys that listens on
// new question content box
// on keyup should evealuate entire string within
// content box
// should render string to display box
// should render string with formating ala MD


//////////////////////////////////
////////  NQ KEYUP LISTENER //////
//////////////////////////////////


var newQuestionKeyUpListener = function() {
  $(".content").on("keyup", function(){
    console.log("Shit is HAPPENING");
    current_string = $("#question_content").val();
    newQuestionControllerFunction(current_string);
  });
};

var newQuestionControllerFunction = function(string) {
  console.log(string);
  // emChecker(string);
  strongChecker(string);
};

var newQuestionWidgetDisplay = function(string) {
  console.log("in the view render");
  $(".widget-display").css({display : 'inline'});
  $(".widget-display").html(string);
};

var emChecker = function(string) {
  newQuestionWidgetDisplay(returnString);
};

var strongChecker = function(string) {
  var returnString;
  // 
  // current blocker is how to iterate over string through multiple passes
  // 
  returnString = string.replace(/(\*\*|__)(.*?)\1/g, "<strong>$2</strong>");
  // returnString = string.replace(/\*(\S[^\*]+\S)\*/g, "<em>$1</em>");
  returnString = string.replace(/(\*|_)(.*?)\1/g, "<em>$2</em>");
  newQuestionWidgetDisplay(returnString);
};





//////////////////////////////////
//////// VOTING AJAX /////////////
//////////////////////////////////


var voteListener = function() {
  $(".ajaxButton").on("ajax:success", function(event, data, status, xhr) {
    console.log("Panda Bear!!");
    var string_num = $("#"+this.id).text();
    var num_num = parseInt(string_num, 10);
    if (this.innerHTML === "Up jax"){ num_num += 1; }
    else if (this.innerHTML === "Down jax"){
      num_num -= 1;
    }
      $("#"+this.id).text(num_num);
  }).on("ajax:error", function() {console.log("faillllll");
  });
};


