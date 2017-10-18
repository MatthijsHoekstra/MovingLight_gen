class RoundParticlePulse {

  PVector[] locationParticles = new PVector[widthLEDStrip];
  
  RoundParticlePulse() {
    
    
    for (int i = 0; i < widthLEDStrip; i++){
     
      locationParticles[i] = new PVector();
      
      Ani.to(this, 1, "locationParticles[" + i + "]", 225, Ani.QUAD_OUT);
      
    }
    
  }

  void update() {
    
    
  }

  boolean finished() {
    return false;
  }
}