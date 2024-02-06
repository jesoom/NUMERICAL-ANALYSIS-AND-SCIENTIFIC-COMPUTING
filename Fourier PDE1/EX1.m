clear all
close all
clc
format long

L=10;
T=5;
N=200;
m=100;
dx=L/N;
x=[0:dx:L-dx]';
dt=T/m;
t=[0:dt:T-dt]';

%a

c01=@(x) exp(-((x-(L/2))/(L/10)).^2);
% c02=@(x) (exp(100*sin(t-2))-1)./(exp(100*sin(t-2))+1);

nu=0;
gama=0;
u=0.2;
% u=0.5;
% u=-0.5;
s=0;
y0=c01(x);
c0hat=fft(y0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=2*pi.*k./L;
alfak=-u*(j)*omegak;
chatk=exp(alfak.*T).*c0hat;
y_exact=ifft(chatk);
plot(x,real(y_exact),'ro')
