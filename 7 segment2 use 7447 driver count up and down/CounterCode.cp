#line 1 "C:/Users/Elearning.DESKTOP-5K0VQ9G/Desktop/7 segment2 use 7447 driver count up and down/CounterCode.c"
#line 5 "C:/Users/Elearning.DESKTOP-5K0VQ9G/Desktop/7 segment2 use 7447 driver count up and down/CounterCode.c"
void main()
{
 unsigned char i=0;
 unsigned a,b;
 Trisa = 0b00011;
 Trisb = 0b00000000;
 Portb = 0b00000000;
 while(1)
 {
 if(porta.f0 ==1)
 {
 i++;
 if(i >= 100) i=0;
 a=i/10;
 b=i%10;
 portb=a<<4|b;
 delay_ms(400);
 }

 if(porta.f1 ==1)
 {
 if(i == 0 ) i=100;
 i--;
 a=i/10;
 b=i%10;
 portb=a<<4|b;
 delay_ms(400);
 }
 }
}
