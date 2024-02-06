close all
clear all
clc
format long

f=@(x) x.*sin(x);
xnodes=[0,1.5,2,2.5,4.5,5,5.5,7];
ynodes=f(xnodes);

p=polyfit(xnodes,ynodes,size(xnodes,2)-1);
x=[0:0.001:7];

y_app=polyval(p,x);
y_exact=f(x);

err_abs_inf=norm(abs(y_exact-y_app),inf)
err_rel_inf=norm(abs(y_exact-y_app),inf)/norm(y_exact,inf)

err_abs_2=norm(abs(y_exact-y_app),2)
err_rel_2=norm(abs(y_exact-y_app),2)/norm(y_exact,2)

abs_err=abs(y_exact-y_app)

figure(1)
plot(x,y_exact,'b',x,y_app,'r')

figure(2)
plot(xnodes,zeros(size(xnodes)),'ko',x,abs_err,'b')
