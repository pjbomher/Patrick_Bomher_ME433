#include "spi.h"
#include<xc.h>           // processor SFR definitions
#include<sys/attribs.h>  // __ISR macro
#define CS_T LATBbits.LATB9
char temp1=0,temp2=0;
unsigned short z1,z2, tempy, tempx;


void spi_init(){
#define CS LATBbits.LATB15// B15 is CS pin
    TRISBbits.TRISB15= 0;
    RPB13Rbits.RPB13R= 0b0011;
    SDI1Rbits.SDI1R= 0b0000;
    SPI1BRG= 0x1;
    RPB15Rbits.RPB15R= 0b0011;
    CS = 1;

    // Master - SPI4, pins are: SDI4(F4), SDO4(F5), SCK4(F13).  
    // we manually control SS4 as a digital output (F12)
    // since the pic is just starting, we know that spi is off. We rely on defaults here

    // setup spi1 , all bits must be changed for SPI1 from SPI4
    SPI1CON = 0;              // turn off the spi module and reset it
    SPI1BUF;                  // clear the rx buffer by reading from it
    SPI1STATbits.SPIROV = 0;  // clear the overflow bit
    SPI1CONbits.CKE = 1;      // data changes when clock goes from hi to lo (since CKP is 0)
    SPI1CONbits.MSTEN = 1;    // master operation
    SPI1CONbits.ON = 1;       // turn on spi 1
            
}

unsigned char spi1_IO(unsigned char write){
    SPI1BUF = write;
  while(!SPI1STATbits.SPIRBF) { // wait to receive the byte
    ;
  }
    
  return SPI1BUF;
}

void setVoltage(char channel, int voltage){
    int voltage_t= voltage;
    unsigned char BGS= 0b111;
    char C1= channel<<7;
    C1= C1|BGS<<4;
    C1= C1|voltage_t>>8;
    unsigned char C2= voltage_t;
    CS=0;
    spi1_IO(C1);
    spi1_IO(C2);
    CS=1;
}

void XPT2046_read(unsigned short *x, unsigned short *y, unsigned int *z){
    temp1=0;
    temp2=0;
    
    
    char m= 0b11010001;         //001= y
    CS_T=0;                     //011= z1
    spi1_IO(m);             //100=z2
    temp1= spi1_IO(0x00);             //101=x
    temp2= spi1_IO(0x00);
    CS_T=1;
    tempx= temp1<<8;
    *x= ((tempx|(temp2))>>3)&0xfff;
    
     m= 0b10010001;         //001= y
    CS_T=0;                     //011= z1
    spi1_IO(m);             //100=z2
    temp1= spi1_IO(0x00);             //101=x
    temp2= spi1_IO(0x00);
    CS_T=1;
    tempy= temp1<<8;
    *y= ((tempy|(temp2))>>3)&0xfff;
            
    m= 0b10110001;         //001= y
    CS_T=0;                     //011= z1
    spi1_IO(m);             //100=z2
    temp1= spi1_IO(0x00);             //101=x
    temp2= spi1_IO(0x00);
    CS_T=1;
    z1= temp1<<8;
    z1= ((z1|(temp2))>>3)&0xfff;
    
    m= 0b11000001;         //001= y
    CS_T=0;                     //011= z1
    spi1_IO(m);             //100=z2
    temp1= spi1_IO(0x00);             //101=x
    temp2= spi1_IO(0x00);
    CS_T=1;
    z2= temp1<<8;
    z2= ((z2|(temp2))>>3)&0xfff;
    *z= z2-z1+4095;

    
}