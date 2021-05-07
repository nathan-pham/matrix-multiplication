float[][] projection = {
  {1, 0, 0},
  {0, 1, 0}
};

float[][] point = {
  {100}, 
  {75}, 
  {50}
};

float[][] matMul(float[][] matrixA, float[][] matrixB) {
  int colA = matrixA[0].length;
  int rowA = matrixA.length;
  
  int colB = matrixB[0].length;
  int rowB = matrixB.length;
  
  // requirement for matrix multiplication 
  if(colA != rowB) {
    println("columnA must equal rowB");
    return null;
  }
 
  float result[][] = new float[rowA][colB];
 
  // loop through each element of result
  for(int i = 0; i < rowA; i++) {
    for(int j = 0; j < colB; j++) {
      // dot product
      float sum = 0;
      
      for(int k = 0; k < colA; k++) {
        sum += matrixA[i][k] * matrixB[k][j];
      }
      
      result[i][j] = sum;
    }
  }
  
  return result;
}

void printM(float[][] m) {
  int col = m[0].length;
  int row = m.length;
  
  println(String.format("%s x %s", row, col));
  
  for(int i = 0; i < row; i++) {
    for(int j = 0; j < col; j++) {
      print(m[i][j] + " ");  
    }
    println();
  }
  
  println("------------");
}

void setup() {
  float[][] result = matMul(projection, point);
  
  printM(projection);
  printM(point);
  printM(result);
}
