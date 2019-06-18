---
layout: single
title: "Swift and UIViewControllers"
date: 2015-07-10T13:53:41+02:00
tags: ios
---

I've come across a very neat trick for working with UIViewControllers, storyboards (or XIBs) and Swift.    
It's a nice and easy way to remove all the setup gunk from your `viewDidLoad` methods in your ViewControllers and move them to where they belong.

<!--more-->

So let's start by defining the issue - a lot of times when initializing a view controller from a storyboard you have to add some custom code to initialize something that is either hard or impossible to do in the Interface builder.

Let's say that we have a page with a simple TableView and we want to initialize that TableView with a content inset so that it never overlaps the icon on the bottom

![](/images/posts/swift-uiviews/ib.png)
<small class='text-center'>Our ViewController in Xcode's Interface builder</small>

Regularly we would have done that extra setup in our `viewDidLoad` method in the ViewController.    

```swift

class MyViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  func viewDidLoad() {
  	super.viewDidLoad()
	tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
  }
}
``` 
This is a great way to do things like that - but when you have a complicated ViewController your `viewDidLoad` method can get really messy and clogged up with lots of UI setup code.

### Where Swift comes in

In Swift we have this awesome feature called [**Property Observers**](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID262) that let's us add an observer method to a property of our class, this method get's called whenever the property gets modified. Specifically we use `didSet`.
 
We can utilize this feature to run our setup code when the view object is assigned to it's property outlet (which happens after the ViewController decodes the storyboard).  
In this way we have all our UI setup code in its contextual place and our `viewDidLoad` is free to manage the logic and not the UI :)

```swift
class MyViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    }
  }
}
```


----

I've been really enjoying playing around with Swift for the last couple of months, I'll be sharing some more tips as I find them :)   
So be sure to follow me on twitter [@yonbergman](http://twitter.com/yonbergman).
