void setup() {
size(400, 400, P2D);
}
void draw() {
My3DPoint eye = new My3DPoint(-100, -100, -5000);
My3DPoint origin = new My3DPoint(0, 0, 0); //The first vertex of your cuboid
My3DBox input3DBox = new My3DBox(origin, 100,150,300);
projectBox(eye, input3DBox).render();
}


