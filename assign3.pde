final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage[][] soils;
int numFrames = 23;//圖片數量
PImage[] images = new PImage[numFrames];//圖片儲存 
int xPos = 320, yPos = 80;//地鼠的起始位子

final int SOIL_SIZE = 80;

int[][] soilHealth;
//PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
//PImage bg, soil8x24;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
  size(640, 480, P2D);
  // Enter your setup code here (please put loadImage() here or your game will lag like crazy)
  images[0] = loadImage("img/bg.jpg");//天空
  images[1] = loadImage("img/title.jpg");//開始畫面
  images[2] = loadImage("img/gameover.jpg");//結束畫面
  images[3] = loadImage("img/startNormal.png");//開始按鈕
  images[4] = loadImage("img/startHovered.png");//開始按鈕（黃）
  images[5] = loadImage("img/restartNormal.png");//重新開始按鈕
  images[6] = loadImage("img/restartHovered.png");//重新開始按鈕（黃）
  images[7] = loadImage("img/soil8x24.png");//長泥土
  images[8] = loadImage("img/groundhogIdle.png");//地鼠
  images[9] = loadImage("img/groundhogDown.png");//地鼠（下）
  images[10] = loadImage("img/groundhogLeft.png");//地鼠（左）
  images[11] = loadImage("img/groundhogRight.png");//地鼠（右）
  images[12] = loadImage("img/stone1.png");//第一層石頭
  images[13] = loadImage("img/stone2.png");//第二層石頭
  images[14] = loadImage("img/life.png");//生命
  
    soils = new PImage[6][5];
  for(int i = 0; i < soils.length; i++){
    for(int j = 0; j < soils[i].length; j++){
      soils[i][j] = loadImage("img" + i + "/soil" + i + "_" + j + ".png");
    }
  }
}

void draw() {
  /* ------ Debug Function ------
   
   Please DO NOT edit the code here.
   It's for reviewing other requirements when you fail to complete the camera moving requirement.
   
   */
  if (debugMode) {
    pushMatrix();
    translate(0, cameraOffsetY);
  }
  /* ------ End of Debug Function ------ */


  switch (gameState) {

  case GAME_START: // Start Screen
    image(images[1], 0, 0);

    if (START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY)
    {

      image(images[4], START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed = false;
      }
    } else {

      image(images[3], START_BUTTON_X, START_BUTTON_Y);
    }
    break;

  case GAME_RUN: // In-Game

    // Background
    image(images[0], 0, 0);

    // Sun
    stroke(255, 255, 0);
    strokeWeight(5);
    fill(253, 184, 19);
    ellipse(590, 50, 120, 120);

    // Grass
    fill(124, 204, 25);
    noStroke();
    rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

    // Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
    image(images[7], 0, 160);
    //for(int i = 0; i < soilHealth.length; i++){
    //  for (int j = 0; j < soilHealth[i].length; j++) {

    //    int areaIndex = floor(j / 4);
    //    image(soil[areaIndex][4], i * SOIL_SIZE, j * SOIL_SIZE);        
    //  }
    //}
    // Player
    image(images[8],xPos,yPos);//地鼠
    // Health UI
    
    //hps = new PImage[5];
  for(int y=0 ; y<=height ; y=y+100)
  {
   image(images[14],y,0);//生命
  }
   
  
    break;

  case GAME_OVER: // Gameover Screen
    image(images[2], 0, 0);

    if (START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {

      image(images[6], START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed = false;
        // Remember to initialize the game here!
      }
    } else {

      image(images[5], START_BUTTON_X, START_BUTTON_Y);
    }
    break;
  }

  // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
  if (debugMode) {
    popMatrix();
  }
}

void keyPressed() {
  // Add your moving input code here

  // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
  switch(key) {
  case 'w':
    debugMode = true;
    cameraOffsetY += 25;
    yPos -= 25;//一次移動的距離
    break;

  case 's':
    debugMode = true;
    cameraOffsetY -= 25;
        yPos += 25;
    image(images[9], xPos, yPos);
    break;

  case 'a':
    if (playerHealth > 0) playerHealth --;
        xPos -= 25;
    image(images[10], xPos, yPos);
    break;

  case 'd':
    if (playerHealth < 5) playerHealth ++;
        xPos += 25;
    image(images[11], xPos, yPos);
    break;
  }
}
void keyReleased() 
{
  
}
