;  ASM code generated by mikroVirtualMachine for PIC - V. 8.2.0.0
;  Date/Time: 1/29/2013 4:32:40 PM
;  Info: http://www.mikroe.com


; ADDRESS	OPCODE	ASM
; ----------------------------------------------
$0000	$2804			GOTO	_main
$0070	$	_Div_8x8_U:
$0070	$1303			BCF	STATUS, RP1
$0071	$1283			BCF	STATUS, RP0
$0072	$01C8			CLRF	STACK_8, F
$0073	$3008			MOVLW	8
$0074	$00CC			MOVWF	STACK_12
$0075	$0D40			RLF	STACK_0, W
$0076	$0DC8			RLF	STACK_8, F
$0077	$0844			MOVF	STACK_4, W
$0078	$02C8			SUBWF	STACK_8, F
$0079	$1803			BTFSC	STATUS, C
$007A	$287D			GOTO	$+3
$007B	$07C8			ADDWF	STACK_8, F
$007C	$1003			BCF	STATUS, C
$007D	$0DC0			RLF	STACK_0, F
$007E	$0BCC			DECFSZ	STACK_12, F
$007F	$2875			GOTO	$-10
$0080	$0008			RETURN
$0004	$	_main:
$0004	$303F			MOVLW	63
$0005	$1303			BCF	STATUS, RP1
$0006	$1283			BCF	STATUS, RP0
$0007	$0090			MOVWF	main_dis_L0+0
$0008	$3006			MOVLW	6
$0009	$0091			MOVWF	main_dis_L0+1
$000A	$305B			MOVLW	91
$000B	$0092			MOVWF	main_dis_L0+2
$000C	$304F			MOVLW	79
$000D	$0093			MOVWF	main_dis_L0+3
$000E	$3066			MOVLW	102
$000F	$0094			MOVWF	main_dis_L0+4
$0010	$306D			MOVLW	109
$0011	$0095			MOVWF	main_dis_L0+5
$0012	$307D			MOVLW	125
$0013	$0096			MOVWF	main_dis_L0+6
$0014	$3007			MOVLW	7
$0015	$0097			MOVWF	main_dis_L0+7
$0016	$307F			MOVLW	127
$0017	$0098			MOVWF	main_dis_L0+8
$0018	$306F			MOVLW	111
$0019	$0099			MOVWF	main_dis_L0+9
;7segment.c,5 :: 		void main()
;7segment.c,7 :: 		unsigned char a,b,c=0,i,dis[]={63,6,91,79,102,109,125,7,127,111};
$001A	$018E			CLRF	main_c_L0, 1
;7segment.c,8 :: 		Trisb = 0;
$001B	$1683			BSF	STATUS, RP0
$001C	$0186			CLRF	TRISB, 1
;7segment.c,9 :: 		Portb = 0;
$001D	$1283			BCF	STATUS, RP0
$001E	$0186			CLRF	PORTB, 1
;7segment.c,10 :: 		Trisa =0;
$001F	$1683			BSF	STATUS, RP0
$0020	$0185			CLRF	TRISA, 1
;7segment.c,11 :: 		Porta =0;
$0021	$1283			BCF	STATUS, RP0
$0022	$0185			CLRF	PORTA, 1
;7segment.c,13 :: 		while(1)
$0023	$	L_main_0:
;7segment.c,15 :: 		a=c/10;
$0023	$300A			MOVLW	10
$0024	$00C4			MOVWF	STACK_4
$0025	$080E			MOVF	main_c_L0, 0
$0026	$00C0			MOVWF	STACK_0
$0027	$2070			CALL	_div_8x8_u
$0028	$0840			MOVF	STACK_0, 0
$0029	$008C			MOVWF	main_a_L0
;7segment.c,16 :: 		b=c%10;
$002A	$300A			MOVLW	10
$002B	$00C4			MOVWF	STACK_4
$002C	$080E			MOVF	main_c_L0, 0
$002D	$00C0			MOVWF	STACK_0
$002E	$2070			CALL	_div_8x8_u
$002F	$0848			MOVF	STACK_8, 0
$0030	$00C0			MOVWF	STACK_0
$0031	$0840			MOVF	STACK_0, 0
$0032	$008D			MOVWF	main_b_L0
;7segment.c,17 :: 		for(i=0;i<20;i++)
$0033	$018F			CLRF	main_i_L0, 1
$0034	$	L_main_2:
$0034	$3014			MOVLW	20
$0035	$020F			SUBWF	main_i_L0, 0
$0036	$1803			BTFSC	STATUS, C
$0037	$2868			GOTO	L_main_3
;7segment.c,19 :: 		portb=dis[a];
$0038	$080C			MOVF	main_a_L0, 0
$0039	$3F10			ADDLW	main_dis_L0
$003A	$0084			MOVWF	FSR
$003B	$0800			MOVF	INDF, 0
$003C	$0086			MOVWF	PORTB
;7segment.c,20 :: 		porta=1;
$003D	$3001			MOVLW	1
$003E	$0085			MOVWF	PORTA
;7segment.c,21 :: 		delay_ms(10);
$003F	$300D			MOVLW	13
$0040	$00CB			MOVWF	STACK_11
$0041	$30FF			MOVLW	255
$0042	$00CA			MOVWF	STACK_10
$0043	$0BCB			DECFSZ	STACK_11, F
$0044	$2846			GOTO	$+2
$0045	$2849			GOTO	$+4
$0046	$0BCA			DECFSZ	STACK_10, F
$0047	$2846			GOTO	$-1
$0048	$2843			GOTO	$-5
$0049	$30F3			MOVLW	243
$004A	$00CA			MOVWF	STACK_10
$004B	$0BCA			DECFSZ	STACK_10, F
$004C	$284B			GOTO	$-1
$004D	$0000			NOP
;7segment.c,22 :: 		portb=0;
$004E	$0186			CLRF	PORTB, 1
;7segment.c,23 :: 		portb=dis[b];
$004F	$080D			MOVF	main_b_L0, 0
$0050	$3F10			ADDLW	main_dis_L0
$0051	$0084			MOVWF	FSR
$0052	$0800			MOVF	INDF, 0
$0053	$0086			MOVWF	PORTB
;7segment.c,24 :: 		porta=2;
$0054	$3002			MOVLW	2
$0055	$0085			MOVWF	PORTA
;7segment.c,25 :: 		delay_ms(10);
$0056	$300D			MOVLW	13
$0057	$00CB			MOVWF	STACK_11
$0058	$30FF			MOVLW	255
$0059	$00CA			MOVWF	STACK_10
$005A	$0BCB			DECFSZ	STACK_11, F
$005B	$285D			GOTO	$+2
$005C	$2860			GOTO	$+4
$005D	$0BCA			DECFSZ	STACK_10, F
$005E	$285D			GOTO	$-1
$005F	$285A			GOTO	$-5
$0060	$30F3			MOVLW	243
$0061	$00CA			MOVWF	STACK_10
$0062	$0BCA			DECFSZ	STACK_10, F
$0063	$2862			GOTO	$-1
$0064	$0000			NOP
;7segment.c,26 :: 		portb=0;
$0065	$0186			CLRF	PORTB, 1
;7segment.c,27 :: 		}
$0066	$	L_main_4:
;7segment.c,17 :: 		for(i=0;i<20;i++)
$0066	$0A8F			INCF	main_i_L0, 1
;7segment.c,27 :: 		}
$0067	$2834			GOTO	L_main_2
$0068	$	L_main_3:
;7segment.c,28 :: 		c++;
$0068	$0A8E			INCF	main_c_L0, 1
;7segment.c,29 :: 		if(c>=100)
$0069	$3064			MOVLW	100
$006A	$020E			SUBWF	main_c_L0, 0
$006B	$1C03			BTFSS	STATUS, C
$006C	$286E			GOTO	L_main_5
;7segment.c,30 :: 		c=0;
$006D	$018E			CLRF	main_c_L0, 1
$006E	$	L_main_5:
;7segment.c,31 :: 		}
$006E	$2823			GOTO	L_main_0
;7segment.c,33 :: 		}
$006F	$286F			GOTO	$