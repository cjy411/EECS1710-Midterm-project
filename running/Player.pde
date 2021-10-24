class Player {
  PImage[] imgList;
  int frameNumber;
  int refreshRate = 4;
  float x;
  float y;
  float height;
  float width;
  float vy;
  
  
  Player() {
    imgList = new PImage[] {
      loadImage("images/player_right1.png"),
      loadImage("images/player_right2.png"),
      loadImage("images/player_right3.png"),
      loadImage("images/player_right4.png")
    };
    this.height =imgList[0].height;
    this.width = imgList[0].width;
    
  }
  
  void drawPlayer() {
    int frameIdx = frameNumber/refreshRate%imgList.length;
    image(imgList[frameIdx], x, y); 
    frameNumber++;
    y+=vy;
  }
}
