ReST - Representational State Transfer
* Representation - let's think of everything as a resource and have a shorthand for talking about it
* State Transfer - Like a relay race, with the ID as the baton

In web development, we talk about how our routes will help us represent to ourselves, and to the user, what we are trying to show or do.

CONVENTIONS AROUND NAMING ROUTES

Model name: Marble (color: string, size: string)

Story                           Verb    URL       REST keyword
I want to see all the marbles - get '/marbles'  -  "index"
I want info on one marble -     get '/marbles/:id' - "show"
I want a form for a new marble - get '/marbles/new' - "new"
I want to create a new marble - post '/marbles' - "create"
I want a form to edit a marble - get '/marbles/:id/edit' "edit"
I want to update a marble in db - put '/marbles/:id'  "update"
I want to delete a marble -      delete '/marbles/:id' "destroy"




















Model - How data is structured/setup, business logic applying to data (AR Class/migration)

View - What the user sees / interacts with, including a display, a form, a link, etc (html / embedded ruby template)

Controller - Go-between, intermediary. Take input from the view, decide what to ask of the model, and prepare the next view in response

FLOW OF MVC

User clicks link - VIEW
Server route catches request - CONTROLLER
Server parses URL to find search term - CONTROLLER
Server ask database if anything matching term exists - MODEL
Server (CONTROLLER) takes info from db (MODEL) and builds an html page with it - VIEW
server responds. 
Page updates. It's the CIIIIIIIRCLE OF LIFE