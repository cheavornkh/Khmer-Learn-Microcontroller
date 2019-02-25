#line 1 "C:/Users/Elearning.DESKTOP-5K0VQ9G/Desktop/Temperature Display with control Lamp/Temperature Display with control Lamp.c"

sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;


const char character[] = {14,17,17,17,14,0,0,0};

void CustomChar(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}


void main(){
 int ad_read;
 int voltage;
 char temp;
 char d2,d1;
 ANSEL = 0B00100000;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;

 TRISB = 0X00;
 PORTB = 0X00;
 TRISE = 0XFF;
 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"  TEMPERATURE   ");
 Lcd_Out(2,1,"  T = 00 C      ");
 CustomChar(2,9);

 while(1){
 ad_read = ADC_Read(5);
 voltage = ad_read * 4.895;
 temp = voltage/10;

 if(temp >= 35)
 PORTB.F0 = 1;
 if(temp <= 30)
 PORTB.f0 = 0;

 d2 = temp/10;
 d1 = temp%10;

 Lcd_Chr(2, 7, d2+48);
 Lcd_Chr(2, 8, d1+48);
 }
}
