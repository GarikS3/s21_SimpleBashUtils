#include "s21_grep.h"

int main(int argc, char *argv[]) {
  Flags flag = {0};
  int pattern_count = 0;
  char patterns[MAX_PATTERNS][MAX_LENGTH] = {0};

  parse_flags(argc, argv, &flag, &pattern_count, patterns);

  if (optind < argc) {
    if (flag.e)
      handle_flag_e(argc, argv, optind, &flag, patterns, &pattern_count);
    else if (flag.f)
      handle_flag_f(argc, argv, optind, &flag, patterns, &pattern_count);
    else
      handle_flags(argc, argv, optind, &flag);
  } else {
    printf("No pattern and no input files\n");
  }

  return 0;
}

void parse_flags(int argc, char *argv[], Flags *flag, int *pattern_count,
                 char patterns[][MAX_LENGTH]) {
  int current_flag;
  while ((current_flag = getopt(argc, argv, "e:ivclnhsfo")) != -1) {
    switch (current_flag) {
      case 'e':
        flag->e = 1;
        strncpy(patterns[*pattern_count], optarg, MAX_LENGTH - 1);
        patterns[*pattern_count][MAX_LENGTH - 1] = '\0';
        (*pattern_count)++;
        break;
      case 'i':
        flag->i = 1;
        break;
      case 'v':
        flag->v = 1;
        break;
      case 'c':
        flag->c = 1;
        break;
      case 'l':
        flag->l = 1;
        break;
      case 'n':
        flag->n = 1;
        break;
      case 'h':
        flag->h = 1;
        break;
      case 's':
        flag->s = 1;
        break;
      case 'f':
        flag->f = 1;
        break;
      case 'o':
        flag->o = 1;
        break;
      default:
        exit(1);
    }
  }
}

void compile_regex(regex_t *regex, char *pattern, Flags *flag) {
  int regex_flags = REG_EXTENDED;
  if (flag->i) {
    regex_flags |= REG_ICASE;
  }
  if (regcomp(regex, pattern, regex_flags) != 0) {
    printf("Error compiling regular expression\n");
    exit(1);
  }
}

void grep_file(char *pattern, char *filename, Flags *flag, int *num_files) {
  regex_t regex;
  FILE *file = fopen(filename, "r");
  if (file == NULL) {
    if (!flag->s) printf("No such file or directory\n");
    exit(1);
  }

  compile_regex(&regex, pattern, flag);
  read_file(file, &regex, flag, filename, num_files);

  fclose(file);
  regfree(&regex);
}

void read_file(FILE *file, regex_t *regex, Flags *flag, char *filename,
               int *num_files) {
  char line[MAX_LENGTH];
  int line_number = 0;
  int match_count = 0;
  regmatch_t match[1];

  while (fgets(line, MAX_LENGTH, file) != NULL) {
    line_number++;

    if ((regexec(regex, line, 0, match, 0) == 0) != flag->v) {
      match_count++;
      if (!flag->c) {
        if (flag->l) {
          printf("%s\n", filename);
          break;
        } else if (flag->n) {
          *num_files > 1 ? printf("%s:%d:%s", filename, line_number, line)
                         : printf("%d:%s", line_number, line);
        } else if (flag->h) {
          printf("%s", line);
        } else if (flag->f) {
          *num_files > 1 ? printf("%s:%s", filename, line) : printf("%s", line);
        } else if (flag->o) {
          int shift = 0;
          while (regexec(regex, line + shift, 1, match, 0) == 0) {
            *num_files > 1
                ? printf("%s:%.*s\n", filename,
                         (int)(match[0].rm_eo - match[0].rm_so),
                         line + shift + match[0].rm_so)
                : printf("%.*s\n", (int)(match[0].rm_eo - match[0].rm_so),
                         line + shift + match[0].rm_so);
            shift += match[0].rm_eo;
          }
        } else {
          *num_files > 1 ? printf("%s:%s", filename, line) : printf("%s", line);
        }
      }
    }
  }
  if (flag->c) {
    *num_files > 1 ? printf("%s:%d\n", filename, match_count)
                   : printf("%d\n", match_count);
  }
}

void read_patterns_from_file(char *filename, char patterns[][MAX_LENGTH],
                             int *pattern_count) {
  FILE *file = fopen(filename, "r");
  if (file != NULL) {
    char line[MAX_LENGTH];
    while (fgets(line, sizeof(line), file) != NULL) {
      line[strcspn(line, "\n")] = '\0';
      strncpy(patterns[*pattern_count], line, MAX_LENGTH - 1);
      patterns[*pattern_count][MAX_LENGTH - 1] = '\0';
      (*pattern_count)++;
    }
    fclose(file);
  } else {
    printf("Error opening pattern file\n");
  }
}

void handle_flag_e(int argc, char *argv[], int optind, Flags *flag,
                   char patterns[][MAX_LENGTH], int *pattern_count) {
  int file_index = optind;
  int num_files = argc - file_index;

  if (num_files >= 1) {
    for (int i = file_index; i < argc; i++) {
      for (int j = 0; j < *pattern_count; j++) {
        grep_file(patterns[j], argv[i], flag, &num_files);
      }
    }
  } else {
    printf("No input files\n");
  }
}

void handle_flag_f(int argc, char *argv[], int optind, Flags *flag,
                   char patterns[][MAX_LENGTH], int *pattern_count) {
  int file_index = optind + 1;
  int num_files = argc - file_index;

  if (num_files >= 1) {
    read_patterns_from_file(argv[optind], patterns, pattern_count);
    for (int i = file_index; i < argc; i++) {
      for (int j = 0; j < *pattern_count; j++) {
        grep_file(patterns[j], argv[i], flag, &num_files);
      }
    }
  } else {
    printf("No input files\n");
  }
}

void handle_flags(int argc, char *argv[], int optind, Flags *flag) {
  int pattern_index = optind++;
  int file_index = optind;
  int num_files = argc - file_index;

  if (num_files >= 1) {
    for (int i = file_index; i < argc; i++) {
      grep_file(argv[pattern_index], argv[i], flag, &num_files);
    }
  } else {
    printf("No input files\n");
  }
}