void setup() { 
  size(400, 286); 
  noLoop(); 
}

void draw() {
  PImage img = loadImage("img1.jpg"); 
  PImage imgPB = createImage(img.width, img.height, RGB); 
  PImage seg2 = createImage(img.width, img.height, RGB);
  
  // Filtro escala de cinza 
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      int pos = (y)*img.width + (x); 
      float media = green(img.pixels[pos]);
      imgPB.pixels[pos] = color(media);
    }
  }
  
  image(imgPB, 0, 0); 

  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      int pos = (y)*img.width + (x); 
       if(green(imgPB.pixels[pos]) > 195) seg2.pixels[pos] = color(255);
       else seg2.pixels[pos] = color(0);
    }
  }
  
  image(seg2, 0, 0); 
  save("img1.png");
  
 

}