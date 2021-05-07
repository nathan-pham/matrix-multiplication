float angle = 0;
PVector[] points = {
  new PVector(-50, -50),
  new PVector( 50, -50),
  new PVector( 50,  50),
  new PVector(-50,  50),
};

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  noFill();
  stroke(0);
  strokeWeight(4);
  
  for(PVector v : points) {
    point(v.x, v.y);
  }
}
