
// extension of the DropListener class

void dropEvent(DropEvent theDropEvent) {
}

class MyDropListener extends DropListener {

  color bgColor;
  String displayText = "drag-and-drop image to load";

  MyDropListener() {
    bgColor = color(0, 0);
    setTargetRect(0, 0, width, height);
  }

  void draw() {
    fill(bgColor);
    rect(0, 0, width, height);

    fill(255);
    text(displayText, width/2, height/2);
  }

  void dropEnter() {
    bgColor = color(0, 150, 255, 100);
  }

  void dropLeave() {
    bgColor = color(0, 0);
  }

  void dropEvent(DropEvent theEvent) {

    // if input file is a GIF, get the file's path and
    // extract the files in a thread (so we can let us
    // know what's happening)

    File f = theEvent.file();
    if (f.getName().endsWith(".gif") || f.getName().endsWith(".GIF")) {
      inputGif = theEvent.file();
      displayText = "extracting frames - may take a bit...";
      thread("extractFrames");
    }
    else {
      displayText = "gifs only, please :)";
    }
  }
}

