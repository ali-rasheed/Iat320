
import processing.sound.*;

SinOsc[] sineWaves; // Array of sines
float[] sineFreq; // Array of frequencies
int numSines = 10; // Number of oscillators to use

void setup() {
  size(1000, 800);
  background(230);
  frameRate(120);
  sineWaves = new SinOsc[numSines]; // Initialize the oscillators
  sineFreq = new float[numSines]; // Initialize array for Frequencies

  for (int i = 0; i < numSines; i++) {
    // Calculate the amplitude for each oscillator
    float sineVolume = (1.0 / numSines) / (i + 1);
    // Create the oscillators
    sineWaves[i] = new SinOsc(this);
    // Start Oscillators
    sineWaves[i].play();
    // Set the amplitudes for all oscillators
    sineWaves[i].amp(sineVolume);
  }
}

void draw() {
  println(frameRate);
  float thickness = dist(mouseX, mouseY, mouseX, pmouseY);

  stroke (0);

  thickness = map(thickness, 0, 50, 1, 5);
  strokeWeight(thickness);

  line (mouseX, mouseY, pmouseX, pmouseY);

  //Map mouseY from 0 to 1
  float yoffset = map(mouseY, 0, height, 1, 0);
  //Map mouseY logarithmically to 150 - 1150 to create a base frequency range
  float frequency = pow(1000, yoffset) + 150;
  //Use mouseX mapped from -0.5 to 0.5 as a detune argument
  float detune = map(mouseX, 0, width, -0.5, 0.5);

  for (int i = 0; i < numSines; i++) {
    sineFreq[i] = frequency * (i + 1 * detune);
    // Set the frequencies for all oscillators
    sineWaves[i].freq(sineFreq[i]);
  }
}
void mouseClicked() {
  background(230);
}
