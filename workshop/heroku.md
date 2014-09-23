---
layout: page
title: Deploying to Heroku
hide-title: false
header: false
---

### Get Heroku

Follow steps 1 through 3 of the [quickstart guide](https://devcenter.heroku.com/articles/quickstart) to sign up, install the toolbelt, and login.

### Preparing your app

#### Version Control Systems

We need to add our code to version control. You can do this by running the following in the terminal:

```sh
git init
echo "tmp" >> .gitignore
echo "logs" >> .gitignore
git add .
git commit -m "initial commit"
```

#### Updating our database

First, we need to get our database to work on Heroku, which uses a different database. Please change the following in the Gemfile:

```rb
gem 'sqlite3'
```

to

```rb
group :development do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end
```

Run `bundle install --without production` to setup your dependencies.

#### Adding rails_12factor

Next, we need to add `rails_12factor` entry into our Gemfile to make our app available on Heroku.

This gem modifies the way Rails works to suit Heroku, for example Logging is updated and the configuration for static assets (your images, stylesheets and javascript files) is tweaked to work properly within Heroku's systems.

Please change the following in the Gemfile:

```rb
group :production do
  gem 'pg'
end
```

to

```rb
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
```

After this run `bundle`, then commit the changes to Gemfile.lock to your repository:

```sh
git commit -a -m "Added rails_12factor gem and updated Gemfile.lock"
```


### Deploying your app

#### App creation

We need to create our Heroku app by typing `heroku create` in the terminal and see something like this:

```sh
Creating sheltered-refuge-6377... done, stack is cedar
http://sheltered-refuge-6377.herokuapp.com/ | git@heroku.com:sheltered-refuge-6377.git
Git remote heroku added
```

In this case "sheltered-refuge-6377" is your app name.

#### Pushing the code

Next we need to push our code to heroku by typing `git push heroku master`. You'll see push output like the following:

```sh
Initializing repository, done.
Counting objects: 101, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (91/91), done.
Writing objects: 100% (101/101), 22.68 KiB | 0 bytes/s, done.
Total 101 (delta 6), reused 0 (delta 0)

-----> Ruby app detected
-----> Compiling Ruby/Rails
-----> Using Ruby version: ruby-2.0.0
-----> Installing dependencies using 1.6.3
       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
       Fetching gem metadata from https://rubygems.org/..........
...
-----> Launching... done, v6
       http://sheltered-refuge-6377.herokuapp.com/ deployed to Heroku
```

You'll know the app is done being pushed, when you see the "Launching..." text like above.

#### Migrate database

Next we need to migrate our database like we did locally during the workshop: `heroku run rake db:migrate`.

When that command is finished being run, you can hit the app based on the url. For this example app, you can go to <http://sheltered-refuge-6377.herokuapp.com/>. You can also type `heroku open` in the terminal to visit the page.

Hurrah!
