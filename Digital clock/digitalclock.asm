
_max7219_init1:

;max7219.h,14 :: 		void max7219_init1() {
;max7219.h,15 :: 		Chip_Select_Direction = 0;    // Set RC0 pin as output
	BCF        TRISC0_bit+0, 0
;max7219.h,16 :: 		Soft_SPI_Init();              // Initialize SPI1 module
	CALL       _Soft_SPI_Init+0
;max7219.h,17 :: 		Chip_Select = 0;              // SELECT MAX
	BCF        RC0_bit+0, 0
;max7219.h,18 :: 		Soft_SPI_Write(0x09);         // BCD mode for digit code B decoding
	MOVLW      9
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,19 :: 		Soft_SPI_Write(0xFF);
	MOVLW      255
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,20 :: 		Chip_Select = 1;       // DESELECT MAX
	BSF        RC0_bit+0, 0
;max7219.h,22 :: 		Chip_Select = 0;       // SELECT MAX
	BCF        RC0_bit+0, 0
;max7219.h,23 :: 		Soft_SPI_Write(0x0A);
	MOVLW      10
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,24 :: 		Soft_SPI_Write(0x0F);      // Segment luminosity intensity
	MOVLW      15
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,25 :: 		Chip_Select = 1;       // DESELECT MAX
	BSF        RC0_bit+0, 0
;max7219.h,27 :: 		Chip_Select = 0;       // SELECT MAX
	BCF        RC0_bit+0, 0
;max7219.h,28 :: 		Soft_SPI_Write(0x0B);
	MOVLW      11
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,29 :: 		Soft_SPI_Write(0x07);      // Display refresh
	MOVLW      7
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,30 :: 		Chip_Select = 1;       // DESELECT MAX
	BSF        RC0_bit+0, 0
;max7219.h,32 :: 		Chip_Select = 0;       // SELECT MAX
	BCF        RC0_bit+0, 0
;max7219.h,33 :: 		Soft_SPI_Write(0x0C);
	MOVLW      12
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,34 :: 		Soft_SPI_Write(0x01);      // Turn on the display
	MOVLW      1
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,35 :: 		Chip_Select = 1;       // DESELECT MAX
	BSF        RC0_bit+0, 0
;max7219.h,37 :: 		Chip_Select = 0;       // SELECT MAX
	BCF        RC0_bit+0, 0
;max7219.h,38 :: 		Soft_SPI_Write(0x00);
	CLRF       FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,39 :: 		Soft_SPI_Write(0xFF);      // No test
	MOVLW      255
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,40 :: 		Chip_Select = 1;       // DESELECT MAX
	BSF        RC0_bit+0, 0
;max7219.h,41 :: 		}
	RETURN
; end of _max7219_init1

_max7219display:

