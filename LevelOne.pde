void levelOneSet(){
  blockNum = 2;
  speed = 2;
  initLevel(4,2,2,pink3);
  player = new Player(white);
  //initialLevel

  //blockBall
  blockBall[0] = new BlockBall(180,80,BLOCK_SIZE,0,speed);
  blockBall[1] = new BlockBall(280,height-80,BLOCK_SIZE,0,-speed); 
  
  //colorBall
  colorBall[0] = new ColorBall(400,260,COLOR_SIZE,0,0);
  colorBall[1] = new ColorBall(480,350,COLOR_SIZE,0,0);
  for(int i=0;i<onField;i++){
    colorBall[i].fillTheColor(ballIndexList[i]);
  }
  
}

void levelOneDraw(){
  //background
  level.show(targetColor);
  fill(15,15,15);
  textSize(17);
  text("LEVEL1",20,40);
  textSize(14);
  text("targetball 2", 14,60);
  //player
  player.display(white);
  player.move();
  
  for(int i=0;i<blockNum;i++){
    player.OnCollision(blockBall[i]);
  }
  for(int i=0;i<onField;i++){
    player.OnCollision(colorBall[i]);    
  }
  
  

  
  
  //blockBall
  for(int i=0;i<blockNum;i++){
    blockBall[i].fillTheColor(block);
  }
  blockBall[0].move(0,width,80*0.5,height-80*0.5);
  blockBall[1].move(0,width,80*0.5,height-80*0.5);
  for(int i=0;i<blockNum;i++){
    blockBall[i].display();
  }
  
  //colorBall
  for(int i=0;i<onField;i++){
    colorBall[i].display();
  }
  
}