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
u(2,1)=y_exact(t(2,1));
u(3,1)=y_exact(t(3,1));

for k=3:N
    u(k+1,1)=u(k,1)+(h*(((23/12)*f(t(k,1),u(k,1)))-((16/12)*f(t(k-1,1),u(k-1,1)))+((5/12)*f(t(k-2,1),u(k-2,1)))));
end

u;

abs_err_end=abs(y_exact(T)-u(end))
rell_err_end=abs(y_exact(T)-u(end))./abs(y_exact(T))

abs_err_inf=norm((abs(y_exact(t)-u)),inf)
rel_err_inf=norm((abs(y_exact(t)-u)),inf)./norm((abs(y_exact(t))),inf)
    