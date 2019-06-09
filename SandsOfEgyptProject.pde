
 // Level 1 Sand
 float sandX =120;
float sandY = 900;

// Level 2 Sand
float sandX2 = 120;
 float sandY2 = 900;

// Level 3 sand
float sandX3 = 120;
 float sandY3 = 900;
    
Collision detector;    // Collision detection object 

  float x, y;   // Variables for location of boulders
  float speed;  // Speed of boulder
  color c;
  float r;      // Radius of boulder

  
int score =0; // Initialize player score to zero

int currentLevel = 1; // Init current level to one






PFont f; // Game over and game win font displayed
int w = 800; // width of game canvas
int h = 900; // height of game canvas



Timer timer;        // game timer


PImage img; // door image
PImage img2; // artwork images 2 to 7
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8; // Ankh egyptian life token image

PImage img10; // Portal image 

PImage p1; // Token 1 image
PImage p2; // Token 2 image



PImage p3;// Token 3 image

PImage p4;// Token 4 image

Token part1; // Canopic jar token objects 1 to 4
Token part2;
Token part3;
Token part4;

Token doors; // End level door objective tokens grant ten points each
Token doors2;
Token doors3;


Life life; // Life tokens 1 to 3 found throughout each of the levels
Life life2;
Life life3;


int circleRadius = 30;
int lives = 3; // Lives init to 3 as default


int[][] blocks = { // 2D array of rectangular block climbing and red death platforms for level 1



  //boundary box

  {
    0, h, w, 270, 1
  }
  , 
  {
    -21, 0, 20, h, 1
  }
  , 
  {
    w, 0, 20, h, 1
  }
  , 


  /*platforms*/

  {
    // Level 1
    120, 850, 640, 520, 1
  }
  , 
  {
    120, 799, 250, 20, 1
  }
  ,
  {
    120, 799, 160, 20, 1
  }
  , 
   {
    450, 799, 220, 20, 1
  }
  ,
  {
    275, 750, 185, 20, 1
  }
  , 
  {
    500, 698, 120, 20, 1
  }
  ,
  {
    250, 650, 200, 20, 1
  }
  ,
   {
    200, 600, 80, 20, 1
  }
  ,
   {
    500, 570, 70, 20, 1
  }
  ,
   {
    330, 570, 140, 20, 1
   }
  ,
  {
    345, 400, 100, 20, 1
  }
  ,
   {
    385, 520, 100, 20, 1
  }
  ,
   {
    570, 520, 30, 20, 1
  }
  ,
    {
    590, 480, 30, 20, 1
  }
  ,
    {
    450, 450, 80, 20, 1
  }
  ,
   {
    365, 295, 90, 20, 1
  }
  ,
    {
    300, 348, 80, 20, 1
  }
  ,
    {
    445, 348, 80, 20, 1
  }
  ,
  {
    300, 720, 50, 20, 0 // Red death platforms indicated by 0 
  }
  ,
  {
   500, 470, 50, 20, 0 
  }

  
   ,
  {
   250, 470, 80, 20, 0 
  }
,
  {
    685, 250, 30, 20, 0
  }
  ,
 
};


