/*   Faculty of Electricity
     Writer : Huo Cheavorn
     Example code
*/
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
