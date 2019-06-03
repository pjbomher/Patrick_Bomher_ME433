#include "i2c_master_noint.h"
#include "ili9341.h"
#include<xc.h>           // processor SFR definitions
#include<sys/attribs.h>  // __ISR macro
#include <stdio.h>
#define CS LATBbits.LATB7

void I2C_read_multiple(unsigned char address, unsigned char reg, unsigned char * data, int length);
signed short make_int(unsigned char datasmall, unsigned char databig);
void WHOAMI(char * data);

// DEVCFG0
#pragma config DEBUG = OFF // no debugging
#pragma config JTAGEN = OFF // no jtag
#pragma config ICESEL = ICS_PGx1 // use PGED1 and PGEC1
#pragma config PWP = OFF // no write protect
#pragma config BWP = OFF // no boot write protect
#pragma config CP = OFF // no code protect

// DEVCFG1
#pragma config FNOSC = PRIPLL // use primary oscillator with pll
#pragma config FSOSCEN = OFF // turn off secondary oscillator
#pragma config IESO = OFF // no switching clocks
#pragma config POSCMOD = HS // high speed crystal mode
#pragma config OSCIOFNC = OFF // disable secondary osc
#pragma config FPBDIV = DIV_1 // divide sysclk freq by 1 for peripheral bus clock
#pragma config FCKSM = CSDCMD // do not enable clock switch
#pragma config WDTPS = PS1048576 // use slowest wdt
#pragma config WINDIS = OFF // wdt no window mode
#pragma config FWDTEN = OFF // wdt disabled
#pragma config FWDTWINSZ = WINSZ_25 // wdt window at 25%

// DEVCFG2 - get the sysclk clock to 48MHz from the 8MHz crystal
#pragma config FPLLIDIV = DIV_2 // divide input clock to be in range 4-5MHz
#pragma config FPLLMUL =  MUL_24// multiply clock after FPLLIDIV
#pragma config FPLLODIV = DIV_2 // divide clock after FPLLMUL to get 48MHz
#pragma config UPLLIDIV = DIV_2 // divider for the 8MHz input clock, then multiplied by 12 to get 48MHz for USB
#pragma config UPLLEN = ON // USB clock on

// DEVCFG3
#pragma config USERID = 0xffff // some 16bit userid, doesn't matter what
#pragma config PMDL1WAY = ON // allow multiple reconfigurations
#pragma config IOL1WAY = OFF // allow multiple reconfigurations
#pragma config FUSBIDIO = ON // USB pins controlled by USB module
#pragma config FVBUSONIO = ON // USB BUSON controlled by USB module

