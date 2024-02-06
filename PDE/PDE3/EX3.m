clear all
close all
clc
format long

L=2;
N=200;
dx=L/N;
x=[dx:dx:L-dx];
x1=[dx/2:dx:L-dx/2];
T=2;
M=50;
dt=T/M;
t=[0:dt:T];

nu=@(x) x.^2/100;
s=@(x,t) 2*t.*x.^3-3*x.^3.*(t.^2+1)/25;
c0=@(x) x.^3;
y=@(x,t) x.^3.*(t.^2+1);

y_exact=y(x,T);

figure(1)
plot(x,y_exact);

g0=@(t) 0*t;
gL=@(t) 8*(t.^2+1);

NU=nu(x1);
mi=NU.*(dt/(2*dx^2));
A1=(1-mi(1:end-1)-mi(2:end));
A2=mi(2:end-1);
A_CNrhs=diag(A1,0)+diag(A2,1)+diag(A2,-1);
A3=(1+mi(1:end-1)+mi(2:end));
A4=-mi(2:end-1);
A_CN=diag(A3,0)+diag(A4,1)+diag(A4,-1);
y0=c0(x);
c_old=y0';


% crank nicolson method
for i=1:length(t)-1;
    S=s(x,t(i));
    S=S';
    b=A_CNrhs*c_old+dt.*(S/2);
    g_0=g0(t(i));
    g_1=g0(t(i+1));
    g_L=gL(t(i));
    g_L1=gL(t(i+1));
    b(1)=b(1)+mi(1).*g_0+mi(1).*g_1;
    b(end)=b(end)+mi(end).*g_L+mi(end).*g_L1;
    S1=s(x,t(i+1));
    S1=S1';
    b=b+dt.*S1/2;
    c_new=A_CN\b;
    c_old=c_new;
end

plot(x,c_new,'ro',x,y_exact,'k')
    