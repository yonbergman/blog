---
layout: page
title: Installing Ruby
hide-title: true
header: false
---

## Installing Ruby
<span class="muted">Taken from RailsGirls</span>

To build apps and other things with Ruby on Rails, we need to setup some software and the developer environment for your computer.

Follow the instructions for your operating system. If you run into any problems, don&#8217;t panic.

* [Setup for OS X](#setup-for-os-x)
* [Setup for Windows](#setup-for-windows)
* [Setup for Linux](#setup-for-linux)
* [Using a Cloud Service - No Installation Required](#using-a-cloud-service)

<hr />

## Setup for OS X

### *1.* Let&#8217;s check the version of the operating system.

Click the Apple menu and choose *About this Mac*.

![Apple menu](http://guides.railsgirls.com/images/1.png "Apple menu")

### *2.* In the window you will find the version of your operating system.
If your version number starts with 10.6, 10.7, 10.8 or 10.9 this guide is for you. If it&#8217;s something else, we can setup your machine at the event.

![About this Mac dialog](http://guides.railsgirls.com/images/2.png "About this Mac dialog")

### *3a.* If your OS X version is 10.6, 10.7, or 10.8:
Download the RailsInstaller for your version of OS X:

* [RailsInstaller for 10.7 and 10.8](http://railsinstaller.s3.amazonaws.com/RailsInstaller-1.0.4-osx-10.7.app.tgz) <span class="muted">(325MB)</span>
* [RailsInstaller for 10.6](http://railsinstaller.s3.amazonaws.com/RailsInstaller-1.0.4-osx-10.6.app.tgz) <span class="muted">(224MB)</span>

Double click the downloaded file and it will unpack it into the current directory. Double click the the newly unpacked 'RailsInstaller-1.0.3-osx-10.7.app' or 'RailsInstaller-1.0.3-osx-10.6.app' and follow the instructions. It will open a README file with 'Rails Installer OS X' at the top. Please **ignore** the instructions in this file.

If the Rails version wasn't the latest, you could update it using a following command on terminal.

```sh
gem update rails --no-ri --no-rdoc
```

Make sure that all works well by running the application generator command.

```sh
rails new railsgirls
```

### *3b.* If your OS X version is 10.9:

If your version number starts with 10.9, follow these steps. We are installing homebrew and rbenv.

#### *3b1.* Install Command line tools on terminal:

```sh
xcode-select --install
```

#### *3b2.* Install [Homebrew](http://brew.sh/):

```sh
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

#### *3b3.* Install [rbenv](https://github.com/sstephenson/rbenv):

```sh
brew update
brew install rbenv rbenv-gem-rehash ruby-build
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```

#### *3b4.* Build Ruby with rbenv:

You can find the newest version of Ruby with the command "rbenv install -l".

```sh
rbenv install 2.1.2
```

If you got "OpenSSL::SSL::SSLError: ... : certificate verify failed" error, try it this way.

```sh
brew install curl-ca-bundle
cp /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt `ruby -ropenssl -e 'puts OpenSSL::X509::DEFAULT_CERT_FILE'`
```

#### *3b5.* Set default Ruby:

```sh
rbenv global 2.1.2
```

#### *3b6.* Install rails:

```sh
gem i rails --no-ri --no-rdoc
```

### *4.* Install a text editor to edit code files

For the workshop we recommend the text editor Atom.

* [Download Atom and install it](https://atom.io/)

If you are using Mac OS X 10.7 or older versions, you can use another editor [Sublime Text 2](http://www.sublimetext.com/2).

### *5.* Update your browser

Open [whatbrowser.org](http://whatbrowser.org) and update your browser if you don't have the latest version.


Now you should have a working Ruby on Rails programming setup. Congrats!

<hr />

## Setup for Windows

### *1.* Install Rails

Download [RailsInstaller](https://github.com/railsinstaller/railsinstaller-windows/releases/download/2.2.2/railsinstaller-2.2.2.exe) and run it. Click through the installer using the default options.

Open `Command Prompt with Ruby on Rails` and run the following command:

```sh
rails -v
```

If the Rails version is less than 4, update it using a following command:

```sh
gem update rails --no-ri --no-rdoc
```

Make sure that all works well by running the application generator command.

```sh
rails new railsgirls
cd railsgirls
rails server
```

### *2.* Install a text editor to edit code files

For the workshop we recommend the text editor Atom.

* [Download Atom and install it](https://github.com/atom/atom/releases/latest)
  * Download an atom zip file for windows and decompress it.
  * Copy the folder into your Program Files.
  * Launch atom in the folder.

If you are using Windows Vista or older versions, you can use another editor [Sublime Text 2](http://www.sublimetext.com/2).

Now you should have a working Ruby on Rails programming setup. Congrats!

### *3.* Update your browser

If you use Internet Explorer, we recommend installing [Firefox](mozilla.org/firefox) or [Google Chrome](google.com/chrome).

Open [whatbrowser.org](http://whatbrowser.org) and update your browser if you don't have the latest version.

<hr />

## Setup for Linux

### *1.* Install Rails


To install the Ruby on Rails development environment you just need to copy the line below for your Linux distribution (Ubuntu or Fedora), paste it in the Terminal and press Enter. Enjoy the text flying on the screen; it will take quite some time. Grabbing a refreshing drink before starting is encouraged.

#### For Ubuntu:

```sh
bash < <(curl -sL https://raw.github.com/railsgirls/installation-scripts/master/rails-install-ubuntu.sh)
```

If you are going to use RVM installations with gnome-terminal, you'll probably need to change it's default options before you can see and use the right Ruby and Rails versions. Find out how: [RVM documentation](http://rvm.io/integration/gnome-terminal).

#### For Fedora:

```sh
bash < <(curl -sL https://raw.github.com/railsgirls/installation-scripts/master/rails-install-fedora.sh)
```

Make sure that all works well by running the application generator command.

Make sure that all works well by running the application generator command.

```sh
rails new railsgirls
cd railsgirls
rails server
```


### *2.* Install a text editor to edit code files

For the workshop we recommend the text editor Sublime Text.

* [Download Sublime Text and install it](http://www.sublimetext.com/2)


### *3.* Update your browser

Open [whatbrowser.org](http://whatbrowser.org) and update your browser if you don't have the latest version.


Now you should have a working Ruby on Rails programming setup. Congrats!

<hr />

## Using a Cloud Service

Instead of installing Ruby on Rails and an editor on your computer, you can use a webservice for development. All you need is a browser and an internet connection. This guide explains how to get started with [nitrous.io](https://nitrous.io). If you're using a different service, they may use a different wording - e.g. 'workspace' instead of 'box', but the process is usually pretty similar.

### *1.* Update your browser

If you use Internet Explorer, we recommend installing [Firefox](mozilla.org/firefox) or [Google Chrome](google.com/chrome).

Open [whatbrowser.org](http://whatbrowser.org) and update your browser if you don't have the latest version.

### *2.* Create a free account
Go to [https://nitrous.io](https://nitrous.io/) and signup for free.

### *3.* Setup a development box / workspace for ruby on rails
* Login to your nitrous account
* Go to the dashboard by using the green 'Open dashboard' button
* Create a nitrous box: pick Ruby/Rails from the templates - everything else can stay as is, but you can change the name of your box if you want to
* It takes a moment until your box is ready

### *4.* Find and restart your development box
* If you've just created your box, you can probably skip these steps - they're good to know if you login to nitrous again later
* You can always find your nitrous boxes by going to the dashboard or choosing 'Boxes' from the top menu
* Pick your box from the list of boxes
* If you haven't used a box in a while, it might have been shutdown due to inactivity. If you are informed that your box is not running, restart it using the respective button
* When your box is up and running, choose 'IDE' in order to start coding

### *5.* Coding with your development box
* On the left hand side, you find a file browser where you can navigate your directories and file
* In the middle, you find the editor where you can modify your files
* At the bottom, you find the terminal where you can run commands
* Everything you need is here in you browser window - you do not need to start an editor or terminal anywhere else
* If your following a guide or tutorial, use the commands for Linux even if you are on a Windows computer - your operating system does not matter, since all commands are run on your development box, which is a Linux machine
* If a guide or tutorial asks you to point your browser to something like http://localhost:3000, go to the 'Preview' menu and pick 'Port 3000'
* If, for example, you're asked to open http://localhost:3000/posts, please append '/posts' manually to the URL that has been opened