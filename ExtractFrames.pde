
// extract frames from animated GIF

void extractFrames() {

  deleteFrames();                                              // delete any previous frames
  frames = Gif.getPImages(this, inputGif.getAbsolutePath());   // extract frames

  // go through all frames, set on background the size of
  // the current screen, save
  for (int i=0; i<frames.length; i++) {
    PGraphics pg = createGraphics(displayWidth, displayHeight);
    pg.beginDraw();
    pg.background(255);

    // resize depending on proportions
    if (frames[i].width < frames[i].height) {
      frames[i].resize(0, displayHeight);
    }
    else {
      frames[i].resize(displayWidth, 0);
    }

    // place image and save
    pg.image(frames[i], pg.width/2 - frames[i].width/2, 0);
    pg.endDraw();
    pg.save(sketchPath("") + outputFolder + "/" + nf(i, 3) + ".png");
  }

  gotFrames = true;
  dropListen.displayText = inputGif.getName();
}

// delete existing frames in the folder
void deleteFrames() {
  try {
    File dir = new File(sketchPath("") + outputFolder);
    File[] files = dir.listFiles();
    for (File f : files) {
      if (f.isFile()) f.delete();
    }
  }
  catch (NullPointerException npe) {
    // output folder doesn't exist yet, skip
  }
} 

