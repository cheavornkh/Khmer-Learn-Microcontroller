#include <max7219.h>
#include <ds1307.h>
#define up   PORTA.F2
#define down PORTA.F3

unsigned char hours, minutes, seconds;
unsigned char old_hours, old_minutes;
bit oldstate;
char Hh,Hl,Mh,Ml,Sh,Sl;

//==============================================================================
void mode_display_time(){
      Read_Time(&hours, &minutes, &seconds);
      Transform_Time(&hours, &minutes, &seconds);
      if(hours>12)
         hours -= 12;

      Hh = hours /10;
      Hl = hours %10;
      Mh = minutes /10;
      Ml = minutes %10;
      Sh = seconds /10;
      Sl = seconds %10;
      max7219display(Sl,Sh,Ml,Mh,Hl,Hh);
      old_hours = hours;
      old_minutes = minutes;
      delay_ms(50);
}
//==============================================================================
void mode_set_hour(){
     if(!up){
        if(old_hours<12)
           old_hours++;
     }
     if(!down){
        if(old_hours>1)
           old_hours--;
     }
     Read_Time(&hours, &minutes, &seconds);
     Transform_Time(&hours, &minutes, &seconds);
     if(hours>12)
         hours -= 12;

     Hh = old_hours /10;
     Hl = old_hours %10;
     Mh = minutes /10;
     Ml = minutes %10;
     Sh = seconds /10;
     Sl = seconds %10;
     max7219display(Sl,Sh,Ml,Mh,Hl,Hh);
     delay_ms(50);
     max7219display(Sl,Sh,Ml,Mh,0XFF,0XFF);
     delay_ms(50);
}
//==============================================================================
void mode_set_minute(){
    if(!up){
        if(old_minutes<59)
           old_minutes++;
     }
     if(!down){
        if(old_minutes>0)
           old_minutes--;
     }
     Read_Time(&hours, &minutes, &seconds);
     Transform_Time(&hours, &minutes, &seconds);
     if(hours>12)
         hours -= 12;

     Hh = old_hours /10;
     Hl = old_hours %10;
     Mh = old_minutes /10;
     Ml = old_minutes %10;
     Sh = seconds /10;
     Sl = seconds %10;
     max7219display(Sl,Sh,Ml,Mh,Hl,Hh);
     delay_ms(50);
     max7219display(Sl,Sh,0XFF,0XFF,Hl,Hh);
     delay_ms(50);
}


void main() {
  char mode1 = 0;
  Trisa = 0X0F;
  ANSEL = 0X00;
  ANSELH = 0X00;
  
  I2C1_Init(100000);            // initialize I2C
  max7219_init1();              // initialize  max7219
  
  while(1){
  
      if (Button(&PORTA, 1, 1, 1)) {
          oldstate = 1;
      }
      if (oldstate && Button(&PORTA, 1, 1, 0)) {
          mode1++;
          if(mode1 > 2){
             mode1 = 0;
             Write_Time(Dec2Bcd(old_hours),Dec2Bcd(old_minutes),Dec2Bcd(seconds));
          }
          oldstate = 0;
      }
      switch(mode1){
           case 0:   mode_display_time(); break;
           case 1:   mode_set_hour();     break;
           case 2:   mode_set_minute();   break;
      }
  }
}