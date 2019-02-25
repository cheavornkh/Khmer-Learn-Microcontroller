
_Display_Temperature:

;temperature control.c,37 :: 		void Display_Temperature(unsigned int temp2write) {
;temperature control.c,43 :: 		if (temp2write & 0x8000) {
	BTFSS      FARG_Display_Temperature_temp2write+1, 7
	GOTO       L_Display_Temperature0
;temperature control.c,44 :: 		text[0] = '-';
	MOVF       _text+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
;temperature control.c,45 :: 		temp2write = ~temp2write + 1;
	COMF       FARG_Display_Temperature_temp2write+0, 1
	COMF       FARG_Display_Temperature_temp2write+1, 1
	INCF       FARG_Display_Temperature_temp2write+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_Display_Temperature_temp2write+1, 1
;temperature control.c,46 :: 		}
L_Display_Temperature0:
;temperature control.c,49 :: 		temp_whole = temp2write >> RES_SHIFT ;
	MOVF       FARG_Display_Temperature_temp2write+0, 0
	MOVWF      R0+0
	MOVF       FARG_Display_Temperature_temp2write+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      Display_Temperature_temp_whole_L0+0
;temperature control.c,52 :: 		if (temp_whole/100)
	MOVLW      100
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Display_Temperature1
;temperature control.c,53 :: 		text[0] = temp_whole/100  + 48;
	MOVF       _text+0, 0
	MOVWF      FLOC__Display_Temperature+0
	MOVLW      100
	MOVWF      R4+0
	MOVF       Display_Temperature_temp_whole_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Display_Temperature+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	GOTO       L_Display_Temperature2
L_Display_Temperature1:
;temperature control.c,55 :: 		text[0] = '0';
	MOVF       _text+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
L_Display_Temperature2:
;temperature control.c,57 :: 		text[1] = (temp_whole/10)%10 + 48;             // Extract tens digit
	INCF       _text+0, 0
	MOVWF      FLOC__Display_Temperature+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       Display_Temperature_temp_whole_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Display_Temperature+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;temperature control.c,58 :: 		text[2] =  temp_whole%10     + 48;             // Extract ones digit
	MOVLW      2
	ADDWF      _text+0, 0
	MOVWF      FLOC__Display_Temperature+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       Display_Temperature_temp_whole_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Display_Temperature+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;temperature control.c,62 :: 		temp_fraction &= 0x000F;
	MOVLW      15
	ANDWF      FARG_Display_Temperature_temp2write+0, 0
	MOVWF      R0+0
	MOVF       FARG_Display_Temperature_temp2write+1, 0
	MOVWF      R0+1
	MOVLW      0
	ANDWF      R0+1, 1
;temperature control.c,63 :: 		temp_fraction *= 625;
	MOVLW      113
	MOVWF      R4+0
	MOVLW      2
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
;temperature control.c,66 :: 		text[4] =  temp_fraction/1000    + 48;         // Extract thousands digit
	MOVLW      4
	ADDWF      _text+0, 0
	MOVWF      FLOC__Display_Temperature+0
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__Display_Temperature+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;temperature control.c,69 :: 		Lcd_Out(2, 2, text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature control.c,70 :: 		if(temp_whole<=on)  PORTB.F6 = 1;
	MOVF       Display_Temperature_temp_whole_L0+0, 0
	SUBWF      _On+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Display_Temperature3
	BSF        PORTB+0, 6
L_Display_Temperature3:
;temperature control.c,71 :: 		if(temp_whole>=off) PORTB.F6 = 0;
	MOVF       _Off+0, 0
	SUBWF      Display_Temperature_temp_whole_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Display_Temperature4
	BCF        PORTB+0, 6
L_Display_Temperature4:
;temperature control.c,72 :: 		}
	RETURN
; end of _Display_Temperature

_Read_sensor:

;temperature control.c,73 :: 		void Read_sensor(){
;temperature control.c,75 :: 		Ow_Reset(&PORTA, 4);                         // Onewire reset signal
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;temperature control.c,76 :: 		Ow_Write(&PORTA, 4, 0xCC);                   // Issue command SKIP_ROM
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperature control.c,77 :: 		Ow_Write(&PORTA, 4, 0x44);                   // Issue command CONVERT_T
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperature control.c,78 :: 		Delay_us(120);
	MOVLW      79
	MOVWF      R13+0
L_Read_sensor5:
	DECFSZ     R13+0, 1
	GOTO       L_Read_sensor5
	NOP
	NOP
;temperature control.c,80 :: 		Ow_Reset(&PORTA, 4);
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;temperature control.c,81 :: 		Ow_Write(&PORTA, 4, 0xCC);                   // Issue command SKIP_ROM
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperature control.c,82 :: 		Ow_Write(&PORTA, 4, 0xBE);                   // Issue command READ_SCRATCHPAD
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperature control.c,84 :: 		temp =  Ow_Read(&PORTA, 4);
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	CLRF       _temp+1
;temperature control.c,85 :: 		temp = (Ow_Read(&PORTA, 4) << 8) + temp;
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      4
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+1
	CLRF       R2+0
	MOVF       _temp+0, 0
	ADDWF      R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _temp+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;temperature control.c,87 :: 		Display_Temperature(temp);
	MOVF       R0+0, 0
	MOVWF      FARG_Display_Temperature_temp2write+0
	MOVF       R0+1, 0
	MOVWF      FARG_Display_Temperature_temp2write+1
	CALL       _Display_Temperature+0
;temperature control.c,88 :: 		}
	RETURN
; end of _Read_sensor

_set_H:

;temperature control.c,91 :: 		void set_H()
;temperature control.c,93 :: 		Lcd_Chr(2,1,62);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      62
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,94 :: 		Lcd_Chr(2,7,60);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      60
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,95 :: 		Lcd_Chr(2,9,143);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      143
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,96 :: 		Lcd_Chr(2,16,143);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      143
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,97 :: 		}
	RETURN
