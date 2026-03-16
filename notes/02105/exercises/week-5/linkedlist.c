#include <stdio.h>
#include <stdlib.h>

struct Node {
  int data;
  struct Node *next;
};

typedef struct Node Node;

typedef struct List {

  Node *head;
  Node *tail;
} List;

Node *create_node(int data) {
  struct Node *newNode = (struct Node *)malloc(sizeof(struct Node));

  newNode->data = data;
  newNode->next = NULL;

  return newNode;
}

void print_list(Node *head) {
  struct Node *current = head;

  while (current != NULL) {
    printf("%d -> ", current->data);
    current = current->next;
  }

  printf("NULL\n");
}

Node *push(Node *head, int value) {
  Node *new = create_node(value);

  new->next = head;

  head = new;

  return head;
}

Node *pop(Node *head) {

  Node *new_head = head->next;
  Node *popped = head;

  head = new_head;

  free(popped);

  return head;
}

List create_list(Node *node) {

  List list = {.head = node, .tail = NULL};

  Node *head = list.head;
  for (;;) {
    Node *next = head->next;

    if (next != NULL) {
      head = next;
      continue;
    }

    list.tail = head;
    break;
  }

  return list;
}

void enqeue(List *list, int data) {
  Node *new = create_node(data);

  if (list->tail == NULL) {
    list->tail = new;
    return;
  }

  list->tail->next = new;
  list->tail = new;
}

void dequeue(List *list) {
  Node *next = list->head->next;

  if (next == NULL)
    return;

  free(list->head);

  list->head = next;
}

int main() {
  struct Node *head = create_node(1);
  head->next = create_node(2);
  head->next->next = create_node(3);

  head = push(head, 5);

  print_list(head);

  head = pop(head);

  print_list(head);

  // Queue

  List list = create_list(head);

  enqeue(&list, 5);

  print_list(head);

  dequeue(&list);
  dequeue(&list);

  print_list(list.head);

  return 0;
}
