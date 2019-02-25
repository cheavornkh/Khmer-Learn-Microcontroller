#line 1 "C:/Users/Welcome to me/Desktop/Start to learn MikroC/lesson 8/Stop XR/test.c"



unsigned char loop;
void l()
{
 for(loop=0;loop<3;loop++)
 {
 portb=0b00111110;
 delay_ms(100);
 portb=0b00111101;
 delay_ms(100);
 portb=0b00111011;
 delay_ms(100);
 portb=0b00111111;
 delay_ms(100);
 }


 for(loop=0;loop<3;loop++)
 {
 portb=0b00111110;
 delay_ms(100);
 portb=0b00111100;
 delay_ms(100);
 portb=0b00111000;
 delay_ms(100);
 portb=0b00111001;
 delay_ms(100);
 portb=0b00111011;
 delay_ms(100);
 portb=0b00111111;
 delay_ms(100);
 }

 delay_ms(100);

 portb=0b00111000;
 delay_ms(100);
 portb=0b00111111;
 delay_ms(100);
 portb=0b00111000;
 delay_ms(100);
 portb=0b00111111;
 delay_ms(100);
}

void r()
{
 for(loop=0;loop<3;loop++)
 {
 portb=0b00110111;
 delay_ms(100);
 portb=0b00101111;
 delay_ms(100);
 portb=0b00011111;
 delay_ms(100);
 portb=0b00111111;
 delay_ms(100);
 }

 for(loop=0;loop<3;loop++)
 {
 portb=0b00110111;
 delay_ms(100);
 portb=0b00100111;
 delay_ms(100);
 portb=0b00000111;
 delay_ms(100);
 portb=0b00001111;
 delay_ms(100);
 portb=0b00011111;
 delay_ms(100);
 portb=0b00111111;
 delay_ms(100);
 }

 delay_ms(100);

 portb=0b00000111;
 delay_ms(100);
 portb=0b00111111;
 delay_ms(100);
 portb=0b00000111;
 delay_ms(100);
 portb=0b00111111;
 delay_ms(100);
}

void s()
{
 portb=0b11110110;
 delay_ms(100);
 portb=0b00100100;
 delay_ms(100);
 portb=0b11000000;
 delay_ms(100);
 portb=0b00001001;
 delay_ms(100);
 portb=0b11011011;
 delay_ms(100);
 portb=0b00111111;
 delay_ms(100);
 portb=255;
 delay_ms(100);
 for(loop=0;loop<3;loop++)
 {
 portb=0b10111111;
 delay_ms(100);
 portb=0b01111111;
 delay_ms(100);

 }
 for(loop=0;loop<3;loop++)
 {
 portb=0b00111111;
 delay_ms(100);
 portb=255;
 delay_ms(100);
 }

}


void main()
{
 unsigned char test=0;
 trisa=0b00000111;
 trisb=0;
 portb=255;
 for(;;)
 {
 test = porta & 0b00000111;
 switch(test)
 {
 case 0: Portb=0b00111111; break;
 case 1: l(); break;
 case 2: r(); break;
 case 4: s(); break;
 case 5: l(); break;
 case 6: r(); break;
 }
 }
}
