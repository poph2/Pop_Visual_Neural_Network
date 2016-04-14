class Network {
  
  int layerLoopCount = 0;
  
  PVector location;
  int layerCount;
  
  int[] layerSize;
  color[] layerColor;
  
  ArrayList<Layer> layers;
  
  Network(int layerC, int[] layerS, color[] layerCol) {
    location = new PVector(width/2, height/2);
    
    layerCount = layerC;
    layerSize = layerS;
    color[] layerColor = layerCol;
    
    layers = new ArrayList<Layer>();
    
    for(int i = 0; i < layerCount; i++) {
      
      float inc = (float)i/((float)layerCount-1.0);
      
      float x = (width - 100) / (2);
      x = lerp(-x, x,inc);
      
      Layer l = new Layer(i, layerSize[i], layerColor[i], x);
      layers.add(l);
    }
    
    for(int i = 0; i < layerCount - 1; i++) {
      ArrayList<Neuron> nextNeurons = layers.get(i+1).neurons;
      
      ArrayList<Neuron> neurons = layers.get(i).neurons;
      
      for(int j = 0; j < neurons.size(); j++) {
        neurons.get(j).connect(nextNeurons);
      }
      
    }
  }
  
  
  
  //We can draw the entire network.
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    for (Layer l : layers) {
      l.display();
    }
    popMatrix();
  }
  
  void feedforward() {
    layers.get(layerLoopCount).feedforward(0);
    layerLoopCount += 1;
    
    if(layerLoopCount >= layers.size() - 1) layerLoopCount = 0;
  }
  
  
}