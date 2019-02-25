#line 1 "C:/Users/Elearning.DESKTOP-5K0VQ9G/Desktop/2 7Segment count 0-99/segmet2.c"
#line 5 "C:/Users/Elearning.DESKTOP-5K0VQ9G/Desktop/2 7Segment count 0-99/segmet2.c"
void main()
{
 unsigned char i;
 unsigned a,b;
 Trisb=0b00000000;
 Portb=0b00000000;
 while(1)
 {
 for(i=0;i<100;i++)
 {
 a=i/10;
 b=i%10;
 portb=a<<4|b;
 delay_ms(200);
 }

 }
}
