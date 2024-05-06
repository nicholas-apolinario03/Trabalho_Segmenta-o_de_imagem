PImage originalImage;
PImage thresholdedImage;

void setup() {
  size(400, 239);
  originalImage = loadImage("img4.jpg");
  thresholdedImage = createImage(originalImage.width, originalImage.height, RGB);
  thresholdedImage.loadPixels();
  originalImage.loadPixels();
  
  
  // Define um limite para distinguir entre o objeto e o fundo
  int thresholdValue = 100;
  
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
    thresholdedImage.save("img4.png");
}

void draw() {
  background(255);
  
  image(thresholdedImage, 0, 0);

}