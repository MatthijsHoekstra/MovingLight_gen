// http://multiply.org/processing/ -- timed events -- TODO?


//------------------ Genral, changable variables ------

int pixelSize = 2; //Determines how many pixels on the screen define 1 pixel on LED strip

boolean helpGrid = true;

//-----------------------------------------------------


PImage mapping;

static final int LEFT_TO_RIGHT = 0;
static final int RIGHT_TO_LEFT = 1;

static final int FULL_LENGTH = 0;
static final int THREE_QUARTER_LENGTH = 1;
static final int HALF_LENGTH = 2;
static final int QUARTER_LENGTH = 3;


void setup() {

  size(600, 600);

  mapping = loadImage("data/mapping.png");
  
   
}

void draw() {
  background(0);
  
  if (helpGrid) {
    image(mapping, 0, 0);
  }
  
  
}