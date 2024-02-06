close all
clear all
clc
format long

f=@(x)     (1-x).^(1/5);

xnodes=[0,0.1,0.2,0.5,0.7,0.8,1];
ynodes=f(xnodes);

p=polyfit(xnodes,ynodes,6);
x=[0:0.01:1];

y_poly=polyval(p,x);
y_exact=f(x);

err_abs_inf=norm(abs(y_exact-y_poly),inf)
err_rel_inf=norm(abs(y_exact-y_poly),inf)/norm(y_exact,inf)

err_abs_2=norm(abs(y_exact-y_poly),2)
err_rel_2=norm(abs(y_exact-y_poly),2)/norm(y_exact,2)

abs_err=abs(y_exact-y_poly);

figure(1)
plot(x,y_exact,'r',x,y_poly,'b')

figure(2)
plot(xnodes,zeros(size(xnodes)),'ro',x,abs_err,'b')

%%

f=@(x)     (1-x).^(1/5);

xnodes1=[0,0.1,0.2,0.5,0.6,0.7,0.8];
ynodes1=f(xnodes1);

p1=polyfit(xnodes1,ynodes1,6);
x1=[0:0.01:0.8];

y_poly1=polyval(p1,x1);
y_exact1=f(x1);

err_abs_inf1=norm(abs(y_exact1-y_poly1),inf)
err_rel_inf1=norm(abs(y_exact1-y_poly1),inf)/norm(y_exact1,inf)

err_abs_21=norm(abs(y_exact1-y_poly1),2)
err_rel_21=norm(abs(y_exact1-y_poly1),2)/norm(y_exact1,2)

abs_err1=abs(y_exact1-y_poly1);

figure(3)
plot(x1,y_exact1,'r',x1,y_poly1,'b')

figure(4)
plot(xnodes1,zeros(size(xnodes1)),'ro',x1,abs_err1,'b')


%the function f does not have the seventh derivative in the given
% interval(because in point 1, the seventh derivative bocome infinit)
% so the theorem of slide 16 could not be true and the behaviour of 
% error will be unexpected. if we remove 1 from the interval, we can trust
% the results because it will be obey the theorem of slide 16 and the
% amount of errors will decrease .