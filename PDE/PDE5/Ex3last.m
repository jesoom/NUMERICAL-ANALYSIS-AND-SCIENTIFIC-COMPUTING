clear all
close all
clc
format long

L=2*pi;
N=100;
dx=L/N;
x=[0:dx:L-dx]';
x_int=[dx:dx:L-dx]';
T=2;
a=3;

c0=@(x) 1+0*x;
y0=c0(x_int);
g0=@(t) 1+sin(t);
gL=@(t) 1+0*t;
x1=[];
y_exact=[];
for i=1:length(x)
    if x(i)<=a*T;
    y_ext(i)=g0(T-x(i)/a);
    x1=x;
    y_exact=y_ext;
    else if x(i)>a*T;
            y_ext(i)=c0(x(i)-a*T);
            x1=x;
            y_exact=y_ext;
        end
    end
end
figure(1)
plot(x1,y_exact,'r')

%%numerical solution
M=1;
lambda=a*((T/M)/dx);
while lambda>1
    M=M+1;
    lambda=a*((T/M)/dx);
end
M;
lambda;
dt=T/M;
t=[0:dt:T]';
A1=ones(1,length(x_int));
A2=-(lambda/4)*ones(1,length(x_int)-1);
A3=(lambda/4)*ones(1,length(x_int)-1);
A_left=diag(A1)+diag(A3,1)+diag(A2,-1);
A_right=diag(A1)+diag(A3,-1)+diag(A2,1);
c_old=y0;

for i=1:length(t)-1
    b=A_right*c_old;
    b(1)=b(1)+(lambda/4)*g0(t(i))-(-lambda/4)*g0(t(i+1));
    b(end)=b(end)-(lambda/4)*gL(t(i))-(lambda/4)*gL(t(i+1));
    [L U P]=lu(A_left);
    y=L\(P*b);
    c_new=U\y;
    c_old=c_new;
end    

figure(2)
plot(x1,y_exact,'ro',x_int,c_new,'k')