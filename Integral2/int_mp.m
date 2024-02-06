function [int] = int_mp(f,a,b,m)
h=(b-a)/m;
x=[a:h:b];
int=0
for i=1:m
    xm=((x(i)+x(i+1))/2)
    int=int+(f(xm)*h)
end
end
