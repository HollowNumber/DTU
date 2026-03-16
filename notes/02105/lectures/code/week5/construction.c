#include <stdbool.h>
#include <stdio.h>
#include <string.h>

void printMatrix(int *matrix, int length) {
  for (int row = 0; row < length; row++) {
    for (int col = 0; col < length; col++) {
      printf("%d ", *(matrix + row * length + col));
    }
    printf("\n");
  }
}

bool DFS(int *matrix, int length, int a, int b, bool visited[]) {
  for (int i = 0; i < length; i++) {
    if (*(matrix + a * length + i) == 1 && !visited[i]) {
      visited[i] = true;
      if (i == b) {
        return true;
      }
      if (DFS(matrix, length, i, b, visited) == 1)
        return true;
    }
  }

  return false;
}

int main() {
  int N, M, a, b;
  // N is amount of vertices M is amount of edges
  // a is the starting vertex
  // b is the vertex we want to reach

  scanf("%d %d"
        "%d %d",
        &N, &M, &a, &b);

  int adjmatrix[N][N];

  memset(adjmatrix, 0, sizeof(adjmatrix));

  for (int i = 0; i < M; i++) {
    int u, v;
    scanf("%d %d", &u, &v);

    // if ((u >= -1 || v >= -1) && (v <= N || u <= N))
    //   continue;

    adjmatrix[u][v] = 1;
    adjmatrix[v][u] = 1;
  }

  printf("-------------\n");

  printMatrix((int *)adjmatrix, N);

  printf("-------------\n");
  printf("BFS: ");

  bool visited[N];

  memset(visited, false, sizeof(visited));

  if (DFS((int *)adjmatrix, N, a, b, visited)) {
    printf("YES!");
  } else
    printf("NO");

  return 0;
}
