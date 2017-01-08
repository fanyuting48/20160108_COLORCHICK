final int COLOR_SIZE = 40, ATTACK_SIZE = 30, BLOCK_SIZE = 80, PLAYER_SIZE = 40;
final int COLOR_NUMBER = 18;
final float BAR_SIZE = 40;
PFont LEVELDISPLAY;
//save all the color                                     
public int [][] colorTable = { {254,254,255}, {288,0,43},{272,128,150},
                              {252,102,0},{262,115,75},{0,102,204},
                              {248,234,72},{124,168,138},{0,153,102},
                              {128,204,128},{254,204,204},{102,0,152},
                              {178,102,178},{271,127,149},{0,204,255},{51,154,204},{26,179,230},
                              {149,144,146},{0,0,0}};
                              
//index of the color
public int white = 0, red = 1, pink =2,
           orange = 3, lightOrange = 4, blue = 5,
           yellow = 6,green = 7, green2 = 8,
           lightGreen = 9, pink2 = 10, purple = 11,
           lightPurple = 12,pink3 =13, lightBlue=14, blue2 =15, blue3 = 16,
           block = 17,attack = 18;
           
public int colorIndex;
public int totalBall, targetBall, onField, targetColor;
public int attackNum, blockNum;
public float speed;
public int [] ballIndexList = new int [15];   


public float startX = 100;
public Player player = new Player();
public Level level = new Level();
public BlockBall [] blockBall = new BlockBall [15];
public AttackBall [] attackBall = new AttackBall [15];
public ColorBall [] colorBall = new ColorBall [15];


//levelState
int levelState;
final int LEVEL1=0;
final int LEVEL2=1;
final int LEVEL3=2;
final int LEVEL4=3;
final int LEVEL5=4;
final int LEVEL6=5;
           
void setup(){
  size(640,480);
  LEVELDISPLAY = createFont("Noto Sans CJK TC",100);
  textFont(LEVELDISPLAY);
  for(int i=0; i<colorBall.length; i++){
    colorBall[i] = new ColorBall(50+i*50,200,COLOR_SIZE,0,0);
    colorBall[i].fillTheColor(ballIndexList[i]);
    attackBall[i] = new AttackBall(100,10,ATTACK_SIZE, random(-5,5),random(-5,5));
    blockBall[i] = new BlockBall(40,20,BLOCK_SIZE,random(-3,3),random(-3,3));
  }
  
  //gameState跳轉的同時，把下一關的配置set好
  player= new Player(white);
  player.x= 50;
  player.y= 240;
  
  levelOneSet();
  
}

void draw(){
  background(255);
  //新的gameState開始後，就可以跑draw的部分
switch(levelState){
  case LEVEL1:
  levelOneDraw();
   if(player.x>600){
      println("ok ok");
      levelTwoSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL2;
      }
  break;
  
  case LEVEL2:
  levelTwoDraw();
   if(player.x>600){
      println("ok ok");
      levelThreeSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL3;
      }
  break;
  
  
  case LEVEL3:
  levelThreeDraw();
   if(player.x>600){
      println("ok ok");
      levelFourSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL4;
      }      
  break;
  
  
  
  case LEVEL4:
  levelFourDraw();
   if(player.x>600){
      println("ok ok");
      levelFiveSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL5;
      } 
  break;
  
  
  case LEVEL5:
  levelFiveDraw();
   if(player.x>600){
      println("ok ok");
      levelSixSet();
      player.x=50;
      player.y=240;
      levelState=LEVEL6;
      } 
  break;
  
  case LEVEL6:
  levelSixDraw();
   if(player.x>600){
      println("ok ok");
      //播影片over一切
      }
  break;

  }
}

void keyPressed () {
  if (key == CODED) { 
    switch ( keyCode ) {
    case UP :
      player.upPressed = true ;
      break ;
    case DOWN :
      player.downPressed = true ;
      break ;
    case LEFT :
      player.leftPressed = true ;
      break ;
    case RIGHT :
      player.rightPressed = true ;
      break ;
    }    
  }
}

void keyReleased () {
  if (key == CODED) { 
    switch ( keyCode ) {
    case UP : 
      player.upPressed = false ;
      break ;
    case DOWN :
      player.downPressed = false ;
      break ;
    case LEFT :
      player.leftPressed = false ;
      break ;
    case RIGHT :
      player.rightPressed = false ;
      break ;
    }
  }   
}