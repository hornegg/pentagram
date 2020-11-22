
int pentagramRadius = 150;
int dotRadius = 30;
boolean invert = false;

void setup() {
  size(512, 512);
  background(128);
}

PVector getPointOnPent(int n) {
  float angle = 4 * PI * n / 5;

  angle += invert ? HALF_PI : -HALF_PI;

  return new PVector(
    pentagramRadius * cos(angle),
    pentagramRadius * sin(angle)
  );
}

void draw() {
  pushStyle();
  noStroke();
  fill(128, 20);
  rect(0, 0, width, height);
  popStyle();
  
  int sideFrames = 100;
  translate(width/2, height/2);

  int sideStart = (frameCount / sideFrames) % 5;
  int sideEnd = (sideStart + 1) % 5;
  int sidePos = frameCount % sideFrames;

  PVector start = getPointOnPent(sideStart);
  PVector end = getPointOnPent(sideEnd);
  
  ellipse(
    map(sidePos, 0, sideFrames, start.x, end.x),
    map(sidePos, 0, sideFrames, start.y, end.y),
    30,
    30
  );
  
}
