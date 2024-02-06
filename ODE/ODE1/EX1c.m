clear all
close all
clc
format long

f=@(t,y) -3*t.^2*y;
y_exact=@(t)  3*exp(-t.^3);
T=2;
h=0.01;
N=T/h;

u0=3
u=zeros(N+1,1);
t=[0:h:T]';
u(1,1)=u0;
u(2,1)=u(1,1)+h*f(t(1,1),u(1,1));

for k=2:N
u(k+1,1)=u(k-1,1)+2*h*f(t(k,1),u(k,1))
end
u
abs_err=norm(abs(y_exact(t)-u),inf)
rel_err=norm(abs(y_exact(t)-u),inf)./norm(abs(y_exact(t)),inf)

abs_err2=abs(y_exact(2)-u(end))
rel_err2=abs(y_exact(2)-u(end))./abs(y_exact(2))
