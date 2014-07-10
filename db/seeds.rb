
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Metagame::Game.parse_json('db/new_games.json')


user1 = User.create(username: "hunter1", password_hash: "1Metagame$1", confirm_pw: "1Metagame$1", user_email: "hunter1@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user2 = User.create(username: "hunter2", password_hash: "2Metagame$1", confirm_pw: "2Metagame$1", user_email: "hunter2@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user3 = User.create(username: "hunter3", password_hash: "3Metagame$1", confirm_pw: "3Metagame$1", user_email: "hunter3@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user4 = User.create(username: "hunter4", password_hash: "4Metagame$1", confirm_pw: "4Metagame$1", user_email: "hunter4@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user5 = User.create(username: "hunter5", password_hash: "5Metagame$1", confirm_pw: "5Metagame$1", user_email: "hunter5@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user6 = User.create(username: "hunter6", password_hash: "6Metagame$1", confirm_pw: "6Metagame$1", user_email: "hunter6@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user7 = User.create(username: "hunter7", password_hash: "7Metagame$1", confirm_pw: "7Metagame$1", user_email: "hunter7@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user8 = User.create(username: "hunter8", password_hash: "8Metagame$1", confirm_pw: "8Metagame$1", user_email: "hunter8@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user9 = User.create(username: "hunter9", password_hash: "9Metagame$1", confirm_pw: "9Metagame$1", user_email: "hunter9@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user10 = User.create(username: "hunter10", password_hash: "10Metagame$1", confirm_pw: "10Metagame$1", user_email: "hunter10@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")
user11 = User.create(username: "hunter11", password_hash: "11Metagame$1", confirm_pw: "11Metagame$1", user_email: "hunter11@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-6KatsPEy4z8/AAAAAAAAAAI/AAAAAAAAABw/Eb8ILiGdG1U/photo.jpg", user_bio: "I would like a Tesla...")

event1 = Event.create(event_name: 'test1', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
event2 = Event.create(event_name: 'test2', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
event3 = Event.create(event_name: 'test3', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
event4 = Event.create(event_name: 'test4', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
event5 = Event.create(event_name: 'test5', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
event6 = Event.create(event_name: 'test6', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
event7 = Event.create(event_name: 'test7', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
even8t = Event.create(event_name: 'test8', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
eve9nt = Event.create(event_name: 'test9', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
ev10ent = Event.create(event_name: 'test10', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
eveewnt = Event.create(event_name: 'test11', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
event32 = Event.create(event_name: 'test12', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')
event21 = Event.create(event_name: 'test13', event_game_title: 'World of Warcraft', event_description: 'game playing', event_location: 'on the line', event_date: '8/8/2014', event_type_id: '0039', event_zipcode: '96143')

group = Group.create(group_name: 'chris is the best',group_description: 'bestgroupever', group_logo_url: 'https://www.9-20recruitment.com/userfiles/_920Recruitment/news/images/Rockstar_Games.png', group_tagline: 'we da best' )
group1 = Group.create(group_name: 'chris i1s the best',group_description: 'bestgr1oupever', group_logo_url: 'https://www.9-20recruitment.com/userfiles/_920Recruitment/news/images/Rockstar_Games.png', group_tagline: 'we d1a best' )
group2 = Group.create(group_name: 'chris i2s the best',group_description: 'bestgro2upever', group_logo_url: 'https://www.9-20recruitment.com/userfiles/_920Recruitment/news/images/Rockstar_Games.png', group_tagline: 'we da 2best' )
group3 = Group.create(group_name: 'chris3 is the best',group_description: 'bestgr3oupever', group_logo_url: 'https://www.9-20recruitment.com/userfiles/_920Recruitment/news/images/Rockstar_Games.png', group_tagline: 'we da 3best' )
group4 = Group.create(group_name: 'chri4s is the best',group_description: 'bestgr4oupever', group_logo_url: 'https://www.9-20recruitment.com/userfiles/_920Recruitment/news/images/Rockstar_Games.png', group_tagline: 'we da b4est' )
group5 = Group.create(group_name: 'ch5ris is the best',group_description: 'bestg5roupever', group_logo_url: 'https://www.9-20recruitment.com/userfiles/_920Recruitment/news/images/Rockstar_Games.png', group_tagline: 'we da b5est' )
group6 = Group.create(group_name: '6chris is the best',group_description: 'best6groupever', group_logo_url: 'https://www.9-20recruitment.com/userfiles/_920Recruitment/news/images/Rockstar_Games.png', group_tagline: 'we da b6est' )
group7 = Group.create(group_name: 'chris4 is the best',group_description: 'best7groupever', group_logo_url: 'https://www.9-20recruitment.com/userfiles/_920Recruitment/news/images/Rockstar_Games.png', group_tagline: 'we da be7st' )


# group = Group.create(group_name: "Best Test Group Ever", group_logo_url: "http://www.infyways.com/wp-content/uploads/2013/01/Create-Multiple-Customer-Group-in-Magento-using-Easy-Steps.png", group_description: "Here to test some stuff...", group_tagline: "Yep this is awesome!")


# user.groups << group
# group.users << user

# user = User.create(username: "nadia", password_hash: "Metagame$1", confirm_pw: "Metagame$1", user_email: "nadia@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh4.googleusercontent.com/-ybUEEJ2DmKM/AAAAAAAAAAI/AAAAAAAAAHM/ej9bkLETxxo/w48-c-h48/photo.jpg", user_bio: "I would also like a Tesla...")
# user.groups << group
# group.users << user

# user = User.create(username: "chris", password_hash: "Metagame$1", confirm_pw: "Metagame$1", user_email: "chris@metagame.com", user_zipcode: 32606, user_avatar_url: "https://bitbucket-assetroot.s3.amazonaws.com/c/photos/2013/Nov/01/bitbucket_bot-avatar-3816520679-5.png", user_bio: "I would also like a Tesla...")
# user.groups << group
# group.users << user

# user = User.create(username: "jake", password_hash: "Metagame$1", confirm_pw: "Metagame$1", user_email: "jake@metagame.com", user_zipcode: 32606, user_avatar_url: "https://bitbucket-assetroot.s3.amazonaws.com/c/photos/2013/Nov/01/bitbucket_bot-avatar-3816520679-5.png", user_bio: "I would also like a Tesla...")
# user.groups << group
# group.users << user

# user = User.create(username: "sam", password_hash: "Metagame$1", confirm_pw: "Metagame$1", user_email: "sam@metagame.com", user_zipcode: 32606, user_avatar_url: "https://lh3.googleusercontent.com/-hpfrsy8z1_A/AAAAAAAAAAI/AAAAAAAAADE/LZcXy87KGzA/w48-c-h48/photo.jpg", user_bio: "I would also like a Tesla...")
# user.groups << group
# group.users << user


