#include <stdlib.h>
#include<stdio.h>
typedef struct {
	size_t size;
	int (*cmp) (void *a, void *b);
    #ifdef MORE_BYTES
        int x;
    #endif
} Ti;

static inline void swap(void *a, void *b, size_t size) {
    unsigned char *a_swap = (unsigned char*)a, *b_swap = (unsigned char*)b;
    unsigned char *a_end = (unsigned char*)a + size;

    while (a_swap < a_end) {
        unsigned char temp = *a_swap;
        *a_swap = *b_swap;
        *b_swap = temp;

        a_swap++, b_swap++;
    }
}

static inline void Qsort(void *base, size_t len, const Ti ti) {
    unsigned char *b = (unsigned char*)base;
  if (len <= 2){
    if (len == 2 && ti.cmp(b + 1, b))
      swap(b, b + 1, ti.size);
    return;
  }
  int left = 1, right = len - 1;
  while (left != right) {
    if (ti.cmp(b, b + right)){
      right--;
      continue;
    }
    if (ti.cmp(b +left, b)) {
      left++;
      continue;
    }
    swap(&b[left], &b[right], ti.size);
  }
  swap(&b[0], &b[left], ti.size);
  return Qsort(b, left + 1, ti), Qsort(b + left, len - left, ti);
}

struct Vec3 { float a,b,c;};

static inline int int_cmp(void *a, void *b) { int *A = (int*)a, *B = (int*)b; return *A < *B; }
static inline int float_cmp(void *a, void *b) { float *A = (float*)a, *B = (float*)b; return *A < *B; }
static inline int double_cmp(void *a, void *b) { double *A = (double*)a, *B = (double*)b; return *A < *B; }
static inline int vec3_cmp(void *a, void *b) { struct Vec3 *A = (struct Vec3*)a, *B = (struct Vec3*)b; return (A->a + A->b * A->c) < (B->a + B->b * B->c); }



void foo(int *a, float *b, double *c, struct Vec3 *d, size_t la, size_t lb, size_t lc, size_t ld) {
  Qsort(a, la, (Ti){sizeof *a, int_cmp});
  Qsort(b, lb, (Ti){sizeof *b, float_cmp});
  Qsort(c, lc, (Ti){sizeof *c, double_cmp});
  Qsort(d, ld, (Ti){sizeof *d, vec3_cmp});
}

int main() {
  int a[] = {4, 2, 1, 5, 3};
  float b[] = {4.2, 2.1, 1.3, 5.8, 3.0};
  double c[] = {4.2, 2.1, 1.3, 5.8, 3.0};
  struct Vec3 d[] = {{2.0, 1.0, 3.0}, {1.0, 2.0, 3.0}, {4.0, 5.0, 1.0}, {1.0, 1.0, 1.0}, {2.0, 2.0, 2.0}};

  size_t la = sizeof(a) / sizeof(*a);
  size_t lb = sizeof(b) / sizeof(*b);
  size_t lc = sizeof(c) / sizeof(*c);
  size_t ld = sizeof(d) / sizeof(*d);

  foo(a, b, c, d, la, lb, lc, ld);

  printf("Sorted int array: ");
  for (size_t i = 0; i < la; i++) {
    printf("%d ", a[i]);
  }
  printf("\n");

  printf("Sorted float array: ");
  for (size_t i = 0; i < lb; i++) {
    printf("%.1f ", b[i]);
  }
  printf("\n");

  printf("Sorted double array: ");
  for (size_t i = 0; i < lc; i++) {
    printf("%.1f ", c[i]);
  }
  printf("\n");

  printf("Sorted Vec3 array: ");
  for (size_t i = 0; i < ld; i++) {
    printf("(%.1f, %.1f, %.1f) ", d[i].a, d[i].b, d[i].c);
  }
  printf("\n");

  return 0;
}
