//  Powered by Huo CheaVorn
//  Electrical Faculty
//  Open Source code
//  Date: 2/7/2104
//  Subject: Microcontroller
//  Year 2
//  PIC16F887 Sample Project
//-------------------------------

#define btn_reset PORTE.F0
#define btn_start PORTE.F1
#define btn_stop  PORTE.F2

// char number = 35;

void main() {

    char count = 0;
    char result[35];
    char i,number;
    const char disp_num[]={63,6,91,79,102,109,125,7,127,111};
    const char disp[]={1,3,7,15,31,63,62,60,56,48,32,0};
    
    ANSEL = 0X00;
    ANSELH = 0X00;
    
    TRISB = 0X00;
    TRISC = 0X00;
    TRISD = 0X00;
    TRISE = 0XFF;
    PORTC = 64;
    PORTD = 64;
    PORTB = 0X00;
    result[0]=0;
    
    while(1){
        start:
        if(btn_start == 1){
           count++;
           if(count>35)
              portb.f0=1;
           while(1){
              for(i=0;i<12;i++){
                 PORTC = disp[i];
                 PORTD = disp[i];
                 delay_ms(50);
                 if(btn_stop == 1)
                    break;
              }
              if(btn_stop == 1)
                    break;
           }
           again:
           if(btn_reset == 1){
               count = 0;
               portb.f0=0;
               PORTC = disp_num[count%10];
               PORTD = disp_num[count/10];
               delay_ms(1000);
               PORTC = 64;
               PORTD = 64;
               goto start;
           }
           PORTC = 64;
           PORTD = 64;
           number = rand()%35+1;
           for(i=0;i<count;i++){
             if(result[i]== number)
                goto again;
           }
           result[count-1]= number;
           
           for(i=0;i<3;i++){
              PORTC = 0X00;
              PORTD = 0X00;
              delay_ms(200);
              PORTC = disp_num[result[count-1]%10];
              PORTD = disp_num[result[count-1]/10];
              delay_ms(200);

           }
        }
    }
}