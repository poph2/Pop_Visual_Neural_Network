Network network;

void setup() {
  size(640, 360);
  // Make a Network.
  
  int layerCount = 3;
  int[] layerSize = {2, 3, 1}; //getRandomLayerSizes(layerCount, 5);
  
  //print("layersize - ");
  //printArray(layerSize);
  
  color from = color(204, 102, 0);
  color to = color(0, 102, 153);
  
  color[] layerColor = getColors(from, to, layerCount);
  network = new Network(layerCount, layerSize, layerColor);
  
  
}

void draw() {
  background(255);
  
  network.display();
  
  if (frameCount % 100 == 0) {
    // We are choosing to send in an input every 30 frames.
    network.feedforward();
  }
}

int[] getRandomLayerSizes(int layerCount, int maxSize) {
  int[] arr = new int[layerCount];
  
  for(int i = 0; i < layerCount; i++) {
    arr[i] = (int)random(3, (float)maxSize);
  }
  
  return arr;
}

color[] getColors(color start, color stop, int size) {
  
  color[] colorArr = new color[size];
  
  for(int i = 0; i < size; i++) {
    float inc = (float)i/((float)size-1);
    colorArr[i] = lerpColor(start, stop, inc);
  }
  
  return colorArr;
}