close all
clear all
clc 
format long

f=@(x)   exp(x)./x.^5;
a=3;
b=15;
n=5;
h=(b-a)/n;

xnodes=[3:h:15];
ynodes=f(xnodes);

p=polyfit(xnodes,ynodes,5);
x=[3:0.01:15];

y_poly=polyval(p,x);
y_exact=f(x);

err_abs_inf=norm(abs(y_exact-y_poly),inf)
err_abs_inf=norm(abs(y_exact-y_poly),inf)/norm(y_exact,inf)

err_abs_2=norm(abs(y_exact-y_poly),2)
err_abs_2=norm(abs(y_exact-y_poly),2)/norm(y_exact,2)

abs_err=abs(y_exact-y_poly);

figure(1)
plot(xnodes,ynodes,'ro',x,y_exact,'r',x,y_poly,'b')

figure(2)
plot(xnodes,zeros(size(xnodes)),'ro',x,abs_err,'b')

x1=[1:0.01:17];

y_poly1=polyval(p,x1);
y_exact1=f(x1);

err_abs_inf1=norm(abs(y_exact1-y_poly1),inf)
err_abs_inf1=norm(abs(y_exact1-y_poly1),inf)/norm(y_exact1,inf)

err_abs_21=norm(abs(y_exact1-y_poly1),2)
err_abs_21=norm(abs(y_exact1-y_poly1),2)/norm(y_exact1,2)

abs_err1=abs(y_exact1-y_poly1);

figure(3)
plot(xnodes,ynodes,'ro',x1,y_exact1,'r',x1,y_poly1,'b')

figure(4)
plot(xnodes,zeros(size(xnodes)),'ro',x1,abs_err1,'b')