int[][] blocks2 = { // 2D array of rectangular block climbing and red death platforms for level 2



  //boundary box

  {
    0, h, w, 270, 1
  }
  , 
  {
    -21, 0, 20, h, 1
  }
  , 
  {
    w, 0, 20, h, 1
  }
  , 


  //platforms

   {
    // Level 2
    120, 850, 640, 520, 1 // Base
  }
  , 
  {
    120, 799, 100, 20, 1 //1
  }
  
  ,
   {
    270, 760, 150, 20, 1 //2
  }
  
  ,
    
   {
    480, 760, 90, 20, 1 //2
  }
  ,
  
       {
    585, 725, 70, 20, 1 //4
  }
  
  ,
  
         {
    655, 685, 40, 20, 1 //5
  } 
  
  ,
         {
    585, 635, 45, 20, 1 //6
  }
  ,
         {
    465, 600, 100, 20, 1 //7
  }
  
  ,
           {
    420, 600, 50, 20, 1 //8
  }
  
  ,
          {
    288, 600, 85, 20, 1 //9
  }
  
  ,
            {
    130, 600, 75, 20, 1 //10
  }
  
  ,
              {
    215, 545, 75, 20, 1 //11
  }
  
  ,
               {
    140, 485, 75, 20, 1 //11
  }
  
  ,
               {
    365, 545, 75, 20, 1 //12
  }
  
  ,
                {
    445, 500, 75, 20, 1 //13
  }
  
  ,
               {
    350, 455, 75, 20, 1 //14
  }
  
  ,
                {
    275, 400, 75, 20, 1 //15
  }
  
  ,
              {
    440, 400, 95, 20, 1 //16
  }
  
  ,
  {
                 
    600, 400, 95, 20, 1 
  }
  
  ,
  {
     565, 490, 80, 20, 1 
  }
  
  ,
  {
     525, 345, 80, 20, 1 
  }
  
  ,
    {
     380, 300, 95, 20, 1 
  }
  
  ,
      {
     255, 275, 75, 20, 1 
  }
  
  ,
  
       {
     610, 235, 90, 20,1 
  }
  
  ,
     {
    615, 295, 90, 20,1 
  }
  
  ,
     {
    525, 270, 50, 20,1 
  }
  
  ,
       {
     500, 185, 80, 20,1 
  }
  
  ,
      {
     155, 110, 80, 20, 1 
  }
  
  ,
          {
     155, 220, 80, 20, 1 
  }
  
  ,
    
       {
     285, 165, 80, 20, 1 
  }
  ,
  {
    120, 720, 100, 20, 0 // red 1
  }
  ,
  
    {
    355, 660, 75, 20, 0 // red 2
  }
  ,
 
  {
   465, 600, 45, 20, 0 //red 3
  }
,
  {
    365, 215, 90, 20,1 // Door block
  }
  ,
  {
    465, 95, 20, 150, 0 // Door block 2
  }
  ,
                {
    140, 395, 75, 20, 0 
  }
  
  ,
  
             {
    498, 420, 20, 80, 0 
  }
  
  ,
   
             {
   420, 760, 60, 20, 0 
  }
  
  ,
};











int[][] blocks3 = { // 2D array of rectangular block climbing and red death platforms for level 3



  //boundary box

  {
    0, h, w, 270, 1
  }
  , 
  {
    -21, 0, 20, h, 1
  }
  , 
  {
    w, 0, 20, h, 1
  }
  , 


  //platforms

   {
    // Level 3
    120, 850, 640, 635, 1 // Base
  }
  , 
  {
    275, 635, 100, 20, 1 
  }
  
  ,

   {
    435, 635, 100, 20, 1 
  }
  
  ,
  {
    595, 635, 90, 20, 1
  }
  
  ,
   {
    640, 580, 80, 20, 1 
  }
  
  ,
   {
    500, 540, 80, 20, 1 
  }
  
  ,
  {
    470, 540, 50, 20, 0 
  }
  
  ,
    {
    400, 540, 70, 20, 1 
  }
  
  ,
     {
    155, 480, 80, 20, 1 
  }
  
  ,
     {
300, 480, 80, 20, 1 
  }
  
  ,
       {
410, 425, 80, 20, 1
  }
  
  ,
         {
320, 400, 40, 20, 1 
  }
  
  ,
           {
145, 350, 130, 20, 1 
  }
  
  ,
         {
255, 295, 70, 20, 1 
  }
  
  ,
           {
145, 245, 70, 20, 1 
  }
  
  ,
            {
245, 200, 70, 20, 1
  }
  
  ,
              {
120, 145, 60, 20, 1 
  }
  
  ,
                {
250, 105, 80, 20, 1
  }
  
  ,
                 {
570, 155, 80, 20, 1 
  }
  
  ,
                   {
480, 205, 80, 20, 1
  }
  
  ,
                     {
565, 295, 120, 20, 1
  }
   
  ,
                       {
595, 245, 40, 20, 1 
  }
   
  ,
                       {
435, 335, 80, 20, 1
  }
  
  ,
                         {
500, 385, 80, 20, 1
  }
  
  ,
   {
    300, 415, 20, 65, 0 
  }
  
  ,
   {
    215, 415, 20, 65, 0 
  }
  
  ,
  {
    270, 800, 100, 20, 1 
  }
  
  ,
  {
    120, 760, 100, 20, 1 
  }
  ,
  {
    220, 698, 50, 20, 1 
  }
  ,

 {
    375, 635,60, 20, 0 // Red
  }
  ,


 {
    355, 655,20, 75, 0 // Red
  }
  ,
{
    435, 655,20, 75, 0 // Red
  }
  ,


  
  
  
  
   {
    338, 125, 20, 150, 0 // Door
  }
  ,
     {
    466, 125, 20, 150, 0 // Door 2
  }
  ,
    {
    350, 276, 125, 20, 0 // Door 3
  }
  ,
};













Boulder[] boulders;       // An array of boulder objects
int totalBoulders = 0; // totalBoulders in the array 

Portal[] portal;       // An array of portal objects
int totalPortals= 0; // totalportals in the array 

Portal2[] portal2;      // Portal for level 2
int totalPortals2= 0; 

