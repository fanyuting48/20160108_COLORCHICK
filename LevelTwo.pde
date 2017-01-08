void levelTwoSet(){
  attackNum = 3;
  speed = 4;
  float speedY = random(1,3);
  initLevel(8,4,4,orange);
  player = new Player(pink);
  
  //attackBall
  attackBall[0] = new AttackBall(350,190,ATTACK_SIZE,speed,speedY);
  attackBall[1] = new AttackBall(250,120,ATTACK_SIZE,speed,speedY);
  attackBall[2] = new AttackBall(355,120,ATTACK_SIZE,speed,speedY);
  
  //colorBall
  colorBall[0] = new ColorBall(300,160,COLOR_SIZE,0,0);
  colorBall[1] = new ColorBall(280,250,COLOR_SIZE,0,0);
  colorBall[2] = new ColorBall(340,350,COLOR_SIZE,0,0);
  colorBall[3] = new ColorBall(480,120,COLOR_SIZE,0,0);
  for(int i=0;i<onField;i++){
    colorBall[i].fillTheColor(ballIndexList[i]);
  }
}

void levelTwoDraw(){
  //background
  level.show(targetColor);
  fill(15,15,15);
  textSize(17);
  text("LEVEL2",20,40);
  textSize(14);
  text("targetball ?", 14,60);
  
  //player
  player.display(pink);
  player.move();
  for(int i=0;i<blockNum;i++){
    player.OnCollision(blockBall[i]);
  }
  for(int i=0;i<onField;i++){
    player.OnCollision(colorBall[i]);
  }
  //player.goToNextLevel(level);
  
  //attackBall
  for(int i=0;i<attackNum;i++){
    attackBall[i].fillTheColor(attack);
    attackBall[i].move(startX,width-BAR_SIZE-ATTACK_SIZE/2,0,height);
    attackBall[i].display();
  }
  
  //colorBall
  for(int i=0;i<onField;i++){
    colorBall[i].display();
    for(int j=0;j<attackNum;j++){
      colorBall[i].OnCollision(attackBall[j]);
    }
  }
  
}