;max7219.h,43 :: 		void max7219display(char d1, char d2, char d3, char d4, char d5, char d6){
;max7219.h,45 :: 		Chip_Select = 0;     // select max7219
	BCF        RC0_bit+0, 0
;max7219.h,46 :: 		Soft_SPI_Write(1);       // send i to max7219 (digit place)
	MOVLW      1
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,47 :: 		Soft_SPI_Write(d1);      // send data to display
	MOVF       FARG_max7219display_d1+0, 0
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,48 :: 		Chip_Select = 1;     // deselect max7219
	BSF        RC0_bit+0, 0
;max7219.h,50 :: 		Chip_Select = 0;     // select max7219
	BCF        RC0_bit+0, 0
;max7219.h,51 :: 		Soft_SPI_Write(2);       // send i to max7219 (digit place)
	MOVLW      2
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,52 :: 		Soft_SPI_Write(d2);      // send data to display
	MOVF       FARG_max7219display_d2+0, 0
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,53 :: 		Chip_Select = 1;     // deselect max7219
	BSF        RC0_bit+0, 0
;max7219.h,55 :: 		Chip_Select = 0;     // select max7219
	BCF        RC0_bit+0, 0
;max7219.h,56 :: 		Soft_SPI_Write(3);       // send i to max7219 (digit place)
	MOVLW      3
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,57 :: 		Soft_SPI_Write(d3);      // send data to display
	MOVF       FARG_max7219display_d3+0, 0
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,58 :: 		Chip_Select = 1;     // deselect max7219
	BSF        RC0_bit+0, 0
;max7219.h,60 :: 		Chip_Select = 0;     // select max7219
	BCF        RC0_bit+0, 0
;max7219.h,61 :: 		Soft_SPI_Write(4);       // send i to max7219 (digit place)
	MOVLW      4
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,62 :: 		Soft_SPI_Write(d4);      // send data to display
	MOVF       FARG_max7219display_d4+0, 0
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,63 :: 		Chip_Select = 1;     // deselect max7219
	BSF        RC0_bit+0, 0
;max7219.h,65 :: 		Chip_Select = 0;     // select max7219
	BCF        RC0_bit+0, 0
;max7219.h,66 :: 		Soft_SPI_Write(5);       // send i to max7219 (digit place)
	MOVLW      5
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,67 :: 		Soft_SPI_Write(d5);      // send data to display
	MOVF       FARG_max7219display_d5+0, 0
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,68 :: 		Chip_Select = 1;     // deselect max7219
	BSF        RC0_bit+0, 0
;max7219.h,70 :: 		Chip_Select = 0;     // select max7219
	BCF        RC0_bit+0, 0
;max7219.h,71 :: 		Soft_SPI_Write(6);       // send i to max7219 (digit place)
	MOVLW      6
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,72 :: 		Soft_SPI_Write(d6);      // send data to display
	MOVF       FARG_max7219display_d6+0, 0
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,73 :: 		Chip_Select = 1;     // deselect max7219
	BSF        RC0_bit+0, 0
;max7219.h,75 :: 		Chip_Select = 0;     // select max7219
	BCF        RC0_bit+0, 0
;max7219.h,76 :: 		Soft_SPI_Write(7);       // send i to max7219 (digit place)
	MOVLW      7
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,77 :: 		Soft_SPI_Write(0XFF);      // send data to display
	MOVLW      255
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,78 :: 		Chip_Select = 1;     // deselect max7219
	BSF        RC0_bit+0, 0
;max7219.h,80 :: 		Chip_Select = 0;     // select max7219
	BCF        RC0_bit+0, 0
;max7219.h,81 :: 		Soft_SPI_Write(8);       // send i to max7219 (digit place)
	MOVLW      8
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,82 :: 		Soft_SPI_Write(0XFF);      // send data to display
	MOVLW      255
	MOVWF      FARG_Soft_SPI_Write_sdata+0
	CALL       _Soft_SPI_Write+0
;max7219.h,83 :: 		Chip_Select = 1;     // deselect max7219
	BSF        RC0_bit+0, 0
;max7219.h,84 :: 		}
	RETURN
; end of _max7219display

_Read_Time:

;ds1307.h,1 :: 		void Read_Time(char *hours, char *minutes, char *seconds){
;ds1307.h,2 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;ds1307.h,3 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,4 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,5 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;ds1307.h,6 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,8 :: 		*seconds = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_seconds+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;ds1307.h,9 :: 		*minutes = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_minutes+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;ds1307.h,10 :: 		*hours = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_hours+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;ds1307.h,11 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;ds1307.h,12 :: 		}
	RETURN
; end of _Read_Time

_Write_Time:

;ds1307.h,14 :: 		void Write_Time(char hours, char minutes, char seconds){
;ds1307.h,15 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;ds1307.h,16 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,17 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,18 :: 		I2C1_Wr(0x80);
	MOVLW      128
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,20 :: 		I2C1_Wr(minutes);               // write 0 to minutes word to (REG1)
	MOVF       FARG_Write_Time_minutes+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,21 :: 		I2C1_Wr(hours);                 // write 17 to hours word (24-hours mode)(REG2)
	MOVF       FARG_Write_Time_hours+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,22 :: 		I2C1_Stop();                    // issue stop signal
	CALL       _I2C1_Stop+0
;ds1307.h,24 :: 		I2C1_Start();                   // issue start signal
	CALL       _I2C1_Start+0
;ds1307.h,25 :: 		I2C1_Wr(0xD0);                  // address DS1307
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,26 :: 		I2C1_Wr(0);                     // start from word at address 0
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,27 :: 		I2C1_Wr(0 | seconds);           // write 0 to REG0 (enable counting + 0 sec)
	MOVF       FARG_Write_Time_seconds+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,28 :: 		I2C1_Stop();                    // issue stop signal
	CALL       _I2C1_Stop+0
;ds1307.h,29 :: 		}
	RETURN
