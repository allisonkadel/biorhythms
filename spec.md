# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [X] Use ActiveRecord for storing information in a database
-----establish connection to a sqlite database, each model inherits from ActiveRecord::Base to establish object relationships.
- [X] Include more than one model class (list of model class names e.g. User, Post, Category)
-----I have included two models: User and Entry
- [X] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
-----User has_many entries
- [X] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
-----Entry belongs_to User
- [X] Include user accounts
-----create :user_id key-value pair in sessions hash when user signs up and store :user_id in sessions hash when user is logged in
- [X] Ensure that users can't modify content created by other users
-----logged_in? and current_user methods ensure that the person making requests is the owner of the content requested
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
-----get '/entries/new' and post '/entries' creates new entry, get '/entries' reads entry, delete '/etries/:id/delete' deletes specific entry, get '/entries/:id/edit' and patch '/entries/:id/edit' updates entry
- [X] Include user input validations
-----redirect to signup if user account is already in use, redirect to create or update forms if any fields are empty
- [X] Display validation failures to user with error message (example form URL e.g. /posts/new)
-----flash messages stored in session hash that appear when field population and user account validations fail
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
------My messages are meaningful to me, but I would like to develop a more standardized language when I am working on the controllers so that other developers could know exactly what I have changed.
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message

------My commit messages and git practices could be improved in this project. At times the messages are repetitive because I had issues with remote IDE connection and merging branches.
