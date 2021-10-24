class Barrier {
  float x;
  float height;
  float groundY;
  
  Barrier() {
  }
  
  Barrier(float x, float height, float groundY) {
    this.x = x;
    this.height = height;
    this.groundY = groundY;
  }
  
  void drawSelf() {
    fill(0);
    stroke(0);
    rect(x, groundY-height, 5, height);
  }
  
}
