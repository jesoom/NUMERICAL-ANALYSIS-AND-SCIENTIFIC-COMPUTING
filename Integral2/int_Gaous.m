function [int] = int_Gaous(f,a,b,m)
h=(b-a)/m
x=[a:h:b]
int=0
for i=0:m-1
    x=a+(i+(1/2)+(1/(2*sqrt(3))))*h
    y=a+(i+(1/2)-(1/(2*sqrt(3))))*h
    int=int+(f(x)+f(y))
end
int=int*(h/2)
end

