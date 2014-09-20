---
layout: page
title: Exercise 1
hide-title: true
header: false
---
## Exercise 1 - Flickr Image Finder

This exercise is all about using plain Ruby to get things done.  

We will be creating a script that uses Flickr to find image thumbnails of a search query.  
The script should receive a search query (for example "cat")
and return the image url for a "Large Square" image that fits that search query.

```
> ruby ./my_flickr.rb cat
> Searching for cat...
> found image
> https://farm6.staticflickr.com/5593/15221986406_ee56dfe9c7_q.jpg
```

## Things you might need

### Flickr API
Two interesting calls to look at in the Flickr API are

* [flickr.photos.search](https://www.flickr.com/services/api/flickr.photos.search.html)
* [flickr.photos.getSizes](https://www.flickr.com/services/api/flickr.photos.getSizes.html)


You can create your own Flickr app and get tokens on the [Flickr API site](https://www.flickr.com/services/apps/create/)
or use the tokens I already generated -  

* api_key = 1823100373f8cd4cab51175a9bebee8a
* secret  = 24a429270aec9d05

### Gems

To use Flickr I recommend you use the [FlickRaw gem](https://github.com/hanklords/flickraw)  
You can also wrap the calls yourself using [HTTParty](https://github.com/jnunemaker/httparty)

### Ruby Tips
To get the command line parameters passed into a script you can use

```
ARGV # returns the array of params
ARGV[0] # returns the first parameter sent
```

## Extra Credit

* Wrap the logic inside a class so it can be re-usable later on.
* Enable to choose the size of image returned by the image finder class
* Do you support cases where the API isn't returning a search result?
* Add tests for your code using [RSpec](https://github.com/rspec/rspec)
* Integrate VCR to speed up your tests
