clear all
close all
clc

a=1;
f=@(t,y) (a/2).*cos(t).*(1-y.^2);
y_exact=@(t)  (exp(a*sin(t))-1)./(exp(a*sin(t))+1);
T=6*pi;
N=20;
h=T/N;
u0=0;
u=zeros(N+1,1);
t=[0:h:T]';
u(1,1)=u0;
f1=f(t(1,1),u(1,1));
f2=f((t(1,1)+(h/2)),(u(1,1)+((h*f1)/2)));
u(2,1)=u(1,1)+h*f2;

for k=2:N
u(k+1,1)=u(k-1,1)+2*h*f(t(k,1),u(k,1));
end
u
abs_err=norm((abs(y_exact(t)-u)),inf)
rel_err=norm((abs(y_exact(t)-u)),inf)./norm((abs(y_exact(t))),inf)

rel_err_20=0.350800624091207;
rel_err_40=0.051271564720352;

p_emp=-log2((rel_err_40)/(rel_err_20))
