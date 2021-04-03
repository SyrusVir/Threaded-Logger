CC=gcc
CFLAGS= -O
OBJ= logger.o
LIBS = -lfifo -lpthread
INCLUDE = -I . 
FIFOPATH = ./General-FIFO
ARFLAGS= -rcs

.PHONY: all
all: liblogger.a

liblogger.a: logger.o $(FIFOPATH)/fifo.o
	ar $(ARFLAGS) $@ $^
	
logger.o: logger.c logger.h
	gcc $(CFLAGS) -c logger.c 

$(FIFOPATH)/fifo.o:
	$(MAKE) -C $(FIFOPATH)

.PHONY: clean
clean:
	rm -rf *.o *.a 