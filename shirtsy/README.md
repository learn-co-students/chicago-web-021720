# Shirtsy
## A sharp site for shirtsmiths to sell shirts.

### Model Domain

#### - Tables

User: (id), name, quote, avatar, (timestamps)

Shirt: (id), message, color, image, 'price:decimal{5,2}', creator_id:integer, (timestamps)

Sale: (id), shirt_id:integer, buyer_id:integer, quantity:integer, (timestamps)

#### - Relationships

A user (as a creator) can have many shirts 
A shirt belongs to a creator (user)
A sale belongs to a buyer (user) and a shirt
A user has many sales (where they were the buyer)
A user (as a buyer) has many purchased shirts, through sales
A shirt has many buyers, also through sales
(Many to many between buying users and bought shirts, sale is the join)
(Also notice that a user is associated with shirts in two ways: creator and buyer)

### User Stories
- As a user, I want to create a shirt to sell
  new, create for shirt

- As a user, I want to view a list of shirts that were created

- As a user, I want to view a list of all the shirts I can buy (from other users (none of my own))

- As a user, I want to view info for a specific shirt (price, color, message, (image), creator)

- As a user, I want to fill out a form to purchase a specific shirt

- As a user, I want to see a list of my purchases with the shirts and their prices, most recent purchases first

- As a user, I want to see a list of sellers I've supported

- As a user, I want to see a list of buyers who have purchased shirts I've created

- As a user, I want to see a list of shirts created by people who have bought from me

- As a user, I want to see a list of shirts made by people I've not yet supported and who have not yet supported me

### Build Goals:
- Create migrations and models using generators

- Use link/path/form helpers whenever possible

- Think about reasonable validations for a shirt when the time comes, and provide decent error handling for users

- Practice vertical slicing! Avoid sketching out all the associations/routes/controller methods in advance, work one user story at a time and build only what's necessary

- Try to get as far as purchasing shirts in an hour, from scratch!


