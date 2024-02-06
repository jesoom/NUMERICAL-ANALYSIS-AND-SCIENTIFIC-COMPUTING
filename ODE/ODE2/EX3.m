clear all
close all
clc
format long

f=@(t,y)  (-50*y)+(4*y.^2)+t;
u0=2;
T=1;
t=[0:1]';
options=odeset('maxstep',10^-4,'reltol',10^-10);
[t_out,u_out]=ode15s(f,t,u0,options);

% N=15;
% h=T/N;
h=2/51;
u=zeros(N+1,1);
t_Eu=[0:h:T]';
u(1,1)=u0;

for k=1:N
    u(k+1,1)=u(k,1)+(h*f(t(k,1),u(k,1)));
end

% in order to have stable method h<(2/landa)
%landa=50
%h<2/50=0.04


