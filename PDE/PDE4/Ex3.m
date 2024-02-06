clear all
close all
clc
format long

L=2*pi;
N=100;
dx=L/N;
x=[0:dx:L-dx]';
x_int=[dx:dx:L-dx];
T=2;
a=3;

c0=@(x) 0*x+1;
g0=@(t) 1+sin(t);

x1=[];
y_exact=[];

for i=1:N
    if x(i)<=a*T
        c_exact(i)=g0(T-(x(i)/a));
        x1=x;
        y_exact=c_exact;
    else if x(i)>=a*T
            c_exact(i)=c0(x(i)-a*T);
            x1=x;
            y_exact=c_exact;
        end
    end
end

figure(1)
plot(x1,y_exact,'r')

M=1;
lambda=a*((T/M)/dx);

while lambda>1
    M=M+1;
    lambda=a*((T/M)/dx);
end

lambda;
M;
            
dt=T/M;
t=[0:dt:T];



            