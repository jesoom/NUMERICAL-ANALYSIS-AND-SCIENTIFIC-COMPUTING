clear all
close all
format long
clc

f=@(t,y) ((y.^2)/(1+y.^2)).*exp(-10*sin(t))
u0=1;
T=4;
h=0.01;
N=T/h;
t=[0:0.01:4]';

options=odeset('maxstep',0.01,'abstol',10^-12,'reltol',10^-11);
[t_out,u_out]=ode45(f,t,u0,options)

disp('Heun')
u=zeros(N+1,1);
u(1,1)=u0;

for k=1:N
f1=f(t(k,1),u(k,1));
f2=f(t(k+1,1),(u(k,1)+h*f1));
u(k+1,1)=u(k,1)+((h/2)*(f1+f2));
end

u
abs_err_inf=norm((abs(u_out-u)),inf)
rel_err_inf=norm((abs(u_out-u)),inf)./norm((abs(u_out)),inf)

disp('modified euler')
u_eu=zeros(N+1,1);
u_eu(1,1)=u0;
t_eu=[0:0.01:4]';

for k=1:N
f1=f(t_eu(k,1),u_eu(k,1));
f2=f((t_eu(k,1)+(h/2)),(u_eu(k,1)+((h*f1)/2)));
u_eu(k+1,1)=u_eu(k,1)+(h*f2)
end

u_eu
abs_err_inf=norm((abs(u_out-u_eu)),inf)
rel_err_inf=norm((abs(u_out-u_eu)),inf)./norm((abs(u_out)),inf)

disp('leapfrog')
u_lf=zeros(N+1,1);
u_lf(1,1)=u_out(1,1);
u_lf(2,1)=u_out(2,1);
t_lf=[0:0.01:4]';

for k=2:N
u_lf(k+1,1)=u_lf(k-1,1)+2*h*f(t_lf(k,1),u_lf(k,1));
end

u_lf
abs_err_inf=norm((abs(u_out-u_lf)),inf)
rel_err_inf=norm((abs(u_out-u_lf)),inf)./norm((abs(u_out)),inf)