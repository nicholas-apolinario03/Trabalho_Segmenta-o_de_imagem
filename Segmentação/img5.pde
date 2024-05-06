PImage originalImage;
PImage thresholdedImage;

void setup() {
  size(400, 320);
  originalImage = loadImage("img5.jpg");
  thresholdedImage = createImage(originalImage.width, originalImage.height, RGB);
  thresholdedImage.loadPixels();
  originalImage.loadPixels();
  
  
  // Define um limite para distinguir entre cadeira e fundo
  int thresholdValue = 180;
  
  // Loop pela imagem
  for (int y = 0; y < originalImage.height; y++) {
    for (int x = 0; x < originalImage.width; x++) {
      // Obtém o valor de cinza do pixel
      int loc = x + y * originalImage.width;
      float grayValue = brightness(originalImage.pixels[loc]);
      
      // Aplica o thresholding
      if (grayValue > thresholdValue) {
        thresholdedImage.pixels[loc] = color(255);
      } else {
        thresholdedImage.pixels[loc] = color(0);
      }
    }
  }
  
  thresholdedImage.updatePixels();
    thresholdedImage.save("img5.png");
}

void draw() {
  background(255);
  
  image(thresholdedImage, 0, 0);

}