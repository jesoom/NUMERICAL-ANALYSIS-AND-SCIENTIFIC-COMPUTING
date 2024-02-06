close all
clear all
clc
format long

f=@(x) exp(x);
xnode=[-2:3]';
ynode=f(xnode);

p=polyfit(xnode,ynode,5);          %size(xnode,1)-1    
x=[-2:0.001:3];

y_app=polyval(p,x);                 %approximation
y_exact=f(x);                       %exact

err_abs_inf=norm(abs(y_exact-y_app),inf)
err_rel_inf=norm(abs(y_exact-y_app),inf)/norm(y_exact,inf)

err_abs_2=norm(abs(y_exact-y_app),2)
err_rel_2=norm(abs(y_exact-y_app),2)/norm(y_exact,2)
err_abs=abs(y_exact-y_app)
figure(1)
plot(x,y_app,'bo',x,y_exact,'r--')

figure(2)
plot(xnode,zeros(size(xnode)),'ro',x,err_abs,'b')
