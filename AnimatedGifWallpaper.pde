import gifAnimation.*;    // to load animated GIF as still frames
import sojamo.drop.*;     // for drag-drop of input file

/*
SET DESKTOP WALLPAPER
 Jeff Thompson | 2013 | www.jeffreythompson.org
 
 Runs a short AppleScript command to set the desktop wallpaper to
 a frame from an animated GIF.
 
 Required libraries:
 + gifAnimation for GIF parsing
 http://www.extrapixel.ch/processing/gifAnimation
 + sDrop for fancy drag-and-drop import
 http://www.sojamo.de/libraries/drop
 
 */

float speed = 1.0;                        // time between frames in seconds
String outputFolder = "ExportedFrames";   // folder to outpt GIF frames to

long prevMillis = 0;              // store time for updating frames
boolean gotFrames = false;        // do we have an input of frames yet?
File inputGif;                    // input file
PImage[] frames;                  // split frames from GIF
PFont font;                       // font for UI
SDrop drop;                       // drag-and-drop objects
MyDropListener dropListen;
int interval = int(60/speed);     // interval (1-second / speed) = time between in ms


void setup() {
  size(500, 300);
  frame.setTitle("Animated GIF Wallpaper");
  noSmooth();
  
  font = createFont("Monaco", 28);     // load font
  textFont(font, 14);
  textAlign(CENTER, CENTER);

  drop = new SDrop(this);              // initialize drag-and-drop
  dropListen = new MyDropListener();
  drop.addDropListener(dropListen);
}


void draw() {
  background(0);
  dropListen.draw();

  // if a GIF is loaded and enough time has passed, update the frame/wallpaper
  if (gotFrames && millis() > prevMillis + interval) {
    updateWallpaper();
  }
}

