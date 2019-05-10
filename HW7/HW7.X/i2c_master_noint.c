#include<xc.h>           // processor SFR definitions
#include<sys/attribs.h>  
#include "i2c_master_noint.h"
// The functions must be callled in the correct order as per the I2C protocol
// Change I2C1 to the I2C channel you are using
// I2C pins need pull-up resistors, 2k-10k


void i2c_master_setup(void) {
  I2C2BRG = 0x035;           // I2CBRG = [1/(2*Fsck) - PGD]*Pblck - 2  PGD=104 ns
                                    // look up PGD for your PIC32
  I2C2CONbits.ON = 1;               // turn on the I2C1 module
}

// Start a transmission on the I2C bus
void i2c_master_start(void) {
    I2C2CONbits.SEN = 1;            // send the start bit
    while(I2C2CONbits.SEN) { ; }    // wait for the start bit to be sent
}

void i2c_master_restart(void) {     
    I2C2CONbits.RSEN = 1;           // send a restart 
    while(I2C2CONbits.RSEN) { ; }   // wait for the restart to clear
}

void i2c_master_send(unsigned char byte) { // send a byte to slave
  I2C2TRN = byte;                   // if an address, bit 0 = 0 for write, 1 for read
  while(I2C2STATbits.TRSTAT) { ; }  // wait for the transmission to finish
  if(I2C2STATbits.ACKSTAT) {        // if this is high, slave has not acknowledged
    // ("I2C2 Master: failed to receive ACK\r\n");
  }
}

unsigned char i2c_master_recv(void) { // receive a byte from the slave
    I2C2CONbits.RCEN = 1;             // start receiving data
    while(!I2C2STATbits.RBF) { ; } 
    LATAbits.LATA4= 1;  // wait to receive the data
    return I2C2RCV;                   // read and return the data
}

void i2c_master_ack(int val) {        // sends ACK = 0 (slave should send another byte)
                                      // or NACK = 1 (no more bytes requested from slave)
    I2C2CONbits.ACKDT = val;          // store ACK/NACK in ACKDT
    I2C2CONbits.ACKEN = 1;            // send ACKDT
    while(I2C2CONbits.ACKEN) { ; }    // wait for ACK/NACK to be sent
}

void i2c_master_stop(void) {          // send a STOP:
  I2C2CONbits.PEN = 1;                // comm is complete and master relinquishes bus
  while(I2C2CONbits.PEN) { ; }        // wait for STOP to complete
}

void initExpander(void){
    
    
    i2c_master_setup();
    
    i2c_master_start();
    char b= 0b01000000;
    i2c_master_send(b);
    i2c_master_send(0x00);
    i2c_master_send(0b11110000);
    i2c_master_stop();
}

void setExpander(char level){
    i2c_master_start();
    char b= 0b01000000;
    i2c_master_send(b);
    i2c_master_send(0x0A);  //OLAT register
    i2c_master_send(level);
    i2c_master_stop();
}

unsigned char getExpander() {
    i2c_master_start();
    char b= 0b01000000;
    i2c_master_send(b);
    i2c_master_send(0x09);
    i2c_master_restart();
    b= 0b01000001;
    i2c_master_send(b);
    unsigned char r=i2c_master_recv();
    i2c_master_ack(1);
    i2c_master_stop();
    return r;
}

void imu_init() {
    ANSELBbits.ANSB2 = 0;
    ANSELBbits.ANSB3 = 0;
    
    i2c_master_start();
    char b= 0b11010110;
    i2c_master_send(b);
    i2c_master_send(0x10);  //OLAT register
    i2c_master_send(0b10000010);
    i2c_master_stop();
    
    i2c_master_start();
     b= 0b11010110;
    i2c_master_send(b);
    i2c_master_send(0x11); 
    i2c_master_send(0b10001000);
    i2c_master_stop();
    
    i2c_master_start();
     b= 0b11010110;
    i2c_master_send(b);
    i2c_master_send(0x12); 
    i2c_master_send(0b00000100);
    i2c_master_stop();
}