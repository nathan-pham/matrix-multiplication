float angle = 0;

PVector[] points = {
  new PVector(-50, -50),
  new PVector( 50, -50),
  new PVector( 50,  50),
  new PVector(-50,  50),
};

// 2 x 3 orthographic matrix
float[][] projection = {
  {1, 0, 0},
  {0, 1, 0}
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
  
  float[][] rotationMatrix = {
    {cos(angle), -sin(angle)},
    {sin(angle),  cos(angle)}
  };
  
  for(PVector v : points) {
    float[][] projected = matMul(projection, vectorToMatrix(v));
    PVector rotated = matrixToVector(matMul(rotationMatrix, projected));
    
    point(rotated.x, rotated.y);
  }
  
  angle += 0.01;
}
