---
layout: single
title: "Static Sites with Parse"
date: 2015-04-27T29:34:41+02:00
tags: parse, javascript
---

Lately I've been really enjoying building my side projects on [Parse](http://parse.com) as opposed to using Heroku. But it hasn't all been a walk on the beach. I've encountered several issues when building static sites and I wanted to share two tricks for building better sites on Parse.

<!--more-->

First I wanted to share a few of the reasons why I enjoy using Parse:

* It makes me build sites that easily withstand greater traffic since they're mostly static
* I can host the static sites wherever I want Parse/S3/VPS
* I get to play around and hone my server side javascript skills
* Parse has a great offering for managing so many things (The built-in admin & analytics are a blast)

![](/images/posts/parse/sea.png)
<small class='text-center'>An actual walk on the beach</small>

## Separating the code into multiple files


One of the most basic things for a developer's sanity is not to have all the code in one huge file, a guideline much easier said than followed in Parce. While the Parse documentation is incredibly good, it lacks any direction as to how you can manage your cloud code nicely.

The solution is very simple, Parse offers a way to manage dependencies in a fashion similar to - [**CommonJS**](http://wiki.commonjs.org/wiki/CommonJS), with something that they call [Modules](https://parse.com/docs/cloud_code_guide#modules).  
For anyone who hasn't worked with CommonJS or the likes, it is a simple JS module loader that lets you manage dependencies in JS.

Let's take for example this simple app with a player model and one cloud function:

```
- cloud
    |- models
    |    \- player.js
     \- main.js
```

#### cloud/models/player.js
```javascript
var Player = Parse.Object.extend("Player", {

}, {
  find: function(id) {
    var q = new Parse.Query(Player);
    return q.get(id);
  }
});

module.exports = Player;

```

#### cloud/main.js
```javascript
var Player = require('cloud/models/player.js');

Parse.Cloud.define("gameOver", function(request, response){
  Player.find(request.params.id).then(function(player){
	// ... Do something with player
  });
});

```

The two important lines to understand are the last line of `player.js` where we expose our newly created Player class to whoever will _depend_ on us,   
and the first line of `main.js` where we announce our _dependency_ on the player file and receive the class that was exposed allowing us to use it.

That's all there is to setting up file dependencies in Parse cloud code.


## Writing Coffeescript code

Parse cloud code doesn't support coffee script out of the box, which is a shame because it makes writing JS so much more fun. To get around this issue, I came up with a nice little solution that also lets me re-use code between the Cloud and the Client.

My solution relies on [Middleman](https://middlemanapp.com) - a great library that I've been using more and more lately. Middleman lets you generate static sites with ease (it's written in Ruby and very similar to Jekyll).

#### Mixing Middleman and Parse
To start combining middleman and parse, it's important to understand what Parse expects to get and run. Parse expects two main parts for a static site, first a `cloud/main.js` file as the entry point to the cloud code, and second, a `public` folder containing static html, css, js of the site.

If we were to create an empty Middleman project, we would be almost halfway to getting a static site running on Parse :)
Middleman's build directory is called `build` by default and we can either reconfigure Middleman to output the static files that are compiled to `public` or create a symbolic link from `public` to `build` (I prefer the symbolic link).
To create the link, all you need to do is run: 

```sh
ln -s build public
``` 
and you can even commit this link into your git repo without filling git with junk.  
You now have a static site generated using Middleman running on Parse (of course you also need to deploy the changes to Parse).

The next part is to get the cloud code running as well. We want to write it in Coffeescript and also potentially share it with the client-side JS we rendered with Middleman and served via the `public` directory.

My solution is to have a file under the `source/javascript` directory that will compile to be the final `cloud/main.js`

```
- source/javascripts
		| - cloud
		|	  \- gameOver.js.coffee 
		|
		| - models
		|     \- player.s.coffee
		|
		| - all.js.coffee
		\ - cloud.js.coffee
		      
```

#### source/javascripts/cloud.js.coffee

```coffee
#= require_self	
#= require_tree ./models
#= require ./cloud/gameOver.js.coffee
MyApp = {}
```

This file can use middleman's Asset Pipeline (sprockets) to require any files that, at build time, will compile to the final javascript. *Note* that by structuring the source folder correctly we can share files between the js going to the client side (`all.js`) and the js running on the Parse cloud (`cloud.js`).

The last piece of the puzzle is to create another symbolic link, this time linking `cloud/main.js` to `build/javascripts/cloud.js` - again this is done by running the command

```sh
ln -s build/javascripts/cloud.js cloud/main.js
```


### It all comes together
Now that we have a Middleman app ready and shared code between client and server and the cloud code all ready, deployments of a new version require this simple two-step process.

```javascript
> middleman build  	// compile the latest version of the site and code
> parse deploy 		// deploy the newly compiled code to Parse's servers
```

We just need to make sure you configure your Parse app to server static content and we're good to go :)

![](/images/posts/parse/eize.jpg)
<small class='text-center'>A site developed in Middleman & Parse</small>

----

I really hope these two pointers find their way to helping people building cool things, let me know if this helped you or if you have any follow-up questions.

You can always find me on twitter [@yonbergman](http://twitter.com/yonbergman).
