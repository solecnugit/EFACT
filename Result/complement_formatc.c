
#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <float.h>
#include <iso646.h>
#include <limits.h>
#include <locale.h>
#include <math.h>
#include <setjmp.h>
#include <signal.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <wchar.h>
#include <wctype.h>
#include <complex.h>
#include <fenv.h>
#include <inttypes.h>
#include <stdalign.h>
#include <stdbool.h>
#include <stdint.h>
#include <tgmath.h>
#include <uchar.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <sys/times.h>
#include <sys/resource.h>
#include <fcntl.h>
#include <pthread.h>
#include <dirent.h>
#include <obstack.h>
#include <getopt.h>
#include <locale.h>
#include <nl_types.h>
char * getenv (const char *);
void free (void *);
int pthread_create (pthread_t *restrict, const pthread_attr_t *restrict, void *(*)(void *), void *restrict);
int unlink (const char *);
char * strncpy (char *restrict, const char *restrict, size_t);
int strncmp (const char *, const char *, size_t);
char * strcpy (char *restrict, const char *restrict);
int ferror (FILE *);
unsigned long fread (void *restrict, size_t, size_t, FILE *restrict);
int abs (int);
double strtod (const char *restrict, char **restrict);
int vsnprintf (char *restrict, size_t, const char *restrict, struct __va_list_tag *);
int clock_gettime (clockid_t, struct timespec *);
int pthread_cond_wait (pthread_cond_t *restrict, pthread_mutex_t *restrict);
double pow (double, double);
int fclose (FILE *);
unsigned long strlen (const char *);
int __isoc99_vfscanf (FILE *stream, const char *format, va_list arg);
char * strchr (const char *, int);
int pthread_mutex_destroy (pthread_mutex_t *);
char * strrchr (const char *, int);
int fputs (const char *restrict, FILE *restrict);
void * memset (void *, int, size_t);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
unsigned long strspn (const char *, const char *);
double cos (double);
unsigned long strcspn (const char *, const char *);
int __libc_start_main (int (*main)(int, char **, char **), int argc, char **argv, void (*init)(void), void (*fini)(void), void (*rtld_fini)(void), void (*stack_end));
int memcmp (const void *, const void *, size_t);
char * fgets (char *restrict, int, FILE *restrict);
int pthread_cond_signal (pthread_cond_t *);
void * calloc (size_t, size_t);
FILE * tmpfile ();
int strcmp (const char *, const char *);
int putc (int, FILE *);
double log10 (double);
long ftell (FILE *);
int feof (FILE *);
long strtol (const char *restrict, char **restrict, int);
void clearerr (FILE *);
void * memcpy (void *restrict, const void *restrict, size_t);
int fileno (FILE *);
int __xstat (int ver, const char *path, struct stat *buf);
int pthread_cond_init (pthread_cond_t *restrict, const pthread_condattr_t *restrict);
int pthread_mutex_unlock (pthread_mutex_t *);
int __isoc99_vsscanf (const char *str, const char *format, va_list arg);
void * malloc (size_t);
int fflush (FILE *);
int ungetc (int, FILE *);
int __fxstat (int ver, int fd, struct stat *buf);
int vprintf (const char *restrict, struct __va_list_tag *);
int mkstemp (char *);
char * strpbrk (const char *, const char *);
int fseek (FILE *, long, int);
void * realloc (void *, size_t);
FILE * fdopen (int, const char *);
void * memmove (void *, const void *, size_t);
int vsprintf (char *restrict, const char *restrict, struct __va_list_tag *);
FILE * fopen (const char *restrict, const char *restrict);
int pthread_join (pthread_t, void **);
int rename (const char *, const char *);
int vfprintf (FILE *restrict, const char *restrict, struct __va_list_tag *);
double sin (double);
int atoi (const char *);
char * strcat (char *restrict, const char *restrict);
void exit (int);
unsigned long fwrite (const void *restrict, size_t, size_t, FILE *restrict);
int posix_memalign (void **, size_t, size_t);
char * strdup (const char *);
int pthread_mutex_init (pthread_mutex_t *, const pthread_mutexattr_t *);
int getc (FILE *);
char * strstr (const char *, const char *);
int pthread_mutex_lock (pthread_mutex_t *);
int pthread_mutex_trylock (pthread_mutex_t *);
