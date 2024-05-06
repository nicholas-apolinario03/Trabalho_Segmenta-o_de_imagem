PImage originalImage; // Imagem original
PImage segmentedImage; // Imagem segmentada
int imageWidth, imageHeight; // Largura e altura das imagens

void setup() {
  size(800, 600);
  
  // Carregar as imagens
  originalImage = loadImage("originalsegmentada.jpeg");
  segmentedImage = loadImage("segmentada.jpeg");
  
  // Redimensionar as imagens, se necessário
  if (originalImage.width != segmentedImage.width || originalImage.height != segmentedImage.height) {
    println("Redimensionando as imagens para o mesmo tamanho...");
    segmentedImage.resize(originalImage.width, originalImage.height);
    println("Imagens redimensionadas com sucesso!");
  }
  
  // Definir largura e altura
  imageWidth = originalImage.width;
  imageHeight = originalImage.height;
  
  // Inicializar contadores
  int truePositives = 0;
  int falsePositives = 0;
  int falseNegatives = 0;
  int trueNegatives = 0;
  
  // Comparar pixel a pixel
  for (int x = 0; x < imageWidth; x++) {
    for (int y = 0; y < imageHeight; y++) {
      color originalColor = originalImage.get(x, y);
      color segmentedColor = segmentedImage.get(x, y);
      
      // Se os dois pixels forem brancos (objeto presente)
      if (brightness(originalColor) > 200 && brightness(segmentedColor) > 200) {
        truePositives++;
      } 
      // Se o pixel na imagem original for branco e na imagem segmentada for preto
      else if (brightness(originalColor) > 200 && brightness(segmentedColor) <= 200) {
        falseNegatives++;
      } 
      // Se o pixel na imagem original for preto e na imagem segmentada for branco
      else if (brightness(originalColor) <= 200 && brightness(segmentedColor) > 200) {
        falsePositives++;
      }
      // Se os dois pixels forem pretos (objeto ausente)
      else if (brightness(originalColor) <= 200 && brightness(segmentedColor) <= 200) {
        trueNegatives++;
      }
    }
  }
  
  // Calcular métricas de desempenho
  float precision = (float) truePositives / (truePositives + falsePositives);
  float recall = (float) truePositives / (truePositives + falseNegatives);
  float f1Score = 2 * (precision * recall) / (precision + recall);
  
  // Exibir resultados
  println("Falso Positivo: " + falsePositives);
  println("Falso Negativo: " + falseNegatives);
  println("Verdadeiro Negativo: " + trueNegatives);
  println("Verdadeiro Positivo: " + truePositives);
  println("Precisão: " + precision);
  println("Recall: " + recall);
  println("F1 Score: " + f1Score);
}

void draw() {
  background(255);
  
  // Exibir as imagens
  image(originalImage, 0, 0);
  image(segmentedImage, imageWidth, 0);
}