; end of _set_H

_set_L:

;temperature control.c,98 :: 		void set_L()
;temperature control.c,100 :: 		Lcd_Chr(2,1,143);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      143
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,101 :: 		Lcd_Chr(2,7,143);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      143
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,102 :: 		Lcd_Chr(2,9,62);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      62
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,103 :: 		Lcd_Chr(2,16,60);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      60
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,104 :: 		}
	RETURN
; end of _set_L

_loadlabel:

;temperature control.c,105 :: 		void loadlabel(){
;temperature control.c,106 :: 		Lcd_Out(1,1,"  Temperature:  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_temperature_32control+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature control.c,107 :: 		Lcd_Out(2,1,"T000.0 C O00 C00");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_temperature_32control+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature control.c,108 :: 		Lcd_Chr(2,7,223);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,109 :: 		txton[0] = On/10 + 48;
	MOVF       _txton+0, 0
	MOVWF      FLOC__loadlabel+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _On+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__loadlabel+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;temperature control.c,110 :: 		txton[1] = On%10 + 48;
	INCF       _txton+0, 0
	MOVWF      FLOC__loadlabel+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _On+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__loadlabel+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;temperature control.c,111 :: 		txtoff[0] = Off/10 + 48;
	MOVF       _txtoff+0, 0
	MOVWF      FLOC__loadlabel+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _Off+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__loadlabel+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;temperature control.c,112 :: 		txtoff[1] = Off%10 + 48;
	INCF       _txtoff+0, 0
	MOVWF      FLOC__loadlabel+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _Off+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__loadlabel+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;temperature control.c,113 :: 		Lcd_Out(2, 11, txton);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _txton+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature control.c,114 :: 		Lcd_Out(2, 15, txtoff);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _txtoff+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature control.c,115 :: 		refresh = 50;
	MOVLW      50
	MOVWF      _refresh+0
;temperature control.c,116 :: 		}
	RETURN
; end of _loadlabel

_main:

;temperature control.c,118 :: 		void main() {
;temperature control.c,119 :: 		TRISB.F6 = 0;
	BCF        TRISB+0, 6
;temperature control.c,120 :: 		PORTB.F6 = 0;
	BCF        PORTB+0, 6
;temperature control.c,121 :: 		TRISA = 0XFF;
	MOVLW      255
	MOVWF      TRISA+0
;temperature control.c,122 :: 		CMCON = 0B00000111;
	MOVLW      7
	MOVWF      CMCON+0
;temperature control.c,123 :: 		Lcd_Init();                                    // Initialize LCD
	CALL       _Lcd_Init+0
;temperature control.c,124 :: 		Lcd_Cmd(_LCD_CLEAR);                           // Clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperature control.c,125 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                      // Turn cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperature control.c,127 :: 		On  = eeprom_read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _On+0
;temperature control.c,128 :: 		Off = eeprom_read(0x01);
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _Off+0
;temperature control.c,132 :: 		if(!MENU){
	BTFSC      RA0_bit+0, 0
	GOTO       L_main6
;temperature control.c,133 :: 		Lcd_Out(1,1,"  Huo Cheavorn  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_temperature_32control+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature control.c,134 :: 		Lcd_Out(2,1," Tel:012593322 ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_temperature_32control+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature control.c,135 :: 		delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;temperature control.c,136 :: 		}
L_main6:
;temperature control.c,137 :: 		loadlabel();
	CALL       _loadlabel+0
;temperature control.c,140 :: 		do {
L_main8:
;temperature control.c,141 :: 		if(MENU && UP && DOWN && SELECT) unlock=1;
	BTFSS      RA0_bit+0, 0
	GOTO       L_main13
	BTFSS      RA3_bit+0, 3
	GOTO       L_main13
	BTFSS      RA1_bit+0, 1
	GOTO       L_main13
	BTFSS      RA2_bit+0, 2
	GOTO       L_main13
L__main53:
	MOVLW      1
	MOVWF      _unlock+0
L_main13:
;temperature control.c,142 :: 		if(!MENU && unlock){
	BTFSC      RA0_bit+0, 0
	GOTO       L_main16
	MOVF       _unlock+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
L__main52:
;temperature control.c,143 :: 		b_menu++;
	INCF       _b_menu+0, 1
;temperature control.c,144 :: 		if(b_menu>=2)
	MOVLW      2
	SUBWF      _b_menu+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main17
;temperature control.c,145 :: 		b_menu=0;
	CLRF       _b_menu+0
L_main17:
;temperature control.c,146 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperature control.c,147 :: 		unlock=0;
	CLRF       _unlock+0
;temperature control.c,148 :: 		if(b_menu==0){
	MOVF       _b_menu+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;temperature control.c,149 :: 		loadlabel();
	CALL       _loadlabel+0
;temperature control.c,150 :: 		EEPROM_Write(0x00,On);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _On+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;temperature control.c,151 :: 		EEPROM_Write(0x01,Off);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _Off+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;temperature control.c,152 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	NOP
	NOP
;temperature control.c,153 :: 		}
L_main18:
;temperature control.c,154 :: 		if(b_menu==1){
	MOVF       _b_menu+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;temperature control.c,155 :: 		Lcd_Out(1,1,"Set Temperature:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_temperature_32control+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature control.c,156 :: 		Lcd_Out(2,1,txt_t);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt_t+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperature control.c,157 :: 		}
L_main20:
;temperature control.c,158 :: 		H_L=0;
	CLRF       _H_L+0
;temperature control.c,159 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	NOP
	NOP
;temperature control.c,160 :: 		}
L_main16:
;temperature control.c,161 :: 		switch(b_menu){
	GOTO       L_main22
;temperature control.c,162 :: 		case 0:  refresh++; if(refresh>50){ refresh=0; Read_sensor(); }  break;
L_main24:
	INCF       _refresh+0, 1
	MOVF       _refresh+0, 0
	SUBLW      50
	BTFSC      STATUS+0, 0
	GOTO       L_main25
	CLRF       _refresh+0
	CALL       _Read_sensor+0
L_main25:
	GOTO       L_main23
;temperature control.c,163 :: 		case 1:  set_value(&On, &Off);                                   break;
L_main26:
	MOVLW      _On+0
	MOVWF      FARG_set_value_on+0
	MOVLW      _Off+0
	MOVWF      FARG_set_value_off+0
	CALL       _set_value+0
	GOTO       L_main23
;temperature control.c,164 :: 		}
L_main22:
	MOVF       _b_menu+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _b_menu+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main26
L_main23:
;temperature control.c,166 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	NOP
;temperature control.c,167 :: 		} while (1);
	GOTO       L_main8
;temperature control.c,168 :: 		}
	GOTO       $+0
; end of _main

_set_value:

;temperature control.c,171 :: 		void set_value(char *on, char *off)
;temperature control.c,173 :: 		Lcd_Chr(2,5,48+ *on/10);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       FARG_set_value_on+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,174 :: 		Lcd_Chr(2,6,48+ *on%10);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       FARG_set_value_on+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,175 :: 		Lcd_Chr(2,14,48+ *off/10);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       FARG_set_value_off+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,176 :: 		Lcd_Chr(2,15,48+ *off%10);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       FARG_set_value_off+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temperature control.c,178 :: 		if(!SELECT && H_L && unlock){
	BTFSC      RA2_bit+0, 2
	GOTO       L_set_value30
	MOVF       _H_L+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_value30
	MOVF       _unlock+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_value30
L__set_value59:
;temperature control.c,179 :: 		unlock=0;
	CLRF       _unlock+0
;temperature control.c,180 :: 		H_L=0;
	CLRF       _H_L+0
;temperature control.c,181 :: 		set_L();
	CALL       _set_L+0
;temperature control.c,182 :: 		}
L_set_value30:
;temperature control.c,183 :: 		if(!SELECT && !H_L && unlock){
	BTFSC      RA2_bit+0, 2
	GOTO       L_set_value33
	MOVF       _H_L+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_set_value33
	MOVF       _unlock+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_value33
L__set_value58:
;temperature control.c,184 :: 		unlock=0;
	CLRF       _unlock+0
;temperature control.c,185 :: 		H_L=1;
	MOVLW      1
	MOVWF      _H_L+0
;temperature control.c,186 :: 		set_H();
	CALL       _set_H+0
;temperature control.c,187 :: 		}
L_set_value33:
;temperature control.c,188 :: 		if(H_L){
	MOVF       _H_L+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_value34
;temperature control.c,189 :: 		if(!UP && unlock){
	BTFSC      RA3_bit+0, 3
	GOTO       L_set_value37
	MOVF       _unlock+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_value37
L__set_value57:
;temperature control.c,190 :: 		unlock=0;
	CLRF       _unlock+0
;temperature control.c,191 :: 		if(*on<99)
	MOVF       FARG_set_value_on+0, 0
	MOVWF      FSR
	MOVLW      99
	SUBWF      INDF+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_value38
;temperature control.c,192 :: 		*on+=1;
	MOVF       FARG_set_value_on+0, 0
	MOVWF      FSR
	INCF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_set_value_on+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_set_value38:
;temperature control.c,193 :: 		}
L_set_value37:
;temperature control.c,194 :: 		if(!DOWN && unlock){
	BTFSC      RA1_bit+0, 1
	GOTO       L_set_value41
	MOVF       _unlock+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_value41
L__set_value56:
;temperature control.c,195 :: 		unlock=0;
	CLRF       _unlock+0
;temperature control.c,196 :: 		if(*on>0)
	MOVF       FARG_set_value_on+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_set_value42
;temperature control.c,197 :: 		*on-=1;
	MOVF       FARG_set_value_on+0, 0
	MOVWF      FSR
	DECF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_set_value_on+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_set_value42:
;temperature control.c,198 :: 		}
L_set_value41:
;temperature control.c,199 :: 		}
L_set_value34:
;temperature control.c,200 :: 		if(!H_L){
	MOVF       _H_L+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_set_value43
;temperature control.c,201 :: 		if(!UP && unlock){
	BTFSC      RA3_bit+0, 3
	GOTO       L_set_value46
	MOVF       _unlock+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_value46
L__set_value55:
;temperature control.c,202 :: 		unlock=0;
	CLRF       _unlock+0
;temperature control.c,203 :: 		if(*off<99)
	MOVF       FARG_set_value_off+0, 0
	MOVWF      FSR
	MOVLW      99
	SUBWF      INDF+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_value47
;temperature control.c,204 :: 		*off+=1;
	MOVF       FARG_set_value_off+0, 0
	MOVWF      FSR
	INCF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_set_value_off+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_set_value47:
;temperature control.c,205 :: 		}
L_set_value46:
;temperature control.c,206 :: 		if(!DOWN && unlock){
	BTFSC      RA1_bit+0, 1
	GOTO       L_set_value50
	MOVF       _unlock+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_value50
L__set_value54:
;temperature control.c,207 :: 		unlock=0;
	CLRF       _unlock+0
;temperature control.c,208 :: 		if(*off>0)
	MOVF       FARG_set_value_off+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_set_value51
;temperature control.c,209 :: 		*off-=1;
	MOVF       FARG_set_value_off+0, 0
	MOVWF      FSR
	DECF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_set_value_off+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_set_value51:
;temperature control.c,210 :: 		}
L_set_value50:
;temperature control.c,211 :: 		}
L_set_value43:
;temperature control.c,212 :: 		}
	RETURN
; end of _set_value
