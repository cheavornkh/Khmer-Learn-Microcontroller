
_main:

;Game_code.c,16 :: 		void main() {
;Game_code.c,18 :: 		char count = 0;
	CLRF       main_count_L0+0
;Game_code.c,24 :: 		ANSEL = 0X00;
	CLRF       ANSEL+0
;Game_code.c,25 :: 		ANSELH = 0X00;
	CLRF       ANSELH+0
;Game_code.c,27 :: 		TRISB = 0X00;
	CLRF       TRISB+0
;Game_code.c,28 :: 		TRISC = 0X00;
	CLRF       TRISC+0
;Game_code.c,29 :: 		TRISD = 0X00;
	CLRF       TRISD+0
;Game_code.c,30 :: 		TRISE = 0XFF;
	MOVLW      255
	MOVWF      TRISE+0
;Game_code.c,31 :: 		PORTC = 64;
	MOVLW      64
	MOVWF      PORTC+0
;Game_code.c,32 :: 		PORTD = 64;
	MOVLW      64
	MOVWF      PORTD+0
;Game_code.c,33 :: 		PORTB = 0X00;
	CLRF       PORTB+0
;Game_code.c,34 :: 		result[0]=0;
	CLRF       main_result_L0+0
;Game_code.c,36 :: 		while(1){
L_main0:
;Game_code.c,37 :: 		start:
___main_start:
;Game_code.c,38 :: 		if(btn_start == 1){
	BTFSS      PORTE+0, 1
	GOTO       L_main2
;Game_code.c,39 :: 		count++;
	INCF       main_count_L0+0, 1
;Game_code.c,40 :: 		if(count>35)
	MOVF       main_count_L0+0, 0
	SUBLW      35
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Game_code.c,41 :: 		portb.f0=1;
	BSF        PORTB+0, 0
L_main3:
;Game_code.c,42 :: 		while(1){
L_main4:
;Game_code.c,43 :: 		for(i=0;i<12;i++){
	CLRF       main_i_L0+0
L_main6:
	MOVLW      12
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Game_code.c,44 :: 		PORTC = disp[i];
	MOVF       main_i_L0+0, 0
	ADDLW      main_disp_L0+0
	MOVWF      R0+0
	MOVLW      hi_addr(main_disp_L0+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;Game_code.c,45 :: 		PORTD = disp[i];
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTD+0
;Game_code.c,46 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Game_code.c,47 :: 		if(btn_stop == 1)
	BTFSS      PORTE+0, 2
	GOTO       L_main10
;Game_code.c,48 :: 		break;
	GOTO       L_main7
L_main10:
;Game_code.c,43 :: 		for(i=0;i<12;i++){
	INCF       main_i_L0+0, 1
;Game_code.c,49 :: 		}
	GOTO       L_main6
L_main7:
;Game_code.c,50 :: 		if(btn_stop == 1)
	BTFSS      PORTE+0, 2
	GOTO       L_main11
;Game_code.c,51 :: 		break;
	GOTO       L_main5
L_main11:
;Game_code.c,52 :: 		}
	GOTO       L_main4
L_main5:
;Game_code.c,53 :: 		again:
___main_again:
;Game_code.c,54 :: 		if(btn_reset == 1){
	BTFSS      PORTE+0, 0
	GOTO       L_main12
;Game_code.c,55 :: 		count = 0;
	CLRF       main_count_L0+0
;Game_code.c,56 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;Game_code.c,57 :: 		PORTC = disp_num[count%10];
	CLRF       R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      main_disp_num_L0+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(main_disp_num_L0+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;Game_code.c,58 :: 		PORTD = disp_num[count/10];
	CLRF       R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      main_disp_num_L0+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(main_disp_num_L0+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTD+0
;Game_code.c,59 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;Game_code.c,60 :: 		PORTC = 64;
	MOVLW      64
	MOVWF      PORTC+0
;Game_code.c,61 :: 		PORTD = 64;
	MOVLW      64
	MOVWF      PORTD+0
;Game_code.c,62 :: 		goto start;
	GOTO       ___main_start
;Game_code.c,63 :: 		}
L_main12:
;Game_code.c,64 :: 		PORTC = 64;
	MOVLW      64
	MOVWF      PORTC+0
;Game_code.c,65 :: 		PORTD = 64;
	MOVLW      64
	MOVWF      PORTD+0
;Game_code.c,66 :: 		number = rand()%35+1;
	CALL       _rand+0
	MOVLW      35
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	INCF       R0+0, 0
	MOVWF      main_number_L0+0
;Game_code.c,67 :: 		for(i=0;i<count;i++){
	CLRF       main_i_L0+0
L_main14:
	MOVF       main_count_L0+0, 0
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;Game_code.c,68 :: 		if(result[i]== number)
	MOVF       main_i_L0+0, 0
	ADDLW      main_result_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      main_number_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Game_code.c,69 :: 		goto again;
	GOTO       ___main_again
L_main17:
;Game_code.c,67 :: 		for(i=0;i<count;i++){
	INCF       main_i_L0+0, 1
;Game_code.c,70 :: 		}
	GOTO       L_main14
L_main15:
;Game_code.c,71 :: 		result[count-1]= number;
	MOVLW      1
	SUBWF      main_count_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      main_result_L0+0
	MOVWF      FSR
	MOVF       main_number_L0+0, 0
	MOVWF      INDF+0
;Game_code.c,73 :: 		for(i=0;i<3;i++){
	CLRF       main_i_L0+0
L_main18:
	MOVLW      3
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main19
;Game_code.c,74 :: 		PORTC = 0X00;
	CLRF       PORTC+0
;Game_code.c,75 :: 		PORTD = 0X00;
	CLRF       PORTD+0
;Game_code.c,76 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
;Game_code.c,77 :: 		PORTC = disp_num[result[count-1]%10];
	MOVLW      1
	SUBWF      main_count_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      main_result_L0+0
	MOVWF      FLOC__main+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      main_disp_num_L0+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(main_disp_num_L0+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;Game_code.c,78 :: 		PORTD = disp_num[result[count-1]/10];
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      main_disp_num_L0+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(main_disp_num_L0+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTD+0
;Game_code.c,79 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
;Game_code.c,73 :: 		for(i=0;i<3;i++){
	INCF       main_i_L0+0, 1
;Game_code.c,81 :: 		}
	GOTO       L_main18
L_main19:
;Game_code.c,82 :: 		}
L_main2:
;Game_code.c,83 :: 		}
	GOTO       L_main0
;Game_code.c,84 :: 		}
	GOTO       $+0
; end of _main
