#line 1 "C:/Users/Boost/Desktop/ET Code/Random number -stop - 2/EX1.c"
void main() {
 unsigned char i,k,j;
 unsigned char a[]={1,3,7,15,31,63,62,60,56,48,32,0};
 unsigned char b[]={63,6,91,79,102,109,125,7,127,111};
 Trisa = 0b00111;
 Trisb = 0b00000000;
 Portb = 64;
 while(1){

 if(porta.f0==1){
 for(;;)
 {
 for(i=0;i<12;i++){
 Portb = a[11-i];
 j = rand()/3600;
 if(porta.f1==1)
 goto end;
 delay_ms(50);
 }
 }
 end:
 for(i=0;i<3;i++){
 portb = 0;
 delay_ms(200);
 portb=b[j];
 delay_ms(200);
 }
 }

 if(porta.f2==1){
 for(;;)
 {
 for(i=0;i<12;i++){
 Portb = a[i];
 j = rand()/3600;
 if(porta.f1==1)
 goto end1;
 delay_ms(50);
 }
 }
 end1:
 for(i=0;i<3;i++){
 portb = 0;
 delay_ms(200);
 portb=b[j];
 delay_ms(200);
 }
 }
 }
}
