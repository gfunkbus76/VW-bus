#!/bin/bash

omxplayer -b --win 0,0,1920,720 --no-keys --timeout 2 --fps 30 --display=2 /usr/share/openautopro/newsplash.mp4 & omxplayer -b --timeout 2 --win 0,0,1024,600 --fps 30 --display=7 /usr/share/openautopro/newsplash.mp4

#this is for a dual screen splash screen for use in my vw bus project with Open Auto Pro
