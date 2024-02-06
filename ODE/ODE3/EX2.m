clear all
close all
clc
format long

tic
f=@(t,y) [y(2);-y(2)-y(1)];
y_exact=@(t) exp(-t/2).*cos((sqrt(3)/2)*t)+(1/sqrt(3))*exp(-t/2).*sin((sqrt(3)/2)*t);
u0=[1 0]';
T=4;
N=400;
h=T/N;
t=[0:h:T]'
u=zeros(N+1,2);
u(1,:)=u0;

disp('heun method')
for k=1:N
    f1=f(t(k,1),u(k,:)');
    f2=f(t(k+1,1),(u(k,:)'+h*f1));
    u(k+1,:)=u(k,:)'+((h/2)*(f1+f2));
end

abs_err_inf=norm((abs(y_exact(t)-u(:,1))),inf)
rel_err_inf=norm((abs(y_exact(t)-u(:,1))),inf)./norm(abs(y_exact(t)),inf)

disp('two step Adams Bashford')
u_ab=zeros(N+1,2);
u_ab(1,:)=u0;
u_ab(2,:)=y_exact(t(2,1));

for k=2:N
    u_ab(k+1,:)=u_ab(k,:)'+h*((3/2)*f(t(k,1),u_ab(k,:)')-(1/2)*f(t(k-1,1),u_ab(k-1,:)'));
end
 
abs_err_inf=norm((abs(y_exact(t)-u_ab(:,1))),inf)
rel_err_inf=norm((abs(y_exact(t)-u_ab(:,1))),inf)./norm(abs(y_exact(t)),inf)

disp('Teta Method')
u_teta=zeros(N+1,2);
u_teta(1,:)=u0;

for k=1:N
    g=@(x) x-u_teta(k,:)'-h*(0.53*f(t(k+1,1),x)+(1-0.53)*f(t(k,1),u_teta(k,:)'));
    options=optimoptions('fsolve','tolx',10^-9);
    u_teta(k+1,:)=fsolve(g,u_teta(k,:)',options);
end

abs_err_inf=norm((abs(y_exact(t)-u_teta(:,1))),inf)
rel_err_inf=norm((abs(y_exact(t)-u_teta(:,1))),inf)./norm(abs(y_exact(t)),inf)

disp('Second order BDF')
u_bdf=zeros(N+1,2);
u_bdf(1,:)=u0;
u_bdf(2,:)=u_teta(2,:)

for k=2:N
    p=@(x) x-(4/3)*u_bdf(k,:)'+(1/3)*u_bdf(k-1,:)'-((2/3)*h*f(t(k+1,1),x))
    options=optimoptions('fsolve','tolx',10^-9);
    u_bdf(k+1,:)=fsolve(p,u_bdf(k,:)',options)
end

abs_err_inf=norm((abs(y_exact(t)-u_bdf(:,1))),inf)
rel_err_inf=norm((abs(y_exact(t)-u_bdf(:,1))),inf)./norm(abs(y_exact(t)),inf)

toc    