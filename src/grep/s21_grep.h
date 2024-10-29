#ifndef S21_GREP_H
#define S21_GREP_H

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define _GNU_SOURCE
#define MAX_PATTERNS 100
#define MAX_LENGTH 4096

typedef struct {
  int e;  // extended regexp;
  int i;  // ignore case;
  int v;  // invert match;
  int c;  // count only;
  int l;  // print filename;
  int n;  // print line number;
  int h;  // no filename;
  int s;  // no error messages;
  int f;  // file patterns;
  int o;  // only matching;
} Flags;

void parse_flags(int argc, char *argv[], Flags *flag, int *pattern_count,
                 char patterns[][MAX_LENGTH]);
void compile_regex(regex_t *regex, char *pattern, Flags *flag);
void grep_file(char *pattern, char *filename, Flags *flag, int *num_files);
void read_file(FILE *file, regex_t *regex, Flags *flag, char *filename,
               int *num_files);
void read_patterns_from_file(char *filename, char patterns[][MAX_LENGTH],
                             int *pattern_count);
void handle_flag_e(int argc, char *argv[], int optind, Flags *flag,
                   char patterns[][MAX_LENGTH], int *pattern_count);
void handle_flag_f(int argc, char *argv[], int optind, Flags *flag,
                   char patterns[][MAX_LENGTH], int *pattern_count);
void handle_flags(int argc, char *argv[], int optind, Flags *flag);

#endif
