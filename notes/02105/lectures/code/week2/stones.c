#include <stdio.h>
#include <stdlib.h>

int compare(const void *a, const void *b) { return (*(int *)a - *(int *)b); }

int main() {
  // Josefine likes to go to the beach and collect stones. Josefine likes to
  // bring home as many stones as possible, but she can only carry $W$ kilograms
  // of stones. Give an algorithm that, given a list of the weights of $N$
  // stones and the maximum weight $W$, determines the maximal number of stones
  // she can bring home that day.
  int maxWeight = 10;
  int stones[] = {5, 2, 4, 1, 2, 7, 10};

  int curr = 0;
  int count = 0;

  int length = sizeof(stones) / sizeof(stones[0]);

  qsort(&stones, length, sizeof(int), compare);

  for (int i = 0; i < length - 1; i++) {
    if (curr >= maxWeight)
      break;

    if ((curr + stones[i]) > maxWeight)
      break;

    curr += stones[i];
    count++;
  }

  printf("maxWeight: %d\ncount: %d\ncurrent weight: %d", maxWeight, count,
         curr);

  return 0;
}
