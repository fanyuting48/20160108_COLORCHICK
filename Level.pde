class Level{
  int r,g,b;
  int colorIndex;
  Level(){
    r = 0;
    g = 0;
    b = 0;
  }
  void show(int colorIndex){
    r = colorTable[colorIndex][0];
    g = colorTable[colorIndex][1];
    b = colorTable[colorIndex][2];
    
    if(colorIndex==pink3){
    background(r+100,g+100,b+100);
    fill(r,g,b);
    rect(width-BAR_SIZE,0,BAR_SIZE,height);
    }else{
    background(r+100,g+100,b+100);
    fill(r,g,b);
    rect(width-BAR_SIZE,0,BAR_SIZE,height);}
    
    
    
    fill(200,200,200);
    for(int i=0; i<25; i++){
      rect(90,0+i*20,3,10);
    }
    
    stroke(205);
    strokeWeight(3);
    noFill();
    ellipse(50,240,35,35);
  }  
}