
_main:

;segmet2.c,5 :: 		void main()
;segmet2.c,9 :: 		Trisb=0b00000000;
	CLRF       TRISB+0
;segmet2.c,10 :: 		Portb=0b00000000;
	CLRF       PORTB+0
;segmet2.c,11 :: 		while(1)
L_main0:
;segmet2.c,13 :: 		for(i=0;i<100;i++)
	CLRF       main_i_L0+0
L_main2:
	MOVLW      100
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;segmet2.c,15 :: 		a=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      main_a_L0+0
	CLRF       main_a_L0+1
;segmet2.c,16 :: 		b=i%10;
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
;segmet2.c,17 :: 		portb=a<<4|b;
	MOVLW      4
	MOVWF      R1+0
	MOVF       main_a_L0+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main6:
	BTFSC      STATUS+0, 2
	GOTO       L__main7
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main6
L__main7:
	MOVF       main_b_L0+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTB+0
;segmet2.c,18 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;segmet2.c,13 :: 		for(i=0;i<100;i++)
	INCF       main_i_L0+0, 1
;segmet2.c,19 :: 		}
	GOTO       L_main2
L_main3:
;segmet2.c,21 :: 		}
	GOTO       L_main0
;segmet2.c,22 :: 		}
	GOTO       $+0
; end of _main