; end of _Write_Time

_Transform_Time:

;ds1307.h,32 :: 		void Transform_Time(char *hours, char *minutes, char *seconds) {
;ds1307.h,33 :: 		*seconds  =  ((*seconds & 0x70) >> 4)*10 + (*seconds & 0x0F);
	MOVF       FARG_Transform_Time_seconds+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__Transform_Time+0
	MOVLW      112
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_Transform_Time_seconds+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;ds1307.h,34 :: 		*minutes  =  ((*minutes & 0xF0) >> 4)*10 + (*minutes & 0x0F);
	MOVF       FARG_Transform_Time_minutes+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__Transform_Time+0
	MOVLW      240
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_Transform_Time_minutes+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;ds1307.h,35 :: 		*hours   =   ((*hours & 0x30) >> 4)*10 + (*hours & 0x0F);
	MOVF       FARG_Transform_Time_hours+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__Transform_Time+0
	MOVLW      48
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      15
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_Transform_Time_hours+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;ds1307.h,36 :: 		}
	RETURN
; end of _Transform_Time

_mode_display_time:

;digitalclock.c,12 :: 		void mode_display_time(){
;digitalclock.c,13 :: 		Read_Time(&hours, &minutes, &seconds);
	MOVLW      _hours+0
	MOVWF      FARG_Read_Time_hours+0
	MOVLW      _minutes+0
	MOVWF      FARG_Read_Time_minutes+0
	MOVLW      _seconds+0
	MOVWF      FARG_Read_Time_seconds+0
	CALL       _Read_Time+0
;digitalclock.c,14 :: 		Transform_Time(&hours, &minutes, &seconds);
	MOVLW      _hours+0
	MOVWF      FARG_Transform_Time_hours+0
	MOVLW      _minutes+0
	MOVWF      FARG_Transform_Time_minutes+0
	MOVLW      _seconds+0
	MOVWF      FARG_Transform_Time_seconds+0
	CALL       _Transform_Time+0
;digitalclock.c,15 :: 		if(hours>12)
	MOVF       _hours+0, 0
	SUBLW      12
	BTFSC      STATUS+0, 0
	GOTO       L_mode_display_time0
;digitalclock.c,16 :: 		hours -= 12;
	MOVLW      12
	SUBWF      _hours+0, 1
L_mode_display_time0:
;digitalclock.c,18 :: 		Hh = hours /10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _Hh+0
;digitalclock.c,19 :: 		Hl = hours %10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Hl+0
;digitalclock.c,20 :: 		Mh = minutes /10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _Mh+0
;digitalclock.c,21 :: 		Ml = minutes %10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Ml+0
;digitalclock.c,22 :: 		Sh = seconds /10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _Sh+0
;digitalclock.c,23 :: 		Sl = seconds %10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Sl+0
;digitalclock.c,24 :: 		max7219display(Sl,Sh,Ml,Mh,Hl,Hh);
	MOVF       R0+0, 0
	MOVWF      FARG_max7219display_d1+0
	MOVF       _Sh+0, 0
	MOVWF      FARG_max7219display_d2+0
	MOVF       _Ml+0, 0
	MOVWF      FARG_max7219display_d3+0
	MOVF       _Mh+0, 0
	MOVWF      FARG_max7219display_d4+0
	MOVF       _Hl+0, 0
	MOVWF      FARG_max7219display_d5+0
	MOVF       _Hh+0, 0
	MOVWF      FARG_max7219display_d6+0
	CALL       _max7219display+0
;digitalclock.c,25 :: 		old_hours = hours;
	MOVF       _hours+0, 0
	MOVWF      _old_hours+0
;digitalclock.c,26 :: 		old_minutes = minutes;
	MOVF       _minutes+0, 0
	MOVWF      _old_minutes+0
;digitalclock.c,27 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_mode_display_time1:
	DECFSZ     R13+0, 1
	GOTO       L_mode_display_time1
	DECFSZ     R12+0, 1
	GOTO       L_mode_display_time1
	NOP
	NOP
;digitalclock.c,28 :: 		}
	RETURN
