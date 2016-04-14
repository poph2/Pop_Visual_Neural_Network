class Connection {
  
  Neuron a;
  Neuron b;
  
  float loc = 0;
  
  boolean sending = false;
  PVector sender;
  float output;
  
  float weight;

  Connection(Neuron from, Neuron to,float w) {
    weight = w;
    a = from;
    b = to;
  }
  
  void display() {
    stroke(0);
    strokeWeight(weight*4);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
    
    update();
  }
  
  void feedforward(float val) {
    // Sending is now true.
    sending = true;
    // Start the animation at the location of Neuron A.
    sender = a.location;
    // Store the output for when it is actually time to feed it forward.
    output = val*weight;
  }
  
  void update() {
    if (sending) {
      //As long as we’re sending, interpolate our points.
      //sender.x = lerp(sender.x, b.location.x, 0.1);
      //sender.y = lerp(sender.y, b.location.y, 0.1);
      
      loc = loc + 0.015;
      
      float x = lerp(sender.x, b.location.x, loc);
      float y = lerp(sender.y, b.location.y, loc);
      
      // How far are we from neuron b?
      float d = PVector.dist(sender, b.location);
      
      //println(d);
      
      if(x >= b.location.x) {
        loc = 0;
        sending = false;
        //b.feedforward();
      }
      else {
        strokeWeight(1);
        ellipse(x, y, 10, 10);
      }
     }
  }
  
}