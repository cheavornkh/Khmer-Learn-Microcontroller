#line 1 "C:/Users/cheavornh/Desktop/New folder (5)/test.c"
void dis(long x)
{
 char i;
 for(i=0;i<32;i++)
 {
 porta.f0=0;
 if((x>>(31-i))&1==1)
 porta.f1=1;
 else
 porta.f1=0;
 porta.f0=1;
 }
 porta.f2=1;
 porta.f2=0;
}
void main()
{ long x;
 char i;
 trisa=0;
 porta=0;
 while(1)
 {
 for(i=0;i<33;i++)
 {
 x=~(0xFFFFFFFE<<i);
 dis(x);
 delay_ms(20);
 }
 for(i=0;i<34;i++)
 {
 x=0xFFFFFFFF>>i;
 dis(x);
 delay_ms(20);
 }

 for(i=0;i<33;i++)
 {
 x=(0x80000000>>i)|(0x80000000>>(32-i));
 dis(x);
 delay_ms(50);
 }
 }
}
