#define  SERIAL_PORT_SPEED  115200

int A=7;
int B=8;
int valX=0;
int valY=0;
boolean fisrtInc=true;
boolean firstDec=true;


void setup()
{
  Serial.begin(SERIAL_PORT_SPEED);
  pinMode(inPin0,INPUT);      // sets the digital pin 7 as input
  pinMode(inPin1,INPUT);
}

void loop()
{
if(A==HIGH && B==LOW)
{
  if(firstInc==true)
  {
    firstInc=false;
  }
  else
  {
    //ragader avec l'angle la valeur qui se rappproche le plus de x ou y 
    if()
    {
      valX++  
    }
    else
    {
      valY++
    }
  }
  
}
if(A==LOW && B==HIGH)
{
   if(firstDec==true)
  {
    firstDec=false;
  }
  else
  {
    //ragader avec l'angle la valeur qui se rappproche le plus de x ou y 
    if()
    {
      valX--; 
    }
    else
    {
      valY--:
    }
  }
  
}

}
