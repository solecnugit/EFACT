#include <cstdio>
#include <iostream>
#include <set>
#include <string>
#include <regex>
#include <stack>
#include <list>
#include <map>
#include <cstdarg>
#include <cstddef>

typedef FILE ee_FILE;

int th_fprintf(ee_FILE *fp, const char* format, ...) {
    int rv;
    va_list args;
    va_start(args, format);
    rv = vfprintf(fp, format, args);
    va_end(args);
    return rv;
}

  int th_printf(const char *fmt, ...) {
    int rv;
    va_list args;
    va_start(args, fmt);
    rv = vprintf(fmt, args);
    va_end(args);
    return rv;
}

  int th_vsprintf( char *str,const char *fmt, ...) {
    int rv;
    va_list args;
    va_start(args, fmt);
    rv = vsprintf(str,fmt, args);
    va_end(args);
    return rv;
}

  int th_vsnprintf( char *str,size_t size, const char *fmt, ...) {
    int rv;
    va_list args;
    va_start(args, fmt);
    rv = vsnprintf(str,size,fmt, args);
    va_end(args);
    return rv;
}



//declare i32 @vprint_mcsema(i64, i64, i64, i64, i64, i64, double, double, double, double, double, double, double, double)
extern "C" int vfprintf_mcsema(ee_FILE *fp,const char* str,...) {
    printf("进入了vfprintf_mcsema的runtime support\n");
    int rv;
    va_list args;
    va_start(args, str);
    //std::cout << "arg1:" << fp << std::endl;
    //std::cout << "arg2:" << str << std::endl;
    rv = vfprintf(fp, str, args);
    va_end(args);
    printf("结束了vfprintf_mcsema的runtime support\n");
    return rv;
}

/*extern "C" void vfprintf_inline_mcsema(ee_FILE *fp,const char* str,int rsi,int rdx,int rcx,int r8,int r9,double xmm0,double xmm1,double xmm2,
double xmm3,double xmm4,double xmm5,double xmm6,double xmm7) {
    //printf("进入了vfprintf_inline_mcsema的runtime support\n");
    th_fprintf(fp,str,rsi,rdx,rcx,r8);
    //printf("结束了vfprintf_inline_mcsema的runtime support\n");

}*/


/*extern "C" void vfprintf_inline_mcsema(ee_FILE *fp,const char* str,...) {
    //printf("进入了vfprintf_inline_mcsema的runtime support\n");
    th_fprintf(fp,str,rsi,rdx,rcx,r8);
    //printf("结束了vfprintf_inline_mcsema的runtime support\n");

}*/
extern "C" int vfprintf_inline_mcsema(ee_FILE *fp,const char* str,...) {
    printf("进入了vfprintf_inline_mcsema的runtime support\n");
    int rv;
    va_list args;
    va_start(args, str);
    //std::cout << "arg1:" << fp << std::endl;
    //std::cout << "arg2:" << str << std::endl;
    rv = vfprintf(fp, str, args);
    va_end(args);
    printf("结束了vfprintf_inline_mcsema的runtime support\n");
    return rv;
}





//declare i32 @vprint_mcsema(i64, i64, i64, i64, i64, i64, double, double, double, double, double, double, double, double)
/*extern "C" void vprintf_mcsema(const char* str, int rsi,int rdx,int rcx,int r8,int r9,double xmm0,double xmm1,double xmm2,
double xmm3,double xmm4,double xmm5,double xmm6,double xmm7) {
    //printf("进入了vprinf_mcsema的runtime support\n");
    th_printf(str,rsi,rdx,rcx,r8,r9);
    //printf("结束了vprinf_mcsema的runtime support\n");
}*/

extern "C" int vprintf_mcsema(const char* str,...) {
    printf("进入了vprinf_mcsema的runtime support\n");
    int rv;
    va_list args;
    va_start(args, str);
    //std::cout << "arg1:" << str << std::endl;
    rv = vprintf(str, args);
    va_end(args);
    printf("结束了vprinf_mcsema的runtime support\n");
    return rv;
}

//declare i32 @vprint_mcsema(i64, i64, i64, i64, i64, i64, double, double, double, double, double, double, double, double)
/*extern "C" void vsprintf_mcsema(char* str,const char* format, int rdx,int rcx,int r8,int r9,double xmm0,double xmm1,double xmm2,
double xmm3,double xmm4,double xmm5,double xmm6,double xmm7) {
    printf("进入了vsprinf_mcsema的runtime support\n");
    th_vsprintf(str,format,rdx,rcx,r8,r9);
    printf("结束了vsprinf_mcsema的runtime support\n");
}*/

extern "C" int vsprintf_mcsema(char* str,const char* format, ...) {
    printf("进入了vsprinf_mcsema的runtime support\n");
    int rv;
    va_list args;
    va_start(args, format);
    //std::cout << "arg1:" << str << std::endl;
    //std::cout << "arg2:" << format << std::endl;
    rv = vsprintf(str,format, args);
    va_end(args);
    printf("结束了vsprinf_mcsema的runtime support\n");
    return rv;
}

//declare i32 @vprint_mcsema(i64, i64, i64, i64, i64, i64, double, double, double, double, double, double, double, double)
/*extern "C" void vsnprintf_mcsema(char* str,size_t size,const char* format,int rcx,int r8,int r9,double xmm0,double xmm1,double xmm2,
double xmm3,double xmm4,double xmm5,double xmm6,double xmm7) {
    printf("进入了vsprinf_mcsema的runtime support\n");
    th_vsnprintf(str,size,format,rcx,r8,r9);
    printf("结束了vsprinf_mcsema的runtime support\n");
}*/
extern "C" int vsnprintf_mcsema(char* str,size_t size,const char* format,...) {
    printf("进入了vsprinf_mcsema的runtime support\n");
    int rv;
    va_list args;
    va_start(args, format);
    //std::cout << "arg1:" << str << std::endl;
    //std::cout << "arg2:" << size << std::endl;
    //std::cout << "arg3:" << format << std::endl;   
    rv = vsnprintf(str,size,format, args);
    va_end(args);
    printf("结束了vsprinf_mcsema的runtime support\n");
    return rv;
}



extern "C" int vfscanf_mcsema(ee_FILE *fp,const char* str,...) {
    printf("进入了vfscanf_mcsema的runtime support\n");
    int rv;
    va_list args;
    va_start(args, str);
    //std::cout << "arg1:" << fp << std::endl;
    //std::cout << "arg2:" << str << std::endl;
    rv = vfscanf(fp, str, args);
    va_end(args);
    printf("结束了vfscanf_mcsema的runtime support\n");
    return rv;
}

extern "C" int vsscanf_mcsema(char* str,const char* format, ...) {
    printf("进入了vsscanf_mcsema的runtime support\n");
    int rv;
    va_list args;
    va_start(args, format);
    //std::cout << "arg1:" << str << std::endl;
    //std::cout << "arg2:" << format << std::endl;
    rv = vsscanf(str,format, args);
    va_end(args);
    printf("结束了vsscanf_mcsema的runtime support\n");
    return rv;
}

