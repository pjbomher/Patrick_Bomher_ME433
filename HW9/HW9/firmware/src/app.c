
#include "../HW9.X/spi.h"
#include "../HW9.X/i2c_master_noint.h"
#include "../HW9.X/ili9341.h"
#include "app.h"
#include <stdio.h>

APP_DATA appData;

char m[100],ind,hold=0,plus=0,minus=0,pcount=0,mcount=0;
unsigned short x1,y1,x2,y2,x3,y3,x,y;
unsigned int ticks,z1,z2,z3,z;
float time=200;
int count=1,count2=0;
/* TODO:  Add any necessary local functions.
*/
unsigned short voting_alg(unsigned short read1, unsigned short read2, unsigned short read3,char ind, unsigned short current);
unsigned int voting_alg2(unsigned int read1, unsigned int read2, unsigned int read3);



void APP_Initialize ( void )
{
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
    TRISBbits.TRISB9= 0;

    LATAbits.LATA4= 0;
    
    //i2c_master_setup();
    SPI1_init();
    LCD_init();
    
    LCD_clearScreen(0xf800);
    
    char ii, jj;
    
    for(ii=0;ii<30;ii++){
        for(jj=0;jj<45;jj++){
            LCD_drawPixel(80+jj,100+ii,0x0000);
            LCD_drawPixel(80+jj,150+ii,0x0000);
            LCD_drawPixel(80+jj,200+ii,0x0000);
            
        }
    }
    sprintf(m,"%d",count);
    LCD_print(m,98,168,0xffff,0x0000);  
    sprintf(m,"add");
    LCD_print(m,93,118,0xffff,0x0000);  //l:1480 r:2112 t:2790 b:2470
    sprintf(m,"less");
    LCD_print(m,90,218,0xffff,0x0000);  //l:1480 r:2110 t:1700 b:1380
    
    
    _CP0_SET_COUNT(0);
    appData.state = APP_STATE_INIT;

    
    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
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
            ind=0;
            XPT2046_read(&x1,&y1,&z1);
            XPT2046_read(&x2,&y2,&z2);
            XPT2046_read(&x3,&y3,&z3);
            z= voting_alg2(z1,z2,z3);
            if (z>10){
                ind=1;
            }
            
                    
            x= voting_alg(x1,x2,x3,ind,x);
            y= voting_alg(y1,y2,y3,ind,y);
            
            
            sprintf(m,"x location:  %d     ",x);
            LCD_print(m,10,20,0x0000,0xf800);
            sprintf(m,"y location:  %d     ",y);
            LCD_print(m,10,30,0x0000,0xf800);
            sprintf(m,"Amount of depression:  %u        ",z);
            LCD_print(m,10,40,0x0000,0xf800);
            sprintf(m,"refresh per second:  %f     ",time);
            LCD_print(m,10,50,0x0000,0xf800);
            
            
            if (ind & (!hold)){
                hold=1;
            }
            if(x<2110 && x>1480){
                if(plus==0 && y<2790 && y>2470){
                    plus=1;
                }
            }
            if(x<2110 && x>1480){
                if(minus==0 && y<1700 && y>1380){
                    mcount++;
                    if (mcount==2){
                        minus=1;
                        mcount=0;
                    }
                }
            }
            if ((!ind)&hold){
                count2++;
                if(count2==5){
                    count=count+plus-minus;
                    
                    
                    count2=0;
                    hold=0;
                    plus=0;
                    minus=0;
                }
            }
            sprintf(m,"%d   ",count);
            LCD_print(m,98,168,0xffff,0x0000);
            
            
            ticks=_CP0_GET_COUNT();
            //time= 24000000/ticks;
            _CP0_SET_COUNT(0);
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

unsigned short voting_alg(unsigned short read1, unsigned short read2, unsigned short read3,char ind,unsigned short current){
    unsigned short final;
    
    
        if(read1<4000){
            final=read1;
        }
        else if(read2<4000){
            final=read2;
            
        }
        else if(read3<4000){
            final=read3;
            
        }
        else{
            final=current;
        }
    
    if(!ind){
        final=0;
    }
        
    
    
    return final;
}/*unsigned short temp1,temp2,temp3,final;
    temp1= (read1-read2)^2;
    temp2= (read2-read3)^2;
    temp3= (read3-read1)^2;
    
    if (temp1<temp2 && temp1<temp3){
        final= (read1+read2)/2;
    }
    else if(temp2<temp1 && temp2<temp3){
        final= (read3+read2)/2;

    }
    else{
        final= (read1+read3)/2;
    }
return final;
}*/

unsigned int voting_alg2(unsigned int read1, unsigned int read2, unsigned int read3){
    unsigned int final3=0,count=0;
    long unsigned int final2;
    if((read1>7000&&read2>7000&&read3>7000)||(read1<7000&&read2<7000&&read3<7000)){
        final2= (read1+read2+read3)/3;
        final3=final2;
    }
    /*else{
        if(read1<7000){
            final2=read1;
            count=1;
        }
        if(read2<7000){
            final2=final2+read2;
            count=count++;
        }
        if(read3<7000){
            final2=final2+read3;
            count=count++;
        }
        if(count>0){
        final2=final2/count;
        }
    }*/
    return final3;
}


/*******************************************************************************
 End of File
 */
