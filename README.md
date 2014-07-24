Creston
=======

Creston is a very tiny deployment script for deploying Rails 4 applications. For those times when Capistrano is overkill &amp; Heroku is too expensive. 

Warning
-----

I made Creston because I'm lazy. It sacrifices a lot of things for the sake of brevity. If your Rails app (1) makes money, (2) has mutliple stages or servers, (3) requires easy rollbacks, (4) keeps satellites in orbit, OR (4) you want to deploy from a remote git repo, YOU SHOULD NOT USE IT. 

If, however, you have an app that is small, experimental, or MVP-ish in nature, creston can be a great way to get it online quickly. 

Installation
-----

[Like the town it was named after](http://en.wikipedia.org/wiki/Creston,_California), Creston is small, ugly, and not a gem. To install Creston, just clone the repo and copy the deploy.sh and .crestonignore files to the root of your Rails project locally. 

Then, edit the 4 lines of the deploy.sh file with the details of your remote server. 

Once, you've done that, just run `./deploy.sh` or `./deploy.sh rvm` (if your server uses rvm) from the terminal. Your Rails files will rsync to your server, then the bundle cmd will be called, and finally the migration rake task is run. 

Digital Ocean Rails Image
-----

One thing that prompted me to build this was [Digital Ocean's Ruby-on-Rails one-click image](https://www.digitalocean.com/features/one-click-apps/). It's a great way to get a Rails server deployed quickly and cheaply. Creston should work with that configuration almost out of the box. 