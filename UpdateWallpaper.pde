
// does the real work...

void updateWallpaper() {
  String[] params = {
    "osascript", "-e", "tell application \"Finder\"", "-e", "set the desktop picture to POSIX file \"" + sketchPath("") + outputFolder + "/" + nf(int(random(frames.length)), 3) + ".png\"", "-e", "end tell"
  };

  try {
    Process p = Runtime.getRuntime().exec(params);
    int i = p.waitFor();
  }
  catch (Exception e) {
    // errors :(
  }

  prevMillis = millis();
}
