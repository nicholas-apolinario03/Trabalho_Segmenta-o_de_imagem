PImage imagemColoridaOriginal;
PImage imagemSegmentada;

void setup() {
  size(800, 600);
  imagemColoridaOriginal = loadImage("sua_imagem_colorida.jpg");
  imagemColoridaOriginal.resize(width, height);
  imagemSegmentada = loadImage("sua_imagem_segmentada.jpg");
  imagemSegmentada.resize(width, height);
  
  // Chama a função para pintar a parte branca da imagem segmentada com a cor da imagem colorida original
  pintarParteBranca(imagemColoridaOriginal, imagemSegmentada);
}

void pintarParteBranca(PImage imgColorida, PImage imgSegmentada) {
  imgColorida.loadPixels();
  imgSegmentada.loadPixels();
  
  for (int i = 0; i < imgSegmentada.pixels.length; i++) {
    // Verifica se o pixel na imagem segmentada é branco
    if (brightness(imgSegmentada.pixels[i]) == 255) {
      // Se for branco, pinta o pixel com a cor correspondente na imagem colorida original
      imgSegmentada.pixels[i] = imgColorida.pixels[i];
    }
  }
  
  imgSegmentada.updatePixels();
  image(imgSegmentada, 0, 0); // Exibe a imagem segmentada com a parte branca pintada
}