Portal3[] portal3;       // Portal for level 3
int totalPortals3= 0; 


// Player variables

float psize=20; // Size of player

 // Player starting x and y positions 
float px=410;
float py=820;   
  
// Player movement, speed and game physics variables
float rx=px;
float ry=py;
float pxv=0;
float pyv=0;
float pspeed=5;
float gravity=0;

boolean dead = false;
boolean falling = true;





void setup() {
  
  // Game canvas size
  size(800, 900);
  
  
  
  
  
   detector = new Collision(35); 
   
   
   
   
  
 img = loadImage("door.jpg");
 img2 = loadImage("art2.jpg");
img3 = loadImage("art2.jpg");
img4 = loadImage("art2.jpg");
img5 = loadImage("art2.jpg");
img6 = loadImage("art2.jpg");
img7 = loadImage("art2.jpg");
img8 = loadImage("ankh.jpg");

img10 = loadImage("portal.jpg");


p1 = loadImage("token.JPG");
p2 = loadImage("token2.JPG");
p3 = loadImage("token3.JPG");
p4 = loadImage("token4.JPG");






  
      
 
  
  // Game speed
  frameRate(60);

     portal= new Portal[2];   
      portal2= new Portal2[2];  
            portal3= new Portal3[2];  

   boulders = new Boulder[800];    // Create 1000 boulders in the array
   
   // Speed of boulders and boulder frequency 
  timer = new Timer(1200);    // Create a timer that goes off every 1200 milliseconds
  timer.start();   
  
  


part1 = new Token(305, 295);


part2 = new Token(565, 435);

part3 = new Token( 185, 150);


part4 = new Token(240, 425);

doors = new Token(410, 250);

doors2 = new Token(410, 130);

doors3 = new Token(410, 150);

 life = new Life(390, 595);

  life2 = new Life(155, 325);

    life3 = new Life(378, 658);



}


// Collision detect method for rectangular red blocks and method for setting up climbing platforms
void blockUpdate() {
  for (int i = 0; i<blocks.length; i++) {

    fill(200); // Fill for climbing platforms

    if (blocks[i][4]==0) {
      
      fill(255, 20, 20); // Obstacle block color
      
    }
    
    
    // Start of collision detection for blocks 
    // Create collision detect for boulders 
    if (px+pxv+psize>blocks[i][0] && px+pxv<blocks[i][0]+blocks[i][2] && py+psize>blocks[i][1] && py<blocks[i][1]+blocks[i][3]) {
      if (blocks[i][4]==0) {
lives = lives - 1;
   px = 410;
   py = 820;
      }
      pxv=0;
    }

    if (px+psize>blocks[i][0] && px<blocks[i][0]+blocks[i][2] && py+pyv+psize>blocks[i][1] && py<blocks[i][1]+blocks[i][3]) {
      if (blocks[i][4]==0) {
lives = lives - 1;
   px = 410;
   py = 820;
      }

      pyv=0;
      gravity=0;
      falling = false;
    }

    if (px+psize>blocks[i][0] && px<blocks[i][0]+blocks[i][2] && py+psize>blocks[i][1] && py+pyv<blocks[i][1]+blocks[i][3]) {
      if (blocks[i][4]==0) {
lives = lives - 1;

   px = 410;
   py = 820;
      }

      pyv=0;
      gravity=0;
    }

    rect(blocks[i][0], blocks[i][1], blocks[i][2], blocks[i][3], blocks[i][4]);

  
  }
}


void blockUpdate2() {
  for (int i = 0; i<blocks2.length; i++) {

    fill(20); // Fill for climbing platforms

    if (blocks2[i][4]==0) {
      
      fill(255, 20, 20); // Obstacle block color
      
    }
    
    
    // Start of collision detection for blocks 
    // Create collision detect for boulders 
    if (px+pxv+psize>blocks2[i][0] && px+pxv<blocks2[i][0]+blocks2[i][2] && py+psize>blocks2[i][1] && py<blocks2[i][1]+blocks2[i][3]) {
      if (blocks2[i][4]==0) {
lives = lives - 1;

   px = 410;
   py = 820;
      }
      pxv=0;
    }

    if (px+psize>blocks2[i][0] && px<blocks2[i][0]+blocks2[i][2] && py+pyv+psize>blocks2[i][1] && py<blocks2[i][1]+blocks2[i][3]) {
      if (blocks2[i][4]==0) {
lives = lives - 1;

 px = 410;
   py = 820;
      }

      pyv=0;
      gravity=0;
      falling = false;
    }

    if (px+psize>blocks2[i][0] && px<blocks2[i][0]+blocks2[i][2] && py+psize>blocks2[i][1] && py+pyv<blocks2[i][1]+blocks2[i][3]) {
      if (blocks2[i][4]==0) {
lives = lives - 1;

 px = 410;
   py = 820;
      }

      pyv=0;
      gravity=0;
    }

    rect(blocks2[i][0], blocks2[i][1], blocks2[i][2], blocks2[i][3], blocks2[i][4]);

  
  }
}

