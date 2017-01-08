class Player{
  float x,y;
  float speed;
  float size;
  int r,g,b;
  float easing;
  boolean upPressed = false;
  boolean downPressed = false;
  boolean rightPressed = false;
  boolean leftPressed = false;
 
  boolean bouncingUp = false;
  boolean bouncingDown = false;
  boolean bouncingRight = false;
  boolean bouncingLeft = false;
  float bounceUp = 30;
  float bounceDown = 30;
  float bounceRight = 30;
  float bounceLeft = 30;
  
  
  int playerTouch = 180;
  
  Player(){}
  
  Player(int colorIndex){
    x = 50;
    y = 240;
    easing = 0.1;
    speed = 4;
    size = PLAYER_SIZE;
    r = colorTable[colorIndex][0];
    g = colorTable[colorIndex][1];
    b = colorTable[colorIndex][2];
  }
  
  void display(int colorIndex){
    if(bouncingUp){
      y-=30*easing;
      bounceUp -= 30*easing;
      if(bounceUp < 0){
        bouncingUp = false;
        bounceUp = 30;
      }
    }
    if(bouncingDown){
      y+=30*easing;
      bounceDown -= 30*easing;
      if(bounceDown < 0){
        bouncingDown = false;
        bounceDown = 30;
      }
    }
    if(bouncingRight){
      x+=30*easing;
      bounceRight -= 30*easing;
      if(bounceRight < 0){
        bouncingRight = false;
        bounceRight = 30;
      }
    }
    if(bouncingLeft){
      x-=30*easing;
      bounceLeft -= 30*easing;
      if(bounceLeft < 0){
        bouncingLeft = false;
        bounceLeft = 30;
      }
    }    
    if(playerTouch<180) playerTouch--;
    if(playerTouch<0) playerTouch = 180;
    noStroke();

    fill(r,g,b);        
    ellipse(x,y,size,size);
  }
  
  void move(){
      if(bouncingUp == false && upPressed && y>size/2) y -= speed;
      if(bouncingDown == false && downPressed && y<height-size/2) y += speed;
      if(bouncingRight == false && rightPressed && x<width-size/2) x += speed;
      if(bouncingLeft == false && leftPressed && x>size/2) x -= speed;
    }
  
  void colorBlend(ColorBall target){
    r = (r+target.r)/2;
    g = (g+target.g)/2;
    b = (b+target.b)/2;
  }
  void playerbecometargetcolor(ColorBall target){     //范：抓不到targetball不知道怎麼寫//范：抓不到targetball不知道怎麼寫
    int targetcolor = target.colorIndex;
    println(target);
    println(targetcolor);
    r = colorTable[targetcolor][0];
    g = colorTable[targetcolor][1];
    b = colorTable[targetcolor][2];
  }
  
  boolean OnCollision(ColorBall target){
    if(playerTouch != 180) return false;
    float distance = dist(x,y,target.x,target.y);
    if(distance<=(size+target.size)/2){
      if(target.colorIndex==level.colorIndex){                //范：抓不到targetball不知道怎麼寫
        this.x=10;
        this.y=10;
        this.playerbecometargetcolor(target);
        }else{
        player.colorBlend(target);
        }
        playerTouch--;
        return true;
    }
    return false;
  }
  
  void OnCollision(BlockBall target){
    float distance = dist(x,y,target.x,target.y);
    if(distance<=(size+target.size)/2){
      if(x<target.x) bouncingLeft = true;
      if(x>target.x) bouncingRight = true;
      if(y<target.y) bouncingUp = true;
      if(y>target.y) bouncingDown = true;
    }    
  }
}