what if navigation was fixed to top and logo scrolled down behind / between divs 








NON-MVP: helper method to display top 10 groups that belong to the user.id

NON-MVP: groups should display all groups that a user is not a member of

NON-MVP: group show should have a join button if a user is not a memeber of that group


Private messages implemented using 
https://github.com/jongilbraith/simple-private-messages







PSEUDO FOR TEMPLATES

add search bar to profile


template start on user index





theres also conditionals to take into account
such as 
	
	-public profile view for non friends
	
	-private profile view for friends

	-private profile view for current user with extra current user options

    
    USER PUBLIC PROFILE

    User name
    Top Games played
    groups associated with
    member since
    avatar_url


    STEPS

    render template via Ajax button click
    Ajax should hit user controller and collect @user variable
    @user variable should contain 
      user info
      user games
      user groups
      user events

    JSON-ic return on success should grab template from page
    compile template with data
    render template to selected div








firebase --- bootcoder htc
https://popping-fire-5557.firebaseio.com/

























user show save paste


<h1 class="title">USERS#SHOW</h1>
<div class="body" style="overflow-y: scroll; height: 400px;">

  <div class="nav-options">
    <%= link_to 'Edit', edit_user_path(@user) %> |
    <%= link_to "Create Event", new_event_path %> |
    <%= link_to 'Back', users_path %> 
  </div>
  <div class="old-profile">
  <div class="feature" id="1">
    <h3>Profile Info</h3>

    <p id="notice"><%= notice %></p>

    <p>
      <b>User name:</b>
      <%= @user.username %>
    </p>

    <p>
      <b>User email:</b>
      <%= @user.user_email %>
    </p>

    <p>
      <b>User bio:</b>
      <%= @user.user_bio %>
    </p>

    <p>
      <b>User zipcode:</b>
      <%= @user.user_zipcode %>
    </p>


    <%= link_to image_tag("http://cdn.steamcommunity.com/public/images/signinthroughsteam/sits_large_noborder.png"), '/auth/steam' %>
  </div>

  <div class="feature" id="2">
    <h2>USERS GAMES</h2>
    <% cache do %>
      <% @games.each do |game| %>
        <div class="one-third column feature">
        <%= link_to image_tag(game.game_img_url), game_path(game) %>
          <p><%= game.game_name %></p>
          <!-- <p>Lorem ipsum dolor sit amet...</p> -->
        </div>
      <% end %>
    <% end %>
  
  </div>
</div>

  <div class="feature" id="3">
    <h2>USERS GROUPS</h2>
    <%= render partial: '/groups/show_groups' %>
  </div>
  <div class="nav-options">
    <%= link_to 'Edit', edit_user_path(@user) %> |
    <%= link_to 'Back', users_path %>
  </div>
</div>









<!-- USER INDEX VIEW -->



<% if current_user %>
  <h1 class="title">USERS#INDEX</h1>
  <h1>User Dash-Board</h1>
  <div class="body" style="overflow-y: scroll; height: 400px;">
    <div class="search-options">
      <table>
        <tr>
          <td><%= form_tag("/searchgames") do |u| %></td>
            <td><%= text_field_tag "search", nil, placeholder: "Search games..." %></td>
            <td><%= submit_tag "Search", class: "button-warning" %></td>
          <td><% end %></td>
          
          <td><%= form_tag("/searchevents") do |u| %></td>
            <td><%= text_field_tag "search", nil, placeholder: "Search events..." %></td>
            <td><%= submit_tag "Search", class: "button-warning" %></td>
          <td><% end %></td>
        </tr>
      </table>
    </div>
    
    <div class="feature" id="1">
      <h2>List of Users News</h2>
    </div>

    <div class="feature" id="2">
      <h2>List of Users Games</h2>
      <% cache do %>
        <% non_null = @games.map{|game| game.game_playtime_forever ||= 0 } %>
        <% non_null_games = @games.sort_by{|game| game.game_playtime_forever * -1 } %>
        <% non_null_games.each do |game| %>
          <%= image_tag(game.game_img_url) %>
          <%= game.game_name %>
          <br />
        <% end %>
      <% end %>
    </div>

    <div class="feature" id="3">
      <h2>User Events</h2>
      <% current_user_events %>
      <% @current_user_events.each do |event| %>
        <h3><%= "#{event.event_name} : #{event.event_date}"%></h3>
        <% end %>
    </div>

    <div class="feature" id="4">
      <h2>USER GROUPS</h2>
      <%= render partial: '/groups/show_groups' %>

    </div>
  </div>

<% else %>

  <h1 class="title">USERS#INDEX SITE INDEX</h1>
  <div class="body" style="overflow-y: scroll; height: 400px;">
    <div class="feature" id="1">
      <h2>About Us</h2>
      <p>
      </p>
    </div>

    <div class="feature" id="2">
      <h2>Feature 1</h2>
    </div>

    <div class="feature" id="3">
      <h2>Feature 2</h2>
    </div>

  </div>

<% end %>












Casual Index BODY




<div class="row">
            <div class="box">
                <div class="col-lg-12 text-center">
                    <div id="carousel-example-generic" class="carousel slide">
                        <!-- Indicators -->
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-responsive img-full" src="slide-1.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/slide-2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/slide-3.jpg" alt="">
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                    <h2>
                        <small>Welcome to</small>
                    </h2>
                    <h1>
                        <span class="brand-name">Business Casual</span>
                    </h1>
                    <hr class="tagline-divider">
                    <h2>
                        <small>By <strong>Start Bootstrap</strong></small>
                    </h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Build a website <strong>worth visiting</strong>
                    </h2>
                    <hr>
                    <img class="img-responsive img-border img-left" src="img/intro-pic.jpg" alt="">
                    <hr class="visible-xs">
                    <p>The boxes used in this template are nested inbetween a normal Bootstrap row and the start of your column layout. The boxes will be full-width boxes, so if you want to make them smaller then you will need to customize.</p>
                    <p>A huge thanks to <a href="http://join.deathtothestockphoto.com/" target="_blank">Death to the Stock Photo</a> for allowing us to use the beautiful photos that make this template really come to life. When using this template, make sure your photos are decent. Also make sure that the file size on your photos is kept to a minumum to keep load times to a minimum.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Beautiful boxes <strong>to showcase your content</strong>
                    </h2>
                    <hr>
                    <p>Use as many boxes as you like, and put anything you want in them! They are great for just about anything, the sky's the limit!</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                </div>
            </div>
        </div>
      <%= yield %>
    </div>



























BOOTSTRAP dropdown 


<div class="dropdown">
      <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
        Dropdown
        <span class="caret"></span>
      </button>
      <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
        <li role="presentation" class="divider"></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
      </ul>
      </div>









Chris Steam News CALL

<p> test text </p>


<% if current_user.user_steam_id %>
  <%= SteamAdapter.new(current_user.user_steam_id).news %>
<%end%>
