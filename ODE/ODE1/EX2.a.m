clear all
close all
clc
format long

a=1
f=@(t,y) (1/2)*cos(t)*(1-y.^2);
y_exact=@(t) (exp(a*sin(t))-1)./(exp(a*sin(t))+1);
T=6*pi;
% h=0.1;
% h=0.05;
% N=T/h;
N=40;
h=T/N;
u0=0
u=zeros(N+1,1);
t=[0:h:T]';
u(1,1)=u0;

for k=1:N
u(k+1,1)=u(k,1)+h*f(t(k,1),u(k,1))
end

u
abs_err=norm(abs(y_exact(t)-u),inf)
rel_err=norm(abs(y_exact(t)-u),inf)./norm(abs(y_exact(t)),inf)

rell_err_20=2.676055087486252;
rell_err_40=0.958964282957898;

p_emp=-log2((rell_err_40)/(rell_err_20))


% baraye mohasebe convergence order yekbar ba N=20 run kardam
% va rell_err ro hesab kardam va bar dg ba N=40 run kardam va 
% rell_err ro be dast avordam va dar akhar p_emp ro ba tavajoh
% be formol bala mohasebe kardam.