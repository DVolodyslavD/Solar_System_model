class Stellar {
  float centerX;
  float centerY;
  float posX;
  float posY;
  float phase;
  float speed;
  float dist;
  int radius; 
  String name;
  
  Stellar(float speed, float dist, int radius, String name){
    this.phase = 0;
    this.speed = speed;
    this.dist = dist;
    this.radius = radius;
    this.name = name;
  }
  
  void update(float X, float Y){ //dsds
    this.centerX = X;
    this.centerY = Y;
    this.posX = cos(this.phase) * this.dist + this.centerX;
    this.posY = sin(this.phase) * this.dist + this.centerY;
    this.phase += this.speed;
  }
}


class Star extends Stellar {
  int r; // RGB code - r, g, b
  float g;  
  float g1;
  int b;
  String type;
  
  Star( String name, int radius, float speed, float dist, int r, int g, int b){
    super(speed, dist, radius, name);
    this.r = r;
    this.g = g;
    this.b = b;
    this.type = "star"; 
  }
  
  void render(){
    noStroke();
    g1 = this.g + random(-45, 21);
    fill(this.r, g1, this.b);
    circle(this.posX, this.posY, this.radius);
    text(this.name, this.posX + this.radius, this.posY);
  }
}


class Planet extends Stellar {
  color albedo;
  String type;
  
  Planet(String name, int radius, float speed, float dist, color albedo){
    super(speed, dist, radius, name);
    this.albedo = albedo;
    this.type = "planet";
  }
  
  void render(){
    orbit();
    noStroke();
    fill(this.albedo);
    circle(this.posX, this.posY, this.radius);
    text(this.name, this.posX + this.radius, this.posY);   
  }
  
  void orbit(){
    noFill();
    stroke(30);
    circle(this.centerX, this.centerY, this.dist*2);
  }
}

class Planet_w_rings extends Stellar {
  color albedo;
  String type;
  
  Planet_w_rings(String name, int radius, float speed, float dist, color albedo){
    super(speed, dist, radius, name);
    this.albedo = albedo;
    this.type = "planet";
  }
  
  void render(){
    orbit();
    fill(this.albedo);
    circle(this.posX, this.posY, this.radius);
    text(this.name, this.posX + this.radius, this.posY);
    noFill();
    stroke(100);
    for(int i=12; i<=21; i++){
    circle(this.posX, this.posY, this.radius + i);
    }
  }
  
  void orbit(){
    noFill();
    stroke(30);
    circle(this.centerX, this.centerY, this.dist*2);
  }
}


class Moon extends Stellar {
  String type;
  color albedo;
  
  Moon(String name, int radius, float speed, float dist, color albedo){
    super(speed, dist, radius, name);
    this.albedo = albedo;
    this.type = "moon";
  }
  
  void render(){
    noStroke();
    fill(this.albedo);
    circle(this.posX, this.posY, this.radius);
    text(this.name, this.posX + this.radius, this.posY);   
  }
}


Star sun;
Planet mercury;
Planet venus;
Planet earth;
Moon moon;
Planet mars;
Planet_w_rings jupiter;
Moon ganymede;
Planet_w_rings saturn;
Moon titan;
Planet_w_rings uranus;
Planet_w_rings neptune;

PImage img;

void setup(){
  size(1200, 1000);
  img = loadImage("space.jpg");
   
  sun = new Star("Sun", 200, 0, 0, 255, 124, 0);
  mercury = new Planet("Mercury", 9, 0.1, 140, color(169));
  venus = new Planet("Venus", 11, 0.089, 156, color(252, 252, 252));
  earth = new Planet("Earth", 17, 0.059, 175, color(0, 0, 255));
  moon = new Moon("Moon", 10, 0.0021, 16, color(128));
  mars = new Planet("Mars", 14, 0.054, 193, color(221, 70, 0));
  jupiter = new Planet_w_rings("Jupiter", 54, 0.0253, 255, color(244, 205, 138));
  ganymede = new Moon("Ganymede", 13, 0.022, 48, color(117, 102, 93));
  saturn = new Planet_w_rings("Saturn", 50, 0.0247, 365, color(255, 255, 138));
  titan = new Moon("Titan", 12, 0.0026, 50, color(255,225,118));
  uranus = new Planet_w_rings("Uranus", 31, 0.0208, 425, color(108, 159, 190));
  neptune = new Planet_w_rings("Neptune", 30, 0.019, 465, color(100, 140, 230));
}

void draw(){
  //background(0);
  image(img, 0, 0);

  sun.update( width / 2, height / 2);
  sun.render();
  mercury.update(sun.centerX, sun.centerY);
  mercury.render();
  venus.update(sun.centerX, sun.centerY);
  venus.render();
  earth.update(sun.centerX, sun.centerY);
  earth.render();
  moon.update(earth.posX, earth.posY);
  moon.render();
  mars.update(sun.centerX, sun.centerY);
  mars.render();
  jupiter.update(sun.centerX, sun.centerY);
  jupiter.render();
  ganymede.update(jupiter.posX, jupiter.posY);
  ganymede.render();
  saturn.update(sun.centerX, sun.centerY);
  saturn.render();
  titan.update(saturn.posX, saturn.posY);
  titan.render();
  uranus.update(sun.centerX, sun.centerY);
  uranus.render();
  neptune.update(sun.centerX, sun.centerY);
  neptune.render();
}
