clear all
close all
format long
clc

f=@(t,y) -3*t.^2*y;
y_exact=@(t) 3*exp(-t.^3);
T=2;

h=0.01;
N=T/h;
u0=3;
t=[0:h:T]';
u=zeros(N+1,1);
u(1,1)=u0;

for k=1:N
    u(k+1,1)=u(k,1)+h*f(t(k,1),u(k,1))

end
u

figure(1)
plot(t,u,'ro',t,y_exact(t),'k')

err_abs=norm(abs(y_exact(t)-u),inf)
err_rel=norm(abs(y_exact(t)-u),inf)./norm(abs(y_exact(t)),inf)

figure(2)
plot(t,err_abs,'ro')

err_abs_end=abs(y_exact(2)-u(end))
err_rel_end=abs(y_exact(2)-u(end))./abs(y_exact(2))

figure(3)
plot(2,err_abs_end,'ko')
