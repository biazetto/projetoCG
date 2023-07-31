import java.util.ArrayList;
import java.util.Collections;
void setup() {
  size(640, 426);
  noLoop();
}

void draw() {
  PImage img = loadImage("Lucas01.jpg");
  PImage aux = createImage(img.width, img.height, RGB);
  //PImage img2 = loadImage("Lucas01.jpg");
  
  //Escala de Cinza
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      //float media = ((red(img.pixels[pos]) + green(img.pixels[pos]) + blue(img.pixels[pos]))/3);
      aux.pixels[pos] = color(red(img.pixels[pos]));
    }
  }

////////Brilho
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      float valor = red(img.pixels[pos])*2.0;
      if (valor > 255) valor = 255;
      else if (valor < 0) valor = 0;
      aux.pixels[pos] = color(valor);
    }
  }
 
    for (int y = 260; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      float valor = red(img.pixels[pos])*2.5;
      if (valor > 255) valor = 255;
      else if (valor < 0) valor = 0;
      aux.pixels[pos] = color(valor);
    }
  }
  

    //Filtro de Linearização
     for (int y=0; y < img.height; y++) {
    for (int x=0; x < img.width; x++) {
      int pos = y*img.width + x;
      if(red(aux.pixels[pos] ) >= 200 || x>260|| x<150|| y<70|| y>310)
        aux.pixels[pos] = color(0);
        else
        aux.pixels[pos] = color(255);
        //else aux.pixels[pos] = color (red(img2.pixels[pos]) , green(img2.pixels[pos]) , blue(img2.pixels[pos]));
    }
     }
     

   
  image(aux, 0, 0);
  save("Linearização2.5.jpg");
}
