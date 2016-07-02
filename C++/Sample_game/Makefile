OBJS = build/debug/main.o build/debug/graphics.o
CC = g++
CFLAGS = -Wall -c
LFLAGS = -Wall

all : $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o runme

# all replaces this with the same effect
#
#runme : build/debug/main.o build/debug/graphics.o
#	g++ build/debug/main.o build/debug/graphics.o -o build/debug/runme

build/debug/graphics.o : source/src/graphics.cpp source/headers/graphics.h
	$(CC) $(CFLAGS) source/src/graphics.cpp -o build/debug/graphics.o
	#g++ -c -Wall source/src/graphics.cpp -o build/debug/graphics.o

build/debug/main.o : source/src/main.cpp
	$(CC) $(CFLAGS) source/src/main.cpp -o build/debug/main.o
	#g++ -c -Wall source/src/main.cpp -o build/debug/main.o

clean :
	\rm build/debug/*.o

tar :
	tar cfv tarTest.tar Makefile *.cpp *.h
