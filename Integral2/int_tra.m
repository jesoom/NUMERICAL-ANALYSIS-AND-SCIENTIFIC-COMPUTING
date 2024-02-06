function [int] = int_tra(f,a,b,m)
h=(b-a)/m;
x=[a:h:b];
int=0
for i=1:m-1
    int=int+(2*f(x(i+1)))
end
int=(int+(f(a)+f(b)))*(h/2)
   
end

