import de.looksgood.ani.*; //<>//
import de.looksgood.ani.easing.*;

// http://multiply.org/processing/ -- timed events -- TODO?




//------------------ Genral, changable variables ------

int pixelSize = 2; //Determines how many pixels on the screen define 1 pixel on LED strip

boolean helpGrid = false;

//-----------------------------------------------------

int widthOuterTunnel = 37 * pixelSize;

int lengthTunnel = int(pixelSize * 75);

int widthLEDStrip = 30 * pixelSize;

final static int nGenerators = 16;

Generator[] generator;

PImage mapping;

static final int LEFT_RIGHT = 0;
static final int RIGHT_LEFT = 1;

static final int FULL_LENGTH_TUNNEL = 150;
static final int FULL_LENGTH = 100;
static final int THREE_QUARTER_LENGTH = 75;
static final int HALF_LENGTH = 50;
static final int QUARTER_LENGTH = 25;


void setup() {

  size(600, 630);

  mapping = loadImage("data/mapping.png");
  
  //Creating all generators

  generator = new Generator[nGenerators];
  
  for (int i = 0; i < nGenerators; i++) {
    generator[i] = new Generator(i);
  }

  createGrid();
   
  //println(lengthTunnel);

  Ani.init(this);
}

void draw() {
  background(0);

  if (helpGrid) {
    image(mapping, 0, 0);
  }

  for (int i = 0; i < generator.length; i++) {
    generator[i].update();
  }
  
  utility();
  
  createVirtualTunnels();

  if (frameCount % 30 == 0) {
   // println("adding pulses");

    for (int i = 0; i < nGenerators; i++) {
      generator[i].addPulse(1, FULL_LENGTH_TUNNEL);
    }
  }
  
  
}