---
layout: page
title: Exercise 4
hide-title: true
header: false
---
## Exercise 4 - Ideation App - Coat of paint

Our next step is to add a nice coat of paint to our app.

### Nicer Site
<img src='/workshop/v2.png'></img>

<hr/>

## Things to do

### _Start:_ Add Dependencies

We'll be using 3 libraries to prettify our app - let's add them all now.

Add these to the `Gemfile`

```ruby
gem 'bootstrap-sass'
gem 'compass-rails'
gem 'font-awesome-rails'
```

And run `bundle install` to install all of them.

### Adding Bootstrap

We'll start with a bit of bootstrapping - [http://getbootstrap.com/](http://getbootstrap.com/)

A cool site to get a color pallet from - [google.com/design](http://www.google.com/design/spec/style/color.html#color-ui-color-palette)

Bootstrap is CSS library that we use that lets us use bootstrap through the app.

Import Bootstrap styles in `app/assets/stylesheets/application.css.scss` (rename application if its not named css.scss)

```scss
@import "bootstrap-sprockets";
@import "bootstrap";
```

Bootstrap should now work in the app.

We will wrap the main yield in `app/view/layouts/application.html.erb` and wrap the yield with

```
<div class='container'>
	<%= yield %>
</div>
```

#### List of things to add

* Add a global header to the app using [navbar](http://getbootstrap.com/components/#navbar)
* Move the search to the header
* Make the table nicer either using [tables](http://getbootstrap.com/css/#tables) or [list group](http://getbootstrap.com/components/#list-group)
* Replace the links with [buttons](http://getbootstrap.com/css/#buttons)
* Improve the form in `app/views/ideas/_form.html.erb` to use [horizontal form](http://getbootstrap.com/css/#forms-horizontal)
* Show an [alert](http://getbootstrap.com/components/#alerts) when the search returns no item.

## Fontawesome

[Font Awesome](http://fontawesome.io/) is a great icon font that contains lots of scalable icons to use.

Add it to the `app/assets/stylesheets/application.css.scss`

```scss
@import "font-awesome";
```

So that you can use it.
Integrate the new icons into the system - I suggest as the icon.


## Compass

[Compass](http://compass-style.org/) is a mixin library for SASS that include lots of utility methods when writing your CSS.

Lets use the [`adjusted-lightness`](http://compass-style.org/reference/compass/helpers/colors/#adjust-lightness) mixin to create situational colors.


## Javascript

The next thing will be adding a Twitter(like) character counter. Although we could possible find one on-line - we'll be building our own one to play around with JS and Rails.

We'll start by adding our very first javascript file `/app/assets/javascript/counter.js`

Inside it we'll add this basic outline - an update the internals

```js
$(document).on('ready page:load', function(){
  alert('Hey Javascript works!');
});
```


## Adding comments

Our next and last step to upgrading the app is adding comments.

We can use the ['acts_as_commentable'](https://github.com/jackdempsey/acts_as_commentable) gem.

After you have it installed we now need to enable users to view and add comments.

We'll start by adding a route to support this new nested model.

```rb
resources :ideas do
  resources :comments, only: [:create]
end
```

We also need to create this new controller `/app/controllers/comments_controller.rb`


```rb
class CommentsController < ApplicationController
  def create
    # find the current idea
    # get the comment text from the params
    # create new comment on this idea
    # redirect the user back
  end
end
```

And the last thing we need to do is to add a new form that creates new ideas.

```erb
<%= form_for [@idea,@idea.comments.new] do |f| %>
  # the fields for the comment + button
<% end %>
```

Also, we need to print out the existing comments in the system.
