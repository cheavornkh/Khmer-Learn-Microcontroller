/*   Faculty of Electricity
     Writer : Huo Cheavorn
     Example code
*/
void main()
{
    unsigned char a,b,c=0,i,dis[]={63,6,91,79,102,109,125,7,127,111};
    Trisb = 0;
    Portb = 0;
    Trisa = 0;
    Porta = 0;

    while(1)
    {
      a=c/10;
      b=c%10;
      for(i=0;i<20;i++)
      {
         portb=dis[a];
         porta=1;
         delay_ms(10);
         portb=0;
         portb=dis[b];
         porta=2;
         delay_ms(10);
         portb=0;
      }
      c++;
      if(c>=100)
        c=0;
    }
    
}