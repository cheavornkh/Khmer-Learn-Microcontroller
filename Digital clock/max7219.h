// DAC module connections
sbit Chip_Select at RC0_bit;
sbit SoftSpi_CLK at RC1_bit;
sbit SoftSpi_SDO at RC2_bit;
sbit SoftSpi_SDI at RC5_bit;

sbit Chip_Select_Direction at TRISC0_bit;
sbit SoftSpi_CLK_Direction at TRISC1_bit;
sbit SoftSpi_SDO_Direction at TRISC2_bit;
sbit SoftSpi_SDI_Direction at TRISC5_bit;
// End DAC module connections


void max7219_init1() {
  Chip_Select_Direction = 0;    // Set RC0 pin as output
  Soft_SPI_Init();              // Initialize SPI1 module
  Chip_Select = 0;              // SELECT MAX
  Soft_SPI_Write(0x09);         // BCD mode for digit code B decoding
  Soft_SPI_Write(0xFF);
  Chip_Select = 1;       // DESELECT MAX

  Chip_Select = 0;       // SELECT MAX
  Soft_SPI_Write(0x0A);
  Soft_SPI_Write(0x0F);      // Segment luminosity intensity
  Chip_Select = 1;       // DESELECT MAX

  Chip_Select = 0;       // SELECT MAX
  Soft_SPI_Write(0x0B);
  Soft_SPI_Write(0x07);      // Display refresh
  Chip_Select = 1;       // DESELECT MAX

  Chip_Select = 0;       // SELECT MAX
  Soft_SPI_Write(0x0C);
  Soft_SPI_Write(0x01);      // Turn on the display
  Chip_Select = 1;       // DESELECT MAX

  Chip_Select = 0;       // SELECT MAX
  Soft_SPI_Write(0x00);
  Soft_SPI_Write(0xFF);      // No test
  Chip_Select = 1;       // DESELECT MAX
}
//---------------------------------------------------------
void max7219display(char d1, char d2, char d3, char d4, char d5, char d6){
    
    Chip_Select = 0;     // select max7219
    Soft_SPI_Write(1);       // send i to max7219 (digit place)
    Soft_SPI_Write(d1);      // send data to display
    Chip_Select = 1;     // deselect max7219
        
    Chip_Select = 0;     // select max7219
    Soft_SPI_Write(2);       // send i to max7219 (digit place)
    Soft_SPI_Write(d2);      // send data to display
    Chip_Select = 1;     // deselect max7219
        
    Chip_Select = 0;     // select max7219
    Soft_SPI_Write(3);       // send i to max7219 (digit place)
    Soft_SPI_Write(d3);      // send data to display
    Chip_Select = 1;     // deselect max7219
        
    Chip_Select = 0;     // select max7219
    Soft_SPI_Write(4);       // send i to max7219 (digit place)
    Soft_SPI_Write(d4);      // send data to display
    Chip_Select = 1;     // deselect max7219
        
    Chip_Select = 0;     // select max7219
    Soft_SPI_Write(5);       // send i to max7219 (digit place)
    Soft_SPI_Write(d5);      // send data to display
    Chip_Select = 1;     // deselect max7219
        
    Chip_Select = 0;     // select max7219
    Soft_SPI_Write(6);       // send i to max7219 (digit place)
    Soft_SPI_Write(d6);      // send data to display
    Chip_Select = 1;     // deselect max7219

    Chip_Select = 0;     // select max7219
    Soft_SPI_Write(7);       // send i to max7219 (digit place)
    Soft_SPI_Write(0XFF);      // send data to display
    Chip_Select = 1;     // deselect max7219

    Chip_Select = 0;     // select max7219
    Soft_SPI_Write(8);       // send i to max7219 (digit place)
    Soft_SPI_Write(0XFF);      // send data to display
    Chip_Select = 1;     // deselect max7219
}