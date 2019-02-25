#line 1 "D:/Videos and Songs/Start to learn MikroC/Example for unit board/7 segment 2 - up and reset/7segment.c"
#line 5 "D:/Videos and Songs/Start to learn MikroC/Example for unit board/7 segment 2 - up and reset/7segment.c"
unsigned char a=0,b=0,i,dis[]={63,6,91,79,102,109,125,7,127,111};

void disp()
{
 portb=dis[a];
 porta=0b01000;
 delay_ms(10);
 portb=0;
 portb=dis[b];
 porta=0b10000;
 delay_ms(10);
 portb=0;
}

void main()
{
 Trisb = 0;
 Portb = 0;
 Trisa = 0b00111;
 Porta = 0;

 while(1)
 {
 if(Porta.f0==1)
 {
 a++;
 if(a==10)
 a=0;
 for(i=0;i<15;i++)
 disp();
 }

 if(Porta.f1==1)
 {
 b++;
 if(b==10)
 b=0;
 for(i=0;i<15;i++)
 disp();
 }

 if(Porta.f2==1)
 {
 a=b=0;
 for(i=0;i<15;i++)
 disp();
 }
 disp();
 }

}
