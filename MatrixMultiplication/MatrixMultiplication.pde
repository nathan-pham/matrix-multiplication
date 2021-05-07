float angle = 0;
float speed = 0.03;

// set of cube points
PVector[] points = {
  new PVector(-1, -1, -1),
  new PVector( 1, -1, -1),
  new PVector( 1,  1, -1),
  new PVector(-1,  1, -1),
  new PVector(-1, -1,  1),
  new PVector( 1, -1,  1),
  new PVector( 1,  1,  1),
  new PVector(-1,  1,  1),
};

// 2 x 3 orthographic matrix
//float[][] projection = {
//  {1, 0, 0},
//  {0, 1, 0}
//};

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  
  noFill();
  stroke(0);
  strokeWeight(4);
  
  // rotation matrices
  float[][] rotationZ = {
    {cos(angle), -sin(angle), 0},
    {sin(angle),  cos(angle), 0},
    {0,                    0, 1}
  };
  
  float[][] rotationX = {
    {1,          0,           0},
    {0, cos(angle), -sin(angle)},
    {0, sin(angle),  cos(angle)},
  };
  
  float[][] rotationY = {
    {cos(angle), 0, -sin(angle)},
    {0,          1,           0},
    {sin(angle), 0,  cos(angle)},
  };
  
  
  PVector[] projectedPoints = new PVector[8];
  
  
  for(int i = 0; i < points.length; i++) {
    PVector v = points[i];
    PVector rotated = matMul(rotationZ, matMul(rotationY, matMul(rotationX, v)));
    
    // dynamic perspective
    float distance = 3;
    float z = 1 / (distance - rotated.z);
    float[][] projection = {
      {z, 0, 0},
      {0, z, 0}
    };
    
    PVector projected2d = matMul(projection, rotated);
    projected2d.mult(50);
    projectedPoints[i] = projected2d;
    point(projected2d.x, projected2d.y);
  }
  
  // connect edges
  for(int i = 0; i < 4; i++) {
    connect(i, i + 4, projectedPoints);
    connect(i, (i + 1) % 4, projectedPoints);
    connect(i + 4, ((i + 1) % 4) + 4, projectedPoints);
  }
  
  angle += speed;
}

// draw a line between two position vectors
void connect(int i, int j, PVector[] projectedPoints) {
  PVector vectorA = projectedPoints[i];
  PVector vectorB = projectedPoints[j];
  
  stroke(0);
  strokeWeight(1);
  
  line(vectorA.x, vectorA.y, vectorB.x, vectorB.y);
}
