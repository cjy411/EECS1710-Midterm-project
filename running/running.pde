
Barrier[] barriers = new Barrier[1000];
int barrierCount = 0;
Player player;
PImage button;
PImage buttonRestart;
int groundY = 350;
float gravity = 1;
int buttonX = 580;
int buttonY = 400;
int buttonW = 50;
int buttonH = 50;
int pressTime = 0;

int restartX = 300;
int restartY = 300;
int restartW = 50;
int restartH = 50;

boolean pressingButton= false ;
int jumpCount = 0;
boolean dead = false;
PImage bg;
PFont font;
int frames;

void setup() {
  size(640,480);
  button = loadImage("images/button.png");
  buttonRestart = loadImage("images/restart.png");
  player = new Player();
  player.x = 80;
  float x = 1000;
  for(int i=0;i<barriers.length;i++ ){
    float height = random(40)+30;
    barriers[i] = new Barrier(x, height, groundY);
    x+=random(200)+300;
  }
  bg = loadImage("images/bg.jpg");
  bg.resize(640, 480);
  font = createFont("images/arial.ttf", 25);
  stroke(255);
  fill(255);
  textFont(font);
  
}


void draw() {
  background(bg);
  fill(255);
  text("Score: "+frames/10, 20,20);

  if(dead){
    fill(255);
    text("GAME OVER", 259,250);
    image(buttonRestart, restartX, restartY, restartW, restartH);
    
    return;
  }

  image(button, buttonX, buttonY, buttonW, buttonH);
  for(int i=0;i<barriers.length;i++ ){
    barriers[i].drawSelf();
    if (player.x <= barriers[i].x && player.x+player.width>=barriers[i].x && groundY-barriers[i].height<player.y+player.height){
      dead = true;
    }
    barriers[i].x-=3;
  }
  
  player.drawPlayer();
  if(player.y+player.height>groundY) {
    player.vy = 0;
    player.y = groundY-player.height;
    jumpCount = 0;
  }
  if(pressTime>10){
    pressingButton = false;
  }
  if(pressingButton){
    if(jumpCount==0) {
      player.vy = -10;
    }
      
  }
  
  player.vy += gravity;
  pressTime++;
  frames++;
}



void mousePressed() {
  if(mouseX>=buttonX && mouseY>=buttonY && mouseX<buttonX+buttonW && mouseY<buttonY+buttonH) {
    pressTime = 0;
    jumpCount++;
    pressingButton = true;
  }
  if(mouseX>=restartX && mouseY>=restartY && mouseX<restartX+restartW && mouseY<restartY+restartH) {
    player = new Player();
    player.x = 80;
    float x = 1000;
    for(int i=0;i<barriers.length;i++ ){
      float height = random(40)+30;
      barriers[i] = new Barrier(x, height, groundY);
      x+=random(200)+300;
    }
    dead = false;
    frames = 0;
  }
  
}

void mouseReleased() {
  pressTime = 0;
  pressingButton = false;
}
