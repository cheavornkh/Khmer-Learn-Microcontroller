//=========== Define Button ====================================================
sbit MENU   at RA0_bit;
sbit UP     at RA3_bit;
sbit DOWN   at RA1_bit;
sbit SELECT at RA2_bit;

// LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB0_bit;
sbit LCD_D6 at RB1_bit;
sbit LCD_D5 at RB2_bit;
sbit LCD_D4 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB0_bit;
sbit LCD_D6_Direction at TRISB1_bit;
sbit LCD_D5_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB3_bit;
// End LCD module connections

//  Set TEMP_RESOLUTION to the corresponding resolution of used DS18x20 sensor:
//  18S20: 9  (default setting; can be 9,10,11,or 12)
//  18B20: 12
const unsigned short TEMP_RESOLUTION = 12;

char *text = "000.0";
char *txton = "00";
char *txtoff = "00";
unsigned temp;
unsigned char refresh=0,unlock=0, b_menu=0, H_L, On, Off;
char txt_t[17]=" ON=    >OFF=  <";

void set_value(char *on, char *off);

void Display_Temperature(unsigned int temp2write) {
  const unsigned short RES_SHIFT = TEMP_RESOLUTION - 8;
  char temp_whole;
  unsigned int temp_fraction;

  // Check if temperature is negative
  if (temp2write & 0x8000) {
     text[0] = '-';
     temp2write = ~temp2write + 1;
     }

  // Extract temp_whole
  temp_whole = temp2write >> RES_SHIFT ;

  // Convert temp_whole to characters
  if (temp_whole/100)
     text[0] = temp_whole/100  + 48;
  else
     text[0] = '0';

  text[1] = (temp_whole/10)%10 + 48;             // Extract tens digit
  text[2] =  temp_whole%10     + 48;             // Extract ones digit

  // Extract temp_fraction and convert it to unsigned int
  temp_fraction  = temp2write << (4-RES_SHIFT);
  temp_fraction &= 0x000F;
  temp_fraction *= 625;

  // Convert temp_fraction to characters
  text[4] =  temp_fraction/1000    + 48;         // Extract thousands digit

                                                 // Print temperature on LCD
  Lcd_Out(2, 2, text);
  if(temp_whole<=on)  PORTB.F6 = 1;
  if(temp_whole>=off) PORTB.F6 = 0;
}
void Read_sensor(){
    //--- Perform temperature reading
    Ow_Reset(&PORTA, 4);                         // Onewire reset signal
    Ow_Write(&PORTA, 4, 0xCC);                   // Issue command SKIP_ROM
    Ow_Write(&PORTA, 4, 0x44);                   // Issue command CONVERT_T
    Delay_us(120);

    Ow_Reset(&PORTA, 4);
    Ow_Write(&PORTA, 4, 0xCC);                   // Issue command SKIP_ROM
    Ow_Write(&PORTA, 4, 0xBE);                   // Issue command READ_SCRATCHPAD

    temp =  Ow_Read(&PORTA, 4);
    temp = (Ow_Read(&PORTA, 4) << 8) + temp;
                                                  //--- Format and display result on Lcd
    Display_Temperature(temp);
}

//================================
void set_H()
{
  Lcd_Chr(2,1,62);
  Lcd_Chr(2,7,60);
  Lcd_Chr(2,9,143);
  Lcd_Chr(2,16,143);
}
void set_L()
{
  Lcd_Chr(2,1,143);
  Lcd_Chr(2,7,143);
  Lcd_Chr(2,9,62);
  Lcd_Chr(2,16,60);
}
void loadlabel(){
   Lcd_Out(1,1,"  Temperature:  ");
   Lcd_Out(2,1,"T000.0 C O00 C00");
   Lcd_Chr(2,7,223);
   txton[0] = On/10 + 48;
   txton[1] = On%10 + 48;
   txtoff[0] = Off/10 + 48;
   txtoff[1] = Off%10 + 48;
   Lcd_Out(2, 11, txton);
   Lcd_Out(2, 15, txtoff);
   refresh = 50;
}

void main() {
  TRISB.F6 = 0;
  PORTB.F6 = 0;
  TRISA = 0XFF;
  CMCON = 0B00000111;
  Lcd_Init();                                    // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);                           // Clear LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);                      // Turn cursor off

  On  = eeprom_read(0x00);
  Off = eeprom_read(0x01);

                                     // If you see greek alpha letter try typing 178 instead of 223

  if(!MENU){
      Lcd_Out(1,1,"  Huo Cheavorn  ");
      Lcd_Out(2,1," Tel:012593322 ");
      delay_ms(5000);
  }
  loadlabel();

  //--- Main loop
  do {
    if(MENU && UP && DOWN && SELECT) unlock=1;
     if(!MENU && unlock){
        b_menu++;
        if(b_menu>=2)
           b_menu=0;
        Lcd_Cmd(_LCD_CLEAR);
        unlock=0;
        if(b_menu==0){
           loadlabel();
           EEPROM_Write(0x00,On);
           EEPROM_Write(0x01,Off);
           delay_ms(50);
        }
        if(b_menu==1){
            Lcd_Out(1,1,"Set Temperature:");
            Lcd_Out(2,1,txt_t);
        }
        H_L=0;
        delay_ms(50);
     }
     switch(b_menu){
         case 0:  refresh++; if(refresh>50){ refresh=0; Read_sensor(); }  break;
         case 1:  set_value(&On, &Off);                                   break;
     }

    Delay_ms(10);
  } while (1);
}

///=============================================================================
void set_value(char *on, char *off)
{
        Lcd_Chr(2,5,48+ *on/10);
        Lcd_Chr(2,6,48+ *on%10);
        Lcd_Chr(2,14,48+ *off/10);
        Lcd_Chr(2,15,48+ *off%10);

        if(!SELECT && H_L && unlock){
          unlock=0;
          H_L=0;
          set_L();
        }
        if(!SELECT && !H_L && unlock){
          unlock=0;
          H_L=1;
          set_H();
        }
        if(H_L){
          if(!UP && unlock){
              unlock=0;
              if(*on<99)
                 *on+=1;
          }
          if(!DOWN && unlock){
              unlock=0;
              if(*on>0)
                 *on-=1;
          }
        }
        if(!H_L){
          if(!UP && unlock){
              unlock=0;
              if(*off<99)
                 *off+=1;
          }
          if(!DOWN && unlock){
              unlock=0;
              if(*off>0)
                 *off-=1;
          }
        }
}