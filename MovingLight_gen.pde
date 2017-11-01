//TODO //<>//

//ADD boolean check for the status of the kinects, publish to overview
//ADD status show, are we running? Do we rerun? What is the show doing? Depends on messages that are received
//ADD the correct json format within the socket created, waiting for correct names @Sander

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

import hypermedia.net.*;

import processing.net.*;

import http.requests.*;
import org.multiply.processing.TimedEventGenerator;

import http.*;
import java.util.Map;

SimpleHTTPServer server;
DynamicResponseHandler responder1, responder2;

private TimedEventGenerator statusOutTimer;
private TimedEventGenerator statusInTimer;


// http://multiply.org/processing/ -- timed events -- TODO

//------------------ Genral, changable variables ------

int pixelSize = 2; //Determines how many pixels on the screen define 1 pixel on LED strip //Can be used for optimalization later on

boolean helpGrid = false;

int udpPort = 5883;

String OVERVIEW_SERVER_IP = "12.0.0.38";
String OVERVIEW_SERVER_PORT = "4444";

final int HTTP_SERVER_PORT = 8000;


//-----------------------------------------------------

int widthOuterTunnel = 37 * pixelSize;

int lengthTunnel = pixelSize * 75;

int widthLEDStrip = 30 * pixelSize;

final static int nGenerators = 22;

Generator[] generator;

PImage mapping;

UDP udp;

static final int LEFT_RIGHT = 0;
static final int RIGHT_LEFT = 1;
static final int UP_DOWN = 2;
static final int DOWN_UP = 3;

static final int FULL_LENGTH_TUNNEL = 150;
static final int FULL_LENGTH = 100;
static final int THREE_QUARTER_LENGTH = 75;
static final int HALF_LENGTH = 50;
static final int QUARTER_LENGTH = 25;

final String JSON_CONTENT_TYPE = "application/json";

//Test server;


void setup() {

  size(600, 630);

  smooth(0);

  mapping = loadImage("data/mapping.png");

  //Creating all generators

  generator = new Generator[nGenerators];

  for (int i = 0; i < nGenerators; i++) {
    generator[i] = new Generator(i);
  }

  createGrid();

  //println(lengthTunnel);

  Ani.init(this);

  udp = new UDP( this, udpPort );
  udp.listen( true );

  noStroke();

  generator[0].addRoundParticlePulse(2, FULL_LENGTH_TUNNEL);

  statusOutTimer = new TimedEventGenerator(this, "sendStatus", false);
  statusOutTimer.setIntervalMs(10000);
  statusOutTimer.setEnabled(true);

  startWebServices();
  
  
}

void draw() {

  //Blur canvas
  fill(0, 50); // semi-transparent white
  rect(0, 0, width, height);

  if (helpGrid) {
    image(mapping, 0, 0);
  }

  for (int i = 0; i < generator.length; i++) {
    generator[i].update();
  }

  utility();

  createVirtualTunnels();

  if (frameCount % 30 == 0) {
    //println("adding pulses");

    for (int i = 0; i < nGenerators; i++) {
      generator[i].addPulse(2, FULL_LENGTH_TUNNEL);
    }
  }
}