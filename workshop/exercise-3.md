---
layout: page
title: Exercise 3
hide-title: true
header: false
---
## Exercise 3 - Ideation App - Level Up

We will now work on improving our ideation app and adding more features to it.

### From this
<img src='/workshop/v0.png'></img>

### To this
<img src='/workshop/v1.png'></img>

<hr/>

## Things to do

### Adding a header to the app

* Check out `app/views/layouts/application.html.erb`

```html
<header>
  <h1>INV Ideas</h1>
</header>
```

### Adding search to the app

We want to add the option to search for ideas based on their name

You can add the search form at `app/views/ideas/index.html.erb`  

```erb
<%= form_for ideas_path, method: 'get' do %>
  <%= search_field_tag :query, @query %>
<% end %>
```

Now we have to filter the results displayed to the user.  
You can find the code for loading the ideas at `app/controllers/ideas_controller.rb`

```ruby
def index
    @query = params[:query]
    if @query.blank?
      @ideas = Idea.all
    else
      @ideas = Idea.where(title: @query)
    end
    render 'index'
  end
```

Play around with the search - cool.  
We can even do some fuzzy searches by replacing our where query

```ruby
@ideas = Idea.where('title like ?', "#{@query}%")
```

### Adding the creation time for each idea

We'll start by adding another column to the table - check out `app/views/ideas/index.html.erb`

Each model in rails has two attributes you can use `created_at` and `updated_at` which are timestamps of the creation time and last time a model updated.

Rails has a lot of [Date helper methods](http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html) - specifically [`time_ago_in_words(time)`](http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-time_ago_in_words)


### Adding a home page

Go to [http://localhost:3000](http://localhost:3000) - this is not what we want

Create a new static view

```sh
rails g controller pages home
```

Now we want to hook up this new page at the root of our site - `config/routes.rb`  

```ruby
get 'pages/home' # you can remove this line
root to: 'pages#home' # and add this line
```

You can go to `app/views/pages/home.html.erb` to write whatever content you want in that page.

### Integrating your Flickr lib

We now want to integrate our Flickr library with our new site.  
If you don't have a Flickr class you can use one I made [flickr_class.rb](/workshop/fickr_class.rb)

We start by copying our flickr class file to the /lib folder.  
make sure to add any gems you used to the `Gemfile` and run `bundle install`

Go to `/app/models/idea.rb` this is the class for the idea model.  
We need to require the file you just added `require './lib/flickr_class.rb'` replace flickr_class with your file's name.

ActiveRecord - the Rails sub library that handles the models and database has [callbacks](http://edgeguides.rubyonrails.org/active_record_callbacks.html).
Specifically we're interested in the `before_update` callback.  
Inside the callback we can check to see if a specific attribute changed by querying the method `[attribute]_changed?`  
For example `title_changed?` to test if the title attribute was changed during this save  

The last thing we need to do is go to the `app/views/ideas/index.html.erb` and change it so that instead of writing the image_url we show an actual image
Again Rails has a helper we can use `image_tag` that receives a image_url and outputs the correct HTML.
