clear all
close all
clc
format long

a=1
f=@(t,y) (1/2)*cos(t)*(1-y.^2);
y_exact=@(t) (exp(a*sin(t))-1)./(exp(a*sin(t))+1);
T=6*pi;
% h=0.1;
% h=0.05;
% N=T/h;
N=20;
h=T/N;
u0=0
u=zeros(N+1,1);
t=[0:h:T]';
u(1,1)=u0;

for k=1:N
f1=f(t(k,1),u(k,1));
f2=f((t(k,1)+(h/2)),u(k,1)+((h*f1)/2));
u(k+1,1)=u(k,1)+h*f2;
end

u
abs_err=norm(abs(y_exact(t)-u),inf)
rel_err=norm(abs(y_exact(t)-u),inf)./norm(abs(y_exact(t)),inf)


rel_err_40=0.006333078480471
rel_err_20=0.034504515439626

p_emp=-log2((rel_err_40)/(rel_err_20))

plot(t,y_exact(t),'r',t,u,'k--')