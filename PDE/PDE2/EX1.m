clear all
close all
clc
format long

L=10
N=100;
dx=L/N;
x=[0:dx:L-dx]';
T=5;
M=200;
dt=T/M;
t=[0:dt:T]';
nu=0.05;
c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);

% % exact solution
y0=c0(x);
c0hat=fft(y0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=(2*pi*k)./L;
alfak=nu*(j).^2*omegak.^2;
chatk=exp(alfak*T).*c0hat;
y_exact=ifft(chatk);
plot(x,y_exact,'r--')

% % numerical solution EE
mi=(dt*nu)/dx^2;
A1=(1-2*mi)*ones(1,length(x));
A2=(mi)*ones(1,length(x)-1);
A=diag(A1)+diag(A2,1)+diag(A2,-1);
A(1,end)=mi;
A(end,1)=mi;
c_old=y0;
for i=1:length(t)-1
    c_new=A*c_old;
    c_old=c_new;
end

figure(1)
plot(x,y_exact,'r',x,c_new,'ko')

abs_err_norm=norm(abs(y_exact-c_new),inf)
rel_err_norm=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)

abs_err_2=norm(abs(y_exact-c_new),2)
rel_err_2=norm(abs(y_exact-c_new),2)./norm(abs(y_exact),2)

abs_err=abs(y_exact-c_new);

figure(2)
plot(x,abs_err)