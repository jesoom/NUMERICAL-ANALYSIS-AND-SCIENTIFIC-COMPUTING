clear all
close all
clc
format long

f=@(t,y) -3*t.^2.*y;
y_exact=@(t) 3*exp(-t.^3);
u0=3;
T=2;
h=0.01;
N=T/h;
tk=[0:h:T]';
uk=zeros(N+1,1);
uk(1,1)=u0;

for k=1:N
    f1=f(tk(k,1),uk(k,1));
    f2=f(tk(k+1,1),uk(k,1)+h*f1)
    uk(k+1,1)=uk(k,1)+(h/2)*(f1+f2)
end

uk;

figure(1)
plot(tk,uk,'ro',tk,y_exact(tk),'k')

err_abs=abs(y_exact(tk)-uk)
err_rel=abs(y_exact(tk)-uk)/abs(y_exact(tk))

err_abs2=abs(y_exact(2)-uk(end))
err_rel2=abs(y_exact(2)-uk)/abs(y_exact(end))