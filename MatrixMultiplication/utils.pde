float[][] vectorToMatrix(PVector v) {
  float[][] result = {{v.x}, {v.y}, {v.z}};
  return result;
}

PVector matrixtoVector(float[][] m) {
  return new PVector(m[0][0], m[1][0], m.length > 2 ? m[2][0] : 0);
}
