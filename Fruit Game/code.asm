
_main:

;code.c,3 :: 		void main(){
;code.c,4 :: 		char disp[]={0b10000,0b01000,0b00100,0b00010,0b00001,0b00010,0b00100,0b01000};
	MOVLW      16
	MOVWF      main_disp_L0+0
	MOVLW      8
	MOVWF      main_disp_L0+1
	MOVLW      4
	MOVWF      main_disp_L0+2
	MOVLW      2
	MOVWF      main_disp_L0+3
	MOVLW      1
	MOVWF      main_disp_L0+4
	MOVLW      2
	MOVWF      main_disp_L0+5
	MOVLW      4
	MOVWF      main_disp_L0+6
	MOVLW      8
	MOVWF      main_disp_L0+7
;code.c,8 :: 		Trisa=0b00011;
	MOVLW      3
	MOVWF      TRISA+0
;code.c,9 :: 		Trisb=0;
	CLRF       TRISB+0
;code.c,10 :: 		Portb=0;
	CLRF       PORTB+0
;code.c,11 :: 		while(1){
L_main0:
;code.c,12 :: 		if(B_start==1){
	BTFSS      PORTA+0, 1
	GOTO       L_main2
;code.c,13 :: 		doagain:
___main_doagain:
;code.c,14 :: 		for(i=0;i<8;i++){
	CLRF       main_i_L0+0
L_main3:
	MOVLW      8
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;code.c,15 :: 		Portb=disp[i];
	MOVF       main_i_L0+0, 0
	ADDLW      main_disp_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;code.c,16 :: 		number=rand()/32;
	CALL       _rand+0
	MOVLW      5
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      main_number_L0+0
	MOVF       R0+1, 0
	MOVWF      main_number_L0+1
	MOVF       R2+0, 0
L__main25:
	BTFSC      STATUS+0, 2
	GOTO       L__main26
	RRF        main_number_L0+1, 1
	RRF        main_number_L0+0, 1
	BCF        main_number_L0+1, 7
	BTFSC      main_number_L0+1, 6
	BSF        main_number_L0+1, 7
	ADDLW      255
	GOTO       L__main25
L__main26:
;code.c,17 :: 		delay_ms(80);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;code.c,18 :: 		if(B_stop==1){
	BTFSS      PORTA+0, 0
	GOTO       L_main7
;code.c,19 :: 		i=8;
	MOVLW      8
	MOVWF      main_i_L0+0
;code.c,20 :: 		Portb=0;
	CLRF       PORTB+0
;code.c,21 :: 		goto end;
	GOTO       ___main_end
;code.c,22 :: 		}
L_main7:
;code.c,14 :: 		for(i=0;i<8;i++){
	INCF       main_i_L0+0, 1
;code.c,23 :: 		}
	GOTO       L_main3
L_main4:
;code.c,24 :: 		goto doagain;
	GOTO       ___main_doagain
;code.c,25 :: 		}
L_main2:
;code.c,26 :: 		end:
___main_end:
;code.c,27 :: 		if(B_stop==1 && i==8){
	BTFSS      PORTA+0, 0
	GOTO       L_main10
	MOVF       main_i_L0+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main10
L__main24:
;code.c,28 :: 		if(number<200)          result=1;
	MOVLW      128
	XORWF      main_number_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      200
	SUBWF      main_number_L0+0, 0
L__main27:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
	MOVLW      1
	MOVWF      main_result_L0+0
	GOTO       L_main12
L_main11:
;code.c,29 :: 		else if(number<400)     result=2;
	MOVLW      128
	XORWF      main_number_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      144
	SUBWF      main_number_L0+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
	MOVLW      2
	MOVWF      main_result_L0+0
	GOTO       L_main14
L_main13:
;code.c,30 :: 		else if(number<600)     result=4;
	MOVLW      128
	XORWF      main_number_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      88
	SUBWF      main_number_L0+0, 0
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main15
	MOVLW      4
	MOVWF      main_result_L0+0
	GOTO       L_main16
L_main15:
;code.c,31 :: 		else if(number<800)     result=8;
	MOVLW      128
	XORWF      main_number_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      32
	SUBWF      main_number_L0+0, 0
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
	MOVLW      8
	MOVWF      main_result_L0+0
	GOTO       L_main18
L_main17:
;code.c,32 :: 		else                    result=16;
	MOVLW      16
	MOVWF      main_result_L0+0
L_main18:
L_main16:
L_main14:
L_main12:
;code.c,34 :: 		for(i=0;i<3;i++){
	CLRF       main_i_L0+0
L_main19:
	MOVLW      3
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;code.c,35 :: 		portb=0;
	CLRF       PORTB+0
;code.c,36 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
;code.c,37 :: 		portb=result;
	MOVF       main_result_L0+0, 0
	MOVWF      PORTB+0
;code.c,38 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
;code.c,34 :: 		for(i=0;i<3;i++){
	INCF       main_i_L0+0, 1
;code.c,39 :: 		}
	GOTO       L_main19
L_main20:
;code.c,40 :: 		}
L_main10:
;code.c,41 :: 		}
	GOTO       L_main0
;code.c,42 :: 		}
	GOTO       $+0
; end of _main
