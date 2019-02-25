/*   Faculty of Electricity
     Writer : Huo Cheavorn
     Example code
*/
void main()
{
    unsigned char i,dis[]={63,6,91,79,102,109,125,7,127,111};
    Trisb = 0;
    Portb = 0;
    while(1)
    {
         for(i=0;i<10;i++)
         {
              Portb = dis[i];
              delay_ms(500);
         }
         
         for(i=0;i<10;i++)
         {
              Portb = dis[9-i];
              delay_ms(500);
         }
    }
    
}