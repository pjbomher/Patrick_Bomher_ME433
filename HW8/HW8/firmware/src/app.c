#include "../HW8.X/spi.h"
#include "../HW8.X/i2c_master_noint.h"
#include "../HW8.X/ili9341.h"
#include "app.h"
#include <stdio.h>



APP_DATA appData;

unsigned char m[100];
    char mes[100];
    signed short temp,gx,gy,gz,wx,wy,wz;
        unsigned short kk;



void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;

    
    __builtin_disable_interrupts();

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
            
            unsigned short kk;
    for(kk=0;kk<240;kk++){
        LCD_drawPixel(kk,200,0xf800);
        LCD_drawPixel(120,80+kk,0xf800);
        LCD_drawPixel(120,200,0xffff);
    }
    
    __builtin_enable_interrupts();
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
    
            break;
        }

        
        

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
