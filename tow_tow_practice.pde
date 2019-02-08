import processing.video.*;
import processing.sound.*;

int THRESHOLD = 15;

boolean isReady = false;
boolean isInspecting = false;

int videoScale = 1;
int cols, rows;

Capture video;
SoundFile ding;
SoundFile ready;
SoundFile smush;

float[] savedPixels;

boolean[] hits;
int hitcount = 0;

void setup() {
  size(320, 200);
  cols = width/videoScale;
  rows = height/videoScale;

  ding = new SoundFile(this, "ding.wav");
  ding.rate(1.5);
  ready = new SoundFile(this, "ready.wav");
  smush = new SoundFile(this, "smush.wav");
  // smush.rate(1);
  
  video = new Capture(this, cols, rows);
  video.start();

  savedPixels = new float[cols + rows * video.width];
  hits = new boolean[cols + rows * video.width];

  reset();

  background(0);  
}

void reset() {
  hitcount = 0;
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      savedPixels[i + j * video.width] = 0.0;
      hits[i + j * video.width] = false;      
    }
  }  
  
}

void captureEvent(Capture video) {
  video.read();
}

void keyPressed() {
  switch(keyCode) {
  case 32:
    // Resetting
    reset();
    // Play a sound signaling that we're ready to begin.
    ready.play();
    
    break;
  case 38:
    // if up arrow, increase threshold
    THRESHOLD += 5;
    println("THRESHOLD ", THRESHOLD);
    break;
  case 40:
    // if down arrow, decrease threshold
    THRESHOLD -= 5;
    println("THRESHOLD ", THRESHOLD);
    break;    
  }
}

void mousePressed() {
  isInspecting = !isInspecting;
}

void inspectColors() {
    loadPixels();
    // get the color where we clicked
    // int loc = (width - mouseX - 1) + mouseY * width;
    int loc = mouseX + (mouseY * width);
    color c = pixels[loc];
    float r = c >> 16 & 0xFF;
    float g = c >> 8 & 0xFF;
    float b = c & 0xFF;

    print("red: ", r);
    print(" green: ", g);
    println(" blue: ", b);  
}

void draw() {
  video.loadPixels();

  if (!isReady) {
    isReady = true;

    // Play a sound signaling that we're ready to begin.
    ready.play();
  }
  
  if (isInspecting) {
    inspectColors();    
  } else {
    scanShots();
  }
}

void scanShots() {
  video.loadPixels();

  int redCount = 0;
      
  // read pixels from video
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      int x = i * videoScale;
      int y = j * videoScale;

      int loc = i + (j * video.width);
      color c = video.pixels[loc];
      savedPixels[loc] = c;
      noStroke();      

      if (isRedEnough(c)) {
        redCount++;
        hits[loc] = true;
      } else if (hits[loc]) {
        fill(255, 0, 0);        
      } else {
        // Just draw in its normal color
        fill(c);        
      }

      rect(x, y, videoScale, videoScale);
    }
  }

  if (redCount > THRESHOLD) {
    // todo: move hits[loc] = true to this spot, but ony if the reds are in a cluster
    recordHit();
    // delay for 0.3 sec
  }  
}

boolean isRedEnough(color c) {
  float r = c >> 16 & 0xFF;
  float g = c >> 8 & 0xFF;
  float b = c & 0xFF;

  return (r > 200 && g < 180 && b < 150);   
}

void recordHit() {
   if (!ding.isPlaying()) {
     ding.play();
     // smush.play();
     hitcount++;
     println("Hit count ", hitcount);
   }   
}
