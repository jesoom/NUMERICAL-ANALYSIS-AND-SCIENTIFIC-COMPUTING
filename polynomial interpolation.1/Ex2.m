
% Ex2.a
close all
clear all
clc
format long

f=@(x)    cos(x);
a=-2;
b=4;
n=5;
h=(b-a)/n;

xnodes=[-2:h:4];
ynodes=f(xnodes);

x=[-2:0.01:4];

p=polyfit(xnodes,ynodes,n);
y_app=polyval(p,x);
y_exact=f(x);

err_abs_inf=norm(abs(y_exact-y_app),inf)
err_rel_inf=norm(abs(y_exact-y_app),inf)/norm(y_exact,inf)

err_abs_2=norm(abs(y_exact-y_app),2)
err_rel_2=norm(abs(y_exact-y_app),2)

abs_err=abs(y_exact-y_app);

figure(1)
plot(x,y_exact,'r',x,y_app,'b')

figure(2)
plot(xnodes,zeros(size(xnodes)),'k*',x,abs_err,'r')
%%
% Ex2.b

f=@(x)    cos(x);
a1=-1;
b1=2;
n1=5;
h1=(b1-a1)/n1;

xnodes1=[-1:h1:2];
ynodes1=f(xnodes1);

x1=[-1:0.01:2];

p1=polyfit(xnodes1,ynodes1,n1);
y_app1=polyval(p1,x1);
y_exact1=f(x1);

err_abs1_inf=norm(abs(y_exact1-y_app1),inf)
err_rel1_inf=norm(abs(y_exact1-y_app1),inf)/norm(y_exact1,inf)

err_abs1_2=norm(abs(y_exact1-y_app1),2)
err_rel1_2=norm(abs(y_exact1-y_app1),2)

abs_err1=abs(y_exact1-y_app1);

figure(3)
plot(x1,y_exact1,'r',x1,y_app1,'b')

figure(4)
plot(xnodes1,zeros(size(xnodes1)),'k*',x1,abs_err1,'r')

p=-log2(err_rel1_inf/err_rel_inf)
