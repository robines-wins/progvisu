class My2DPoint {
float x;
float y;
My2DPoint(float x, float y) {
this.x = x;
this.y = y;
}
}

class My3DPoint {
float x;
float y;
float z;
My3DPoint(float x, float y, float z) {
this.x = x;
this.y = y;
this.z = z;
} 
}

class My2DBox {
  My2DPoint[] s;
  My2DBox(My2DPoint[] s) {
  this.s = s;
  }
  void render(){
  strokeWeight(3);
  stroke(255,0,0);
  line(s[1].x, s[1].y, s[2].x, s[2].y);
  line(s[1].x, s[1].y, s[0].x, s[0].y);
  line(s[2].x, s[2].y, s[3].x, s[3].y);
  line(s[3].x, s[3].y, s[0].x, s[0].y);
  stroke(0,255,0);
  line(s[4].x, s[4].y, s[0].x, s[0].y);
  line(s[2].x, s[2].y, s[6].x, s[6].y);
  line(s[3].x, s[3].y, s[7].x, s[7].y);
  line(s[1].x, s[1].y, s[5].x, s[5].y);
  stroke(0,0,255);
  line(s[4].x, s[4].y, s[7].x, s[7].y);
  line(s[4].x, s[4].y, s[5].x, s[5].y);
  line(s[5].x, s[5].y, s[6].x, s[6].y);
  line(s[6].x, s[6].y, s[7].x, s[7].y);
  
  }
  }
  
  
class My3DBox {
  My3DPoint[] p;
  My3DBox(My3DPoint origin, float dimX, float dimY, float dimZ){
    float x = origin.x;
    float y = origin.y;
    float z = origin.z;
    this.p = new My3DPoint[]{new My3DPoint(x,y+dimY,z+dimZ),
                              new My3DPoint(x,y,z+dimZ),
                              new My3DPoint(x+dimX,y,z+dimZ),
                              new My3DPoint(x+dimX,y+dimY,z+dimZ),
                              new My3DPoint(x,y+dimY,z),
                              origin,
                              new My3DPoint(x+dimX,y,z),
                              new My3DPoint(x+dimX,y+dimY,z)
                              };
  }
  My3DBox(My3DPoint[] p) {
  this.p = p;
  }
}

My2DPoint projectPoint(My3DPoint eye, My3DPoint p) {
float[] trans = {p.x - eye.x ,p.y-eye.y, p.z-eye.z, -p.z/eye.z+1};

  for (int i = 0; i<trans.length; i++){
    trans[i]= trans[i]/trans[3];
  }
return new My2DPoint(trans[0],trans[1]);
}

My2DBox projectBox (My3DPoint eye, My3DBox box) {
  My2DPoint[] projectedBox = new My2DPoint[8];
  for (int i = 0; i<projectedBox.length; i++){
    projectedBox[i] = projectPoint(eye,box.p[i]);
  }
  
  return new My2DBox(projectedBox);
}


My3DBox transformBox(My3DBox box, float[][] transformMatrix) {
  My3DPoint[] newBoxPts = new My3DPoint[8];
  for (int i=0; i<box.p.length; i++){
    newBoxPts[i] = euclidian3DPoint( matrixProduct(transformMatrix, homogeneous3DPoint(box.p[i])));
  }
  return new My3DBox(newBoxPts);
}

My3DPoint euclidian3DPoint (float[] a) {
  My3DPoint result = new My3DPoint(a[0]/a[3], a[1]/a[3], a[2]/a[3]);
  return result;
}
