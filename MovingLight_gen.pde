//TODO //<>// //<>//

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

import spout.*;

SimpleHTTPServer server;
DynamicResponseHandler responder1, responder2;

private TimedEventGenerator statusOutTimer;
private TimedEventGenerator timeRipplePulseTimer;
private TimedEventGenerator gravityWavePulseTimer;

private TimedEventGenerator timeline_40;
private TimedEventGenerator timeline_47;


//------------------ Genral, changable variables ------

int pixelSize = 2; //Determines how many pixels on the screen define 1 pixel on LED strip //Can be used for optimalization later on

boolean helpGrid = false;

int udpPort = 5883;

String OVERVIEW_SERVER_IP = "10.0.1.3";
String OVERVIEW_SERVER_PORT = "5500";

final int HTTP_SERVER_PORT = 8000;


//-----------------------------------------------------

int widthOuterTunnel = 37 * pixelSize;

int lengthTunnel = pixelSize * 75;

int widthLEDStrip = 30 * pixelSize;

final static int nGenerators = 23;

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

float[] kinectHeight = new float[4];
float[] kinectCrowd = new float[4];
float[] kinectChaos = new float[4];

boolean[] activationEffect = new boolean[4];
boolean[] activationTimeRipple = new boolean[4];
boolean[] activationGravityWave = new boolean[4];

Spout spout;

int lastMillis;

void setup() {

  size(600, 630, OPENGL);

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
  Ani.setDefaultTimeMode(Ani.FRAMES);

  udp = new UDP( this, udpPort );
  udp.listen( true );

  noStroke();

  //generator[0].addRoundParticlePulse(2, FULL_LENGTH_TUNNEL);

  statusOutTimer = new TimedEventGenerator(this, "sendStatus", false);
  statusOutTimer.setIntervalMs(5000);
  statusOutTimer.setEnabled(true);

  timeRipplePulseTimer = new TimedEventGenerator(this, "timeRipplePulseActivated", false);
  timeRipplePulseTimer.setIntervalMs(200);
  timeRipplePulseTimer.setEnabled(true);

  timeline_40 = new TimedEventGenerator(this, "prepareWormhole");
  timeline_40.setIntervalMs(40000);
  timeline_40.setEnabled(false);

  timeline_47 = new TimedEventGenerator(this, "startWormhole");
  timeline_47.setIntervalMs(47000);
  timeline_47.setEnabled(false);

  startWebServices();

  createShapes();

  spout = new Spout(this);
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

  pushStyle();
  fill(255);
  rect(mouseX, mouseY, 50, 50);
  popStyle();


  utility();

  createVirtualTunnels();

  summonEffects();

  spout.sendTexture();
}