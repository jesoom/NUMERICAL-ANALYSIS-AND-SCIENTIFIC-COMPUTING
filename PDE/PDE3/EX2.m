clear all
close all
clc
format long

L=10;
N=100;
dx=L/N;
x=[0:dx:L-dx]';
T=5;
M=20;
dt=T/M;
t=[0:dt:T]';
nu=0.1;

% %  exact solution with fourier series
c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);
y0=c0(x);
c0hat=fft(y0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=(2*pi*k)./L;
alfak=nu*(j).^2*omegak.^2;
chatk=exp(alfak*T).*c0hat;
y_exact=ifft(chatk);

figure(1)
plot(x,y_exact)

% % numerical solution with crank-nicolson
mi=(nu*dt)/(2*dx^2);
A1=(1+2*mi)*ones(1,length(x));
A2=-mi*ones(1,length(x)-1);
A_CN=diag(A1)+diag(A2,1)+diag(A2,-1);
A_CN(1,end)=-mi;
A_CN(end,1)=-mi;
A3=(1-2*mi)*ones(1,length(x));
A4=mi*ones(1,length(x)-1);
A_CNrhs=diag(A3)+diag(A4,1)+diag(A4,-1);
A_CNrhs(1,end)=mi;
A_CNrhs(end,1)=mi;
c_old=y0;

for i=1:length(t)-1
    b=A_CNrhs*c_old;
    c_new=A_CN\b;
    c_old=c_new
end

figure(2)
plot(x,c_new,'ro',x,y_exact,'k')

abs_err_inf=norm(abs(y_exact-c_new),inf)
rel_err_inf=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)

abs_err_2=norm(abs(y_exact-c_new),2)
rel_err_2=norm(abs(y_exact-c_new),2)./norm(abs(y_exact),2)

abs_err=abs(y_exact-c_new);

figure(3)
plot(x,abs_err)