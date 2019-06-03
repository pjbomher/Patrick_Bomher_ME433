#ifndef spi_H
#define spi_H
#endif

void spi_init();
unsigned char spi1_IO(unsigned char write);
void setVoltage(char channel, int voltage);
void XPT2046_read(unsigned short *x, unsigned short *y, unsigned int *z);