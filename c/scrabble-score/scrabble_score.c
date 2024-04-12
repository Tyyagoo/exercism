#include <ctype.h>
#include <string.h>
#include "scrabble_score.h"

typedef struct {
  char *letters;
  int value;
} score_t;

score_t scores[7] = {
  { "AEIOULNRST", 1 },
  { "DG", 2 },
  { "BCMP", 3 },
  { "FHVWY", 4 },
  { "K", 5},
  { "JX", 8 },
  { "QZ", 10 },
};

unsigned int score(const char *word) {
  int i = 0, acc = 0;
  while (word[i] != '\0') {
    for (int j = 0; j < 7; j++) {
      if (strchr(scores[j].letters, toupper(word[i]))) {
        acc += scores[j].value;
        break;
      }
    }
    i++;
  }
  return acc;
}
