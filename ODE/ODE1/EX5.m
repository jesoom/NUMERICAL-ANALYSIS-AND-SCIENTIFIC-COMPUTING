clear all
close all
clc
format long

f=@(t,y) -2*t.*y;
y_exact=@(t) (exp(-t.^2))/2;
T=2;
h=0.01;
N=T/h;
t=[0:h:2];
u0=1/2;
options=odeset('maxstep',0.01,'reltol',10^-7);
[t_out,u_out]=ode45(f,t,u0,options)

plot(t,y_exact(t),'r',t_out,u_out,'k--')

abs_err_inf=norm((abs(y_exact(t_out)-u_out)),inf)
rel_err_inf=norm((abs(y_exact(t_out)-u_out)),inf)./norm((abs(y_exact(t_out))),inf)

abs_err_end=norm((abs(y_exact(T)-u_out(end))),inf)
rel_err_end=norm((abs(y_exact(T)-u_out(end))),inf)./norm((abs(y_exact(T))),inf)