# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app

Yes, the controller files inherit from Sinatra.

- [x] Use ActiveRecord for storing information in a database

The models and migrations are all based on ActiveRecord.

- [x] Include more than one model class (e.g. User, Post, Category)

User, Places, Countries, Cities

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)

City has_many Places and Users
Country has_many Cities, Places, and Users
Place has_many Users and User_Places (the join table)
User has_many Countries, Cities, Places, and User_Places


- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

City belongs_to Country
Place belongs_to Country
User_Place belongs_to User and Place

- [x] Include user accounts with unique login attribute (username or email)

The User model validates for uniqueness on user's name.

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

All of these are present for Place:
Creating get "/places/new" and post "/places"
Reading get "/places" and get "/places/:id" for individual Places
Updating get "/places/:id/edit" and patch "/places/:id"
Destroying delete "/places/:id"

- [x] Ensure that users can't modify content created by other users

I check that the resource's user_id is the same as the current user in the edit and delete routes for Places, as well in the edit route for User.

- [x] Include user input validations

There are validations on Place, Country and City such that places must not be blank or duplicates, and must have a country and city

- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

I use sinatra-flash to inform users if they should log in or if their inputs didn't validate.

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

See README.md

Confirm
- [x] You have a large number of small Git commits
yes, I've done this, I have frequently committed

- [x] Your commit messages are meaningful

yes, I included a description in each case

- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

I tried to do the above, but there have been some errors when I accidentally committed before saving, or made a minor change or two (often a small bug/typo I noticed) that wasn't covered in the commit message.