
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include <string.h>

typedef struct {
  int N;          // Amount of computers
  int M;          // Amount of operations
  int *adjMatrix; // Adjacency list
} Network;

void printMatrix(int *matrix, int length) {
  printf("\n");

  for (int row = 0; row < length; row++) {
    for (int col = 0; col < length; col++) {
      printf("%d ", *(matrix + row * length + col));
    }
    printf("\n");
  }
}

void init(Network *net, int N, int M) {
  net->N = N;
  net->M = M;

  int *adjMatrix = (int *)calloc(N * N, sizeof(int));
  net->adjMatrix = adjMatrix;
}

void add_cable(Network *net, int u, int v) {
  net->adjMatrix[u * net->N + v] = 1;
  net->adjMatrix[v * net->N + u] = 1;
}

bool DFS(Network *net, int current, int target, bool visited[]) {
  if (current == target) {
    return true;
  }
  visited[current] = true;

  for (int i = 0; i < net->N; i++) {
    if (net->adjMatrix[current * net->N + i] == 1 && !visited[i]) {
      if (DFS(net, i, target, visited)) {
        return true;
      }
    }
  }
  return false;
}

bool is_connected(Network *net, int u, int v) {
  bool visited[net->N];
  memset(visited, false, sizeof(visited));

  return DFS(net, u, v, visited);
}

int main() {
  Network net;

  int N, M;

  scanf("%d %d", &N, &M);

  init(&net, N, M);

  for (int i = 1; i < M; i++) {
    int A, B;  // Puters
    char pref; // Prefix, A for add cable, C for connected

    scanf(" %c %d %d\n", &pref, &A, &B);

    if (pref == 'A') {
      add_cable(&net, A, B);
    }

    if (pref == 'C') {
      bool con = is_connected(&net, A, B);

      if (con) {
        printf("\nLine %d is result of the %d'th connected operation",
               net.M + 1, net.M);
      } else {
        printf("\nComputer %d and %d are not connected", A, B);
      }
    }
  }

  printMatrix(net.adjMatrix, net.N);

  free(net.adjMatrix);
  return 0;
}