void blockUpdate3() {
  for (int i = 0; i<blocks3.length; i++) {

    fill(20); // Fill for climbing platforms

    if (blocks3[i][4]==0) {
      
      fill(25, 120, 212); // Obstacle block color
      
    }
    
    
    // Start of collision detection for blocks 
    // Create collision detect for boulders 
    if (px+pxv+psize>blocks3[i][0] && px+pxv<blocks3[i][0]+blocks3[i][2] && py+psize>blocks3[i][1] && py<blocks3[i][1]+blocks3[i][3]) {
      if (blocks3[i][4]==0) {
lives = lives - 1;

   px = 410;
   py = 820;
      }
      pxv=0;
    }

    if (px+psize>blocks3[i][0] && px<blocks3[i][0]+blocks3[i][2] && py+pyv+psize>blocks3[i][1] && py<blocks3[i][1]+blocks3[i][3]) {
      if (blocks3[i][4]==0) {
lives = lives - 1;

 px = 410;
   py = 820;
      }

      pyv=0;
      gravity=0;
      falling = false;
    }

    if (px+psize>blocks3[i][0] && px<blocks3[i][0]+blocks3[i][2] && py+psize>blocks3[i][1] && py+pyv<blocks3[i][1]+blocks3[i][3]) {
      if (blocks3[i][4]==0) {
lives = lives - 1;

 px = 410;
   py = 820;
      }

      pyv=0;
      gravity=0;
    }

    rect(blocks3[i][0], blocks3[i][1], blocks3[i][2], blocks3[i][3], blocks3[i][4]);

  
  }
}











// Game Controls 

boolean[] keys = new boolean[256];



void keyPressed() {
  keys[keyCode]=true;
};


void keyReleased() {
  keys[keyCode]=false;
};


void playerInput() {
  pxv=0;
  pyv=0;


  if (dead==false) {
    if (keys[UP] && falling==false) {
      gravity-=7;
    }
    if (keys[LEFT]) {
      pxv=-pspeed;
    }
    if (keys[RIGHT]) {
      pxv=pspeed;
    }
  }
  
  if(keys[82]){
    dead=false;
    px=rx;
    py=ry;
  }
  // Player gravity 
  pyv+=gravity; // increase down direction y axis for gravity
  gravity+=0.4;

  falling = true;
}



// Method for setting up player 
void playerUpdate() {
  px+=pxv; // x axis movement vertical
  py+=pyv;
  

 
 
 
  fill(234,192,134);
 ellipse(px, py, circleRadius, circleRadius);
  
  
   fill(255,215,0);
  arc(px, py-15, 50, 50, radians(150), radians(380));
  
  
  fill(0, 0, 128);
  rect(px-25, py-20,50, 5);
 
 fill(0, 0, 128);
  rect(px-22, py-30,45, 5);
  
  
fill(0);
 ellipse(px-5, py, 7, 7);
 
  fill(0);
 ellipse(px+5, py, 7, 7);
  



  
  }


   
 
    
     


         



void draw() {
  


  // Level design
  
    if (currentLevel == 1) {
    level1();

  }
  else if (currentLevel == 2) {
    level2();
  }
  else if (currentLevel == 3) {
    level3();
  }
  else if (lives <= 0){
 background(255);
 textAlign(CENTER);
  fill(0);
  text("GAME OVER", width/2, height/2);
  text("SPACEBAR TO RESTART", width/2, 350);
  if (keyPressed) {
    if (key == ' ') {
currentLevel = 1;
part1 = new Token(305, 295);
   part1.appear();
   
    if (part1.intersectX(detector)) {
      part1.caughtP();
    
    }
sandY = 900;
sandY -= 0.1;
 px = 410;
   py = 820;
 
     playerUpdate();
   lives = 3;
    score = 0;

   
  }
  }
  }

}


              

  


