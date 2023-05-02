#include<cmath>
#include<iostream>
#include<stdlib.h>
#include<string>
int main( )
{
    float d1=cos(2023.2023);
    std::string str = "3.14";
    double x = std::stod(str);
    printf("%lf,%lf",d1,x);
    std::string s = "Hello World";
    s.insert(5, 1, ','); 
    std::cout << s << std::endl;
    return 0;
}

