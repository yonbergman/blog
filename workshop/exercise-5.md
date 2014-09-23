---
layout: page
title: Exercise 5
hide-title: true
header: false
---
## Exercise 5 - Ideation App - Last steps

Our last steps we'll be doing adding users and deploying our app to Heroku.

### Auth

We'll be using Twitter for auth because it's pretty easy.

Adding the Twitter Omniauth gems to Gemfile

```rb
gem 'omniauth'
gem 'omniauth-twitter'
```

These are tokens that you can use (or generate your own)

```rb
provider :twitter, "acHhc05nbOyC528Ps7p6pMs9O", "c3zkMotm2RmQmsRrXrqXiMJ2Pg97cpYRHTKmH7V05P5EsgmE2C"
```

We need to add a User model to the system

```sh
rails g model user nickname:string name:string image_url:string provider:string uid:string
```

We need to create a session controller and expose it in the routes file from

```rb
get '/auth/:provider/callback', to: 'sessions#create'
```

We can now access the `auth_hash` inside the session create method.  
We can use `model.where(something).first_or_create` to get a copy of the model that has certain attributes - by getting an existing one or a creating a new one if needed.


### Deploying to Heroku

We will be deploying our sites to [Heroku](/workshop/heroku)
