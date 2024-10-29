CC=gcc
CFLAGS=-Wall -Werror -Wextra -std=c11

all: s21_cat

s21_cat : s21_cat.o
	$(CC) $(CFLAGS) s21_cat.o -o s21_cat

s21_cat.o : s21_cat.c
	$(CC) $(CFLAGS) -c s21_cat.c
	
test: s21_cat
	bash cat_test.sh

rebuild:
	make clean
	make all

clean: 
	rm -f *.o *.out
	rm -f s21_cat
