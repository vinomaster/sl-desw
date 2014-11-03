# Slide Deck Instructions

Optionally, you can follow these steps (provided by (Matt Corkum](https://github.com/mattcorkum) to render the workshop slide deck using boot2docker.  


## Install boot2docker  

* Go to http://boot2docker.io/  to download for Mac or Windows.
* Install it: There is a video showing the mac install and the running of Docker engine and client via boot2docker.
 
## Render Slide Deck
These steps enable you to render any slides.md file in the filesystem to run on boot2docker

* Run boot2docker  -- click on the icon or find the app in the installed apps on windows
* Open a new terminal window
```
    mkdir presentation
    cd presentation
```
* Get the slide deck

This can be done via git or by downloading the zip at the git url below. We will start with howTo with git
 
* initialize git in this directory
```
   git init
```
* slides should be here now 
```
    $ git clone https://github.com/vinomaster/bcsm-dcw.git
```
Note: if you are not set up with git or have issues with certificates, then visit the above URL and download the zip and unpack the zip.
 
* hop into the slides directory
```
    $ cd sldesw/slides
```

* create and save a file called "Dockerfile" with the 1 line below (cAsE is important on the filename and on the CoNteNts)
```
 FROM parente/revealjs
``` 

* Type the following into the boot2docker terminal window
Note: Change terminal windows -- Click into the Boot2Docker shell — the below lines are typed into the boot2docker terminal window
* get the docker info 
```
    $ docker info
```
If this spits out something like this, then you are in the wrong terminal
2014/11/03 13:44:39 Get http:///var/run/docker.sock/v1.15/info: dial unix /var/run/docker.sock: no such file or directory
 
* Build it 
Slow the first time ONLY, it nevers need rebuilding again and it can be used with any slide deck later at run time.
```
    $ docker build -t myslides .
```
* Run the slide deck 
```
    $ docker run -d -P myslides
```
* Validate
Is it running, let's check to see what port it came up on
```
    $ docker ps 
``` 
* Get Port
View the markdown slides (to view a different set of slides, simple re-run this image from a directory with another deck. It will come up on a new port ---most likely port 49154). Noticed it picked port 0.0.0.0:49513->8000 so let's put that in the next line ...else change it to match what docker ps spits out)
* View Slides
Bring up a web browser against the port it picks initially (49153)
```
 open http://$(boot2docker ip 2>/dev/null):49153/#/
```
## Success
You have just installed Docker, created an image that will run any markdown slide deck. The container contains the slides.md that it was started with. enjoy!
