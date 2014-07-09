maybe a good idea to tag sections we work on with a comment block. open to thoughts






issues with precompile


bundle exec rake tmp:clear

 bundle exec rake assets:clean RAILS_ENV=production

 bundle exec rake assets:precompile RAILS_ENV=production

 also toggle aditioinal assets in production.rb
 FIND OUT ABOUT ENV variable


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



