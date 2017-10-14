// http://multiply.org/processing/ -- timed events -- TODO?


//------------------ Genral, changable variables ------

int pixelSize = 2; //Determines how many pixels on the screen define 1 pixel on LED strip

boolean helpGrid = true;

//-----------------------------------------------------

final static int nGenerators = 18;

Generator[] generator;

PImage mapping;

static final int LEFT_RIGHT = 0;
static final int RIGHT_LEFT = 1;

static final int FULL_LENGTH = 3;
static final int THREE_QUARTER_LENGTH = 2;
static final int HALF_LENGTH = 1;
static final int QUARTER_LENGTH = 0;


void setup() {

  size(600, 600);

  mapping = loadImage("data/mapping.png");
  
  
  generator = new Generator[nGenerators];
  for (int i = 0; i < nGenerators ; i++){
   generator[i] = new Generator(i);
  }
}

void draw() {
  background(0);
  
  if (helpGrid) {
    image(mapping, 0, 0);
  }
  
  for (int i = 0; i < generator.length; i++){
   generator[i].update(); 
  }
  
}