; end of _mode_display_time

_mode_set_hour:

;digitalclock.c,30 :: 		void mode_set_hour(){
;digitalclock.c,31 :: 		if(!up){
	BTFSC      PORTA+0, 2
	GOTO       L_mode_set_hour2
;digitalclock.c,32 :: 		if(old_hours<12)
	MOVLW      12
	SUBWF      _old_hours+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_mode_set_hour3
;digitalclock.c,33 :: 		old_hours++;
	INCF       _old_hours+0, 1
L_mode_set_hour3:
;digitalclock.c,34 :: 		}
L_mode_set_hour2:
;digitalclock.c,35 :: 		if(!down){
	BTFSC      PORTA+0, 3
	GOTO       L_mode_set_hour4
;digitalclock.c,36 :: 		if(old_hours>1)
	MOVF       _old_hours+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_mode_set_hour5
;digitalclock.c,37 :: 		old_hours--;
	DECF       _old_hours+0, 1
L_mode_set_hour5:
;digitalclock.c,38 :: 		}
L_mode_set_hour4:
;digitalclock.c,39 :: 		Read_Time(&hours, &minutes, &seconds);
	MOVLW      _hours+0
	MOVWF      FARG_Read_Time_hours+0
	MOVLW      _minutes+0
	MOVWF      FARG_Read_Time_minutes+0
	MOVLW      _seconds+0
	MOVWF      FARG_Read_Time_seconds+0
	CALL       _Read_Time+0
;digitalclock.c,40 :: 		Transform_Time(&hours, &minutes, &seconds);
	MOVLW      _hours+0
	MOVWF      FARG_Transform_Time_hours+0
	MOVLW      _minutes+0
	MOVWF      FARG_Transform_Time_minutes+0
	MOVLW      _seconds+0
	MOVWF      FARG_Transform_Time_seconds+0
	CALL       _Transform_Time+0
;digitalclock.c,41 :: 		if(hours>12)
	MOVF       _hours+0, 0
	SUBLW      12
	BTFSC      STATUS+0, 0
	GOTO       L_mode_set_hour6
;digitalclock.c,42 :: 		hours -= 12;
	MOVLW      12
	SUBWF      _hours+0, 1
L_mode_set_hour6:
;digitalclock.c,44 :: 		Hh = old_hours /10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _old_hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _Hh+0
;digitalclock.c,45 :: 		Hl = old_hours %10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _old_hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Hl+0
;digitalclock.c,46 :: 		Mh = minutes /10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _Mh+0
;digitalclock.c,47 :: 		Ml = minutes %10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Ml+0
;digitalclock.c,48 :: 		Sh = seconds /10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _Sh+0
;digitalclock.c,49 :: 		Sl = seconds %10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Sl+0
;digitalclock.c,50 :: 		max7219display(Sl,Sh,Ml,Mh,Hl,Hh);
	MOVF       R0+0, 0
	MOVWF      FARG_max7219display_d1+0
	MOVF       _Sh+0, 0
	MOVWF      FARG_max7219display_d2+0
	MOVF       _Ml+0, 0
	MOVWF      FARG_max7219display_d3+0
	MOVF       _Mh+0, 0
	MOVWF      FARG_max7219display_d4+0
	MOVF       _Hl+0, 0
	MOVWF      FARG_max7219display_d5+0
	MOVF       _Hh+0, 0
	MOVWF      FARG_max7219display_d6+0
	CALL       _max7219display+0
;digitalclock.c,51 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_mode_set_hour7:
	DECFSZ     R13+0, 1
	GOTO       L_mode_set_hour7
	DECFSZ     R12+0, 1
	GOTO       L_mode_set_hour7
	NOP
	NOP
;digitalclock.c,52 :: 		max7219display(Sl,Sh,Ml,Mh,0XFF,0XFF);
	MOVF       _Sl+0, 0
	MOVWF      FARG_max7219display_d1+0
	MOVF       _Sh+0, 0
	MOVWF      FARG_max7219display_d2+0
	MOVF       _Ml+0, 0
	MOVWF      FARG_max7219display_d3+0
	MOVF       _Mh+0, 0
	MOVWF      FARG_max7219display_d4+0
	MOVLW      255
	MOVWF      FARG_max7219display_d5+0
	MOVLW      255
	MOVWF      FARG_max7219display_d6+0
	CALL       _max7219display+0
;digitalclock.c,53 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_mode_set_hour8:
	DECFSZ     R13+0, 1
	GOTO       L_mode_set_hour8
	DECFSZ     R12+0, 1
	GOTO       L_mode_set_hour8
	NOP
	NOP
;digitalclock.c,54 :: 		}
	RETURN
