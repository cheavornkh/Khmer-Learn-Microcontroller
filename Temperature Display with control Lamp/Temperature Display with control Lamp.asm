
_CustomChar:

;Temperature Display with control Lamp.c,19 :: 		void CustomChar(char pos_row, char pos_char) {
;Temperature Display with control Lamp.c,21 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temperature Display with control Lamp.c,22 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       CustomChar_i_L0+0
L_CustomChar0:
	MOVF       CustomChar_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChar1
	MOVF       CustomChar_i_L0+0, 0
	ADDLW      _character+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       CustomChar_i_L0+0, 1
	GOTO       L_CustomChar0
L_CustomChar1:
;Temperature Display with control Lamp.c,23 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temperature Display with control Lamp.c,24 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomChar_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChar_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Temperature Display with control Lamp.c,25 :: 		}
	RETURN
; end of _CustomChar

_main:

;Temperature Display with control Lamp.c,28 :: 		void main(){
;Temperature Display with control Lamp.c,33 :: 		ANSEL  = 0B00100000;               // set RE5 as analog input
	MOVLW      32
	MOVWF      ANSEL+0
;Temperature Display with control Lamp.c,34 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Temperature Display with control Lamp.c,35 :: 		C1ON_bit = 0;                      // Disable comparators
	BCF        C1ON_bit+0, 7
;Temperature Display with control Lamp.c,36 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, 7
;Temperature Display with control Lamp.c,38 :: 		TRISB = 0X00;
	CLRF       TRISB+0
;Temperature Display with control Lamp.c,39 :: 		PORTB = 0X00;
	CLRF       PORTB+0
;Temperature Display with control Lamp.c,40 :: 		TRISE = 0XFF;                      // Set PORTE as Input
	MOVLW      255
	MOVWF      TRISE+0
;Temperature Display with control Lamp.c,41 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;Temperature Display with control Lamp.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temperature Display with control Lamp.c,44 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temperature Display with control Lamp.c,45 :: 		Lcd_Out(1,1,"  TEMPERATURE   ");   // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Temperature_32Display_32with_32control_32Lamp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temperature Display with control Lamp.c,46 :: 		Lcd_Out(2,1,"  T = 00 C      ");   // Write text in Second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Temperature_32Display_32with_32control_32Lamp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temperature Display with control Lamp.c,47 :: 		CustomChar(2,9);                   // Display symbol Celsius
	MOVLW      2
	MOVWF      FARG_CustomChar_pos_row+0
	MOVLW      9
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;Temperature Display with control Lamp.c,49 :: 		while(1){
L_main3:
;Temperature Display with control Lamp.c,50 :: 		ad_read = ADC_Read(5);        // Read analog AN5
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;Temperature Display with control Lamp.c,51 :: 		voltage = ad_read * 4.895;    // 5000mV/1023
	CALL       _Int2Double+0
	MOVLW      215
	MOVWF      R4+0
	MOVLW      163
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
;Temperature Display with control Lamp.c,52 :: 		temp = voltage/10;            // 10mV/0C
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_temp_L0+0
;Temperature Display with control Lamp.c,54 :: 		if(temp >= 35)
	MOVLW      35
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;Temperature Display with control Lamp.c,55 :: 		PORTB.F0 = 1;  // lamp on
	BSF        PORTB+0, 0
L_main5:
;Temperature Display with control Lamp.c,56 :: 		if(temp <= 30)
	MOVF       main_temp_L0+0, 0
	SUBLW      30
	BTFSS      STATUS+0, 0
	GOTO       L_main6
;Temperature Display with control Lamp.c,57 :: 		PORTB.f0 = 0;  // lamp off
	BCF        PORTB+0, 0
L_main6:
;Temperature Display with control Lamp.c,59 :: 		d2 = temp/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      main_d2_L0+0
;Temperature Display with control Lamp.c,60 :: 		d1 = temp%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_temp_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_d1_L0+0
;Temperature Display with control Lamp.c,62 :: 		Lcd_Chr(2, 7, d2+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      main_d2_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Temperature Display with control Lamp.c,63 :: 		Lcd_Chr(2, 8, d1+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      main_d1_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Temperature Display with control Lamp.c,64 :: 		}
	GOTO       L_main3
;Temperature Display with control Lamp.c,65 :: 		}
	GOTO       $+0
; end of _main
