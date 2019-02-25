#line 1 "C:/Users/vorn/Desktop/Fruit Game/code.c"


void main(){
 char disp[]={0b10000,0b01000,0b00100,0b00010,0b00001,0b00010,0b00100,0b01000};
 char i;
 int number;
 char result;
 Trisa=0b00011;
 Trisb=0;
 Portb=0;
 while(1){
 if( Porta.f1 ==1){
 doagain:
 for(i=0;i<8;i++){
 Portb=disp[i];
 number=rand()/32;
 delay_ms(80);
 if( Porta.f0 ==1){
 i=8;
 Portb=0;
 goto end;
 }
 }
 goto doagain;
 }
 end:
 if( Porta.f0 ==1 && i==8){
 if(number<200) result=1;
 else if(number<400) result=2;
 else if(number<600) result=4;
 else if(number<800) result=8;
 else result=16;

 for(i=0;i<3;i++){
 portb=0;
 delay_ms(300);
 portb=result;
 delay_ms(300);
 }
 }
 }
}
