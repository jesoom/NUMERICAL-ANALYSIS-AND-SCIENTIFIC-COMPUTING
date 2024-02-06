clear all
close all
clc
format long

%%=======Explicit upwind method=======
L=2*pi;
N=100;
dx=L/N;
x=[0:dx:L-dx]';
x_int=[dx:dx:L-dx]';
T=2;
a=3;
c0=@(x) 1+0*x;
g0=@(t) 1+sin(t);
y0=c0(x_int);
x1=[]
y_exact=[]
for i=1:length(x)
    if x(i)<=a*T;
       y_exc(i)=g0(T-x(i)/a);
       x1=x;
       y_exact=y_exc;
    else if x(i)>=a*T;
            y_exc(i)=c0(x(i)-a*T);
            x1=x;
            y_exact=y_exc;
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

dt=T/M;
t=[0:dt:T]';
A1=(1-lambda)*ones(1,length(x_int));
A2=(lambda)*ones(1,length(x_int)-1);
A=diag(A1)+diag(A2,-1);

c_old=y0;
b=zeros(size(x_int))
for i=1:length(t)-1
    b(1)=lambda*g0(t(i));
    c_new=A*c_old+b;
    c_old=c_new
end
figure(2)
plot(x_int,c_new,'ro',x1,y_exact,'k')

%%========Implicit upwind method========    
L=2*pi;
N=100;
dx=L/N;
x=[0:dx:L-dx]';
x_int=[dx:dx:L-dx]';
T=2;
a=3;
c0=@(x) 1+0*x;
g0=@(t) 1+sin(t);
y0=c0(x_int);
x1=[]
y_exact=[]
for i=1:length(x)
    if x(i)<=a*T;
       y_exc(i)=g0(T-x(i)/a);
       x1=x;
       y_exact=y_exc;
    else if x(i)>=a*T;
            y_exc(i)=c0(x(i)-a*T);
            x1=x;
            y_exact=y_exc;
        end
    end
end
figure(1)
plot(x1,y_exact,'r')

M=48;
dt=T/M
t=[0:dt:T]';
lambda=a*(dt/dx)

A1=(1+lambda)*ones(1,length(x_int));
A2=-(lambda)*ones(1,length(x_int)-1);
A=diag(A1)+diag(A2,-1);

c_old=y0;
b=zeros(size(x_int));
for i=1:length(t)-1
    b(1)=lambda*g0(t(i+1));
    c_old=c_old+b;
    [L U P]=lu(A);
    y=L\(P*c_old);
    c_new=U\y;
    c_old=c_new;
end
figure(2)
plot(x_int,c_new,'ro',x1,y_exact,'k')
   
            
        