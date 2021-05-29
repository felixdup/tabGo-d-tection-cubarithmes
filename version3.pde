import gab.opencv.*;
import java.util.ArrayList;
import java.util.List;
import java.awt.Rectangle;

PImage src;
OpenCV opencv;
int value = 0;
DetectionCube maDetect;

void setup() {
  src = loadImage("2.jpg"); 
  size(2000, 900);
  maDetect = new DetectionCube(src);

  //trouveCube();
  //println("nombre de cube trouve", mesCubes.size());
  
}

void draw() {
  scale(0.5);
  image(src, 0, 0);
  for (Point monBlob : maDetect.mesPoints) {
    stroke(255, 0, 0);
    strokeWeight(3);
    noFill();
    
    circle(monBlob.pointMoyen.x, monBlob.pointMoyen.y, 16);
    
    
   /* for (Cube monCube : mesCubes) {
      // monCube.dessinerCube();
    }*/

    if (maDetect.mesCubes.size()>0) {
      //println("cube n:",value);
      maDetect.mesCubes.get(value).dessineCube();
      //maDetect.mesCubes.get(value).printPos();
      maDetect.mesCubes.get(value).dessineCubeComplet();
    }
  }
}

void keyPressed() {
  value = (value+1)%maDetect.mesCubes.size();
}
