
_main:

;CounterCode.c,5 :: 		void main()
;CounterCode.c,7 :: 		unsigned char i=0;
	CLRF       main_i_L0+0
;CounterCode.c,9 :: 		Trisa = 0b00011;
	MOVLW      3
	MOVWF      TRISA+0
;CounterCode.c,10 :: 		Trisb = 0b00000000;
	CLRF       TRISB+0
;CounterCode.c,11 :: 		Portb = 0b00000000;
	CLRF       PORTB+0
;CounterCode.c,12 :: 		while(1)
L_main0:
;CounterCode.c,14 :: 		if(porta.f0 ==1)
	BTFSS      PORTA+0, 0
	GOTO       L_main2
;CounterCode.c,16 :: 		i++;
	INCF       main_i_L0+0, 1
;CounterCode.c,17 :: 		if(i >= 100) i=0;
	MOVLW      100
	SUBWF      main_i_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main3
	CLRF       main_i_L0+0
L_main3:
;CounterCode.c,18 :: 		a=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      main_a_L0+0
	CLRF       main_a_L0+1
;CounterCode.c,19 :: 		b=i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_b_L0+0
	CLRF       main_b_L0+1
;CounterCode.c,20 :: 		portb=a<<4|b;
	MOVLW      4
	MOVWF      R1+0
	MOVF       main_a_L0+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main8:
	BTFSC      STATUS+0, 2
	GOTO       L__main9
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main8
L__main9:
	MOVF       main_b_L0+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTB+0
;CounterCode.c,21 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
;CounterCode.c,22 :: 		}
L_main2:
;CounterCode.c,24 :: 		if(porta.f1 ==1)
	BTFSS      PORTA+0, 1
	GOTO       L_main5
;CounterCode.c,26 :: 		if(i == 0 ) i=100;
	MOVF       main_i_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main6
	MOVLW      100
	MOVWF      main_i_L0+0
L_main6:
;CounterCode.c,27 :: 		i--;
	DECF       main_i_L0+0, 1
;CounterCode.c,28 :: 		a=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      main_a_L0+0
	CLRF       main_a_L0+1
;CounterCode.c,29 :: 		b=i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_b_L0+0
	CLRF       main_b_L0+1
;CounterCode.c,30 :: 		portb=a<<4|b;
	MOVLW      4
	MOVWF      R1+0
	MOVF       main_a_L0+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main10:
	BTFSC      STATUS+0, 2
	GOTO       L__main11
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main10
L__main11:
	MOVF       main_b_L0+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTB+0
;CounterCode.c,31 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
;CounterCode.c,32 :: 		}
L_main5:
;CounterCode.c,33 :: 		}
	GOTO       L_main0
;CounterCode.c,34 :: 		}
	GOTO       $+0
; end of _main
