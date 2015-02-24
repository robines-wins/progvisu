/*void setup() {
size(400, 400, P2D);
}
void draw() {
My3DPoint eye = new My3DPoint(-100, -100, -5000);
My3DPoint origin = new My3DPoint(0, 0, 0); //The first vertex of your cuboid
My3DBox input3DBox = new My3DBox(origin, 100,150,300);
projectBox(eye, input3DBox).render();
}*/

void setup () {
size(1000,1000,P2D);
}
void draw() {
background(255, 255, 255);
My3DPoint eye = new My3DPoint(0, 0, -5000);
My3DPoint origin = new My3DPoint(0, 0, 0);
My3DBox input3DBox = new My3DBox(origin, 100, 150, 300);
//rotated around x
float[][] transform1 = rotateXMatrix(PI/8);
input3DBox = transformBox(input3DBox, transform1);
projectBox(eye, input3DBox).render();
//rotated and translated
float[][] transform2 = translationMatrix(200, 200, 0);
input3DBox = transformBox(input3DBox, transform2);
projectBox(eye, input3DBox).render();
//rotated, translated, and scaled
float[][] transform3 = scaleMatrix(2, 2, 2);
input3DBox = transformBox(input3DBox, transform3);
projectBox(eye, input3DBox).render();
}

