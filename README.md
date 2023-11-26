# WebDropDead Ruby On Rails Application
Author: Harir Al-Rubaye 1108085

## Table of Contents

- [How to Run](#how-to-run)
- [Accessing the Application](#accessing-the-application)
- [Implemented Features](#features)
- [Prerequisites](#prerequisites)
- [Directory Structure](#Directory-Structure)

## How to Run

To run the application locally, use the following command:

`rails server -d -p 35061 -b 0.0.0.0`

## Accessing the Application

Welcome Page: http://cis3260.socs.uoguelph.ca:35061
Sign In Page: http://cis3260.socs.uoguelph.ca:35061/sign_in

## Implemented Features

1. Hello World” is working
    • [4 pts] Shows connectivity from client to server and the ability to modify the routes file and view

2. “Sign-In” page

    • [4 pts] Demonstrates ability to use scaffolding to obtain and store info from a user
	into the database through the manipulation of Control and Model and View code

3. “Play Game” page

   • [2 pt] Displaying the game
       o Demonstrates the ability to create an “application” with proper OO interaction, using instances obtained from the Rails model and accessed from the controller 
	and use it to process the game logic and create game pages from the view to display

   • [1 pt] Replaying game with same settings
       o To get this mark, you have to have AutoDropDead working

   • [1 pt] Replaying game with different settings
       o To get this mark, you have to have AutoDropDead working.

## Prerequisites

Ruby 2.7.0 or higher
Rails 6.0.0 or higher

The version I used: 

ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux-gnu]
Rails 7.1.1


## Directory Structure
What rb and html.erb classes I have and where they are:

WebDropDead/
  app/
    controllers/
      application_controller.rb
      games_controller.rb
      sessions_controller.rb
      users_controller.rb
      Welcome_controller.rb
      
    models/
      application_record.rb
      user.rb	

    views/
      games/
        play.html.erb
        results.html.erb
     sessions/
        new.html.erb
     users/
        _form.html.erb
        new.html.erb
        _user.html.erb
     layouts/
        application.html.erb
        mailer.html.erb
        mailer.text.erb

    lib/
      AutoDropDead.rb
      Player.rb
      PlayerManager.rb
      GameManager.rb
      GameLogic.rb
      Dice.rb 
  

