CC=gcc
CFLAGS=-Wall -Werror -Wextra -std=c11

all: s21_grep

s21_grep : s21_grep.o
	$(CC) $(CFLAGS) s21_grep.o -o s21_grep

s21_grep.o : s21_grep.c
	$(CC) $(CFLAGS) -c s21_grep.c
	
test: s21_grep
	bash grep_test.sh

rebuild:
	make clean
	make all

clean:
	rm -f *.o *.out
	rm -f s21_grep
