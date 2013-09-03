import processing.serial.*;

Serial Port;
char HeadLabel='H';
int[] Barx={20,20+7};
int[] Bary={200,200+7};
int[] BarWidth={350,350-7*2};
int[] BarLength={30,30-7*2};
int[] BarColor={152,190,50};
int BackgroundColor=255;
float BlockPosition=0;
int BlockWidth=10;
int BlockLength=BarLength[0]+10;
float Blockx=BlockPosition+Barx[1]-BlockWidth/2;
int Blocky=Bary[0]-(BlockLength-BarLength[0])/2;
float Percent=0;
String Text="Light: "+Percent+"0%";

void setup() {
  size(400,380);
  smooth();
  textSize(32);
  textAlign(CENTER);
  String PortName=Serial.list()[4];
  Port=new Serial(this,PortName,9600);
  SendPercentage();
}

void draw() {
  if (mousePressed==true)//adjust mouse click
  {
    BlockPosition=mouseX-Barx[1];//according to mouse location, get the bar location
    if (BlockPosition<0){
      BlockPosition=0;//most right location
    }
    if (BlockPosition>BarWidth[1]){
      BlockPosition=BarWidth[1];//most left location
    }
    Blockx=BlockPosition+Barx[1]-BlockWidth/2;//according to bar location, calculate the draw location
    Percent=Math.round(BlockPosition/BarWidth[1]*1000)/10.00;//calculate light percentage (one decimal)
    Text="Light: "+Percent+"%";//range text
    if (Text.length()!=12 && Percent!=100){
      Text="Light: "+Percent+"0%";//make the text has same characters
    }
    SendPercentage();
  }
  DrawBar();//draw screen
}

void DrawBar(){
  background(BackgroundColor);
  noStroke();
  fill(BarColor[0]);
  rect(Barx[0],Bary[0],BarWidth[0],BarLength[0]);
  fill(BarColor[1]);
  rect(Barx[1],Bary[1],BarWidth[1],BarLength[1]);
  fill(BarColor[2]);
  rect(Blockx,Blocky,BlockWidth,BlockLength);
  text(Text,Barx[0]+BarWidth[0]/2,Bary[0]/2);
}

void SendPercentage(){
  int Light=Math.round(255*Percent/100);
  Port.write(HeadLabel);
  Port.write(Light);
}