void level1() {
  

  

  
  detector.display(); 
  detector.setLocation(px, py); 
  
  
 background(40); // Background color

  fill(255);
  text("Level 1 ", 150, 20);
  text("Lives: " + lives, 150, 35);
  text("Score: " + score, 150, 50);
  

 blockUpdate();

  

  

  playerUpdate();

         playerInput();

 
    // Check the timer
  if (timer.isFinished()) {

    // Initialize one boulder
    boulders[totalBoulders] = new Boulder();
      portal[totalPortals] = new Portal();
      totalPortals ++;
    
    // Increment total boulders in the array 
    totalBoulders ++ ;
          // Increment totalDrops
       if (totalPortals >= portal.length) {
      totalPortals = 0; // Start over

    }
    
    
    // If we hit the end of the array
    if (totalBoulders >= boulders.length) {
      totalBoulders = 0; // Start over
         
   
    }    
  

           
          timer = new Timer(2000);    
    timer.start();
   
  }
  
 
  // Move and display all boulders

  
  
    for (int i = 0; i < totalBoulders; i++ ) {
    boulders[i].move();
    boulders[i].display();
    if (detector.intersect(boulders[i])) {
      boulders[i].caught();
 px = 410;
   py = 820;

    }
  }


  
  
 
   

  
  
  
  // Move and display all portals
for (int i = 0; i < totalPortals; i++ ) {
   
    portal[i].display();

   if (detector.intersectT(portal[i])) {
      portal[i].caughtPortal();
      
      px = 444;
      py = 425;
  
   }

 
}

  





    part1.appear(); 
    
      doors.appearDoor(); 
    
    life.appear();





    
    if (px <= 0 + r) { //Lose a life if player goes off left of screen
lives = lives - 1;

    }
   
   
   
   if (px >= width - r) {  //Lose a life if player goes off right of screen
lives = lives -1;
    }
  

   




   
   


    
    
   
    if (part1.intersectX(detector)) {
      part1.caughtP();
    
    }
    
        
    if (doors.intersectX(detector)) {
      doors.caughtD();
    
    }
 if (life.intersectX(detector)) {
    life.caughtL();

    }
    



      image(img, 360, 125, width/7.5, height/6);
    image(img2, 0, 0, width/6.6, height/3);
    image(img3, 680, 0, width/6.6, height/3);
    image(img4, 0, 300, width/6.6, height/3);
     image(img5, 0, 600, width/6.6, height/3);
       image(img6, 680, 300, width/6.6, height/3);
       image(img7, 680, 600, width/6.6, height/3);
      
       
    fill(239,221,111); // Sand Fill Color
   rect(sandX, sandY, 800, 900);
 sandY=sandY-0.1;
 
   
   
     if(px  > sandX && px < sandX + 800){
       if( py > sandY &&  py < sandY + 900){
 background(255);
 textAlign(CENTER);
  fill(0);
  text("GAME OVER", width/2, height/2);
  text("SPACEBAR TO RESTART", width/2, 350);
  if (keyPressed) {
    if (key == ' ') {
currentLevel = 1;
part1 = new Token(305, 295);
   part1.appear();
   
    if (part1.intersectX(detector)) {
      part1.caughtP();
    
    }
sandY = 900;
sandY -= 0.1;
 px = 410;
   py = 820;
   part1.appear(); 
   
     playerUpdate();
   lives = 3;
    score = 0;

       }
     }
       }
     
     }  
         
       if (lives <= 0) {
     background(255);
 textAlign(CENTER);
  fill(0);
  text("GAME OVER", width/2, height/2);
  text("SPACEBAR TO RESTART", width/2, 350);
  if (keyPressed) {
    if (key == ' ') {
currentLevel = 1;
part1 = new Token(305, 295);
   part1.appear();
   
    if (part1.intersectX(detector)) {
      part1.caughtP();
    
    }
sandY = 900;
sandY -= 0.1;
   part1.appear(); 
   
 px = 410;
   py = 820;
 
     playerUpdate();
   lives = 3;
    score = 0;

       


    }
  }
       }
  
   if (score >= 11) {
      currentLevel = 2;
 px = 410;
   py = 820;
   
    }
  
  
}
  




