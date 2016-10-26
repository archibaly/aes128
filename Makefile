#CC           = avr-gcc
#CFLAGS       = -Wall -mmcu=atmega16 -Os -Wl,-Map,test.map
#OBJCOPY      = avr-objcopy
CC           = gcc
CFLAGS       = -Wall -Os -Wl,-Map,test.map
OBJCOPY      = objcopy

# include path to AVR library
INCLUDE_PATH = /usr/lib/avr/include
# splint static check
SPLINT       = splint test.c aes_128.c -I$(INCLUDE_PATH) +charindex -unrecog

.SILENT:
.PHONY:  lint clean


rom.hex : test.out
	# copy object-code to new image and format in hex
	$(OBJCOPY) -j .text -O ihex test.out rom.hex

test.o : test.c
	# compiling test.c
	$(CC) $(CFLAGS) -c test.c -o test.o

aes_128.o : aes_128.h aes_128.c
	# compiling aes_128.c
	$(CC) $(CFLAGS) -c aes_128.c -o aes_128.o

test.out : aes_128.o test.o
	# linking object code to binary
	$(CC) $(CFLAGS) aes_128.o test.o -o test.out

small: test.out
	$(OBJCOPY) -j .text -O ihex test.out rom.hex

clean:
	rm -f *.OBJ *.LST *.o *.gch *.out *.hex *.map

lint:
	$(call SPLINT)
