close all
clear all
clc
format long

f=@(x)  x.^4+3.*x.^3-2.*x+4;
a=-3;
b=3;
n1=4;
n2=2;
n3=5;
h1=(b-a)/n1;
h2=(b-a)/n2;
h3=(b-a)/n3;

xnodes1=[-3:h1:3];
xnodes2=[-3:h2:3];
xnodes3=[-3:h3:3];

ynodes1=f(xnodes1);
ynodes2=f(xnodes2);
ynodes3=f(xnodes3);

x=[-3:0.001:3];

p1=polyfit(xnodes1,ynodes1,4);
y_app1=polyval(p1,x);

p2=polyfit(xnodes2,ynodes2,2);
y_app2=polyval(p2,x);

p3=polyfit(xnodes3,ynodes3,5);
y_app3=polyval(p3,x);

y_exact=f(x)


err_abs1_inf=norm(abs(y_exact-y_app1),inf)
err_abs2_inf=norm(abs(y_exact-y_app2),inf)
err_abs3_inf=norm(abs(y_exact-y_app3),inf)

err_abs1=abs(y_exact-y_app1)
err_abs2=abs(y_exact-y_app2)
err_abs3=abs(y_exact-y_app3)

figure(1)
plot(xnodes1,f(xnodes1),'ro',x,y_app1,'k*',x,y_exact,'b')

figure(2)
plot(xnodes2,f(xnodes2),'ro',x,y_app1,'k*',x,y_exact,'b')

figure(3)
plot(xnodes3,f(xnodes3),'ro',x,y_app1,'k*',x,y_exact,'b')

figure(4)
plot(x,err_abs1,'r')

figure(5)
plot(x,err_abs2,'r')

figure(6)
plot(x,err_abs1,'r')
%%

