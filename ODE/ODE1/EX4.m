clear all
close all
clc
format long

f=@(t,y) -y+(exp(t).*sin(t));
y_exact=@(t)  (51/5)*exp(-t)-(1/5)*exp(t).*(cos(t)-2*sin(t));
T=5;
h=0.01;
N=T/h;
u0=10;
t=[0:h:T];
options=odeset('maxstep',0.01,'reltol',10^-7);
[t_out,u_out]= ode45(f,t,u0,options)

plot(t_out,u_out,'r',t,y_exact(t),'k--');

abs_err=norm((abs(y_exact(t_out)-u_out)),inf)
rel_err=norm((abs(y_exact(t_out)-u_out)),inf)./norm((abs(y_exact(t))),inf)