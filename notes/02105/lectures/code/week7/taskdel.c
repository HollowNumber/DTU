#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int size;
  int capacity;
  int *id;
  int *diff;

} Heap;

void add_to_heap(Heap *heap, int id, int diff) {
  heap->size++;

  if (heap->size > heap->capacity) {
    fprintf(stderr, "Heap has reached capacity");
    return;
  }

  heap->id[heap->size - 1] = id;
  heap->diff[heap->size - 1] = diff;

  // Bubble up

  int current = heap->size - 1;

  while (current > 0) {
    int parent = (current - 1) / 2;

    if (heap->diff[current] < heap->diff[parent]) {
      break;
    }

    int temp = heap->id[current];
    heap->id[current] = heap->id[parent];
    heap->id[parent] = temp;

    temp = heap->diff[current];
    heap->diff[current] = heap->diff[parent];
    heap->diff[parent] = temp;

    current = parent;
  }
}

void remove_from_heap(Heap *heap) {

  heap->id[0] = heap->id[heap->size - 1];
  heap->diff[0] = heap->diff[heap->size - 1];

  heap->size--;

  // Bubble down

  int current = 0;

  for (;;) {
    int left = 2 * current + 1;
    int right = 2 * current + 2;
    int largest = current;

    if (left < heap->size && heap->diff[left] > heap->diff[largest]) {
      current = left;
    }

    if (right < heap->size && heap->diff[right] > heap->diff[largest]) {
      current = right;
    }

    if (largest == current) {
      break;
    }

    int temp = heap->id[current];

    heap->id[current] = heap->id[largest];
    heap->id[largest] = temp;

    temp = heap->diff[current];
    heap->diff[current] = heap->diff[largest];
    heap->diff[largest] = temp;

    current = largest;
  }
}

int main() {

  int N;

  Heap h;

  scanf("%d", &N);

  h.id = malloc(N * sizeof(int));
  h.diff = malloc(N * sizeof(int));
  h.capacity = N;

  if (h.id == NULL || h.diff == NULL) {
    fprintf(stderr, "Could not allocate memory");
    return 1;
  };

  for (int i = 2; i < (N + 1); i++) {
    int id, diff;
    char pref;

    scanf(" %c %d %d", &pref, &id, &diff);

    if (pref == 'N') {
      add_to_heap(&h, id, diff);
    }

    if (pref == 'R') {
      printf("\nTask:\n id: %d\n diff: %d\nwas given at line %d", h.id[0],
             h.diff[0], i);
      remove_from_heap(&h);
    }
  }

  free(h.id);
  free(h.diff);

  return 0;
}
