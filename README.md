# tow tow! (that's "bang bang" in case you're wondering)

Included with the repo is a [demo video](https://raw.githubusercontent.com/radishmouse/tow_tow_practice/master/demo.mp4), which you'll need to download to view. (Sorry for the inconvenience. I was feeling lazy and didn't want to have to upload the video to youtube just so I could embed it.)

Here's a screenshot.

![screenshot of processing sketch running](https://raw.githubusercontent.com/radishmouse/tow_tow_practice/master/screenshot.png)

## What is it?

It's a program written in [processing](https://processing.org/download/) that lets you do target practice at home, provided you've got a webcam for your computer and a laser cartridge for your firearm.

## Did you say "firearm"?

I did. 

Please be responsible.

## How does it work?

You hook up a webcam to your computer, point the webcam at a surface that isn't red. (That part is important.) You might want to print out a [suitable target](http://officeformula.com/wp-content/uploads/2017/12/Printable-Zombie-Targets-8.5x11-e1514247852698.png) and tape it onto the surface.

Start the processing sketch. You should hear a little song play when it is able to read data from the camera.

Then load up the laser cartridge, aim at the target, and move the trigger.

If the laser light falls on the target, the processing sketch should detect the red color. It will make a "ding" sound and the sketch window should stay red in that spot.

Also, you will see in the console a running count of how many hits you've made.

## What do I need?

Besides a computer running [processing](https://processing.org/download/), I used this webcam:

![webcam](https://raw.githubusercontent.com/radishmouse/tow_tow_practice/master/webcam.jpg)

and this laser cartridge:

![laser cartridge](https://raw.githubusercontent.com/radishmouse/tow_tow_practice/master/cartridge.jpg)


## Are there keyboard controls?

Why yes!

- Press the `space` bar to reset the count and the marks from previous hits. You'll hear the same little song play when you reset.
- Press the `up` arrow to increase the pixel threshold by 5. This should reduce the number of false positives.
- Press the `down` arrow to decrease the pixel threshold by 5. Do this if you're hitting the target, but it's not registering.


