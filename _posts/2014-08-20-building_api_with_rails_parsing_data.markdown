---
layout: post
title: "Building an API with Rails: Parsing Data"
date: 2014-08-20T23:14:32+03:00
comments: true
---

Recently I had the chance of working on a project that was 95% API. 
There are tons of blog posts on the best practices behind building an API with Rails. Most of them have a lot of very cool info on things from security, versioning and auditing calls.
Many of the guides mention the importance of using a serializer that's more complex and feature-full than Rails' standard `respond_to` and `.to_json`. 

You have many options, whether it's
[JBuilder](https://github.com/rails/jbuilder), 
[ActiveModel::Serializer](https://github.com/rails-api/active_model_serializers), 
[Grape](https://github.com/intridea/grape#restful-model-representations),
or [Rabl](https://github.com/nesquena/rabl).

<img src='/images/posts/parsing_api/cuneiform.jpg'></img>

I found that [ActiveModel::Serializer](https://github.com/rails-api/active_model_serializers) works in a way that best fits me, both from functionality and style perspectives.  
The issue with these libraries is that they only handle the creation of JSON representations of your data objects in a way that you can pass out, but what about the other way around?  
When writing an API, you will encounter the need to parse data sent to you from JSON format to something that fits your object model.


## Parsing Data

I found that using [Hashie](https://github.com/intridea/hashie) is the best tool for this job. It fits the style I was looking for and mirrors using ActiveModel::Serializer on the serializing end.
Hashie is awesome because it comes with a lot of things out the gate that helps you parse nested data objects.
Hashie has verification and transformation capabilities which are a **must** when working with data passed into your system.
Hashie also provides a very clean output that both works as a Hash (with indifferent access) `object[:property]` and as an object that you can access like a regular class `object.property`.

Here's an example of parsing a request sent to an imaginary API that books tickets:

```ruby
module Api
 class TicketBooker
    def self.book_ticket(request_body)
        parsed_request = new Request(request_body)
        # ... more work
    end
 end
 
 # Incoming JSON format
 # {
 #   'user_id': 13,
 #   'booking': {
 #     'show_id': 37,
 #     'price': 75.99,
 #     'seats': 2,
 #     'preorder': true,
 #   }
 # }

 class Request < Hashie::Trash
  property :user_id, required: true
  property :booking, 
           with: -> (hash) { Request::Booking.new(hash.symbolize_keys) }

  class Booking < Hashie::Trash
    property :show_id, required: true
    property :price_cents, from: :price, with: -> (float) { (float * 100).to_i }
    property :number_of_seats, from: :seats
    property :preorder
  end
end


```

This code accepts a JSON and parses the data out into the format that the rest of the system accepts. 
You can nest as many of these as you want, as we use the Hashie::Trash's transformation block to pass the parsing to a deeper level of the nesting.

It also handles exceptions really well - if a required parameter is missing an `ArgumentError` will be raised.
Similarly, if the user passes any unexpected parameter a `NoMethodError` will be raised.  
You could potentially allow passing of unknown parameters by including a module provided in hashie.

```ruby
class Request < Hashie::Trash
  include Hashie::Extensions::IgnoreUndeclared
end
```

The Hashie::Trash object created is really flexible and you can use it as a clean object and access properties in a very nice way, or as a Hash which you can use it normally.   
Potentially you could transform the inbounding request to fit a Rails' nested_attributes chain so that you could validate the data and pass it straight to a Rails' model `.create` method which is really cool - just note that if you do that and use Rails 4+ or strong parameters, you'll need to use [Hashie::Rails](https://github.com/Maxim-Filimonov/hashie_rails) which bypasses an issue with `:permitted?` on Hashie objects.

```ruby
# using a Hashie object

parsed_request = new Request(request_body)
parsed_request.user_id                # 13
parsed_request[:user_id]              # 13
parsed_request.booking.price_cents    # 7599
parsed_request.booking[:price_cents]  # 7599
parsed_request.booking.preorder?      # true
parsed_request.merge!({foo: :bar})    # {...}
```
 
## Other Uses

You can also use Hashie to parse responses when you call an API.
It's super useful especially when working with APIs that have a very standard way to respond.
I first saw this used in an old version of [Octokit](https://github.com/octokit/octokit.rb/tree/v1.25.0) where they used [Faraday](https://github.com/lostisland/faraday_middleware/blob/master/lib/faraday_middleware/response/mashify.rb) to mashify the responses from the GitHub API.  
*Hashie::Mash* is a more loose version of Hashie::Trash that doesn't support transformations or requires and is useful when you just want to generically wrap a Hash in a more robust interface. Hashie::Mash is also auto deep, meaning that any sub-hashes are also wrapped by the Mash.

When I started wrapping calls to other APIs in the server, I also used Hashie to parse the responses generated, although I used [HTTParty](https://github.com/jnunemaker/httparty) and not Faraday to do the calls. (The code that wrapped the response was delegated to an HTTParty parser, but that's a story for a different blog post.)

----

When working on the API, it was very surprising that not many people touched the subject of parsing requests and I hope this helps a few people down the path of building better, more stable APIs... until next time :)   
You can always find me on twitter [@yonbergman](http://twitter.com/yonbergman).

_P.S._ I'll be speaking at this year's [Golden Gate Ruby Conference](http://gogaruco.com/speakers/#ybergman) in San Francisco in September. It'd be cool to meet you so say hey if you see me walking around the conference hall.

  

