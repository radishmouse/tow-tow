# tow tow! (that's "bang bang" in case you're wondering)

Included with the repo is a demo video, which you'll need to download to view. (Sorry for the inconvenience. I was feeling lazy and didn't want to have to upload the video to youtube.)

## What is it?

It lets you do target practice at home, provided you've got a laser cartridge for your firearm.

## Did you say "firearm"?

I did. 

Please be responsible.

## How does it work?

You hook up a webcam to your computer, point the webcam at a surface that isn't red. (That part is important.) 

Start the processing sketch. You should hear a little song play when it is reading data from the camera.

Then load up the laser cartridge, aim at the target, and move the trigger.

If the laser light falls on the target, the processing sketch should detect the red color. It will make a "ding" sound and the sketch window should stay red in that spot.

Also, you will see a count of how many hits you've made.

## What do I need?

Besides a computer running processing, I used this webcam:

(logitech webcam image)

and this laser cartridge

(laser cartridge image)


## Are there keyboard controls?

Why yes!

- Press the `space` bar to reset the count and the marks from previous hits.
- Press the `up` arrow to increase the pixel threshold by 5. This should reduce the number of false positives.
- Press the `down` arrow to decrease the pixel threshold by 5. Do this if you're hitting the target, but it's not registering.


