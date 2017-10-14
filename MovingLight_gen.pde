import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

// http://multiply.org/processing/ -- timed events -- TODO?




//------------------ Genral, changable variables ------

int pixelSize = 2; //Determines how many pixels on the screen define 1 pixel on LED strip

boolean helpGrid = false;

//-----------------------------------------------------

int lengthTunnel = pixelSize * 50 * 5;

final static int nGenerators = 18;

Generator[] generator;

PImage mapping;

static final int LEFT_RIGHT = 0;
static final int RIGHT_LEFT = 1;

static final int FULL_LENGTH = 100;
static final int THREE_QUARTER_LENGTH = 2;
static final int HALF_LENGTH = 1;
static final int QUARTER_LENGTH = 0;


void setup() {

  size(600, 600);

  mapping = loadImage("data/mapping.png");

  generator = new Generator[nGenerators];
  for (int i = 0; i < nGenerators; i++) {
    generator[i] = new Generator(i);
  }
  
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

  if (frameCount % 30 == 0) {
    println("adding pulses");
    
    generator[0].addPulse(1, FULL_LENGTH);
    generator[1].addPulse(1, FULL_LENGTH);
    generator[2].addPulse(1, FULL_LENGTH);
    generator[3].addPulse(1, FULL_LENGTH); //<>//
  }
}