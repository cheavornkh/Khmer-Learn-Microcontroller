// LCD module connections
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
// End LCD module connections

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
  ANSEL  = 0B00100000;               // set RE5 as analog input
  ANSELH = 0;
  C1ON_bit = 0;                      // Disable comparators
  C2ON_bit = 0;

  TRISB = 0X00;
  PORTB = 0X00;
  TRISE = 0XFF;                      // Set PORTE as Input
  Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,1,"  TEMPERATURE   ");   // Write text in first row
  Lcd_Out(2,1,"  T = 00 C      ");   // Write text in Second row
  CustomChar(2,9);                   // Display symbol Celsius

  while(1){
     ad_read = ADC_Read(5);        // Read analog AN5
     voltage = ad_read * 4.895;    // 5000mV/1023
     temp = voltage/10;            // 10mV/0C

     if(temp >= 35)
        PORTB.F0 = 1;  // lamp on
     if(temp <= 30)
        PORTB.f0 = 0;  // lamp off

     d2 = temp/10;
     d1 = temp%10;

     Lcd_Chr(2, 7, d2+48);
     Lcd_Chr(2, 8, d1+48);
  }
}