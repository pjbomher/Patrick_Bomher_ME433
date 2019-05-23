
#include "app.h"
#include <i2c_master_noint_1.h>
#include "ili9341_1.h"
#include "spi.h"
#include<xc.h>           // processor SFR definitions
#include<sys/attribs.h>  // __ISR macro
#include <stdio.h>


APP_DATA appData;



/* TODO:  Add any necessary local functions.
*/



/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;

    
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
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Application's initial state. */
        case APP_STATE_INIT:
        {
            bool appInitialized = true;
       
        
            if (appInitialized)
            {
            
                appData.state = APP_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {
        _CP0_SET_COUNT(0);
        while (_CP0_GET_COUNT()<48000000){
            ;
        }
        LATAbits.LATA4=!LATAbits.LATA4;
        
        while(!PORTBbits.RB4){
            ;
        }
            break;
        }

        /* TODO: implement your application state machine.*/
        

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

 

/*******************************************************************************
 End of File
 */
