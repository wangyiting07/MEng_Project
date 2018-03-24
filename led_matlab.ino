/*
Adafruit Arduino - Lesson 3. RGB LED
*/

int redPin = 11;
int greenPin = 10;
int bluePin = 9;
int answer = 0;

//uncomment this line if using a Common Anode LED
//#define COMMON_ANODE

void setup()
{
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT); 
  Serial.begin(9600); 
}

void loop()
{
  if(Serial.available()>0)   //if there is data to read
  {
    answer = Serial.read();
    Serial.print(answer);
    if(answer == '1'){       //enter 1 having red light
      setColor(255,0,0);
    }
    if(answer == '2'){      //enter 2 having blue light
      setColor(0,0,225);
    }
    if(answer == '3'){      //enter 3 having green light
      setColor(0,225,0);
    }
    if(answer == '0'){      //enter 0 turning off the light 
      off();
    }
      
    }
  }


void setColor(int red, int green, int blue)
{
  #ifdef COMMON_ANODE
//    red = 255 - red;
//    green = 255 - green;
//    blue = 255 - blue;
  #endif
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);  
}

void off()
{
  #ifdef COMMON_ANODE
//    red = 255 - red;
//    green = 255 - green;
//    blue = 255 - blue;
  #endif
  analogWrite(redPin, 0);
  analogWrite(greenPin, 0);
  analogWrite(bluePin, 0);  
}
