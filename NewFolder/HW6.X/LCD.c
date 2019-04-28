#include<xc.h>           // processor SFR definitions
#include<sys/attribs.h>  // __ISR macro
#include"ili9341.h"
#include<stdio.h> 

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
    SPI1_init();
    LCD_init();   
    //LATAbits.LATA4= 1;
    
    __builtin_enable_interrupts();
    
    LCD_clearScreen(0xf800);
    while(1){
        char m[20];
        _CP0_SET_COUNT(0);
        int jj,ii=0;
        LCD_draw_letter(0x7c-0x20,27,87,0x0000,0xf800);
        LCD_draw_letter(0x7c-0x20,127,87,0x0000,0xf800);

        for (jj=0;jj<101;jj++){
            LCD_drawPixel(29+jj,79,0x0000);
            LCD_drawPixel(29+jj,86,0x0000);

        }
        
        while(_CP0_GET_COUNT()<240000){
            ;
        }
            sprintf(m,"Hello world %d!");
            LCD_print(m,28,40,0x0000,0xf800);
            
            LATAbits.LATA4= !LATAbits.LATA4;
            //LCD_draw_letter(10,10,20,0x0000,0xf800);
            //LCD_draw_letter(11,15,20,0x0000,0xf800);
        
        
    }
    
}

void LCD_print(char* mes, short x, short y, short font, short bg){
    //char mes[2];
    //mes[0]= 40;
    //mes[1]= 31;
    //mes[2]=0;
    
    int t=0;
    while(mes[t]){
        LCD_draw_letter(mes[t]-0x20,x+5*t,y,font,bg);
        t++;
    }
}

void LCD_draw_letter(char letter, short x, short y, short font, short bg){
    char i;
    for(i=0;i<5;i++){
        char col= ASCII[letter][i];
        
        char j;
        for(j=0;j<8;j++){
            char BIT= (col>>(7-j))&0b1;
            
            if(BIT==1){
                LCD_drawPixel(x+i,y-j,font);
            }
            
            else{
                LCD_drawPixel(x+i,y-j,bg);

            }
        }
    } 
}