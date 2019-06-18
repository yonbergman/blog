---
layout: single
title: "Global day of coderetreat 2014 - New Session"
date: 2014-11-16T12:34:41+02:00
tags: culture
---

This weekend I had the pleasure of hosting the 4th annual [Global Day of Coderetreat](http://gdcr.coderetreat.org/) at our eBay offices in Tel-Aviv. This was the 4th year hosting and facilitating the GDCR one of my favorite events of the year.
This year we got really creative and came up with a completely brand new type of session which was great!

<!--more-->

![](/images/posts/gdcr/too-many-cooks.jpg)
<small class='text-center'>People mesmerized to 'Too Many Cooks'</small>

For those of you who haven't heard about it - the [Global Day of Coderetreat](http://gdcr.coderetreat.org/) is a day where 150+ cities around the world, from Australia to Hawaii, all host a coderetreat.  
Coderetreats are events where developers come together to hone their craft and work on bettering themselves and their coding community.  
In a coderetreat we usually have 6 sessions throughout the day where you solve [Conway's Game of Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life) each time paired with a different partner and set to different constraints.

![](/images/posts/gdcr/Gospers_glider_gun.gif)

This year me and my co-host [@avivby](http://twitter.com/avivby) wanted to try something new.
For the past 3 years we have a routine that more or less works, with the order and timing of the different sessions.  

We had a small issue in past years that after lunch people get tired - to try and combat that we moved our best session (the evil mute programmer) to be just after lunch. This helped greatly but created a new issue - now people where getting unfocused after this 4th session.

We were talking before this year's event and trying to come up with a new and exciting session that we can add during the day. I remembered that in the last GOGARUCO I was exposed to a different code kata called the [The Gilded Rose](https://github.com/professor/GildedRose), I really liked the idea of having a kata where you work on existing code that simulates the pain of working on a real legacy system.  
We decided that we want to have a sessions like that in this years' coderetreat, we discussed where the source/starting code will be from and though what better than from the evil mute programmer session.

### Initech - New employee onboarding process
So in this year's coderetreat at the end of the 4th session (Evil mute programmers) we asked everyone instead of deleting the code to zip the code and tests and to upload them to a mini-site that we set up for them.
![](/images/posts/gdcr/upload.png)

After the retrospective for the 4th session we kicked of the 5th session by welcoming everyone to their new job at Initech and assuring them that the legacy system they're going to be working on for the next session was built by our best people :)

![](/images/posts/gdcr/choose.png)
In this 5th session they would be receiving a random zip file containing the code from one of the other pairs in the previous session and they had to complete the code while fitting the code to a new constraint (they now have to support a sized infinite world.)
![](/images/posts/gdcr/download.png)
This session was a blast, almost as fun as the evil mute programmer one - people had the chance to receive code that had tests (even though they they didn't always pass) and have to adapt someone else's code. It really helped keep the excitement from the 4th session alive and had people very energetic all the way to the end of the coderetreat.


### Building the site
The mini-site is very simple, it's a single page application written with Backbone, Coffeescript, SASS, HAML & Parse.com.
It isn't the nicest piece of code but I built it in a couple of hours and it works.  
I chose to use Parse as a database/backend mostly because I wanted to try it out and it was a delightful experience. It was super easy to get going with Parse as a simple data storage and even easier to integrate it with Backbone.  
It was a long time since I've done Backbone without Marionette - and I really can't see how one can do that in a real project. [Marionette](http://marionettejs.com/) just solves so much of the cruft that comes out of working with Backbone.

![](/images/posts/gdcr/parse.png)

I built the mini-site as part of the already existing site I had for the Israeli coderetreat events so it was based on a very simple Sinatra server that compiles the HAML/SASS/Coffee - but you can probably do without it and deploy to S3 or anyplace that accepts static sites.

I extracted the code so you can easily set up your own server running on Heroku - just [clone the repo](https://github.com/yonbergman/coderetreat-initech) and follow the instructions.


----

If you haven't participated in a coderetreat yet, look for the next one being held close to you or organize one by yourself. It's an exciting event that brings back energy and passion into coding.

You can always find me on twitter [@yonbergman](http://twitter.com/yonbergman).
