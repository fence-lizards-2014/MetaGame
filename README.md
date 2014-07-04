
MetaGame
========

Platform for Organizing Gamers
'''http://metagame.herokuapp.com/'''
=======
[Project Workflow](https://github.com/fence-lizards-2014/MetaGame/blob/master/WorkFlow.md)


## Jake Persing 								"MisterDamon"
### Nadia Koroleva Gori 				"NadiaKG"
### Samuel Davis 								"davissamuel997"
### Hunter Chapman 							"Bootcoder"
### Chris Aubuchon 							"Aubuchcl"

Description of Project
======================

Overview
========
MetaGame is rails-heavy application that will utilize ActiveRecord, Google maps, and the Steam API to create a great user experience that connects gamers together through organizations. 

Goals
=====
* At least 90% test coverage (Well-tested)
* Clean, efficient, simply designed UI
	* Mobile-first responsive design
	* Convert to mobile app???
* OO/Class-based CSS
* Speed!
	* minimize DB hits
	* caching
	* sidekiq
	* minimize server-size logic
	* Utilize helpers and modularization
* MVP done by Sunday Night
* AGILE process
	* Constructive Feedback
	* Stand-ups
	* Minimize solo work- constant check-ins




MVP
===


Users
=====
	* User can create an account
	* User can sign in/sign out to an account
	* User can sign up with Steam account as an option
	* User can create a private/public organization
	* User can invite people to an organization
	* User has a profile page
	* User has a collection of games they play
	* User can opt in to location-based matching
	* User can create a specific event
	* User is notified of upcoming events
	* User has an avatar (Not a profile picture)
	* User can see a styled site 


Events
======
	* User can create an event
		* Local events
		* Recruitment event
		* Organization events
		* Pick-Up-Group events
		* STRETCH: custom event types
	* An event is set to non-active after assigned date/time
	* Event has a date and a time


Organizations
=============
	* User can create an organization 
	* User can join an existing organization
	* Organization admins can invite people to org
	* User can leave an organization
	* Admin can kick trolls
	* Admin can edit organization details
	* Organization admins can post messages


