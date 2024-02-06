clear all
close all
clc
format long

disp 'crank nicolson N=100,M=100'
L=10;
N=100;
dx=L/N;
x=[0:dx:L-dx]'
T=2;
M=100;
dt=T/M;
t=[0:dt:T];
a=1;

c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);
y=@(x,t) c0(x-a*t);

y_exact=y(x,T);

figure(1)
plot(x,y_exact);

landa=a*(dt/dx);
A1=ones(1,length(x));
A2=(landa/4)*ones(1,length(x)-1);
A3=-(landa/4)*ones(1,length(x)-1);
Acn_right=diag(A1,0)+diag(A3,1)+diag(A2,-1);
Acn_left=diag(A1,0)+diag(A2,1)+diag(A3,-1);

y0=c0(x);
c_old=Acn_right*y0;

for i=1:length(t)-1
    [L U P]=lu(Acn_left);
    y=L\(P*c_old);
    c_new=U\y;
    c_old=Acn_right*c_new;
end

figure(2)
plot(x,y_exact,'ro',x,c_new,'k')

abs_err_inf=norm(abs(y_exact-c_new),inf)
rel_err_inf=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)

abs_err_2=sqrt(dx)*norm(abs(y_exact-c_new))
rel_err_2=sqrt(dx)*norm(abs(y_exact-c_new))./norm(abs(y_exact))
