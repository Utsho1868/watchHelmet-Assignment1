//Mr GW
int headX=60;
int headY=230;
int headW=30;
int headH=30;
int move=64; //movement of Mr GW
//door on the right side
int doorX=409;
int doorY=186;
int doorW=50;
int doorH=86;
//door open or close
//Main door
int doorCounter=0;
boolean doorOpen=false;
//Hammer falling from sky
int hammerX= 188;
int hammerY= -20;
int hammerW= 25;
int hammerH=15;
int hammerSpeed=10;

void setup(){
  size(512,348); // size of the screen
  doorCounter=(int)random(180,480); 
  headX=60;
  hammerY=20;
}

void draw(){
  background(21,227,142); //background color of screen
  
  //door on the left side
  rectMode(CORNER);
  stroke(0);
  strokeWeight(2);
  fill(21,227,142);
  rect(0,186,43,86);
  //square inside the door
  rectMode(CENTER);
  fill(0);
  rect(21,208,15,15,2);
  strokeWeight(6);
  point(35,237);
  //balconyBottom
  noStroke();
  fill(7,170,62);
  rectMode(CORNER);
  rect(0,154,52,15,0,5,5,0);
  stroke(7,170,62);
  strokeWeight(6);
  line(0,130,48,130);
  strokeWeight(4);
  line(10,132,10,155);
  line(23,133,23,155);
  line(36,133,36,155);
  noStroke();
  fill(7,170,62,50);
  rectMode(CORNER);
  rect(0,173,50,10);
  //balconyMiddle
  noStroke();
  fill(7,170,62);
  rectMode(CORNER);
  rect(0,84,52,15,0,5,5,0);
  stroke(7,170,62);
  strokeWeight(6);
  line(0,60,48,60);
  strokeWeight(4);
  line(10,60,10,86);
  line(23,60,23,86);
  line(36,60,36,86);
  noStroke();
  fill(7,170,62,50);
  rectMode(CORNER);
  rect(0,105,50,15);
  //balconyTop
  noStroke();
  fill(7,170,62,200);
  rectMode(CORNER);
  rect(0,10,52,15);
  noStroke();
  fill(7,170,62,50);
  rectMode(CORNER);
  rect(0,36,50,10);
  
  //Ground
  stroke(7,170,62);
  strokeWeight(1);
  line(79,291,100,291);
  line(74,285,98,285);
  line(134,291,174,288);
  line(127,285,161,285);
  line(186,293,213,286);
  line(186,282,230,283);
  line(302,285,361,287);
  line(321,295,359,292);
  line(249,287,275,287);
  line(257,295,296,297);
  line(108,286,118,289);
  line(223,294,234,295);
  line(52,288,67,288);
  
  //Trees at the top of the house
  //treeLeft
  fill(7,170,62);
  triangle(387,159,415,72,431,134);
  triangle(396,96,413,75,433,96);
  triangle(402,78,414,62,426,78);
  //treeRight
  triangle(470,131,498,69,width+30,180);
  //treeMiddle
  triangle(440,104,456,85,470,104);
  triangle(446,90,456,77,467,90);
  triangle(448,79, 457,70  ,465,79);
  
  
  //House on the right side
  //shades of house
  stroke(0);
  strokeWeight(20);
  line(365,184,453,134);
  line(453,134,width,165);
  //right side border of house
  stroke(0);
  strokeWeight(2);
  line(379,185,379,282);
  //door on the right
  stroke(0);
  strokeWeight(2);
  fill(21,227,142);
  rectMode(CORNER);
  rect(409, doorY,doorW, doorH);
  
  //Door Open or closed
  doorCounter-=1;
  if(doorCounter<=0){
    doorOpen = !doorOpen;
    doorCounter=(int)random(180,480);
  }
  if(doorOpen){
    //open the door
    stroke(0);
    strokeWeight(2);
    fill(21,227,142);
    quad(459,186,494,178,494,281,459,272);
    //small square at middle
    noStroke();
    strokeWeight(0);
    fill(0,0,0,200);
    quad(469,205,485,200,485,225,469,223);
    stroke(0);
    strokeWeight(5);
    fill(0);
    point(485,240);
  }else{
    //close the door
    stroke(0);
    strokeWeight(2);
    fill(21,227,142);
    rectMode(CORNER);
    rect(doorX, doorY,doorW, doorH);
    //small square
    stroke(0);
    fill(0);
    rectMode(CENTER);
    rect(doorX+25,doorY+30,20,20); //doorX=409; doorY=186; doorW=50; doorH=86;
    strokeWeight(5);
    point(419,243);
  }
  
  //Mr GW The Superhero
  //head
  //big circle
  stroke(0);
  strokeWeight(1);
  fill(0);
  ellipse(headX,headY,headW,headH);
  //small circle
  noStroke();
  strokeWeight(0);
  fill(21,227,142);
  ellipse(headX+10,headY+5,15,15);
  //Body of GW
  stroke(0);
  fill(0);
  triangle(headX-10,headY+35,headX,headY+5,headX+4,headY+40);
  
  //hammer fall from the sky
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(hammerX,hammerY,hammerW,hammerH);
  strokeWeight(5);
  line(hammerX,hammerY-10,hammerX,hammerY-40);
  if(frameCount%60==0){
  hammerY+=hammerSpeed;
  }
  //hammer hit then MrGW reset to initial point
  if(hammerY>headY-15 && headX==hammerX && hammerY-40<headY+35){
    headX=60;
  }
  //reset hammer into its initial point
  if(hammerY>height){
    hammerY=-20;
  }
  
  
  
  
}

//Keyboard pressed for moving Mr GW
void keyPressed(){
  if(key==CODED){
      if(keyCode==RIGHT){ 
       if(doorOpen==true){
        if(headX<400){
          headX+=move;
    }}else if(doorOpen==false) {
      if(headX<350){
      headX+=move;
    }
    }
  
}
    else if(headX >100){
      headX-=move;
    }
    
  }
}






//Pixel identification of the screen
void mouseClicked(){
  print("mouse X co-ordinate: ");
  println(mouseX);
  print("mouse Y co-ordinate: ");
  println(mouseY);
}