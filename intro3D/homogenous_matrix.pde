float[] homogeneous3DPoint (My3DPoint p) {
  float[] result = {p.x, p.y, p.z , 1};
  return result;
}

float[][] rotateXMatrix(float angle) {
  return(new float[][] {{1, 0 , 0 , 0},
                        {0, cos(angle), sin(angle) , 0},
                        {0, -sin(angle) , cos(angle) , 0},
                        {0, 0 , 0 , 1}});
}
float[][] rotateYMatrix(float angle) {
  return(new float[][]  {{cos(angle), 0, -sin(angle) , 0},
                        {0, 1, 0, 0},
                        {sin(angle), 0, cos(angle), 0},
                        {0, 0, 0, 1}});
}
float[][] rotateZMatrix(float angle) {
  return(new float[][]  {{cos(angle), sin(angle) , 0 , 0},
                        {-sin(angle) , cos(angle) , 0, 0},
                        {0, 0, 1, 0},
                        {0, 0, 0, 1}});
}
float[][] scaleMatrix(float x, float y, float z) {
  return(new float[][]  {{x, 0, 0, 0},
                        {0, y, 0, 0},
                        {0, 0, z, 0},
                        {0, 0, 0, 1}});
}

float[][] translationMatrix(float x, float y, float z) {
  return(new float[][] {{1, 0, 0, x},
                        {0, 1, 0, y},
                        {0, 0, 1, z},
                        {0, 0, 0, 1}});
}

float[] matrixProduct(float[][] a, float[] b) {
  float tot[] = {0,0,0,0};
  for (int i=0; i<a.length; i++){
    for(int j=0; j<a[i].length; j++){
    tot[i] += a[i][j]*b[j];
    }
  }
  
  return tot;
}


