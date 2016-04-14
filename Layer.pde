class Layer {
  
  public ArrayList<Neuron> neurons;
  int size;
  int index;
  color layerColor;
  
  float x;
  
  Layer(int ind, int s, color layerC, float xPos) {
    index = ind;
    size = s;
    layerColor = layerC;
    x = xPos;
    
    neurons = new ArrayList<Neuron>();
    
    //println("Size " + size);
    if(size == 1) {
      add1Neuron();
    }
    else if(size == 2) {
      add2Neurons();
    }
    else if(size == 3) {
      add3Neurons();
    }
    else if(size > 3) {
      addNNeurons();
    }
    
    
  }
  
  void add1Neuron() {
    float y = ((float)height-100.0)/2.0;
    y = 0.0;
    Neuron n = new Neuron(x, y, layerColor);
    
    neurons.add(n);
  }
  
  void add2Neurons() {
    
    float y = ((float)height-100.0)/4.0;
    Neuron n = new Neuron(x, y, layerColor);
    neurons.add(n);
    
    y = -y;
    n = new Neuron(x, y, layerColor);
    neurons.add(n);
    
  }
  
  void add3Neurons() {
    addNNeurons();
  }
  
  void addNNeurons() {
    for(int i = 0; i < size; i++) {
      
      float inc = (float)i/((float)size-1.0);
      //println(inc);
      
      float y = (height-100)/2;
      y = lerp(-y, y,inc);
      
      
      Neuron n = new Neuron(x, y, layerColor);
      //n.color
      
      //println("Neuron " + index + " " + i + " -- x = " + x + " --  y - " + lerp(((height-20)/2), (-(height-20)/2), inc));
      
      neurons.add(n);
    }
  }
  
  void display() {
    for (Neuron n : neurons) {
      n.display();
    }
  }
  
  void feedforward(float input) {
    for(int i = 0; i < neurons.size(); i++) {
      neurons.get(i).feedforward();
    }
  }
  
}