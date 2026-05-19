#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int i;
  int j;
  int p;
} Connection;

void u_init(int n, int *parent, int *size) {
  for (int i = 0; i < n; i++) {
    parent[i] = i;
    size[i] = 1;
  }
}
int u_find(int x, int *parent) {
  while (parent[x] != x) {
    parent[x] = parent[parent[x]];
    x = parent[x];
  }
  return x;
}
void unite(int i, int j, int *size, int *parent) {
  int ri = u_find(i, parent), rj = u_find(j, parent);
  if (ri == rj)
    return;
  if (size[ri] < size[rj]) {
    int tmp = ri;
    ri = rj;
    rj = tmp;
  }
  parent[rj] = ri;
  size[ri] += size[rj];
}

int main() {

  int N, M;
  scanf("%d %d", &N, &M);

  Connection connections[M];

  int *parent = (int *)calloc(N, sizeof(int));
  int *size = (int *)calloc(N, sizeof(int));
  for (int iter = 0; iter < M; iter++) {
    int i, j, p;

    scanf(" %d %d %d", &i, &j, &p);
    connections[iter] = (Connection){i, j, p};
  }

  // sort by weight p
  for (int i = 0; i < M - 1; i++) {
    for (int j = 0; j < M - i - 1; j++) {
      if (connections[j].p > connections[j + 1].p) {
        Connection temp = connections[j];
        connections[j] = connections[j + 1];
        connections[j + 1] = temp;
      }
    }
  }

  u_init(N, parent, size);

  int total_cost = 0;
  for (int iter = 0; iter < M; iter++) {
    int i = connections[iter].i;
    int j = connections[iter].j;
    int p = connections[iter].p;

    if (u_find(i, parent) != u_find(j, parent)) {
      unite(i, j, size, parent);
      total_cost += p;
    }
  }

  printf("Total lowest possible cost of connecting all nodes: %d\n",
         total_cost);

  return 0;
}
