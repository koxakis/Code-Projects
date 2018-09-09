CC=gcc
CFLAGS= -Wall -g -std=c11 -I.
DEPS= movment.h
OBJ= main_game.o movment.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

main_game: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean_obj:
	rm $(OBJ) 

clean_all:
	rm $(OBJ) main_game