void level2() {

    detector.display(); 
detector.setLocation(px, py); 
   background(120); // Background color

  fill(255);
  text("Level 2 ", 150, 20);
  text("Lives: " + lives, 150, 35);
  text("Score: " + score, 150, 50);
 blockUpdate2();

  // Display the catcher
  
  

   playerUpdate();
  playerInput();
          




 
    // Check the timer
  if (timer.isFinished()) {
  
    boulders[totalBoulders] = new Boulder();
      portal2[totalPortals2] = new Portal2();

        totalPortals2 ++;

    totalBoulders ++ ;
      
       if (totalPortals2 >= portal2.length) {
      totalPortals2 = 0; // Start over

    }
    
    
    // If we hit the end of the array
    if (totalBoulders >= boulders.length) {
      totalBoulders = 0; // Start over
         
   
    }    
  
 
          timer = new Timer(1500);      
    timer.start();
   
  }
  
 

  
  
    for (int i = 0; i < totalBoulders; i++ ) {
    boulders[i].move();
    boulders[i].display();
    if (detector.intersect(boulders[i])) {
      boulders[i].caught();
 px = 410;
   py = 820;
    }
  }


  
  
 
   

  
  
  
for (int i = 0; i < totalPortals2; i++ ) {
   
    portal2[i].display();

   if (detector.intersectT2(portal2[i])) {
      portal2[i].caughtPortal2();
      

   }

 
}

  










    
    if (px <= 0 + r) { //Lose a life if player goes off left of screen
lives = lives -1;
    }
   
   
   
   if (px >= width - r) {  //Lose a life if player goes off right of screen
lives = lives -1;
    }
  

   


   
 
       
    






   

part2.appear2();
life2.appear();
    doors2.appearDoor(); 
    
   
    if (part2.intersectX(detector)) {
      part2.caughtP();
    
    }
    
        if (doors2.intersectX(detector)) {
      doors2.caughtD();
    
    }
 if (life2.intersectX(detector)) {
    life2.caughtL();

    }
    

       
       image(img, 360, 95, width/7.5, height/6);
    image(img2, 0, 0, width/6.6, height/3);
    image(img3, 680, 0, width/6.6, height/3);
    image(img4, 0, 300, width/6.6, height/3);
     image(img5, 0, 600, width/6.6, height/3);
       image(img6, 680, 300, width/6.6, height/3);
     
       
        fill(239,221,111); // Sand Fill Color
   rect(sandX2, sandY2, 800, 900);

 sandY2=sandY2-0.2;
 
     image(img7, 680, 600, width/6.6, height/3);
   
     if(px  > sandX2 && px < sandX2 + 800){
       if( py > sandY2 &&  py < sandY2 + 900){
 background(255);
 textAlign(CENTER);
  fill(0);
  text("GAME OVER", width/2, height/2);
  text("SPACEBAR TO RESTART", width/2, 350);
  if (keyPressed) {
    if (key == ' ') {
      
currentLevel = 2;
part2 = new Token(565, 435);
   part2.appear2();
   
    if (part2.intersectX(detector)) {
      part2.caughtP();
    
    }
sandY2 = 900;
sandY2 -= 0.15;
 px = 410;
   py = 820;

     playerUpdate();
   lives = 3;
    score = 0;

       }
     }
       }
     
     }  
     if (lives <= 0) {
     background(255);
 textAlign(CENTER);
  fill(0);
  text("GAME OVER", width/2, height/2);
  text("SPACEBAR TO RESTART", width/2, 350);
  if (keyPressed) {
    if (key == ' ') {
currentLevel = 1;
  part2 = new Token(565, 435);
   part2.appear2();
   
    if (part2.intersectX(detector)) {
      part2.caughtP();
    
    }
sandY = 900;
sandY -= 0.1;

    
 px = 410;
   py = 820;
 
     playerUpdate();
   lives = 3;
    score = 0;

       


    }
  }
       }


  
  
   if (score >= 22) {
      currentLevel = 3;
       px = 410;
   py = 820;

    }
 
  
 
}
  
   


