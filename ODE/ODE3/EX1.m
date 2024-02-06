clear all
close all
clc
format long

A=[-30 0 -28;-29 -1 -29;0 0 -2];
g=[2 2 2]';

f=@(t,y) A*y+g;
T=4;
N=200;
h=T/N;
t=[0:h:T]';
u0=[1 2 -10]'
options=odeset('maxstep',0.02,'reltol',10^-9);
[t_out,u_out]=ode45(f,t,u0,options);

u=zeros(N+1,3);
u(1,:)=u0;
u(2,:)=u_out(2,:);
u(3,:)=u_out(3,:);

tic
for k=3:N
    g=@(x) x-(18/11)*u(k,:)'+(9/11)*u(k-1,:)'-(2/11)*u(k-2,:)'-(6/11)*h*f(t(k+1,1),x);
    options=optimoptions('fsolve','tolfun',10^-8);
    u(k+1,:)=fsolve(g,u(k,:)',options);
end
toc

abs_err_inf=norm((abs(u_out-u)),inf)
rel_err_inf=norm((abs(u_out-u)),inf)./norm((abs(u_out)),inf)

abs_err_2=norm((abs(u_out-u)),2)
rel_err_2=norm((abs(u_out-u)),2)./norm((abs(u_out)),2)