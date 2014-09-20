---
layout: page
title: Exercise 3
hide-title: true
header: false
---
## Exercise 3 - Ideation web app


* Adding a header to the app
* Views/Layouts/Application.html
* `<header><h1>INV Ideas</h1></header>`

-

* Adding search over the ideas
* Add the following to your views/ideas/index.html.erb
*
```
<%= form_for ideas_path, method: 'get' do %>
  <%= search_field_tag :query, @query %>
<% end %>
```
* Now we have to filter the results displayed to the user
* ```
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
* To do a more fuzzy filter we can even use more complex SQL
* `      @ideas = Idea.where('title like ?', "#{@query}%")`

-

* Humainze time, show in table - created x min ago


-

* Static Page / Home page
* `rails g controller pages home`
* and routes.rb - `root to: 'pages#home'`

-

* Images from Flickr
* Start by adding a copying our flickr_class to the lib
* Add `gem 'flickraw'` to your gemfile and run `bundle install`
* Go to the idea.rb file
* import your flickr_class `require './lib/flickr_class.rb'`
* add an before_update callback `before_update :find_image`
* define this new find_image method
* ```
def find_image
    if title_changed?
      image_url = FlickrFinder.new().find(title)
      if image_url.present?
        self.image_url = image_url
      end
    end
  end  
  ```
* The last thing we need to do is go to the `index.html.erb` and change the output of the image_url to an image_tag
* `<td><%= image_tag idea.image_url %></td>`



## Things you might need

### Gems

To use Flickr I recommend you use the [FlickRaw gem](https://github.com/hanklords/flickraw)
You can also wrap the calls yourself using [HTTParty](https://github.com/jnunemaker/httparty)

### Ruby Tips
To get the command line parameters passed into a script you can use

```
ARGV # returns the array of params
ARGV[0] # returns the first parameter sent
```

## Advance stuff

* Add tests for controller methods [RSpec](https://github.com/rspec/rspec)
*