//LEVEL 2
void level3() {


  detector.display(); 
  
  detector.setLocation(px, py); 

  

   background(123); // Background color

  fill(255);
  text("Level 3 ", 150, 20);
  text("Lives: " + lives, 150, 35);
  text("Score: " + score, 150, 50);


blockUpdate3();
  
  
   playerUpdate();
  playerInput();
          
  
  

   if (timer.isFinished()) {

    boulders[totalBoulders] = new Boulder();
     portal3[totalPortals3] = new Portal3();

    totalBoulders ++ ;
      
    totalPortals3 ++ ;
    
    // If we hit the end of the array
    if (totalBoulders >= boulders.length) {
      totalBoulders = 0; // Start over
    }
    if (totalPortals3 >= portal3.length) {
      totalPortals3 = 0; // Start over
    }
    

   
          timer = new Timer(1000);    
    timer.start();
   
  }
        

  
  
    for (int i = 0; i < totalBoulders; i++ ) {
    boulders[i].move();
    boulders[i].display();
    if (detector.intersect(boulders[i])) {
      boulders[i].caught();
 px = 410;
   py = 820;
  
    }
  }


  
  
 
   

  
  
for (int i = 0; i < totalPortals3; i++ ) {
   
    portal3[i].display();

   if (detector.intersectT3(portal3[i])) {
      portal3[i].caughtPortal3();
  
   }
}



 











    
    if (px <= 0 + r) { //Lose a life if player goes off left of screen
lives = lives -1;
    }
   
   
   
   if (px >= width - r) {  //Lose a life if player goes off right of screen
lives = lives -1;
    }
  








     part3.appear3();
     part4.appear4();
      doors3.appearDoor(); 
     life3.appear();
     


    
   
    if (part3.intersectX(detector)) {
      part3.caughtP();
    
    }
     if (doors3.intersectX(detector)) {
      doors3.caughtD();
    
    }
        if (part4.intersectX(detector)) {
      part4.caughtP();
    
    }

    
    if (life3.intersectX(detector)) {
    life3.caughtL();

    }
    






 image(img, 360, 125, width/7.5, height/6);
     image(img2, 0, 0, width/6.6, height/3);
    image(img3, 680, 0, width/6.6, height/3);
    image(img4, 0, 300, width/6.6, height/3);
     image(img5, 0, 600, width/6.6, height/3);
       image(img6, 680, 300, width/6.6, height/3);




      
       
        fill(239,221,111); // Sand Fill Color
   rect(sandX2, sandY2, 800, 900);

 sandY2=sandY2-0.1; 
  
     image(img7, 680, 600, width/6.6, height/3);
   
     if(px  > sandX2 && px < sandX2 + 800){
       if( py > sandY2 &&  py < sandY2 + 900){
 background(255);
 textAlign(CENTER);
  fill(0);
  text("GAME OVER", width/2, height/2);
  text("SPACEBAR TO RESTART", width/2, 350);
  if (keyPressed) {
    if (key == ' ') {
currentLevel = 3;
part3 = new Token(185, 150);
   part3.appear3();
   
    if (part3.intersectX(detector)) {
      part3.caughtP();
    
    }
part4 = new Token(240, 425);
part4.appear4();
   
    if (part4.intersectX(detector)) {
      part4.caughtP();
    
    } 
sandY2 = 900;
sandY2 -= 0.3;

 px = 410;
   py = 820;

     playerUpdate();
   lives = 3;
    score = 0;

       }
     }
       }
     
     }  
     if (lives <= 0) {
     background(255);
 textAlign(CENTER);
  fill(0);
  text("GAME OVER", width/2, height/2);
  text("SPACEBAR TO RESTART", width/2, 350);
  if (keyPressed) {
    if (key == ' ') {
currentLevel = 1;
part3 = new Token(185, 150);
   part3.appear3();
   
    if (part3.intersectX(detector)) {
      part3.caughtP();
    
    }
part4 = new Token(240, 425);
part4.appear4();
   
    if (part4.intersectX(detector)) {
      part4.caughtP();
    
    } 
sandY = 900;
sandY -= 0.1;

 px = 410;
   py = 820;
 
     playerUpdate();
   lives = 3;
    score = 0;

       


    }
  }
       }

  
  
   if (score >= 34) {
currentLevel = 4;
  background(255);
 textAlign(CENTER);
  fill(0);
  text("Congrats! You have complete the Sands of Egypt Game, Thank you for playing", width/2, height/2);
 
  
    }
}
 
  
 

  
   

  

class Boulder {
  float x, y;   // Variables for location of raindrop
  float speed;  // Speed of raindrop
  color c;
  float r;      // Radius of raindrop


float psize=18;
float px=w-psize;
float py=h-psize;
float rx=px;
float ry=py;
float pxv=0;
float pyv=0;
float pspeed=5;
float gravity=0;

boolean dead = false;




boolean falling = true;


  Boulder() {
    r = 15;                   // All boulders are the same size
    x = random(width);       // Start with a random x location
    y = -r*4;                // Start a little above the window
    speed = random(4.5, 2);   
    c = color(50, 100, 150);
      
  }

  // Move the raindrop down
  void move() {
    // Increment by speed
    y += speed;
    
      
    if(dist(px, py, x, y) < r+ circleRadius){
       dead= true;
     }
    
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
     
    
  }
 
     
  void caught() {
 
lives--;

    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = -1000;
    

  }


  // Display the boulder
  void display() {
  
    fill(90,77,65);
    noStroke();
    for (int i = 2; i < r; i++ ) {
  
      ellipse(x, y, 50, 50);
    
     }
    }
}


class Collision {
  float r;    // radius
  color col;  // color
  float x, y; // location

  Collision(float tempR) {
    r = tempR;
    col = color(50, 10, 10, 150);
    x = 0;
    y = 0;
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    stroke(0);
    fill(col);
    ellipse(px, py, 30, 30);
  }