; end of _mode_set_hour

_mode_set_minute:

;digitalclock.c,56 :: 		void mode_set_minute(){
;digitalclock.c,57 :: 		if(!up){
	BTFSC      PORTA+0, 2
	GOTO       L_mode_set_minute9
;digitalclock.c,58 :: 		if(old_minutes<59)
	MOVLW      59
	SUBWF      _old_minutes+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_mode_set_minute10
;digitalclock.c,59 :: 		old_minutes++;
	INCF       _old_minutes+0, 1
L_mode_set_minute10:
;digitalclock.c,60 :: 		}
L_mode_set_minute9:
;digitalclock.c,61 :: 		if(!down){
	BTFSC      PORTA+0, 3
	GOTO       L_mode_set_minute11
;digitalclock.c,62 :: 		if(old_minutes>0)
	MOVF       _old_minutes+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_mode_set_minute12
;digitalclock.c,63 :: 		old_minutes--;
	DECF       _old_minutes+0, 1
L_mode_set_minute12:
;digitalclock.c,64 :: 		}
L_mode_set_minute11:
;digitalclock.c,65 :: 		Read_Time(&hours, &minutes, &seconds);
	MOVLW      _hours+0
	MOVWF      FARG_Read_Time_hours+0
	MOVLW      _minutes+0
	MOVWF      FARG_Read_Time_minutes+0
	MOVLW      _seconds+0
	MOVWF      FARG_Read_Time_seconds+0
	CALL       _Read_Time+0
;digitalclock.c,66 :: 		Transform_Time(&hours, &minutes, &seconds);
	MOVLW      _hours+0
	MOVWF      FARG_Transform_Time_hours+0
	MOVLW      _minutes+0
	MOVWF      FARG_Transform_Time_minutes+0
	MOVLW      _seconds+0
	MOVWF      FARG_Transform_Time_seconds+0
	CALL       _Transform_Time+0
;digitalclock.c,67 :: 		if(hours>12)
	MOVF       _hours+0, 0
	SUBLW      12
	BTFSC      STATUS+0, 0
	GOTO       L_mode_set_minute13
;digitalclock.c,68 :: 		hours -= 12;
	MOVLW      12
	SUBWF      _hours+0, 1
L_mode_set_minute13:
;digitalclock.c,70 :: 		Hh = old_hours /10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _old_hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _Hh+0
;digitalclock.c,71 :: 		Hl = old_hours %10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _old_hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Hl+0
;digitalclock.c,72 :: 		Mh = old_minutes /10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _old_minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _Mh+0
;digitalclock.c,73 :: 		Ml = old_minutes %10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _old_minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Ml+0
;digitalclock.c,74 :: 		Sh = seconds /10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _Sh+0
;digitalclock.c,75 :: 		Sl = seconds %10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Sl+0
;digitalclock.c,76 :: 		max7219display(Sl,Sh,Ml,Mh,Hl,Hh);
	MOVF       R0+0, 0
	MOVWF      FARG_max7219display_d1+0
	MOVF       _Sh+0, 0
	MOVWF      FARG_max7219display_d2+0
	MOVF       _Ml+0, 0
	MOVWF      FARG_max7219display_d3+0
	MOVF       _Mh+0, 0
	MOVWF      FARG_max7219display_d4+0
	MOVF       _Hl+0, 0
	MOVWF      FARG_max7219display_d5+0
	MOVF       _Hh+0, 0
	MOVWF      FARG_max7219display_d6+0
	CALL       _max7219display+0
;digitalclock.c,77 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_mode_set_minute14:
	DECFSZ     R13+0, 1
	GOTO       L_mode_set_minute14
	DECFSZ     R12+0, 1
	GOTO       L_mode_set_minute14
	NOP
	NOP
;digitalclock.c,78 :: 		max7219display(Sl,Sh,0XFF,0XFF,Hl,Hh);
	MOVF       _Sl+0, 0
	MOVWF      FARG_max7219display_d1+0
	MOVF       _Sh+0, 0
	MOVWF      FARG_max7219display_d2+0
	MOVLW      255
	MOVWF      FARG_max7219display_d3+0
	MOVLW      255
	MOVWF      FARG_max7219display_d4+0
	MOVF       _Hl+0, 0
	MOVWF      FARG_max7219display_d5+0
	MOVF       _Hh+0, 0
	MOVWF      FARG_max7219display_d6+0
	CALL       _max7219display+0
;digitalclock.c,79 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_mode_set_minute15:
	DECFSZ     R13+0, 1
	GOTO       L_mode_set_minute15
	DECFSZ     R12+0, 1
	GOTO       L_mode_set_minute15
	NOP
	NOP
;digitalclock.c,80 :: 		}
	RETURN
