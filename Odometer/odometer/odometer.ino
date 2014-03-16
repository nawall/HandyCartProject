#define  SERIAL_PORT_SPEED  9600

int A=7;
int B=8;
int valX=0;
int valY=0;
int valA=0;
int valB=0;
int val=0;

int Afirst=0;
int Bfirst=0;
int tour=0;

int firstAB =0;
int firstBA =0;
int cpt=0;

int counterA = 0;
int counterB = 0;
boolean fisrtInc=true;
boolean firstDec=true;
boolean AattendB=false;
boolean BattendA=false;
long lastDebounce0 = 0;
long lastDebounce1 = 0;
boolean onceB=false;
boolean onceA=false;
volatile char first = 'o';
int firstAvance = 0;
int firstRecule = 0;

long debounceDelay = 700;
long Adelay=2000;
long Bdelay=2000;

// Ignore bounces under 1/2 second


int timeA=0;
int timeB=0;

void setup()
{
   Serial.begin(SERIAL_PORT_SPEED);
  pinMode(A,INPUT);
  digitalWrite(A, HIGH);
  digitalWrite(B, HIGH);
  pinMode(B,INPUT);
       // sets the digital pin 7 as input
  
}

void loop()
{
 // valA=digitalRead(A);
 // valB=digitalRead(B);
 if(digitalRead(B)==HIGH && digitalRead(A)==HIGH)
 {
   
 }
 else
 {
 if(digitalRead(A)==HIGH)
 {
   if (!AattendB)
   {
    if( (millis() - lastDebounce0) > debounceDelay)
    {
       
       Serial.println("A");
       lastDebounce0 = millis();
       AattendB=true;
       cpt=cpt+1;
       Afirst=cpt;
       }
   }
  
   
   
 }
 
 if(digitalRead(B)==HIGH )
 {
   if(!BattendA)
   {
         if( (millis() - lastDebounce1) > debounceDelay)
         {
         Serial.println("B");
         lastDebounce1 = millis();
         BattendA=true;
         cpt=cpt+1;
         Bfirst=cpt;
         }
   }
  
 }
 
 if(BattendA  &&  AattendB)
 {
   Serial.println("compute");
   if(Bfirst<Afirst)
   {
      Serial.println("B is first ");
      Serial.println("Recule");
      if(firstBA==0)
      {
        firstBA=1;
        firstAB=0;
      }
       if(firstBA==1)
      {
        if(tour>0)tour--;
        Serial.println(tour);
      }
   }
   if(Afirst<Bfirst)
   {
     
      Serial.println("A is first ");
      Serial.println("Avance");
      if(firstAB==0)
      {
        firstAB=1;
        firstBA=0;
      }
       if(firstAB==1)
      {
        tour++;
        Serial.println(tour);
      }
   }
   BattendA=false;
   AattendB=false;
   Bfirst=0;
   Afirst=0;
   cpt=0;  
 }

}
    
 
  
}
