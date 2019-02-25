void Read_Time(char *hours, char *minutes, char *seconds){
  I2C1_Start();
  I2C1_Wr(0xD0);
  I2C1_Wr(0);
  I2C1_Repeated_Start();
  I2C1_Wr(0xD1);

  *seconds = I2C1_Rd(1);
  *minutes = I2C1_Rd(1);
  *hours = I2C1_Rd(0);
  I2C1_Stop();
}

void Write_Time(char hours, char minutes, char seconds){
   I2C1_Start();
   I2C1_Wr(0xD0);
   I2C1_Wr(0);
   I2C1_Wr(0x80);

   I2C1_Wr(minutes);               // write 0 to minutes word to (REG1)
   I2C1_Wr(hours);                 // write 17 to hours word (24-hours mode)(REG2)
   I2C1_Stop();                    // issue stop signal

   I2C1_Start();                   // issue start signal
   I2C1_Wr(0xD0);                  // address DS1307
   I2C1_Wr(0);                     // start from word at address 0
   I2C1_Wr(0 | seconds);           // write 0 to REG0 (enable counting + 0 sec)
   I2C1_Stop();                    // issue stop signal
}

//-------------------- Formats date and time -----------------------------------
void Transform_Time(char *hours, char *minutes, char *seconds) {
  *seconds  =  ((*seconds & 0x70) >> 4)*10 + (*seconds & 0x0F);
  *minutes  =  ((*minutes & 0xF0) >> 4)*10 + (*minutes & 0x0F);
  *hours   =   ((*hours & 0x30) >> 4)*10 + (*hours & 0x0F);
}