#ifndef S21_CAT_H_
#define S21_CAT_H_
#define _GNU_SOURCE

#include <getopt.h>
#include <stdio.h>

#define SIZE 4096

typedef struct {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
} Flags;

int flag_parser(int argc, char *argv[], Flags *flag);
void read_and_print_file(char *argv[], Flags *flag);
void handle_flag_v(int cur_char);

#endif