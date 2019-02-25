
_main:

;code.c,8 :: 		void main()
;code.c,11 :: 		Trisa = 0x01;
	MOVLW      1
	MOVWF      TRISA+0
;code.c,12 :: 		Trisb = 0x00;
	CLRF       TRISB+0
;code.c,13 :: 		Portb = 0x00;
	CLRF       PORTB+0
;code.c,14 :: 		while(1)
L_main0:
;code.c,16 :: 		Portb = 0b11110000;
	MOVLW      240
	MOVWF      PORTB+0
;code.c,17 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;code.c,18 :: 		for(;;)
L_main3:
;code.c,20 :: 		Portb = ~Portb;
	COMF       PORTB+0, 1
;code.c,21 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;code.c,22 :: 		if(Porta.f0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main7
;code.c,23 :: 		break;
	GOTO       L_main4
L_main7:
;code.c,24 :: 		}
	GOTO       L_main3
L_main4:
;code.c,26 :: 		Portb = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;code.c,27 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
;code.c,28 :: 		for(;;)
L_main9:
;code.c,30 :: 		portb = ~Portb;
	COMF       PORTB+0, 1
;code.c,31 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	NOP
;code.c,32 :: 		if(Porta.f0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main13
;code.c,33 :: 		break;
	GOTO       L_main10
L_main13:
;code.c,34 :: 		}
	GOTO       L_main9
L_main10:
;code.c,36 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
;code.c,37 :: 		for(;;)
L_main15:
;code.c,39 :: 		for(i=0;i<8;i++)
	CLRF       R4+0
L_main18:
	MOVLW      8
	SUBWF      R4+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main19
;code.c,41 :: 		Portb = 1 << i;
	MOVF       R4+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main34:
	BTFSC      STATUS+0, 2
	GOTO       L__main35
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main34
L__main35:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;code.c,42 :: 		delay_ms(100);
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
;code.c,43 :: 		if(Porta.f0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main22
;code.c,44 :: 		break;
	GOTO       L_main19
L_main22:
;code.c,39 :: 		for(i=0;i<8;i++)
	INCF       R4+0, 1
;code.c,45 :: 		}
	GOTO       L_main18
L_main19:
;code.c,46 :: 		if(Porta.f0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main23
;code.c,47 :: 		break;
	GOTO       L_main16
L_main23:
;code.c,48 :: 		}
	GOTO       L_main15
L_main16:
;code.c,50 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
;code.c,51 :: 		for(;;)
L_main25:
;code.c,53 :: 		for(i=0;i<4;i++)
	CLRF       R4+0
L_main28:
	MOVLW      4
	SUBWF      R4+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main29
;code.c,55 :: 		Portb = 1 << i | 128 >> i;
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVLW      1
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
	MOVF       R0+0, 0
L__main36:
	BTFSC      STATUS+0, 2
	GOTO       L__main37
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__main36
L__main37:
	MOVF       R4+0, 0
	MOVWF      R1+0
	MOVLW      128
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main38:
	BTFSC      STATUS+0, 2
	GOTO       L__main39
	RRF        R0+0, 1
	BCF        R0+0, 7
	ADDLW      255
	GOTO       L__main38
L__main39:
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTB+0
;code.c,56 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	NOP
	NOP
;code.c,57 :: 		if(Porta.f0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main32
;code.c,58 :: 		break;
	GOTO       L_main29
L_main32:
;code.c,53 :: 		for(i=0;i<4;i++)
	INCF       R4+0, 1
;code.c,59 :: 		}
	GOTO       L_main28
L_main29:
;code.c,60 :: 		if(Porta.f0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main33
;code.c,61 :: 		break;
	GOTO       L_main26
L_main33:
;code.c,62 :: 		}
	GOTO       L_main25
L_main26:
;code.c,64 :: 		}
	GOTO       L_main0
;code.c,65 :: 		}
	GOTO       $+0
; end of _main
