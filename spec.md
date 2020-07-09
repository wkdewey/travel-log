# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app

Yes, the controller files inherit from Sinatra.

- [x] Use ActiveRecord for storing information in a database

The models and migrations are all based on ActiveRecord.

- [x] Include more than one model class (e.g. User, Post, Category)

User and Places [so far]

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)

User has_many Places

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

Places belongs_to Users [I may have to update this if I change the Places/User relationship; Places belongs_to City, City belongs_to Country].

- [x] Include user accounts with unique login attribute (username or email)

The User model validates for uniqueness.

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

All of these are present:
Creating get "/places/new" and post "/places"
Reading get "/places" and get "/places/:id" for individual Places
Updating get "/places/:id/edit" and patch "/places/:id"
Destroying delete "/places/:id"

- [x] Ensure that users can't modify content created by other users

I check for this in the edit and delete routes for Places, as well in the edit route for User.

- [x] Include user input validations

All fields of Place validate for presence, and the name of Place validates for uniqueness.

- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

I use sinatra-flash to inform users if they should log in or if their inputs didn't validate.

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

See README.md

Confirm
- [x] You have a large number of small Git commits
yes, I've done this, I have frequently committed
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
I tried to do the above, but there have been some errors in committing when I committed without realizing a file was not saved, or made a minor change or two (often a bug I noticed) that wasn't covered in the commit message.