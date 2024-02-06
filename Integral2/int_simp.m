function [int] = int_simp(f,a,b,m)
h=(b-a)/m;
x=[a:h:b];
int1=0;
int2=0;
for i=1:m
    xm=(x(i)+x(i+1))/2
    int1=int1+(f(xm))
end
for i=1:m-1
    int2=int2+(f(x(i+1)))
end
int=(4*int1+2*int2+f(a)+f(b))*(h/6)
    
end
