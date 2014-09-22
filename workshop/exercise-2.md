---
layout: page
title: Exercise 2
hide-title: true
header: false
---
## Exercise 2 - Ideation App - First Steps

This exercise will let you build your first Rails app.

We will be building an site that will collect ideas, show ideas and edit ideas

Make sure you have Rails 4 or better installed `rails -v`

* Installing Rails `gem install rails`
* Updating Rails `gem update rails`

We'll then create our very first app by running the following command in the `02-ideation-app` folder

```
rails new ideation -m http://www.yonbergman.com/workshop/template.rb
```

Go into the new `/ideation` folder created in the terminal
and also open it up with your text editor.
Go over the directory strucutre and see all that we've created.

Run `rails server` to start up your app
go to [http://localhost:3000](http://localhost:3000) to visit your new site


We'll be using `rails generate scaffold` to start the basics of our server.

Close the server in your terminal - and run

```
rails generate scaffold idea title:string description:text image_url:string
rake db:migrate
```

This first generates the required migration commands and models in the system, and then updates your local database accordingly.

Start your server again with `rails server` and visit
[http://localhost:3000/ideas](http://localhost:3000/ideas)

Play around with your new site. Create at least 5 ideas. (You may leave the image field empty for now).
