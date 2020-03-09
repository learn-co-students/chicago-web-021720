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