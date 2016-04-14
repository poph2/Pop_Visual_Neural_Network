class Neuron {
  PVector location;
  color col;
  
  ArrayList<Float> inputs;
  ArrayList<Float> weights;
  
  
  ArrayList<Connection> connections;
  
  Float bias;
  Float biasWeight;
  
  Float output;
  
  Neuron(float x, float y, color c) {
    location = new PVector(x, y);
    col = c;
    connections = new ArrayList<Connection>();
    inputs = new ArrayList<Float>();
    weights = new ArrayList<Float>();
    bias = 1.0;
    biasWeight = random(1);
    output = 0.0;
  }
  
  void display() {
    stroke(0);
    fill(col);
    
    //Drawing all the connections
    for (Connection c : connections) {
      c.display();
    }
    
    strokeWeight(5);
    ellipse(location.x, location.y, 25, 25);
  }
  
  void connect(ArrayList<Neuron> nextNeurons) {
    for(int i = 0; i < nextNeurons.size(); i++) {
      Connection con = new Connection(this, nextNeurons.get(i), random(1));
      connections.add(con);
      
      Float input = new Float(0.0);
      inputs.add(input);
      
      Float weights = new Float(0.0);
      inputs.add(input);
    }
  }
  
  void feedforward() {
    //outpu = sum += input;
    // Activate the neuron and fire the outputs?
    //if (sum > 1) {
      fire();
      // If we’ve fired off our output,
      // we can reset our sum to 0.
      //sum = 0;
    //}
  }
  
  float getOutput() {
    return 0.0;
  }
  
  float getSum() {
    float sum = bias * biasWeight;
    
    //for (int ) {
    //  c.display();
    //}
    
    return sum;
  }
  
  void fire() {
    for (Connection c : connections) {
      // The Neuron sends the sum out
      // through all of its connections
      c.feedforward(0);
    }
  }
  
}