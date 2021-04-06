CC=gcc
CFLAGS= -g -O -Wall -Wextra
OBJ= logger.o
LIBS = -lpthread
INCLUDE = -I. 
FIFOPATH = ./General-FIFO
ARFLAGS= -rcs


liblogger.a: logger.o $(FIFOPATH)/fifo.o
	ar $(ARFLAGS) $@ $^
	
logger.o: logger.c logger.h
	$(CC) $(CFLAGS) -c $<

*/fifo.o:
	$(MAKE) -C $(FIFOPATH) fifo.o

.PHONY: clean
clean:
	rm -rf *.o *.a *.gch && $(MAKE) -C $(FIFOPATH) clean