
_main:

;EX1.c,1 :: 		void main() {
;EX1.c,3 :: 		unsigned char a[]={1,3,7,15,31,63,62,60,56,48,32,0};
	MOVLW      1
	MOVWF      main_a_L0+0
	MOVLW      3
	MOVWF      main_a_L0+1
	MOVLW      7
	MOVWF      main_a_L0+2
	MOVLW      15
	MOVWF      main_a_L0+3
	MOVLW      31
	MOVWF      main_a_L0+4
	MOVLW      63
	MOVWF      main_a_L0+5
	MOVLW      62
	MOVWF      main_a_L0+6
	MOVLW      60
	MOVWF      main_a_L0+7
	MOVLW      56
	MOVWF      main_a_L0+8
	MOVLW      48
	MOVWF      main_a_L0+9
	MOVLW      32
	MOVWF      main_a_L0+10
	CLRF       main_a_L0+11
	MOVLW      63
	MOVWF      main_b_L0+0
	MOVLW      6
	MOVWF      main_b_L0+1
	MOVLW      91
	MOVWF      main_b_L0+2
	MOVLW      79
	MOVWF      main_b_L0+3
	MOVLW      102
	MOVWF      main_b_L0+4
	MOVLW      109
	MOVWF      main_b_L0+5
	MOVLW      125
	MOVWF      main_b_L0+6
	MOVLW      7
	MOVWF      main_b_L0+7
	MOVLW      127
	MOVWF      main_b_L0+8
	MOVLW      111
	MOVWF      main_b_L0+9
;EX1.c,5 :: 		Trisa = 0b00111;
	MOVLW      7
	MOVWF      TRISA+0
;EX1.c,6 :: 		Trisb = 0b00000000;
	CLRF       TRISB+0
;EX1.c,7 :: 		Portb = 64;
	MOVLW      64
	MOVWF      PORTB+0
;EX1.c,8 :: 		while(1){
L_main0:
;EX1.c,10 :: 		if(porta.f0==1){
	BTFSS      PORTA+0, 0
	GOTO       L_main2
;EX1.c,11 :: 		for(;;)
L_main3:
;EX1.c,13 :: 		for(i=0;i<12;i++){
	CLRF       main_i_L0+0
L_main6:
	MOVLW      12
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;EX1.c,14 :: 		Portb = a[11-i];
	MOVF       main_i_L0+0, 0
	SUBLW      11
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      main_a_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;EX1.c,15 :: 		j = rand()/3600;
	CALL       _rand+0
	MOVLW      16
	MOVWF      R4+0
	MOVLW      14
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_j_L0+0
;EX1.c,16 :: 		if(porta.f1==1)
	BTFSS      PORTA+0, 1
	GOTO       L_main9
;EX1.c,17 :: 		goto end;
	GOTO       ___main_end
L_main9:
;EX1.c,18 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
;EX1.c,13 :: 		for(i=0;i<12;i++){
	INCF       main_i_L0+0, 1
;EX1.c,19 :: 		}
	GOTO       L_main6
L_main7:
;EX1.c,20 :: 		}
	GOTO       L_main3
;EX1.c,21 :: 		end:
___main_end:
;EX1.c,22 :: 		for(i=0;i<3;i++){
	CLRF       main_i_L0+0
L_main11:
	MOVLW      3
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;EX1.c,23 :: 		portb = 0;
	CLRF       PORTB+0
;EX1.c,24 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
;EX1.c,25 :: 		portb=b[j];
	MOVF       main_j_L0+0, 0
	ADDLW      main_b_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;EX1.c,26 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
;EX1.c,22 :: 		for(i=0;i<3;i++){
	INCF       main_i_L0+0, 1
;EX1.c,27 :: 		}
	GOTO       L_main11
L_main12:
;EX1.c,28 :: 		}
L_main2:
;EX1.c,30 :: 		if(porta.f2==1){
	BTFSS      PORTA+0, 2
	GOTO       L_main16
;EX1.c,31 :: 		for(;;)
L_main17:
;EX1.c,33 :: 		for(i=0;i<12;i++){
	CLRF       main_i_L0+0
L_main20:
	MOVLW      12
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;EX1.c,34 :: 		Portb = a[i];
	MOVF       main_i_L0+0, 0
	ADDLW      main_a_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;EX1.c,35 :: 		j = rand()/3600;
	CALL       _rand+0
	MOVLW      16
	MOVWF      R4+0
	MOVLW      14
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_j_L0+0
;EX1.c,36 :: 		if(porta.f1==1)
	BTFSS      PORTA+0, 1
	GOTO       L_main23
;EX1.c,37 :: 		goto end1;
	GOTO       ___main_end1
L_main23:
;EX1.c,38 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	NOP
;EX1.c,33 :: 		for(i=0;i<12;i++){
	INCF       main_i_L0+0, 1
;EX1.c,39 :: 		}
	GOTO       L_main20
L_main21:
;EX1.c,40 :: 		}
	GOTO       L_main17
;EX1.c,41 :: 		end1:
___main_end1:
;EX1.c,42 :: 		for(i=0;i<3;i++){
	CLRF       main_i_L0+0
L_main25:
	MOVLW      3
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main26
;EX1.c,43 :: 		portb = 0;
	CLRF       PORTB+0
;EX1.c,44 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
	NOP
;EX1.c,45 :: 		portb=b[j];
	MOVF       main_j_L0+0, 0
	ADDLW      main_b_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;EX1.c,46 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
;EX1.c,42 :: 		for(i=0;i<3;i++){
	INCF       main_i_L0+0, 1
;EX1.c,47 :: 		}
	GOTO       L_main25
L_main26:
;EX1.c,48 :: 		}
L_main16:
;EX1.c,49 :: 		}
	GOTO       L_main0
;EX1.c,50 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
