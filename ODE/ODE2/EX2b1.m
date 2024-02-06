clear all
close all
clc
format long

f=@(t,y) -y+exp(t).*sin(t);
y_exact=@(t) ((51/5)*exp(-t))-((1/5)*exp(t).*(cos(t)-2*sin(t)));
u0=10;
T=5;
N=5000;
h=T/N;
t=[0:h:5]';
u=zeros(N+1,1);
u(1,1)=u0;

tic
for k=1:N
    f1=f(t(k,1),u(k,1));
    f2=f((t(k,1)+(h/2)),(u(k,1)+(h/2)*f1));
    f3=f((t(k,1)+(h/2)),(u(k,1)+(h/2)*f2));
    f4=f(t(k+1,1),(u(k,1)+h*f3));
    u(k+1,1)=u(k,1)+((h/6)*(f1+2*f2+2*f3+f4));
    
end
toc

abs_err_end=abs(y_exact(T)-u(end))
rell_err_end=abs(y_exact(T)-u(end))./abs(y_exact(T))

abs_err_inf=norm((abs(y_exact(t)-u)),inf)
rel_err_inf=norm((abs(y_exact(t)-u)),inf)./norm((abs(y_exact(t))),inf)