; end of _mode_set_minute

_main:

;digitalclock.c,83 :: 		void main() {
;digitalclock.c,84 :: 		char mode1 = 0;
	CLRF       main_mode1_L0+0
;digitalclock.c,85 :: 		Trisa = 0X0F;
	MOVLW      15
	MOVWF      TRISA+0
;digitalclock.c,86 :: 		ANSEL = 0X00;
	CLRF       ANSEL+0
;digitalclock.c,87 :: 		ANSELH = 0X00;
	CLRF       ANSELH+0
;digitalclock.c,89 :: 		I2C1_Init(100000);            // initialize I2C
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;digitalclock.c,90 :: 		max7219_init1();              // initialize  max7219
	CALL       _max7219_init1+0
;digitalclock.c,92 :: 		while(1){
L_main16:
;digitalclock.c,94 :: 		if (Button(&PORTA, 1, 1, 1)) {
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main18
;digitalclock.c,95 :: 		oldstate = 1;
	BSF        _oldstate+0, BitPos(_oldstate+0)
;digitalclock.c,96 :: 		}
L_main18:
;digitalclock.c,97 :: 		if (oldstate && Button(&PORTA, 1, 1, 0)) {
	BTFSS      _oldstate+0, BitPos(_oldstate+0)
	GOTO       L_main21
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
L__main28:
;digitalclock.c,98 :: 		mode1++;
	INCF       main_mode1_L0+0, 1
;digitalclock.c,99 :: 		if(mode1 > 2){
	MOVF       main_mode1_L0+0, 0
	SUBLW      2
	BTFSC      STATUS+0, 0
	GOTO       L_main22
;digitalclock.c,100 :: 		mode1 = 0;
	CLRF       main_mode1_L0+0
;digitalclock.c,101 :: 		Write_Time(Dec2Bcd(old_hours),Dec2Bcd(old_minutes),Dec2Bcd(seconds));
	MOVF       _seconds+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+1
	MOVF       _old_minutes+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       _old_hours+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_Write_Time_hours+0
	MOVF       FLOC__main+0, 0
	MOVWF      FARG_Write_Time_minutes+0
	MOVF       FLOC__main+1, 0
	MOVWF      FARG_Write_Time_seconds+0
	CALL       _Write_Time+0
;digitalclock.c,102 :: 		}
L_main22:
;digitalclock.c,103 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;digitalclock.c,104 :: 		}
L_main21:
;digitalclock.c,105 :: 		switch(mode1){
	GOTO       L_main23
;digitalclock.c,106 :: 		case 0:   mode_display_time(); break;
L_main25:
	CALL       _mode_display_time+0
	GOTO       L_main24
;digitalclock.c,107 :: 		case 1:   mode_set_hour();     break;
L_main26:
	CALL       _mode_set_hour+0
	GOTO       L_main24
;digitalclock.c,108 :: 		case 2:   mode_set_minute();   break;
L_main27:
	CALL       _mode_set_minute+0
	GOTO       L_main24
;digitalclock.c,109 :: 		}
L_main23:
	MOVF       main_mode1_L0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	MOVF       main_mode1_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main26
	MOVF       main_mode1_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main27
L_main24:
;digitalclock.c,110 :: 		}
	GOTO       L_main16
;digitalclock.c,111 :: 		}
	GOTO       $+0
; end of _main
