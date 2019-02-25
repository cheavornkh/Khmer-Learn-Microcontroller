//  Writer : Huo Cheavorn
//  LED Flashing 4 Mode
//  Chip pic16F84A
//  Clock 4 MHz
//  eelibrary.wordpress.com
//==============================================================================

void main() 
{
   unsigned char i;
   Trisa = 0x01;
   Trisb = 0x00;
   Portb = 0x00;
   while(1)
   {
       Portb = 0b11110000;
       delay_ms(300);
       for(;;)
       {
           Portb = ~Portb;
           delay_ms(100);
           if(Porta.f0 == 1)
              break;
       }
       
       Portb = 0b10101010;
       delay_ms(300);
       for(;;)
       {
           portb = ~Portb;
           delay_ms(100);
           if(Porta.f0 == 1)
              break;
       }
       
       delay_ms(300);
       for(;;)
       {
          for(i=0;i<8;i++)
          {
              Portb = 1 << i;
              delay_ms(100);
              if(Porta.f0 == 1)
              break;
          }
          if(Porta.f0 == 1)
              break;
       }
       
       delay_ms(300);
       for(;;)
       {
          for(i=0;i<4;i++)
          {
              Portb = 1 << i | 128 >> i;
              delay_ms(100);
              if(Porta.f0 == 1)
              break;
          }
          if(Porta.f0 == 1)
              break;
       }
       
   }
}