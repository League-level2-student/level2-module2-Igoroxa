//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;
int head;
int numX;
int numY;


// Add a constructor with parameters to initialize each variable.

Segment(int x, int y) {
this.x = x;
this.y = y;


}

}
//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head = new Segment(100, 100);
int foodX;
int foodY;
int direction = UP;
int total = 0;
ArrayList<Segment> tails = new ArrayList< Segment >();
Segment numX;
Segment numY;

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500,500);
this.head = new Segment(100, 100);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0,0,0);
  drawFood();
  move();
  drawSnake();
 
}

void drawFood() {
  //Draw the food
  fill (0, 255, 0);
  rect(foodX, foodY, 10, 10);
  
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(255, 0, 0);
  rect(head.x, head.y, 10, 10);
  manageTail();
  drawTail();
  eat();

}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
for (int i = 0; i < tails.size(); i++) {  
 Segment newblock = tails.get(i);
 
  
rect(newblock.x, newblock.y,  10, 10);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  Segment block = new Segment(head.x, head.y);
  tails.add(block);
  tails.remove(tails.size() - 1);
  println("test");
  
 
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for (int i=1; i < tails.size(); i++) {
  numX = tails.get(i);
  numY = tails.get(i);
  if (head.x == numX.x && head.y == numY.y) {
  total = 1;
  tails.clear();
  println("snake");
  }
  }


}

//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (keyCode == UP) {
    direction = UP;
}
if (keyCode == DOWN) {
  direction = DOWN;
}
if (keyCode == RIGHT) {
  direction = RIGHT;
}
if (keyCode == LEFT) {
  direction = LEFT;
}
}
void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
    head.y -= 10;
    break;
  case DOWN:
    head.y += 10; 
    break;
  case LEFT:
   head.x -= 10; 
    break;
  case RIGHT:
    head.x += 10; 
    break;
   
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.x > width) {
   head.x = 0;
 }
 if(head.x < 0) {
   head.x = width;
 }
 if(head.y < 0) {
   head.y = width;
 }
 if(head.y > width) {
   head.y = 0;
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if (head.x == foodX && head.y == foodY) {
   
  total = total + 1;
  dropFood();
  println(tails.size());
  Segment block = new Segment(head.x, head.y);
  tails.add(block);
  }

};
