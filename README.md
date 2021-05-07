# Matrix Multiplication
experimenting with simple matrices and vectors

## Screenshots
![running cube](/screenshots/cube.png)

## Main Library
```java
// matrix.pde

float[][] projection = {
  {1, 0, 0},
  {0, 1, 0}
};

float[][] point = new PVector(100, 75, 50);

printM(matMul(projection, point));

/* resulting matrix: 2 x 1
100.0 
75.0 
*/
```
