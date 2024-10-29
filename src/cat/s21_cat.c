#include "s21_cat.h"

int main(int argc, char *argv[]) {
  if (argc >= 2) {
    Flags flag = {0};
    if (flag_parser(argc, argv, &flag)) {
      while (optind < argc) {
        read_and_print_file(argv, &flag);
        optind++;
      }
    }
  } else {
    printf("usage: s21_cat [-beEnstTv] [file ...]\n");
  }
  return 0;
}

int flag_parser(int argc, char *argv[], Flags *flag) {
  int current_flag, res = 1;

  struct option long_options[] = {
      {"number-nonblank", 0, 0, 'b'},
      {"number", 0, 0, 'n'},
      {"squeeze-blank", 0, 0, 's'},
      {0, 0, 0, 0},
  };

  while ((current_flag =
              getopt_long(argc, argv, "+benstvTE", long_options, 0)) != -1) {
    switch (current_flag) {
      case 'b':
        flag->b = 1;
        break;
      case 'e':
        flag->e = 1;
        flag->v = 1;
        break;
      case 'n':
        flag->n = 1;
        break;
      case 's':
        flag->s = 1;
        break;
      case 't':
        flag->t = 1;
        flag->v = 1;
        break;
      case 'v':
        flag->v = 1;
        break;
      case 'T':
        flag->t = 1;
        break;
      case 'E':
        flag->e = 1;
        break;
      default:
        res = 0;
        break;
    }
  }
  if (flag->b && flag->n) flag->n = 0;

  return res;
}

void read_and_print_file(char *argv[], Flags *flag) {
  FILE *file = fopen(argv[optind], "r");
  if (file != NULL) {
    int str_count = 1, empty_str_count = 0, last_char = '\n', cur_char;

    while ((cur_char = fgetc(file)) != EOF) {
      if (flag->s && cur_char == '\n' && last_char == '\n') {
        empty_str_count++;
        if (empty_str_count > 1) {
          continue;
        }
      } else {
        empty_str_count = 0;
      }

      if (((flag->b && cur_char != '\n') || flag->n) && last_char == '\n') {
        printf("%6d\t", str_count++);
      }

      if (flag->e && cur_char == '\n') printf("$");

      if (flag->t && cur_char == '\t') {
        printf("^I");
        last_char = cur_char;
        continue;
      }

      if (flag->v) {
        handle_flag_v(cur_char);
      } else {
        printf("%c", cur_char);
      }
      last_char = cur_char;
    }
    fclose(file);
  } else {
    printf("s21_cat: %s: No such file or directory\n", argv[optind]);
  }
}

void handle_flag_v(int cur_char) {
  if ((cur_char >= 0 && cur_char < 9) || (cur_char > 10 && cur_char < 32)) {
    printf("^%c", cur_char + 64);
  } else if (cur_char == 127) {
    printf("^?");
  } else if (cur_char >= 128 && cur_char <= 159) {
    printf("M-^%c", cur_char - 64);
  } else if (cur_char >= 160 && cur_char <= 255) {
    printf("M-%c", cur_char - 128);
  } else {
    printf("%c", cur_char);
  }
}