  boolean intersect(Boulder d) {
    // Calculate distance
    float distance = dist(px, py, d.x, d.y); 

    // Compare distance to sum of radii
    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean intersectT(Portal t) {
    // Calculate distance
    float distance = dist(px, py, t.x, t.y); 

    // Compare distance to sum of radii
    if (distance <= r + t.r) { 
      return true;
    } else {
      return false;
    }
  }
    
  boolean intersectT2(Portal2 t) {
    // Calculate distance
    float distance = dist(px, py, t.x, t.y); 

    // Compare distance to sum of radii
    if (distance <= r + t.r) { 
      return true;
    } else {
      return false;
    }
  }
    boolean intersectT3(Portal3 t) {
    // Calculate distance
    float distance = dist(px, py, t.x, t.y); 

    // Compare distance to sum of radii
    if (distance <= r + t.r) { 
      return true;
    } else {
      return false;
    }
  }
   boolean intersectP(Token p) {
    // Calculate distance
    float distance = dist(px, py, p.x, p.y); 

    // Compare distance to sum of radii
    if (distance <= r + p.r) { 
      return true;
    } else {
      return false;
    }
  }
    boolean intersectD(Door t) {
    // Calculate distance
    float distance = dist(px, py, t.x, t.y); 

    // Compare distance to sum of radii
    if (distance <= r + t.r) { 
      return true;
    } else {
      return false;
    }
  }
  
  
}
class Door {
  float x, y;   

  color c;
    color c2;
  float r;      



  Door() {
    r = 15;                 
    x = 420;      
    y = 1220;               

    c = color(75, 0, 75); // Color

  }



  void display() {
   fill(c);
       ellipse(x, y, 50, 50);
 
    }
 
     
  void caughtDoor() {

 score = score + 10;
   
    
   
    
   
  }


}

 class Life {
  float x_;
  float y_;
  float d;
float x, y;  
  float speed;  
  color c;
  float r;    


 Life(int posX, int posY) {
    x_ = posX;
    y_ = posY;              // Start a little above the window

      
  }
  void caughtL() {
lives =lives + 1;
y_ = 1233;

    // Set the location to somewhere way off-screen
    

  }
  boolean intersectX(Collision a) {
    float distance = dist(x_, y_, a.x, a.y);
    if (distance <= d + a.r ) {
      return true;
    } 
    else {
      return false;
    }
  }

  //Create appearance of first part
  void appear() {
       fill(117);
    image(img8, x_, y_, 56, 55);

  
 
  }


  
}

class Portal {
  float x, y;   

  color c;
    color c2;
  float r;      



  Portal() {
    r = 15;                 
    x = 265;     
    y = 410;              

    c = color(75, 0, 75); // Color
      c2 = color(0, 0, 0); // Color
  }


  void display() {
   fill(c);
       image(img10, x, y, width/15, height/15);
 
    }
 
     
  void caughtPortal() {

 
   
    
   
    
   
  }


}

class Portal2 {
  float x, y;   

  color c;
    color c2;
  float r;      



  Portal2() {
    r = 15;            
    x = 585;      
    y = 80;              

    c = color(75, 0, 75); // Color
      c2 = color(0, 0, 0); // Color
  }


  void display() {
   fill(c);
       image(img10, x, y, width/15, height/15);
 
    }
 
     
  void caughtPortal2() {
px = 155;
 
 py = 100;
   
 
   
  }


}

class Portal3 {
  float x, y;   

  color c;
    color c2;
  float r;      



  Portal3() {
    r = 15;                  
    x = 580;       // Start with a random x location
    y = 75;                // Start a little above the window

    c = color(75, 0, 75); // Color
      c2 = color(0, 0, 0); // Color
  }


  void display() {
   fill(c);
       image(img10, x, y, width/15, height/15);
 
    }
 
     
  void caughtPortal3() {
px = 365;
 
 py = 630;
   
 
   
  }


}












class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }

 
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
class Token {
  float x_;
  float y_;
  float d;
float x, y;   // Variables for location of raindrop
  float speed;  // Speed of raindrop
  color c;
  float r;      // Radius of raindrop


  Token(int posX, int posY) {
    x_ = posX;
    y_ = posY;              // Start a little above the window

      
  }
  void caughtP() {
score =score + 1;
y_ = 5554;

   
    

  }
    void caughtD() {
score =score + 10;
y_ = 5554;

   
    

  }
  boolean intersectX(Collision a) {
    float distance = dist(x_, y_, a.x, a.y);
    if (distance <= d + a.r ) {
      return true;
    } 
    else {
      return false;
    }
  }

  //Create appearance of first part
  void appear() {
       fill(117);
    image(p1, x_, y_, 56, 55);


 
  }
  void appear2() {
       fill(117);
    image(p2, x_, y_, 56, 55);


 
  }
  void appear3() {
       fill(117);
    image(p3, x_, y_, 56, 55);


 
  }

    void appear4() {
       fill(117);
    image(p4, x_, y_, 56, 55);


 
  }
     void appearDoor() {
       fill(117);
    ellipse(x_, y_, 50, 50);


 
  }
}


  

  