int main() {

    __builtin_disable_interrupts();

    TRISBbits.TRISB15=0;
    // set the CP0 CONFIG register to indicate that kseg0 is cacheable (0x3)
    __builtin_mtc0(_CP0_CONFIG, _CP0_CONFIG_SELECT, 0xa4210583);

    // 0 data RAM access wait states
    BMXCONbits.BMXWSDRM = 0x0;

    // enable multi vector interrupts
    INTCONbits.MVEC = 0x1;

    // disable JTAG to get pins back
    DDPCONbits.JTAGEN = 0;

    // do your TRIS and LAT commands here
    
    TRISAbits.TRISA4= 0;
    TRISBbits.TRISB4= 1;
    LATAbits.LATA4= 0;
    
    i2c_master_setup();
    SPI1_init();
    LCD_init();
    imu_init();
    
    LCD_clearScreen(0xf800);
    
    unsigned char m[100];
    char mes[100];
    signed short temp,gx,gy,gz,wx,wy,wz;
           // LATAbits.LATA4= 0;
    
    //WHOAMI
    i2c_master_start();
    char b= 0b11010110;
    i2c_master_send(b);
    i2c_master_send(0x0f);
    i2c_master_restart();
    b= 0b11010111;
    i2c_master_send(b);
    char r=i2c_master_recv();
    i2c_master_ack(1);
    i2c_master_stop();
    LCD_clearScreen(0x0000);

    
    
    //I2C_read_multiple(0,0x0f,m,1);
            LATAbits.LATA4= 1;

    if(r==0b01101001){
        //LATAbits.LATA4= 1;
    }
    else{
        //LATAbits.LATA4= 1;
        while(1){
            ;}
    }
    __builtin_enable_interrupts();
    unsigned short kk;
    for(kk=0;kk<240;kk++){
        LCD_drawPixel(kk,200,0xf800);
        LCD_drawPixel(120,80+kk,0xf800);
        LCD_drawPixel(120,200,0xffff);
    }
    
    while(1){
        //LATAbits.LATA4= !LATAbits.LATA4;
        _CP0_SET_COUNT(0);
        while(_CP0_GET_COUNT()<12000){
            //LATAbits.LATA4= 1;
        }
        I2C_read_multiple(0,0x20,m,14);
        temp= make_int(m[0],m[1]);
        wx= make_int(m[2],m[3]);
        wy= make_int(m[4],m[5]);
        wz= make_int(m[6],m[7]);
        gx= make_int(m[8],m[9]);
        gy= make_int(m[10],m[11]);
        gz= make_int(m[12],m[13]);
        
        sprintf(mes,"Temperature:  %d",temp);
        LCD_print(mes,10,12,0x0000,0xf800);
        sprintf(mes,"Angular velocity in x:  %d",wx);
        LCD_print(mes,10,22,0x0000,0xf800);
        sprintf(mes,"Angular velocity in y:  %d",wy);
        LCD_print(mes,10,32,0x0000,0xf800);
        sprintf(mes,"Angular velocity in z:  %d",wz);
        LCD_print(mes,10,42,0x0000,0xf800);
        sprintf(mes,"Gx:  %d",gx/100);
        LCD_print(mes,10,52,0x0000,0xf800);
        sprintf(mes,"Gy:  %d",gy/100);
        LCD_print(mes,10,62,0x0000,0xf800);
        sprintf(mes,"Gz:  %d",gz/100);
        LCD_print(mes,10,72,0x0000,0xf800);
        
        for(kk=0;kk<120;kk++){
            if(gx>0 && kk<=(gx/100)){
                LCD_drawPixel(120+kk,200,0xffff);
                LCD_drawPixel(120-kk,200,0xf800);
            }
            if(gx>0 &&kk>(gx/100)){
                LCD_drawPixel(120+kk,200,0xf800);
                LCD_drawPixel(120-kk,200,0xf800);
            }
            if(gx<0 && kk<=(-gx/100)){
                LCD_drawPixel(120-kk,200,0xffff); 
                LCD_drawPixel(120+kk,200,0xf800);
                }
            if(gx<0 && kk >(-gx/100)){
                LCD_drawPixel(120-kk,200,0xf800);
                LCD_drawPixel(120+kk,200,0xf800);
                }   
            
            //test y now
            
            if(gy>0 && kk<(gy/100)){
                LCD_drawPixel(120,200+kk,0xffff);
                LCD_drawPixel(120,200-kk,0xf800);
            }
            if(gy>0 &&kk>(gy/100)){
                LCD_drawPixel(120,200+kk,0xf800);
                LCD_drawPixel(120,200-kk,0xf800);
            }
            if(gy<0 && kk<=(-gy/100)){
                LCD_drawPixel(120,200-kk,0xffff); 
                LCD_drawPixel(120,200+kk,0xf800);
                }
            if(gy<0 && kk >(-gy/100)){
                LCD_drawPixel(120,200-kk,0xf800);
                LCD_drawPixel(120,200+kk,0xf800);
            }
        }
    }
}

void I2C_read_multiple(unsigned char address, unsigned char reg, unsigned char * data, int length) {
    i2c_master_start();
    char b= 0b11010110;
    i2c_master_send(b);
    i2c_master_send(reg);
    i2c_master_restart();
    b= 0b11010111;
    i2c_master_send(b);
    char ii;
    for(ii=0;ii<length;ii++){
        data[ii]=i2c_master_recv();
        if(ii==length-1){i2c_master_ack(1);}
        else {i2c_master_ack(0);} 
        
    }
    i2c_master_stop();
}

signed short make_int(unsigned char datasmall, unsigned char databig){
    signed short output= (databig<<8)| datasmall;
    return output;
}

void WHOAMI(char * data){
    i2c_master_start();
    char b= 0b11010110;
    i2c_master_send(b);
    i2c_master_send(0x0f);
    i2c_master_restart();
    b= 0b11010111;
    i2c_master_send(b);
    data[0]=i2c_master_recv();
    i2c_master_ack(1);
    
    i2c_master_stop();
}
